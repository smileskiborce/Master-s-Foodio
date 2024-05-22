table 50104 "Food Order Line"
{
    Caption = 'Линија за нарачка на храна';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SalesSetup.Get();
                    NoSeriesMgt.TestManual(SalesSetup."Food Order Line Nos.");
                    "No. Series" := '';
                end;
            end;
        }

        field(2; "Restaurant Code"; Code[20])
        {
            Caption = 'Restaurant Code';
            TableRelation = "Food Order Line";
        }
        field(3; FoodLineNum; Integer)
        {
            Caption = 'Food Line Num';
            Editable = false;
        }
        field(4; FoodOrderCode; Code[20])
        {
            Caption = 'FoodOrderCode';
            Editable = false;
            TableRelation = "Food Order";
        }
        field(5; MealId; Code[10])
        {
            Caption = 'MealId';
            NotBlank = true;
            ValidateTableRelation = true;
            TableRelation = "Restaurant Meal"."No." where(RestaurantCode = field("Restaurant Code"));
            trigger OnValidate()
            var
                RestaurantMeal: Record "Restaurant Meal";
                FoodOrder: Record "Food Order";
                discount: Integer;
            begin
                RestaurantMeal.Get(MealId);
                MealName := RestaurantMeal.Name;
                MealPrice := RestaurantMeal.Price;
                FoodOrder.Get(FoodOrderCode);


                Rec.DiscountAmount := FoodOrderLineMgt.checkDiscount(CustomerCode, "No.", FoodOrder."No.");

                TotalLineAmount := RestaurantMeal.Price * Qty * (1 - DiscountAmount / 100);

                FoodOrder.TotalAmount := FoodOrderLineMgt.addToTotal(FoodOrder, Rec);

                FoodOrderLineMgt.checkIfOverpassMonthyLimit(TotalLineAmount, rec.CustomerCode);

                FoodOrderLineMgt.setOrderToPay(FoodOrderCode, rec."No.", CustomerCode, TotalLineAmount);
            end;
        }
        field(6; Qty; Integer)
        {
            Caption = 'Quantity';

            MinValue = 1;
            trigger OnValidate()
            var
                RestaurantMeal: Record "Restaurant Meal";
                FoodOrder: Record "Food Order";
            begin
                FoodOrder.Get(FoodOrderCode);
                RestaurantMeal.Get(MealId);
                TotalLineAmount := RestaurantMeal.Price * Qty * (1 - DiscountAmount / 100);

                FoodOrder.TotalAmount := FoodOrderLineMgt.addToTotal(FoodOrder, Rec);

                FoodOrder.Modify();
                FoodOrderLineMgt.checkIfOverpassMonthyLimit(TotalLineAmount, rec.CustomerCode);

                FoodOrderLineMgt.setOrderToPay(FoodOrderCode, rec."No.", CustomerCode, TotalLineAmount);
            end;
        }
        field(7; MealPrice; Decimal)
        {
            Editable = false;
            Caption = 'Meal Price';
        }
        field(9; DiscountAmount; Integer)
        {
            Caption = 'Discount Amount';
            Editable = false;
        }
        field(10; TotalLineAmount; Decimal)
        {
            Editable = false;
            Caption = 'Total Line Amount';
        }
        field(13; CustomerCode; Code[20])
        {
            Caption = 'CustomerCode';
            TableRelation = Customer;
            trigger OnValidate()
            var
                FoodOrderLines: Record "Food Order Line";
                Customer: Record Customer;
                FoodOrder: Record "Food Order";
            begin
                FoodOrderLines.SetFilter(FoodOrderCode, Rec.FoodOrderCode);
                rec.FoodLineNum := FoodOrderLines.Count;
                FoodOrder.Get(FoodOrderCode);
                "Restaurant Code" := FoodOrder.RestaurantId;
                Customer.Get(Rec.CustomerCode);
                CustomerName := Customer.Name;
            end;
        }
        field(14; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(15; "CustomerName"; Text[100])
        {
            Caption = 'Customer Name';
        }
        field(16; "MealName"; Text[100])
        {
            Editable = false;
            Caption = 'Meal Name';
        }
    }
    keys
    {
        key(PK; "No.", FoodLineNum)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
    begin
        if "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Food Order Line Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Food Order Line Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FoodOrderLineMgt: Codeunit "Food Order Line Mgtt";
        FoodOrderMgt: Codeunit "Food Order";

    trigger OnDelete()
    var
        PayOrder: Record "Pay Order";
    begin
        PayOrder.SetFilter(FoodOrderLineCode, Rec."No.");
        PayOrder.DeleteAll();
    end;

}

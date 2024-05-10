table 50104 "Food Order Line"
{
    Caption = 'Food Order Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Food Order Line Code';
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
            Caption = 'FoodLineNum';
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
            TableRelation = "Restaurant Meal";

            trigger OnValidate()
            var
                RestaurantMeal: Record "Restaurant Meal";
                FoodOrder: Record "Food Order";
            begin
                RestaurantMeal.Get(MealId);
                MealName := RestaurantMeal.Name;
                MealPrice := RestaurantMeal.Price;
                FoodOrder.Get(FoodOrderCode);
                if qty <> 0 then
                    TotalLineAmount := RestaurantMeal.Price * Qty
                else
                    TotalLineAmount := RestaurantMeal.Price;
                FoodOrderMgt.setTotalAmountOrder(FoodOrder."No.");
                FoodOrderMgt.checkIfOverpassMonthyLimit(TotalLineAmount, rec.CustomerCode);

            end;
        }
        field(6; Qty; Integer)
        {
            Caption = 'Qty';
            trigger OnValidate()
            var
                RestaurantMeal: Record "Restaurant Meal";
                FoodOrder: Record "Food Order";
            begin
                FoodOrder.Get(FoodOrderCode);
                RestaurantMeal.Get(MealId);
                if qty <> 0 then
                    TotalLineAmount := RestaurantMeal.Price * Qty
                else
                    TotalLineAmount := RestaurantMeal.Price;
                FoodOrderMgt.setTotalAmountOrder(FoodOrder."No.");
                FoodOrderMgt.checkIfOverpassMonthyLimit(TotalLineAmount, rec.CustomerCode);
            end;
        }
        field(7; MealPrice; Decimal)
        {
            Editable = false;
            Caption = 'MealPrice';
            trigger OnValidate()
            begin
                Message('test');
            end;
        }
        field(9; DiscountAmount; Decimal)
        {
            Caption = 'DiscountAmount';
            Editable = false;
            InitValue = 0;
        }
        field(10; TotalLineAmount; Decimal)
        {
            Editable = false;
            Caption = 'TotalLineAmount';
        }
        field(11; PaidAmount; Decimal)
        {
            Caption = 'PaidAmount';
        }
        field(12; IsPaid; Boolean)
        {
            Caption = 'IsPaid';
        }
        field(13; CustomerCode; Code[20])
        {
            Caption = 'Customer Id';
            TableRelation = Customer;
            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
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
            Caption = 'Customer name';
            Editable = false;
        }
        field(16; "MealName"; Text[100])
        {
            Editable = false;
            Caption = 'Meal name';
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
        FoodOrderMgt: Codeunit "Food Order Line Mgt";
}

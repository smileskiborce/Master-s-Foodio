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
            TableRelation = "Food Order";
        }
        field(5; MealId; Code[10])
        {
            Caption = 'MealId';
            TableRelation = "Restaurant Meal";
            trigger OnValidate()
            var
                RestaurantMeal: Record "Restaurant Meal";
            begin
                RestaurantMeal.Get(MealId);
                MealPrice := RestaurantMeal.Price;
                if TotalLineAmount <> 0 then
                    MealPrice := RestaurantMeal.Price * TotalLineAmount;
            end;
        }
        field(6; Qty; Integer)
        {
            Caption = 'Qty';
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
        field(10; TotalLineAmount; Integer)
        {
            Caption = 'TotalLineAmount';
            trigger OnValidate()
            var
                RestaurantMeal: Record "Restaurant Meal";
            begin
                RestaurantMeal.Get(MealId);
                MealPrice := RestaurantMeal.Price * TotalLineAmount;
            end;

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
        }
        field(14; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
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
}

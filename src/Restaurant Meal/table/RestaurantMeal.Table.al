table 50102 "Restaurant Meal"
{
    Caption = 'Restaurant Meal';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'Restaurant Meal Code';
            Editable = false;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SalesSetup.Get();
                    NoSeriesMgt.TestManual(SalesSetup."Restaurant Meal Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; RestaurantCode; Code[10])
        {
            Caption = 'Restaurant Code';
            TableRelation = Restaurant;
        }
        field(4; MealType; Enum "Meal Type")
        {
            Caption = 'Meal Type';
        }
        field(5; Price; Decimal)
        {
            Caption = 'Price';
        }
        field(6; CalorieLevel; Enum "Calorie Level")
        {
            Caption = 'Calorie Level';
        }
        field(7; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
    begin
        if "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Restaurant Meal Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Restaurant Meal Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

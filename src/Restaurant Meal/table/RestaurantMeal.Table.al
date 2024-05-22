/// <summary>
/// Table Restaurant Meal (ID 50102).
/// </summary>
table 50102 "Restaurant Meal"
{
    Caption = 'Restaurant Meal';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'No.';
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
            Caption = 'Restaurant code';
            TableRelation = Restaurant;
            Editable = false;
            trigger OnValidate()
            var
                Restaurant: Record Restaurant;
            begin
                Restaurant.Get(Rec.RestaurantCode);
                RestaurantName := Restaurant.Name;
            end;
        }
        field(4; RestaurantName; Text[100])
        {
            Caption = 'Restaurant name';
            TableRelation = Restaurant;
            Editable = false;
        }
        field(5; MealType; Enum "Meal Type")
        {
            Caption = 'Meal type';
        }
        field(6; Price; Decimal)
        {
            Caption = 'Цена';
        }
        field(7; CalorieLevel; Enum "Calorie Level")
        {
            Caption = 'Calorie level';
        }
        field(8; "No. Series"; Code[20])
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
            "No. Series" := SalesSetup."Restaurant Meal Nos.";
            if NoSeriesMgt.AreRelated(SalesSetup."Restaurant Meal Nos.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeriesMgt.GetNextNo("No. Series")
        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "No. Series";
}
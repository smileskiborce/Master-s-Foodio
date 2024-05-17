table 50100 "Restaurant"
{
    Caption = 'Restaurant list';
    DataClassification = ToBeClassified;

    fields
    {

        field(1; "No."; code[10])
        {
            Caption = 'No.';
            Editable = false;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SalesSetup.Get();
                    NoSeriesMgt.TestManual(SalesSetup."Restaurant Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; CuisineType; enum "Restaurant Type")
        {
            Caption = 'CuisineType';
        }
        field(4; Location; Code[20])
        {
            Caption = 'Location';
            TableRelation = "Logistic Location";
        }
        field(5; Telephone; Text[100])
        {
            Caption = 'Telephone';
        }
        field(6; "No. Series"; Code[20])
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
            SalesSetup.TestField("Restaurant Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Restaurant Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;


    trigger OnDelete()
    var
        RestaurantMeal: Record "Restaurant Meal";
    begin
        RestaurantMeal.SetFilter(RestaurantCode, Rec."No.");
        RestaurantMeal.DeleteAll();
    end;


    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

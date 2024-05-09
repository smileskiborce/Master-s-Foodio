table 50100 "Restaurant"
{
    Caption = 'Restaurant';
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
            Caption = 'Restaurant Type';
        }
        field(4; Location; Code[20])
        {
            Caption = 'Location';
            TableRelation = "Logistic Location";
        }
        field(5; Telephone; Text[100])
        {
            Caption = 'Location';
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

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

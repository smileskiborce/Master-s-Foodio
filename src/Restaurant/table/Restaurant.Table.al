/// <summary>
/// Table Restaurant (ID 50100).
/// </summary>
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
        IsHandled: Boolean;

    begin
        if "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Restaurant Nos.");
            "No. Series" := SalesSetup."Restaurant Nos.";
            if NoSeriesMgt.AreRelated(SalesSetup."Restaurant Nos.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeriesMgt.GetNextNo("No. Series");
        end;
    end;


    trigger OnDelete()
    var
        RestaurantMeal: Record "Restaurant Meal";
        deletable: Boolean;
        FoodOrder: Record "Food Order";
    begin
        deletable := false;
        FoodOrder.SetFilter(RestaurantId, Rec."No.");

        if FoodOrder.FindSet() then begin
            repeat
                if FoodOrder.Status = FoodOrder.Status::"In progress" then
                    deletable := true
            until FoodOrder.Next() = 0
        end;

        if deletable then
            ERROR('The restaurant %1 cannot be deleted since there is at least one in progress order related to it', rec."No.");



        RestaurantMeal.SetFilter(RestaurantCode, Rec."No.");
        RestaurantMeal.DeleteAll();
    end;


    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "No. Series";
}

table 50103 "Food Order"
{
    Caption = 'Food Order';
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
                    NoSeriesMgt.TestManual(SalesSetup."Food Order Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; OrderingDate; DateTime)
        {
            Caption = 'OrderingDate';
        }
        field(3; RestaurantId; Code[10])
        {
            Caption = 'RestaurantId';
            TableRelation = Restaurant;
            trigger OnValidate()
            var
                Restaurant: Record Restaurant;
            begin
                Restaurant.Get(Rec.RestaurantId);
                RestaurantName := Restaurant.Name;
            end;
        }
        field(4; Status; Enum "Order Status")
        {
            Caption = 'Status';
            Editable = false;
        }
        field(5; PaymMethod; Enum "Payment Type")
        {
            Caption = 'PaymMethod';
        }
        field(6; TotalAmount; Decimal)
        {
            Caption = 'TotalAmount';
            Editable = false;
        }
        field(7; DeliveryExpenses; Boolean)
        {
            Caption = 'DeliveryExpenses';
            trigger OnValidate()
            begin
                FoodOrderMgt.setTotalAmountOrder(rec."No.");
            end;
        }
        field(8; DeliveryService; Enum "Delivery Service")
        {
            Caption = 'DeliveryService';
        }
        field(9; DeliveryAmount; Decimal)
        {
            Caption = 'DeliveryAmount';
            InitValue = 150;
            trigger OnValidate()
            begin
                FoodOrderMgt.setTotalAmountOrder(rec."No.");
            end;
        }
        field(10; DeliveryAddress; Text[100])
        {
            Caption = 'DeliveryAddress';
        }
        field(11; UserId; Text[100])
        {
            Caption = 'UserId';
            TableRelation = User;
        }
        field(20; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(13; "RestaurantName"; Text[100])
        {
            Editable = false;
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
            SalesSetup.TestField("Food Order Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Food Order Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FoodOrderMgt: Codeunit "Food Order Line Mgt";

}

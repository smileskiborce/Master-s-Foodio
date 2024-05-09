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
        }
        field(7; DeliveryExpenses; Boolean)
        {
            Caption = 'DeliveryExpenses';
        }
        field(8; DeliveryService; Enum "Delivery Service")
        {
            Caption = 'DeliveryService';
        }
        field(9; DeliveryAmount; Decimal)
        {
            Caption = 'DeliveryAmount';
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
}

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
            Caption = 'Ordering Date';
        }
        field(3; RestaurantId; Code[10])
        {
            Caption = 'Restaurant Id';
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
            Caption = 'Payment Method';
        }
        field(6; TotalAmount; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;
        }
        field(7; DeliveryExpenses; Boolean)
        {
            Caption = 'Delivery Expenses';
            trigger OnValidate()

            begin
                TotalAmount := FoodOrderMgt.addExpensesToTotal(Rec);

                FoodOrderMgt.addExpensesAmountToPay(Rec);
            end;
        }
        field(8; DeliveryService; Enum "Delivery Service")
        {
            Caption = 'Delivery Service';
        }
        field(9; DeliveryAmount; Decimal)
        {
            Caption = 'Delivery Amount';
            InitValue = 150;
            trigger OnValidate()
            begin
                TotalAmount := FoodOrderMgt.addExpensesToTotal(Rec);

                FoodOrderMgt.addExpensesAmountToPay(Rec);
            end;
        }
        field(10; DeliveryAddress; Text[100])
        {
            Caption = 'Delivery Address';
        }
        field(11; UserId; Text[100])
        {
            Caption = 'UserId';
            TableRelation = User;
            trigger OnValidate()
            var
                User: Record User;
            begin
                User.Get(Rec.UserId);
                UserName := User."Full Name";
            end;
        }
        field(20; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(13; "RestaurantName"; Text[100])
        {
            Caption = 'Restaurant Name';
            Editable = false;
        }
        field(15; "UserName"; Text[100])
        {
            Caption = 'User Name';
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


    trigger OnDelete()
    var
        FoodOrderLine: Record "Food Order Line";
        PayOrder: Record "Pay Order";
    begin
        FoodOrderLine.SetFilter("FoodOrderCode", Rec."No.");
        PayOrder.SetFilter(FoodOrderCode, rec."No.");
        PayOrder.DeleteAll();
        FoodOrderLine.DeleteAll();
    end;


    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FoodOrderLineMgt: Codeunit "Food Order Line Mgtt";
        FoodOrderMgt: Codeunit "Food Order";

}

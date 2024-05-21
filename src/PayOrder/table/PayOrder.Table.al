table 50106 "Pay Order"
{
    Caption = 'Pay order';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(2; FoodOrderCode; Code[10])
        {
            Caption = 'FoodOrderCode';
            Editable = false;
            NotBlank = true;
        }
        field(3; CustomerCode; Code[10])
        {
            Caption = 'CustomerCode';
            Editable = false;
        }
        field(4; FoodOrderLineCode; Code[10])
        {
            Caption = 'FoodOrderLineCode';
            Editable = false;
        }
        field(5; Amount; Decimal)
        {
            Editable = false;
            Caption = 'Amount';
        }
        field(6; PaidAmount; Decimal)
        {
            Editable = false;
            Caption = 'PaidAmount';
        }
        field(7; IsPaid; Enum "IsPaid")
        {
            Caption = 'IsPaid';
            Editable = false;
        }
        field(8; CustomerName; Text[100])
        {
            Editable = false;
            Caption = 'CustomerName';
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}

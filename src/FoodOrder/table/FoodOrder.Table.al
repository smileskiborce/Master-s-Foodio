table 50103 "Food Order"
{
    Caption = 'Food Order';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; FoodOrderId; Integer)
        {
            Caption = 'FoodOrderId';
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
        }
        field(5; PaymMethod; Enum "Payment Type")
        {
            Caption = 'PaymMethod';
        }
        field(6; TotalAmount; Decimal)
        {
            Caption = 'TotalAmount';
        }
        field(7; DeliveryExpenses; Enum "Delivery Expenses")
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
        field(11; UserId; Integer)
        {
            Caption = 'UserId';
            TableRelation = User;
        }
    }
    keys
    {
        key(PK; FoodOrderId)
        {
            Clustered = true;
        }
    }
}

table 50104 "Food Order Line"
{
    Caption = 'Food Order Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; FoodOrderLineId; Code[10])
        {
            Caption = 'FoodOrderLineId';
        }
        field(2; FoodLineNum; Integer)
        {
            Caption = 'FoodLineNum';
        }
        field(3; FoodOrderId; Code[10])
        {
            Caption = 'FoodOrderId';
            TableRelation = "Food Order";
        }
        field(4; MealId; Code[10])
        {
            Caption = 'MealId';
            TableRelation = "Restaurant Meal";
        }
        field(5; Qty; Integer)
        {
            Caption = 'Qty';
        }
        field(6; MealPrice; Decimal)
        {
            Caption = 'MealPrice';
        }
        field(7; CustAccount; Text[100])
        {
            Caption = 'CustAccount';
        }
        field(8; DiscountAmount; Decimal)
        {
            Caption = 'DiscountAmount';
        }
        field(9; TotalLineAmount; Decimal)
        {
            Caption = 'TotalLineAmount';
        }
        field(10; PaidAmount; Decimal)
        {
            Caption = 'PaidAmount';
        }
        field(11; IsPaid; Boolean)
        {
            Caption = 'IsPaid';
        }
        field(12; CustomerId; Integer)
        {
            Caption = 'Customer Id';
            TableRelation = Customer;
        }
    }
    keys
    {
        key(PK; FoodOrderLineId, FoodLineNum)
        {
            Clustered = true;
        }
    }
}

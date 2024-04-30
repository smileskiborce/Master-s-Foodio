table 50102 "Restaurant Meal"
{
    Caption = 'Restaurant Meal';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; MealId; Code[10])
        {
            Caption = 'MealId';
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; RestaurantId; Code[10])
        {
            Caption = 'RestaurantId';
            TableRelation = Restaurant;
        }
        field(4; MealType; Enum "Meal Type")
        {
            Caption = 'MealType';
        }
        field(5; Price; Decimal)
        {
            Caption = 'Price';
        }
        field(6; CalorieLevel; Enum "Calorie Level")
        {
            Caption = 'CalorieLevel';
        }
    }
    keys
    {
        key(PK; MealId)
        {
            Clustered = true;
        }
    }
}

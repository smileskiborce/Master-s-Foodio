page 50105 "Restaurant Meal Card"
{
    ApplicationArea = All;
    Caption = 'Restaurant Meal Card';
    PageType = Card;
    SourceTable = "Restaurant Meal";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(RestaurantCode; Rec.RestaurantCode)
                {
                    NotBlank = true;
                    ToolTip = 'Specifies the value of the RestaurantId field.';
                }
                field(Name; Rec.Name)
                {
                    NotBlank = true;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(CalorieLevel; Rec.CalorieLevel)
                {
                    ToolTip = 'Specifies the value of the CalorieLevel field.';
                }
                field(MealType; Rec.MealType)
                {
                    ToolTip = 'Specifies the value of the MealType field.';
                }
                field(Price; Rec.Price)
                {
                    NotBlank = true;
                    ToolTip = 'Specifies the value of the Price field.';
                }

            }
        }
    }
}

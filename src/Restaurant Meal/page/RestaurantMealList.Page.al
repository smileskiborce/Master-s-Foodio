page 50104 "Restaurant Meal List"
{
    ApplicationArea = All;
    Caption = 'Meal List';
    PageType = List;
    SourceTable = "Restaurant Meal";
    UsageCategory = Lists;
    CardPageID = "Restaurant Meal Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    NotBlank = true;
                }
                field(RestaurantCode; Rec.RestaurantCode)
                {
                    ToolTip = 'Specifies the value of the Restaurant Code field.';
                }
                field(RestaurantName; Rec.RestaurantName)
                {
                    ToolTip = 'Specifies the value of the Restaurant Name field.';
                }
                field(Name; Rec.Name)
                {
                    NotBlank = true;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Price; Rec.Price)
                {
                    NotBlank = true;
                    ToolTip = 'Specifies the value of the Price field.';
                }
                field(MealType; Rec.MealType)
                {
                    ToolTip = 'Specifies the value of the MealType field.';
                }

                field(CalorieLevel; Rec.CalorieLevel)
                {
                    ToolTip = 'Specifies the value of the CalorieLevel field.';
                }
            }
        }
    }
}

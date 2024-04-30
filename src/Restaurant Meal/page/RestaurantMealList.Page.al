page 50104 "Restaurant Meal List"
{
    ApplicationArea = All;
    Caption = 'Restaurant Meal List';
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
                field(MealId; Rec.MealId)
                {
                    ToolTip = 'Specifies the value of the MealId field.';
                    NotBlank = true;
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
                field(RestaurantId; Rec.RestaurantId)
                {
                    ToolTip = 'Specifies the value of the RestaurantId field.';
                }
                field(CalorieLevel; Rec.CalorieLevel)
                {
                    ToolTip = 'Specifies the value of the CalorieLevel field.';
                }
            }
        }
    }
}

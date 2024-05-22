/// <summary>
/// Page Restaurant Meal Card (ID 50105).
/// </summary>
page 50105 "Restaurant Meal Card"
{
    ApplicationArea = All;
    Caption = 'Meal Card';
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
                field(RestaurantName; Rec.RestaurantName)
                {
                    NotBlank = true;
                    ToolTip = 'Specifies the value of the RestaurantName field.';
                }
                field(Name; Rec.Name)
                {
                    NotBlank = true;
                    ShowMandatory = true;
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
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Price field.';
                }

            }
        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        Rec.TestField(Name);
    end;
}

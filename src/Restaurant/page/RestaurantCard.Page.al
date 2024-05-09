page 50103 "Restaurant Card"
{
    ApplicationArea = All;
    Caption = 'Restaurant Card';
    PageType = Card;
    SourceTable = Restaurant;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(CuisineType; Rec.CuisineType)
                {
                    ToolTip = 'Specifies the value of the RestaurantType field.';
                }
                field(Location; Rec.Location)
                {
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                    ShowMandatory = true;
                    NotBlank = true;
                }
            }
        }
    }
}

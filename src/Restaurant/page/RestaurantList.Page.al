page 50102 "Restaurant List"
{
    ApplicationArea = All;
    Caption = 'Restaurant List';
    PageType = List;
    SourceTable = Restaurant;
    UsageCategory = Lists;
    CardPageId = "Restaurant Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                 field(RestaurantId; Rec.RestaurantId)
                {
                    ToolTip = 'RestaurantId';
                    NotBlank=true;
                }
                field(CuisineType; Rec.CuisineType)
                {
                    ToolTip = 'Specifies the value of the CuisineType field.';
                }
                field(Location; Rec.Location)
                {
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field(Name; Rec.Name)
                {
                    ShowMandatory=true;
                    NotBlank=true;
                    ToolTip = 'Specifies the value of the Name field.';
                }
            }
        }
    }
}

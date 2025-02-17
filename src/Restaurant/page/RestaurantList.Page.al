/// <summary>
/// Page Restaurant List (ID 50102).
/// </summary>
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
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ShowMandatory = true;
                    NotBlank = true;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(CuisineType; Rec.CuisineType)
                {
                    ToolTip = 'Specifies the value of the CuisineType field.';
                }
                field(Location; Rec.Location)
                {
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field(Telephone; Rec.Telephone)
                {
                    ToolTip = 'Specifies the value of the Location field.';
                }
            }
        }
    }
    actions
    {
        Area(Navigation)
        {
            action("View restourant meals")
            {
                Caption = 'View restourant tree meals';
                ApplicationArea = All;
                RunObject = page "Restaurant Tree Meals";
            }
        }
    }
}

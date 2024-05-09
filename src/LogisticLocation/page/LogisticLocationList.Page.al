page 50100 "Logistic Location List"
{
    ApplicationArea = All;
    Caption = 'Logistic Location List';
    PageType = List;
    SourceTable = "Logistic Location";
    UsageCategory = Lists;
    CardPageId = "Logistic Location Card";


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
                    ToolTip = 'Specifies the value of the Name field.';
                }
            }
        }
    }
}

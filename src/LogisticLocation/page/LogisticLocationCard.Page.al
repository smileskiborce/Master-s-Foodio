page 50101 "Logistic Location Card"
{
    ApplicationArea = All;
    Caption = 'Logistic Location Card';
    PageType = Card;
    SourceTable = "Logistic Location";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
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

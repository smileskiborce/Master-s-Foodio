/// <summary>
/// Page Pay Order List (ID 50112).
/// </summary>
page 50112 "Pay Order List"
{
    ApplicationArea = All;
    Caption = 'Pay order';
    PageType = List;
    SourceTable = "Pay Order";
    UsageCategory = Lists;
    CardPageId = "Pay Order Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(CustomerName; Rec.CustomerName)
                {
                    ToolTip = 'Specifies the value of the CustomerName field.';
                }
                field(FoodOrderCode; Rec.FoodOrderCode)
                {
                    ToolTip = 'Specifies the value of the FoodOrderCode field.';
                }
                field(FoodOrderLineCode; Rec.FoodOrderLineCode)
                {
                    ToolTip = 'Specifies the value of the FoodOrderLineCode field.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(IsPaid; Rec.IsPaid)
                {
                    ToolTip = 'Specifies the value of the IsPaid field.';
                    StyleExpr = StyleExprTxt;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
    begin
        StyleExprTxt := ChangeColor.ChangeStatusColor(Rec);
    end;

    var
        StyleExprTxt: Text[50];
        ChangeColor: Codeunit "PayOrderMgt";
}

/// <summary>
/// Page Pay Order Card (ID 50113).
/// </summary>
page 50113 "Pay Order Card"
{
    ApplicationArea = All;
    Caption = 'Pay Order';
    PageType = Card;
    SourceTable = "Pay Order";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(CustomerCode; Rec.CustomerCode)
                {
                    ToolTip = 'Specifies the value of the CustumerCode field.';
                }
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
                field(IsPaid; Rec.IsPaid)
                {
                    ToolTip = 'Specifies the value of the IsPaid field.';
                    StyleExpr = StyleExprTxt;
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(PaidAmount; Rec.PaidAmount)
                {
                    ToolTip = 'Specifies the value of the PaidAmount field.';
                }
            }
        }
    }
    actions
    {

        Area(Navigation)
        {
            action("Pay order line")
            {
                Caption = 'Pay order line';
                ApplicationArea = all;
                Image = Open;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    FoodOrder: Record "Food Order";
                    FoodOrderLine: Record "Food Order Line";
                    PayOrder: Record "Pay Order";
                    isPaidEveryLine: Boolean;
                begin
                    isPaidEveryLine := true;
                    rec.PaidAmount := Rec.Amount;
                    Rec.IsPaid := IsPaid::Paid;
                    Rec.Modify();
                    FoodOrder.Get(rec.FoodOrderCode);
                    PayOrder.SetFilter(FoodOrderCode, rec.FoodOrderCode);
                    if PayOrder.FindSet() then
                        repeat
                            if PayOrder.IsPaid = IsPaid::"Not Paid" then
                                isPaidEveryLine := false;
                        until PayOrder.Next() = 0;

                    if isPaidEveryLine then
                        FoodOrder.Status := "Order Status"::Finished
                    else
                        FoodOrder.Status := "Order Status"::"In progress";

                    FoodOrder.Modify();
                    Message('You successfuly paid %1 for this line.', Rec.Amount);
                end;
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

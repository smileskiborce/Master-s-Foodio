codeunit 50101 "PayOrderMgt"
{
    procedure ChangeStatusColor(PayOrder: Record "Pay Order"): Text[50]
    var
        myInt: Integer;

    begin
        with PayOrder do
            case IsPaid of
                IsPaid::Paid:
                    exit('Favorable');
                IsPaid::"Not Paid":
                    exit('Unfavorable')
            end;
    end;
}

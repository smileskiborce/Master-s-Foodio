/// <summary>
/// Codeunit PayOrderMgt (ID 50101).
/// </summary>
codeunit 50101 "PayOrderMgt"

/// <summary>
/// ChangeStatusColor.
/// </summary>
/// <param name="PayOrder">Record "Pay Order".</param>
/// <returns>Return value of type Text[50].</returns>
{
    procedure ChangeStatusColor(PayOrder: Record "Pay Order"): Text[50]
    var
        myInt: Integer;

    begin
        case PayOrder.IsPaid of
            IsPaid::Paid:
                exit('Favorable');
            IsPaid::"Not Paid":
                exit('Unfavorable')
        end;
    end;
}

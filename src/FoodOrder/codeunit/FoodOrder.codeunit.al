/// <summary>
/// Codeunit Food Order (ID 50102).
/// </summary>
codeunit 50102 "Food Order"
{
    /// <summary>
    /// ChangeStatusColor.
    /// </summary>
    /// <param name="FoodOrder">Record "Food Order".</param>
    /// <returns>Return value of type Text[50].</returns>
    procedure ChangeStatusColor(FoodOrder: Record "Food Order"): Text[50]
    begin
        case FoodOrder.Status of
            FoodOrder.Status::Open:
                exit('StrongAccent');
            FoodOrder.Status::"In progress":
                exit('StandardAccent');
            FoodOrder.Status::Finished:
                exit('favorable');
            else
                exit('UnknownStatus'); // Optional: handle unexpected statuses
        end;
    end;


    /// <summary>
    /// addExpensesToTotal.
    /// </summary>
    /// <param name="FoodOrder">Record "Food Order".</param>
    /// <returns>Return value of type Decimal.</returns>
    procedure addExpensesToTotal(FoodOrder: Record "Food Order"): Decimal
    var
        FoodOrderLine: Record "Food Order Line";
        totalAmount: Decimal;
    begin
        FoodOrderLine.SetFilter(FoodOrderCode, FoodOrder."No.");
        if FoodOrderLine.FindSet() then
            repeat
                totalAmount += FoodOrderLine.TotalLineAmount;
            until FoodOrderLine.Next() = 0;

        if FoodOrder.DeliveryExpenses then begin
            totalAmount += FoodOrder.DeliveryAmount;
            exit(totalAmount);
        end
        else begin
            totalAmount := FoodOrder.TotalAmount - FoodOrder.DeliveryAmount;
            exit(totalAmount);
        end;

    end;



    /// <summary>
    /// addExpensesAmountToPay.
    /// </summary>
    /// <param name="FoodOrder">Record "Food Order".</param>
    procedure addExpensesAmountToPay(FoodOrder: Record "Food Order")
    var
        PayOrder: Record "Pay Order";
    begin
        PayOrder.SetFilter(FoodOrderCode, FoodOrder."No.");

        if FoodOrder.DeliveryExpenses then begin
            PayOrder.SetFilter(FoodOrderLineCode, 'DELIVERY');
            if PayOrder.FindSet() then begin
                PayOrder.Amount := FoodOrder.DeliveryAmount;
                PayOrder.Modify();
            end
            else begin
                PayOrder.Init();
                PayOrder.FoodOrderCode := FoodOrder."No.";
                PayOrder.FoodOrderLineCode := 'DELIVERY';
                PayOrder.Amount := FoodOrder.DeliveryAmount;
                PayOrder.insert();
            end;
        end
        else begin
            PayOrder.SetFilter(FoodOrderLineCode, 'DELIVERY');
            if PayOrder.FindSet() then
                PayOrder.Delete();
        end;
    end;

}

codeunit 50102 "Food Order"
{
    procedure ChangeStatusColor(FoodOrder: Record "Food Order"): Text[50]
    var
        myInt: Integer;

    begin
        with FoodOrder do
            case Status of
                Status::Open:
                    exit('StrongAccent');
                Status::"In progress":
                    exit('StandardAccent');
                Status::Finished:
                    exit('favorable')
            end;
    end;


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

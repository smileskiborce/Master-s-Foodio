codeunit 50105 "Food Order Line Mgtt"
{
    TableNo = "Food Order Line";

    procedure setTotalAmountOrder(var FoodOrderCode: Code[20]) totalAmount: Decimal
    var
        FoodOrderLines: Record "Food Order Line";
        FoodOrder: Record "Food Order";
    begin
        FoodOrder.Get(FoodOrderCode);
        FoodOrderLines.SetFilter(FoodOrderCode, FoodOrder."No.");
        if FoodOrderLines.FindSet() then
            repeat
                totalAmount += FoodOrderLines.TotalLineAmount;
            until FoodOrderLines.Next() = 0;
        if FoodOrder.DeliveryExpenses then
            totalAmount += FoodOrder.DeliveryAmount;
        exit(totalAmount);
    end;



    procedure checkIfOverpassMonthyLimit(var totalLineAmount: Decimal; var CustomerCode: Code[20])
    var
        Customer: Record Customer;
    begin
        Customer.get(CustomerCode);

        if Customer.MonthlyBudget < totalLineAmount then
            Message('Customer  %1, monthly budget of %2, is overpasse, do you like to continue?', Customer.Name, Customer.MonthlyBudget)

    end;



    procedure checkDiscount(CustomerCode: Code[20]; FoodOrderLineCode: Code[20]; FoodOderNo: Code[10]) discount: Integer;
    var
        FoodOrderLine: Record "Food Order Line";
        FoodOrder: Record "Food Order";
        Restourant: Record "Restaurant";
        counter: Integer;
        RestourantCode: Code[20];
    begin
        FoodOrderLine.SetFilter(CustomerCode, CustomerCode);
        FoodOrder.Get(FoodOderNo);
        Restourant.Get(FoodOrder.RestaurantId);
        RestourantCode := Restourant."No.";

        if FoodOrderLine.FindSet() then
            repeat
                FoodOrder.Get(FoodOrderLine.FoodOrderCode);
                if RestourantCode = FoodOrder.RestaurantId then
                    counter += 1;
            until FoodOrderLine.Next() = 0;
        if (counter mod 4 = 0) and (counter <> 0) then begin
            Message('This costume has bonus discount of 20%');
            discount := 20;
        end;
        exit(discount);
    end;


    procedure setOrderToPay(FoodOrderCode: Code[20]; FoodOrderLineCode: Code[20]; CustomerCode: Code[20]; TotalLineAmount: Decimal)
    var
        PayOrder: Record "Pay Order";
        FoodOrderLine: Record "Food Order Line";
        Customer: Record "Customer";
    begin
        if PayOrder.get(FoodOrderLineCode) = false then begin
            PayOrder.Init();
            PayOrder.CustomerCode := CustomerCode;
            PayOrder.FoodOrderCode := FoodOrderCode;
            PayOrder.FoodOrderLineCode := FoodOrderLineCode;
            PayOrder.Amount := TotalLineAmount;
            Customer.get(CustomerCode);
            PayOrder.CustomerName := Customer.Name;
            PayOrder.Insert();
        end
        else begin
            PayOrder.Get(FoodOrderLineCode);
            PayOrder.Amount := TotalLineAmount;
            PayOrder.Modify();
        end;

    end;
}

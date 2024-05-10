codeunit 50101 "Food Order Line Mgt"
{
    TableNo = "Food Order Line";

    procedure setTotalAmountOrder(var FoodOrderCode: Code[20])
    var
        FoodOrderLines: Record "Food Order Line";
        totalAmount: Decimal;
        FoodOrder: Record "Food Order";
    begin
        FoodOrder.Get(FoodOrderCode);
        FoodOrderLines.SetFilter(FoodOrderCode, FoodOrder."No.");
        if FoodOrderLines.FindSet() then
            repeat
                totalAmount += FoodOrderLines.TotalLineAmount;
            until FoodOrderLines.Next() = 0;
        FoodOrder."TotalAmount" := totalAmount;
        if FoodOrder.DeliveryExpenses then
            FoodOrder.TotalAmount += FoodOrder.DeliveryAmount;
        FoodOrder.Modify();
    end;

    procedure checkIfOverpassMonthyLimit(var totalLineAmount: Decimal; var CustomerCode: Code[20])
    var
        Customer: Record Customer;
    begin
        Customer.get(CustomerCode);
        if Customer.MonthlyBudget < totalLineAmount then
            Message('Customer  %1, monthly budget of %2, is overpasse, do you like to continue?', Customer.Name, Customer.MonthlyBudget)
    end;

    procedure checkDiscount(CustomerCode: Code[20]; FoodOrderLineCode: Code[20]) discount: Integer;
    var
        FoodOrderLine: Record "Food Order Line";
        counter: Integer;
    begin
        FoodOrderLine.SetFilter(CustomerCode, CustomerCode);
        counter := FoodOrderLine.Count();
        if (counter mod 5 = 0) and (counter <> 0) then begin
            Message('This costume has bonus discount of 20%');
            discount := 20;
        end;
        exit(discount);
    end;
}

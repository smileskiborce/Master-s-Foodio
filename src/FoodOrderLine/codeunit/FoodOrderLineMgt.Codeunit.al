/// <summary>
/// Codeunit Food Order Line Mgtt (ID 50105).
/// </summary>
codeunit 50105 "Food Order Line Mgtt"
{
    TableNo = "Food Order Line";

    /// <summary>
    /// addToTotal.
    /// </summary>
    /// <param name="FoodOrder">VAR Record "Food Order".</param>
    /// <param name="FoodOrderLine">VAR Record "Food Order Line".</param>
    /// <returns>Return variable totalAmount of type Decimal.</returns>
    procedure addToTotal(var FoodOrder: Record "Food Order"; var FoodOrderLine: Record "Food Order Line") totalAmount: Decimal
    var
        FoodOrderLines: Record "Food Order Line";
    begin

        FoodOrderLines.SetFilter(FoodOrderCode, FoodOrder."No.");
        totalAmount += FoodOrder.TotalAmount + FoodOrderLine.TotalLineAmount;
        exit(totalAmount);
    end;



    /// <summary>
    /// checkIfOverpassMonthyLimit.
    /// </summary>
    /// <param name="totalLineAmount">VAR Decimal.</param>
    /// <param name="CustomerCode">VAR Code[20].</param>
    procedure checkIfOverpassMonthyLimit(var totalLineAmount: Decimal; var CustomerCode: Code[20])
    var
        Customer: Record Customer;
    begin
        Customer.get(CustomerCode);

        if Customer.MonthlyBudget and (Customer.MinimalLimit < totalLineAmount) then
            Message('Customer  %1, monthly budget of %2, is overpasse, do you like to continue?', Customer.Name, Customer.MinimalLimit)

    end;



    /// <summary>
    /// checkDiscount.
    /// </summary>
    /// <param name="CustomerCode">Code[20].</param>
    /// <param name="FoodOrderLineCode">Code[20].</param>
    /// <param name="FoodOderNo">Code[10].</param>
    /// <returns>Return variable discount of type Integer.</returns>
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


    /// <summary>
    /// setOrderToPay.
    /// </summary>
    /// <param name="FoodOrderCode">Code[20].</param>
    /// <param name="FoodOrderLineCode">Code[20].</param>
    /// <param name="CustomerCode">Code[20].</param>
    /// <param name="TotalLineAmount">Decimal.</param>
    procedure setOrderToPay(FoodOrderCode: Code[20]; FoodOrderLineCode: Code[20]; CustomerCode: Code[20]; TotalLineAmount: Decimal)
    var
        PayOrder: Record "Pay Order";
        FoodOrderLine: Record "Food Order Line";
        Customer: Record "Customer";
    begin
        PayOrder.SetFilter(FoodOrderLineCode, FoodOrderLineCode);
        if PayOrder.FindSet() = false then begin
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
            PayOrder.SetFilter(FoodOrderLineCode, FoodOrderLineCode);
            PayOrder.FindFirst();
            PayOrder.Amount := TotalLineAmount;
            PayOrder.Modify();
        end;

    end;
}

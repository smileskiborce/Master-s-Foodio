page 50106 "Food Order List"
{
    ApplicationArea = All;
    Caption = 'Food Order';
    PageType = List;
    SourceTable = "Food Order";
    UsageCategory = Lists;
    CardPageId = "Food Order Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(RestaurantId; Rec.RestaurantId)
                {
                    ToolTip = 'Specifies the value of the RestaurantId field.';
                    ShowMandatory = true;
                }
                field(UserId; Rec.UserId)
                {
                    ToolTip = 'Specifies the value of the UserId field.';
                    ShowMandatory = true;
                }
                field(OrderingDate; Rec.OrderingDate)
                {
                    ToolTip = 'Specifies the value of the OrderingDate field.';
                    ShowMandatory = true;
                }
                field(DeliveryAddress; Rec.DeliveryAddress)
                {
                    ToolTip = 'Specifies the value of the DeliveryAddress field.';
                    ShowMandatory = true;
                }
                field(DeliveryAmount; Rec.DeliveryAmount)
                {
                    ToolTip = 'Specifies the value of the DeliveryAmount field.';
                }
                field(DeliveryExpenses; Rec.DeliveryExpenses)
                {
                    ToolTip = 'Specifies the value of the DeliveryExpenses field.';
                }
                field(DeliveryService; Rec.DeliveryService)
                {
                    ToolTip = 'Specifies the value of the DeliveryService field.';
                }
                field(FoodOrderId; Rec.FoodOrderId)
                {
                    ToolTip = 'Specifies the value of the FoodOrderId field.';
                }
                field(PaymMethod; Rec.PaymMethod)
                {
                    ToolTip = 'Specifies the value of the PaymMethod field.';
                    ShowMandatory = true;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ShowMandatory = true;
                }
                field(TotalAmount; Rec.TotalAmount)
                {
                    ToolTip = 'Specifies the value of the TotalAmount field.';
                }
            }
        }
    }
}

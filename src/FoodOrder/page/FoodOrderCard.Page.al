page 50107 "Food Order Card"
{
    ApplicationArea = All;
    Caption = 'Food Order';
    PageType = Card;
    SourceTable = "Food Order";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Food Order Id field.';
                }
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
    actions
    {
        Area(Processing)
        {

            action("Food Order Line")
            {
                Caption = 'Food Order Line';
                ApplicationArea = all;
                Image = Open;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    FoodOrderLine: Record "Food Order Line";

                begin
                    FoodOrderLine.Init();
                    FoodOrderLine.Validate("FoodOrderCode", Rec."No.");
                    FoodOrderLine.Insert(true);
                    Page.Run(Page::"Food Order Line Card", FoodOrderLine);
                end;
            }

        }
    }
}

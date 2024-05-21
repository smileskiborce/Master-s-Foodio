page 50107 "Food Order Card"
{
    ApplicationArea = All;
    Caption = 'Food Order card';
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
                field(RestaurantName; Rec.RestaurantName)
                {
                    ToolTip = 'Specifies the value of the RestaurantName field.';
                }
                field(UserId; Rec.UserId)
                {
                    ToolTip = 'Specifies the value of the UserId field.';
                    ShowMandatory = true;
                }
                field(UserName; Rec.UserName)
                {
                    ToolTip = 'Specifies the value of the User name field.';
                }
                field(DeliveryAddress; Rec.DeliveryAddress)
                {
                    ToolTip = 'Specifies the value of the DeliveryAddress field.';
                    ShowMandatory = true;
                }
                field(DeliveryExpenses; Rec.DeliveryExpenses)
                {
                    ToolTip = 'Specifies the value of the DeliveryExpenses field.';
                }
                field(DeliveryAmount; Rec.DeliveryAmount)
                {
                    ToolTip = 'Specifies the value of the DeliveryAmount field.';
                }
                field(OrderingDate; Rec.OrderingDate)
                {
                    ToolTip = 'Specifies the value of the OrderingDate field.';
                    ShowMandatory = true;
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
                    StyleExpr = StyleExprTxt;
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

        Area(Navigation)
        {

            action("View Food Order list")
            {
                Caption = 'View Food Order list';
                ApplicationArea = All;
                RunObject = page "Food Order Line List";
                RunPageLink = "FoodOrderCode" = field("No.");
            }
            action("Food Order Line")
            {
                Caption = 'Create Food Order Line';
                ApplicationArea = all;
                Image = Open;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    FoodOrderLine: Record "Food Order Line";
                    RestaurantMeal: Record "Restaurant Meal";
                begin
                    FoodOrderLine.Init();
                    FoodOrderLine.Validate("FoodOrderCode", Rec."No.");
                    FoodOrderLine.Insert(true);
                    Page.Run(Page::"Food Order Line Card", FoodOrderLine);
                end;
            }
            action("Pay order")
            {
                Caption = 'Pay Order';
                ApplicationArea = All;
                RunObject = page "Pay Order List";
                RunPageLink = FoodOrderCode = field("No.");
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
        ChangeColor: Codeunit "Food Order";


    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        Rec.TestField(RestaurantId);
        Rec.TestField(UserId);
        Rec.TestField(DeliveryAddress);
        Rec.TestField(OrderingDate);
    end;
}

page 50109 "Food Order Line Card"
{
    ApplicationArea = All;
    Caption = 'Food Order Line Card';
    PageType = Card;
    SourceTable = "Food Order Line";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Food Order Line Code field.';
                }
                field(FoodOrderCode; Rec.FoodOrderCode)
                {
                    ToolTip = 'Specifies the value of the FoodOrderId field.';
                }
                field("Customer Code."; Rec.CustomerCode)
                {
                    ToolTip = 'Specifies the value of the Customer Id field.';
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field("CustomerName"; Rec.CustomerName)
                {
                    ToolTip = 'Specifies the value of the CustomerName Id field.';
                }
                field(DiscountAmount; Rec.DiscountAmount)
                {
                    ToolTip = 'Specifies the value of the DiscountAmount field.';
                }
                field(FoodLineNum; Rec.FoodLineNum)
                {
                    ToolTip = 'Specifies the value of the FoodLineNum field.';
                }

                field(IsPaid; Rec.IsPaid)
                {
                    ToolTip = 'Specifies the value of the IsPaid field.';
                }
                field(MealId; Rec.MealId)
                {
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the MealId field.';
                }
                field(MealPrice; Rec.MealPrice)
                {
                    ToolTip = 'Specifies the value of the MealPrice field.';
                }
                field(MealName; Rec.MealName)
                {
                    ToolTip = 'Specifies the value of the MealName field.';
                }
                field(Qty; Rec.Qty)
                {
                    ToolTip = 'Specifies the value of the Qty field.';
                }
                field(TotalLineAmount; Rec.TotalLineAmount)
                {
                    ToolTip = 'Specifies the value of the TotalLineAmount field.';
                }
                field(PaidAmount; Rec.PaidAmount)
                {
                    ToolTip = 'Specifies the value of the PaidAmount field.';
                }

            }
        }
    }
}

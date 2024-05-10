page 50108 "Food Order Line List"
{
    ApplicationArea = All;
    Caption = 'Food Order Line';
    PageType = List;
    SourceTable = "Food Order Line";
    UsageCategory = Lists;
    CardPageId = "Food Order Line Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Food Order Line code field.';
                }
                field(FoodOrderCode; Rec.FoodOrderCode)
                {
                    ToolTip = 'Specifies the value of the FoodOrderId field.';
                }
                field(MealName; Rec.MealName)
                {
                    ToolTip = 'Specifies the value of the MealName field.';
                }
                field(MealPrice; Rec.MealPrice)
                {
                    ToolTip = 'Specifies the value of the MealPrice field.';
                }
                field(Qty; Rec.Qty)
                {
                    ToolTip = 'Specifies the value of the Qty field.';
                }

                field(TotalLineAmount; Rec.TotalLineAmount)
                {
                    ToolTip = 'Specifies the value of the TotalLineAmount field.';
                }
                field(CustomerName; Rec.CustomerName)
                {
                    ToolTip = 'Specifies the value of the CustomerCode field.';
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
                field(PaidAmount; Rec.PaidAmount)
                {
                    ToolTip = 'Specifies the value of the PaidAmount field.';
                }
            }
        }
    }
}

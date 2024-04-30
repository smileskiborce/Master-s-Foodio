page 50108 "Food Order Line List"
{
    ApplicationArea = All;
    Caption = 'Food Order Line List';
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
                field(CustAccount; Rec.CustAccount)
                {
                    ToolTip = 'Specifies the value of the CustAccount field.';
                }
                field(CustomerId; Rec.CustomerId)
                {
                    ToolTip = 'Specifies the value of the Customer Id field.';
                }
                field(DiscountAmount; Rec.DiscountAmount)
                {
                    ToolTip = 'Specifies the value of the DiscountAmount field.';
                }
                field(FoodLineNum; Rec.FoodLineNum)
                {
                    ToolTip = 'Specifies the value of the FoodLineNum field.';
                }
                field(FoodOrderId; Rec.FoodOrderId)
                {
                    ToolTip = 'Specifies the value of the FoodOrderId field.';
                }
                field(FoodOrderLineId; Rec.FoodOrderLineId)
                {
                    ToolTip = 'Specifies the value of the FoodOrderLineId field.';
                }
                field(IsPaid; Rec.IsPaid)
                {
                    ToolTip = 'Specifies the value of the IsPaid field.';
                }
                field(MealId; Rec.MealId)
                {
                    ToolTip = 'Specifies the value of the MealId field.';
                }
                field(MealPrice; Rec.MealPrice)
                {
                    ToolTip = 'Specifies the value of the MealPrice field.';
                }
                field(PaidAmount; Rec.PaidAmount)
                {
                    ToolTip = 'Specifies the value of the PaidAmount field.';
                }
                field(Qty; Rec.Qty)
                {
                    ToolTip = 'Specifies the value of the Qty field.';
                }
                field(TotalLineAmount; Rec.TotalLineAmount)
                {
                    ToolTip = 'Specifies the value of the TotalLineAmount field.';
                }
            }
        }
    }
}

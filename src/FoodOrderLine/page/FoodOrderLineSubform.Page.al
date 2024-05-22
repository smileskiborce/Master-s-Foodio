page 50114 "Food Order Line Subform"
{
    ApplicationArea = All;
    Caption = 'Food Order Lines';
    PageType = ListPart;
    SourceTable = "Food Order Line";

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
            }
        }
    }
}

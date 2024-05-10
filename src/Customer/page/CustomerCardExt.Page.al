pageextension 50101 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        addafter(General)
        {
            group(Master)
            {
                Caption = 'Master Foodio';
                field("MonthlyBudget"; Rec.MonthlyBudget)
                {
                    Caption = 'MonthlyBudget';
                    ApplicationArea = All;
                }
            }

        }
    }
}

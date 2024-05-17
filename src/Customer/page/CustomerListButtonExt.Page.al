pageextension 50102 CustomerListButtonExt extends "Customer List"
{
    actions
    {
        addfirst(Reports)
        {
            action("CustomerExpensesRep")
            {
                Caption = 'Customer expenses per restaurant';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Report.Run(Report::CustomerExpensesPerRestaurant);
                end;
            }
        }
    }
}

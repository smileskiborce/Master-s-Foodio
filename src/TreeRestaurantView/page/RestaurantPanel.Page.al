page 50111 RestaurantPanel
{
    ApplicationArea = All;
    Caption = 'Restaurant Panel';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Restaurant Tree";
    Editable = true;
    ModifyAllowed = true;
    InsertAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(content)
        {
            grid(Mygrid)
            {
                group(RestaurantMeal)
                {
                    ShowCaption = false;
                    part(Meals; "Restaurant Tree Meals")
                    {
                        ApplicationArea = all;
                    }
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Update)
            {
                ApplicationArea = all;
                Image = WorkCenterLoad;
                Caption = 'Update Panel';

                trigger OnAction()
                var
                    UpdatedLbl: Label 'Panel updated';
                begin
                    CurrPage.Meals.Page.LoadMeals();
                    Message(UpdatedLbl);
                end;
            }
        }
    }
}

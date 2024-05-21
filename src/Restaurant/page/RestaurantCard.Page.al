page 50103 "Restaurant Card"
{
    ApplicationArea = All;
    Caption = 'Restaurant card';
    PageType = Card;
    SourceTable = Restaurant;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(CuisineType; Rec.CuisineType)
                {
                    ToolTip = 'Specifies the value of the RestaurantType field.';
                }
                field(Location; Rec.Location)
                {
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field(Telephone; Rec.Telephone)
                {
                    ToolTip = 'Specifies the value of the Telephone field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                    ShowMandatory = true;
                    NotBlank = true;
                }
            }
        }
    }
    actions
    {

        Area(Navigation)
        {

            action("View restourant meals")
            {
                Caption = 'View restourant meals';
                ApplicationArea = All;
                RunObject = page "Restaurant Meal List";
                RunPageLink = RestaurantCode = field("No.");
            }
            action("Create restourant meal")
            {
                Caption = 'Create restourant meal';
                ApplicationArea = all;
                Image = Open;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    RestourantMeal: Record "Restaurant Meal";
                begin
                    RestourantMeal.Init();
                    RestourantMeal.Validate("RestaurantCode", Rec."No.");
                    RestourantMeal.Insert(true);
                    Page.Run(Page::"Restaurant Meal Card", RestourantMeal);
                end;
            }
        }
    }


    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        Rec.TestField(Location);
        Rec.TestField(Name);
    end;
}

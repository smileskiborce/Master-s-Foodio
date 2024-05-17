page 50110 "Restaurant Tree Meals"
{
    Caption = 'Restaurant Tree Meals';
    PageType = ListPart;
    SourceTable = "Restaurant Tree";
    Editable = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                IndentationColumn = Rec.Indentation;
                ShowAsTree = true;
                field(Indentation; Rec.Indentation)
                {
                    ToolTip = 'Specifies the value of the Indentatiotreen field.';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("Restaurant No."; Rec."Restaurant No.")
                {
                    ToolTip = 'Specifies the value of the Restaurant No. field.';
                    ApplicationArea = All;
                    HideValue = HideValues;
                    StyleExpr = StyleExpr;
                    Editable = false;
                }
                field("Restaurant Name"; Rec."Restaurant Name")
                {
                    ToolTip = 'Specifies the value of the Restaurant Name field.';
                    ApplicationArea = All;
                    HideValue = HideValues;
                    StyleExpr = StyleExpr;
                    Editable = false;
                }
                field("Meal No."; Rec."Meal No.")
                {
                    ToolTip = 'Specifies the value of the Meal No. field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Meal Name"; Rec."Meal Name")
                {
                    ToolTip = 'Specifies the value of the MealName field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Meal Price"; Rec."Meal Price")
                {
                    ToolTip = 'Specifies the value of the Meal Price field.';
                    ApplicationArea = All;
                    Editable = false;
                }

            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        case Rec.Indentation of
            0:
                begin
                    HideValues := false;
                    StyleExpr := 'Strong';
                end;
            1:
                begin
                    HideValues := true;
                end;
        end;
    end;


    trigger OnInit()
    begin
        LoadMeals();
        Rec.FindFirst();
    end;


    procedure LoadMeals()
    var
        SalesTreePanelFunctions: Codeunit RestaurantTreeFucntions;
    begin
        SalesTreePanelFunctions.CreateMealEntries(Rec);
    end;


    var
        HideValues: Boolean;
        StyleExpr: Text;
}

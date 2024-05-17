codeunit 50102 "Change Color Satus"
{
    procedure ChangeStatusColor(FoodOrder: Record "Food Order"): Text[50]
    var
        myInt: Integer;

    begin
        with FoodOrder do
            case Status of
                Status::Open:
                    exit('StrongAccent');
                Status::"In progress":
                    exit('StandardAccent');
                Status::Finished:
                    exit('favorable')
            end;
    end;
}

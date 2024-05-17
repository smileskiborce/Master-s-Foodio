codeunit 50103 RestaurantTreeFucntions
{
    procedure CreateMealEntries(var restraurantTree: Record "Restaurant Tree")
    var
        Restaurant: Record Restaurant;
    begin
        restraurantTree.DeleteAll();
        if Restaurant.FindSet() then begin
            repeat
                CreateLevel0(Restaurant, restraurantTree);
                CreateLevel1(Restaurant, restraurantTree);
            until Restaurant.Next() = 0;
        end;
    end;


    local procedure CreateLevel0(Restaurant: Record Restaurant; var restaurantTree: Record "Restaurant Tree")
    begin
        restaurantTree.Init();
        restaurantTree."Entry No." := EntryNo;
        restaurantTree.Indentation := 0;
        restaurantTree."Restaurant No." := Restaurant."No.";
        restaurantTree."Restaurant Name" := Restaurant."Name";
        restaurantTree.Insert();
        EntryNo += 1;
    end;

    local procedure CreateLevel1(Restaurant: Record Restaurant; var restaurantTree: Record "Restaurant Tree")
    var
        RestaurantMeal: Record "Restaurant Meal";
    begin
        RestaurantMeal.SetRange(RestaurantCode, Restaurant."No.");
        if RestaurantMeal.FindSet() then begin
            repeat
                restaurantTree.Init();
                restaurantTree."Entry No." := EntryNo;
                restaurantTree.Indentation := 1;
                restaurantTree."Restaurant No." := Restaurant."No.";
                restaurantTree."Restaurant Name" := Restaurant.Name;
                restaurantTree."Meal No." := RestaurantMeal."No.";
                restaurantTree."Meal Name" := RestaurantMeal.Name;
                restaurantTree."Meal Price" := RestaurantMeal.Price;
                restaurantTree.Insert();
                EntryNo += 1;
            until RestaurantMeal.Next() = 0;
        end;
    end;

    var
        EntryNo: Integer;
}

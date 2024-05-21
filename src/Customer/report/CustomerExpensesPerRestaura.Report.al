report 50100 "CustomerExpensesPerRestaurant"
{
    Caption = 'Customer Expenses Per Restaurant';
    DefaultRenderingLayout = LayoutRDL;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            PrintOnlyIfDetail = true;

            column(No_; "No.")
            {
            }
            column(Name; Name)
            {
            }
            dataitem("Food Order Line"; "Food Order Line")
            {
                DataItemLink = "CustomerCode" = field("No.");

                column(FoodOrderLineNo_; "No.")
                {

                }
                column(TotalLineAmount; TotalLineAmount)
                {
                }

                dataitem("Restaurant Meal"; "Restaurant Meal")
                {
                    DataItemLink = "No." = field("MealId");
                    column(MealName; Name)
                    {

                    }
                    column(MealType; MealType)
                    {

                    }

                    dataitem(Restaurant; Restaurant)
                    {
                        DataItemLink = "No." = field(RestaurantCode);

                        column(RestourantNo_; "No.")
                        {

                        }
                        column(RestourantName; Name)
                        {

                        }
                    }
                }

            }

        }
    }


    rendering
    {
        layout(LayoutRDL)
        {
            Type = RDLC;
            Caption = 'LayoutRDL';
            Summary = 'Item Ledger Entry Analysis RDL Report';
            LayoutFile = 'src/Customer/layout/CustomerExpensesPerRestaurant.report.rdl';
        }
    }
}

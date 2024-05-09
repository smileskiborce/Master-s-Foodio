pageextension 50100 SalesReceivablesSetupPageExt extends "Sales & Receivables Setup"
{

    layout
    {
        addafter("Customer Nos.")
        {
            field("Restaurant Nos."; Rec."Restaurant Nos.")
            {
                Caption = 'Restaurant Nos.';
                ApplicationArea = All;
            }
            field("Food Order Nos."; Rec."Food Order Nos.")
            {
                Caption = 'Food Order Nos.';
                ApplicationArea = All;
            }
            field("Restaurant Meal Nos."; Rec."Restaurant Meal Nos.")
            {
                Caption = 'Restaurant Meal Nos.';
                ApplicationArea = All;
            }
            field("Logistic Location Nos."; Rec."Logistic Location Nos.")
            {
                Caption = 'Restaurant Meal Nos.';
                ApplicationArea = All;
            }
            field("Food Order Line Nos."; Rec."Food Order Line Nos.")
            {
                Caption = 'Food Order Line Nos.';
                ApplicationArea = All;
            }
        }
    }
}

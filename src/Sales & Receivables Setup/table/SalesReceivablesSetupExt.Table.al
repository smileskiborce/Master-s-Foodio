tableextension 50100 "Sales & Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50200; "Restaurant Nos."; Code[20])
        {
            Caption = 'Restaurant Nos.';
            TableRelation = "No. Series";
        }
        field(50201; "Food Order Nos."; Code[20])
        {
            Caption = 'Food Order Nos.';
            TableRelation = "No. Series";
        }
        field(50202; "Restaurant Meal Nos."; Code[20])
        {
            Caption = 'Restaurant Meal Nos.';
            TableRelation = "No. Series";
        }
        field(50203; "Logistic Location Nos."; Code[20])
        {
            Caption = 'Logistic Location Nos.';
            TableRelation = "No. Series";
        }
        field(50204; "Food Order Line Nos."; Code[20])
        {
            Caption = 'Food Order Nos.';
            TableRelation = "No. Series";
        }
    }
}

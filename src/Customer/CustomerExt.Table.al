tableextension 50101 CustomerExt extends Customer
{
    fields
    {
        field(50100; MonthlyBudget; Boolean)
        {
            Caption = 'MonthlyBudget';
            DataClassification = ToBeClassified;
        }
        field(50101; MinimalLimit; Decimal)
        {
            Caption = 'MonthlyBudget';
            DataClassification = ToBeClassified;
        }
    }
}

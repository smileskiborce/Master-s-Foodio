tableextension 50101 CustomerExt extends Customer
{
    fields
    {
        field(50100; MonthlyBudget; Decimal)
        {
            Caption = 'MonthlyBudget';
            DataClassification = ToBeClassified;
        }
    }
}

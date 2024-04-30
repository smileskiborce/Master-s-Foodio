table 50101 "Logistic Location"
{
    Caption = 'LogisticLocation';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; LogisticsLocationRecId; Integer)
        {
            Caption = 'LogisticsLocationRecId';
            AutoIncrement = true;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
    }
    keys
    {
        key(PK; LogisticsLocationRecId)
        {
            Clustered = true;
        }
    }
}

table 50100 "Restaurant"
{
    Caption = 'Restaurant';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "RestaurantId"; Code[10])
        {
            Caption = 'No.';
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; CuisineType; enum "Restaurant Type")
        {
            Caption = 'RestaurantType';
        }
        field(4; Location; Integer)
        {
            Caption = 'Location';
            TableRelation = "Logistic Location";
        }
        field(5; Telephone; Text[100])
        {
            Caption = 'Location';
        }
    }
    keys
    {
        key(PK; "RestaurantId")
        {
            Clustered = true;
        }
    }
}

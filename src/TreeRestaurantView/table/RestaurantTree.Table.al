table 50105 "Restaurant Tree"
{
    Caption = 'Restaurant Tree';
    DataClassification = ToBeClassified;
    TableType = Temporary;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(2; Indentation; Integer)
        {
            Caption = 'Indentation';
            DataClassification = SystemMetadata;
        }
        field(3; "Restaurant No."; Code[20])
        {
            Caption = 'Restaurant No.';
            DataClassification = SystemMetadata;
        }
        field(4; "Restaurant Name"; Text[100])
        {
            Caption = 'Restaurant No.';
            DataClassification = SystemMetadata;
        }
        field(5; "Meal No."; Code[20])
        {
            Caption = 'Meal No.';
            DataClassification = SystemMetadata;
        }
        field(6; "Meal Name"; Text[100])
        {
            Caption = 'Meal Name';
            DataClassification = SystemMetadata;
        }
        field(7; "Meal Price"; Decimal)
        {
            Caption = 'Meal Price';
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}

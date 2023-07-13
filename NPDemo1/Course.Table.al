table 90100 "OSA Course"
{
    Caption = 'Course';
    DataClassification = CustomerContent;
    LookupPageId = "OSA Course List";
    DrillDownPageId = "OSA Course List";

    fields
    {
        field(10; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(20; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(30; Type; Enum "OSA Course Type")
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
            InitValue = "E-Learning";
        }
        field(40; "Duration"; Integer)
        {
            Caption = 'Duration';
            DataClassification = ToBeClassified;
        }
        field(50; Price; Decimal)
        {
            Caption = 'Price';
            DataClassification = ToBeClassified;

        }
        field(60; Active; Boolean)
        {
            Caption = 'Active';
            DataClassification = CustomerContent;
            InitValue = true;
        }
        field(70; Difficulty; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(80; "Instructor Code"; Code[20])
        {
            Caption = 'Instructor Code';
            DataClassification = CustomerContent;
            TableRelation = Resource."No." where(Type = const(Person));
        }
        field(90; "Instructor Name"; Text[50])
        {
            Caption = 'Instructor Name';
            FieldClass = FlowField;

            CalcFormula = lookup(Resource.Name where("No." = ))



        }

    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}

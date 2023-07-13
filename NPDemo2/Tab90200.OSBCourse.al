table 90200 "OSB Course"
{
    Caption = 'OSB Course';
    DataClassification = CustomerContent;
    DrillDownPageId = "OSB Course List";
    LookupPageId = "OSB Course List";

    fields
    {
        field(10; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(20; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(30; "Course Type"; Enum "OSB Course Type")
        {
            Caption = 'Course Type';
        }
        field(40; "Instructor Code"; Code[20])
        {
            Caption = 'Instructor Code';
            TableRelation = Resource."No." where(Type = const(Person));
        }
        field(50; "Instructor Name"; Text[100])
        {
            Caption = 'Instructor Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Resource.Name where("No." = field("Instructor Code"), Type = const(Person)));
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
        key(ByInstructorCode; "Instructor Code")
        {
            IncludedFields = Name;
        }
    }
    fieldgroups
    {
        fieldgroup(Brick; "Code", Name, "Instructor Code", "Instructor Name")
        {

        }
    }
}

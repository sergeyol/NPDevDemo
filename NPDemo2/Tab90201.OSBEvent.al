table 90201 "OSB Event"
{
    Caption = 'OSB Event';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Event Date"; Date)
        {
            Caption = 'Event Date';
        }
        field(3; "Course Code"; Code[20])
        {
            Caption = 'Course Code';
            TableRelation = "OSB Course";
        }
        field(4; "Course Name"; Text[100])
        {
            Caption = 'Course Name';
            FieldClass = FlowField;
            CalcFormula = lookup("OSB Course".Name where(Code = field("Course Code")));
            Editable = false;
        }
        field(5; "Instructor Code"; Code[20])
        {
            Caption = 'Instructor Code';
            TableRelation = Resource where(Type = const(Person));
        }
        field(6; "Instructor Name"; Text[100])
        {
            Caption = 'Instructor Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Resource.Name where("No." = field("Instructor Code"), Type = const(Person)));
            Editable = false;
        }
        field(7; "No. of Registered Participants"; Integer)
        {
            Caption = 'No. of Registered Participants';
            FieldClass = FlowField;
            CalcFormula = count("OSB Event Participant" where("Event No." = field("No."), "Registration Confirmed" = const(true)));
            Editable = false;
        }
        field(8; "No. of Actual Participants"; Integer)
        {
            Caption = 'No. of Actual Participants';
            FieldClass = FlowField;
            CalcFormula = count("OSB Event Participant" where("Event No." = field("No."), "Checked-in" = const(true)));
            Editable = false;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if Rec."Event Date" = 0D then
            Rec."Event Date" := WorkDate();
    end;
}

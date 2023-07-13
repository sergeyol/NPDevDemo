table 90202 "OSB Event Participant"
{
    Caption = 'OSB Event Participant';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Event No."; Code[20])
        {
            Caption = 'Event No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Registration Date"; Date)
        {
            Caption = 'Registration Date';
        }
        field(4; "Participant Contact No."; Code[20])
        {
            Caption = 'Participant Contact No.';
            TableRelation = Contact."No." where(Type = const(Person));

            trigger OnValidate()
            var
                Contact: Record Contact;
            begin
                if (Rec."Participant Contact No." <> '') and Contact.Get(Rec."Participant Contact No.") then begin
                    Rec."Participant Name" := Contact.Name;
                    Rec."Participant Email" := Contact."E-Mail";
                    Rec."Participant Phone" := Contact."Phone No.";
                end;
            end;
        }
        field(5; "Participant Name"; Text[100])
        {
            Caption = 'Participant Name';
        }
        field(6; "Participant Email"; Text[50])
        {
            Caption = 'Participant Email';
        }
        field(7; "Participant Phone"; Text[30])
        {
            Caption = 'Participant Phone';
        }
        field(8; "Registration Confirmed"; Boolean)
        {
            Caption = 'Registration Confirmed';
        }
        field(9; "Checked-in"; Boolean)
        {
            Caption = 'Checked-in';
        }
    }
    keys
    {
        key(PK; "Event No.", "Line No.")
        {
            Clustered = true;
        }
    }
}

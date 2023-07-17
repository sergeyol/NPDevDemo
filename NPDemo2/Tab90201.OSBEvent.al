table 90201 "OSB Event"
{
    Caption = 'OSB Event';
    DataClassification = CustomerContent;

    InherentPermissions = R;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                TestNoSeries();
            end;
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
        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
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
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if Rec."Event Date" = 0D then
            Rec."Event Date" := WorkDate();

        if "No." = '' then begin
            SalesSetup.ReadIsolation := SalesSetup.ReadIsolation::ReadUncommitted;
            SalesSetup.Get();
            SalesSetup.TestField("OSB Event Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."OSB Event Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    //[InherentPermissions(PermissionObjectType::Table, Database::"Sales & Receivables Setup", 'R')]
    local procedure TestNoSeries()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ErrorInfo: ErrorInfo;
    begin
        if (Rec."No." <> '') then begin
            if Rec."No." <> xRec."No." then begin
                Error('You are not allowed to enter number %1 manually', Rec.FieldCaption("No."));

                SalesSetup.Get();
                NoSeriesMgt.TestManual(SalesSetup."OSB Event Nos.");
                Rec."No. Series" := '';
            end;
        end else begin
            Rec."No. Series" := '';
        end;
    end;
}

page 90202 "OSB Event"
{
    ApplicationArea = All;
    Caption = 'OSB Event';
    PageType = Document;
    SourceTable = "OSB Event";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Event Date"; Rec."Event Date")
                {
                    ToolTip = 'Specifies the value of the Event Date field.';
                }
                field("Course Code"; Rec."Course Code")
                {
                    ToolTip = 'Specifies the value of the Course Code field.';
                }
                field("Course Name"; Rec."Course Name")
                {
                    ToolTip = 'Specifies the value of the Course Name field.';
                }
                field("Instructor Code"; Rec."Instructor Code")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Instructor Name"; Rec."Instructor Name")
                {
                    ToolTip = 'Specifies the value of the Instructor Name field.';
                }
            }
            part(ParticipantsSubpage; "OSB Event Participant Subpage")
            {
                SubPageLink = "Event No." = field("No.");
            }
        }
    }

    actions
    {
        area(Reporting)
        {
            action(PrintEvent)
            {
                Caption = 'Print Event';
                RunObject = Report "OSB Event Print";
                //RunPageLink =  "No." = field("No.");
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Event Date" := WorkDate();
    end;
}

page 90203 "OSB Event Participant Subpage"
{
    ApplicationArea = All;
    Caption = 'Participants';
    PageType = ListPart;
    SourceTable = "OSB Event Participant";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Registration Date"; Rec."Registration Date")
                {
                    ToolTip = 'Specifies the value of the Registration Date field.';
                }
                field("Participant Contact No."; Rec."Participant Contact No.")
                {
                    ToolTip = 'Specifies the value of the Participant Contact No. field.';
                }
                field("Participant Name"; Rec."Participant Name")
                {
                    ToolTip = 'Specifies the value of the Participant Name field.';
                }
                field("Participant Email"; Rec."Participant Email")
                {
                    ToolTip = 'Specifies the value of the Participant Email field.';
                }
                field("Participant Phone"; Rec."Participant Phone")
                {
                    ToolTip = 'Specifies the value of the Participant Phone field.';
                }
                field("Registration Confirmed"; Rec."Registration Confirmed")
                {
                    ToolTip = 'Specifies the value of the Registration Confirmed field.';
                }
                field("Checked-in"; Rec."Checked-in")
                {
                    ToolTip = 'Specifies the value of the Checked-in field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                    Editable = false;
                    //Visible = false;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Registration Date" := Today();
    end;
}

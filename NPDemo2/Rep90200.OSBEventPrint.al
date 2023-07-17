report 90200 "OSB Event Print"
{
    ApplicationArea = All;
    Caption = 'OSB Event Print';
    UsageCategory = ReportsAndAnalysis;
    DataAccessIntent = ReadOnly;

    // DefaultLayout = Word;
    // WordLayout = './OSB Event Print.docx';

    // DefaultLayout = Excel;
    // ExcelLayout = './OSB Event Print.xlsx';

    DefaultLayout = RDLC;
    RDLCLayout = './OSB Event Print.rdlc';

    dataset
    {
        dataitem(OSBEvent; "OSB Event")
        {
            column(No; "No.")
            {
            }
            column(EventDate; "Event Date")
            {
            }
            column(CourseName; "Course Name")
            {
            }
            column(InstructorName; "Instructor Name")
            {
            }
            column(NoofRegisteredParticipants; "No. of Registered Participants")
            {
            }
            column(NoofActualParticipants; "No. of Actual Participants")
            {
            }

            dataitem("OSB Event Participant"; "OSB Event Participant")
            {
                DataItemLinkReference = OSBEvent;
                DataItemLink = "Event No." = field("No.");

                column(ParticipantNo; ParticipantNo)
                { }
                column(Participant_Name; "Participant Name")
                { }
                column(Participant_Email; "Participant Email")
                { }
                column(Participant_Phone; "Participant Phone")
                { }
                column(Checked_in; "Checked-in")
                { }

                trigger OnPreDataItem()
                begin
                    ParticipantNo := 0;
                end;

                trigger OnAfterGetRecord()
                begin
                    ParticipantNo += 1;
                end;

                trigger OnPostDataItem()
                begin

                end;
            }

            trigger OnPreDataItem()
            begin
            end;

            trigger OnAfterGetRecord()
            begin
            end;

            trigger OnPostDataItem()
            begin

            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    var
        ParticipantNo: Integer;


    trigger OnInitReport()
    begin

    end;

    trigger OnPreReport()
    begin

    end;

    trigger OnPostReport()
    begin

    end;
}

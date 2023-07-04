page 90101 "OSA Course Card"
{
    ApplicationArea = All;
    Caption = 'OSA Course Card';
    PageType = Card;
    SourceTable = "OSA Course";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Code"; Rec."Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
            group(Details)
            {
                Caption = 'Details';

                field(Type; Rec."Type")
                {
                }
                field("Instructor Code"; Rec."Instructor Code")
                {
                }
                field(Active; Rec.Active)
                {
                }
                field(Difficulty; Rec.Difficulty)
                {
                }
                field("Duration"; Rec."Duration")
                {
                }
                field(Price; Rec.Price)
                {
                }
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            actionref(InstructorResourceCard_Promoted; InstructorResourceCard)
            {
            }
        }
        area(Navigation)
        {
            action(InstructorResourceCard)
            {
                Caption = 'Instructor Resource Card';
                Image = Card;
                RunObject = page "Resource Card";
                RunPageLink = "No." = field("Instructor Code");
            }
        }
    }
}

pageextension 90201 "OSB Resource Card" extends "Resource Card"
{
    layout
    {
        addlast(General)
        {
            field("OSB Instructor Level"; Rec."OSB Instructor Level")
            {
                ApplicationArea = All;
            }
            field("OSB No. of Courses"; Rec."OSB No. of Courses")
            {
                ApplicationArea = All;
            }
        }
    }
}

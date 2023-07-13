pageextension 90200 "OSB Resource List" extends "Resource List"
{
    layout
    {
        addlast(Control1)
        {
            field("OSB No. of Courses"; Rec."OSB No. of Courses")
            {
                ApplicationArea = All;
            }
        }
    }
}

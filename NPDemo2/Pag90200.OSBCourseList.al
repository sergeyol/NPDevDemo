page 90200 "OSB Course List"
{
    ApplicationArea = All;
    Caption = 'OSB Course List';
    PageType = List;
    SourceTable = "OSB Course";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Course Type"; Rec."Course Type")
                {
                    ToolTip = 'Specifies the value of the Course Type field.';
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
        }
    }
}

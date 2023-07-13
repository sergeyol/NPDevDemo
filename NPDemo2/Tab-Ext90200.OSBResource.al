tableextension 90200 "OSB Resource" extends Resource
{
    fields
    {
        field(90200; "OSB Instructor Level"; Integer)
        {
            Caption = 'Instructor Level';
            DataClassification = CustomerContent;
        }
        field(90201; "OSB No. of Courses"; Integer)
        {
            Caption = 'No. of Courses';
            FieldClass = FlowField;
            CalcFormula = count("OSB Course" where("Instructor Code" = field("No.")));
            Editable = false;
        }
    }
}

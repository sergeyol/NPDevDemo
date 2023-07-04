tableextension 90100 "OSA Resource OSA" extends Resource
{
    fields
    {
        field(90100; "OSA Instructor Level"; Integer)
        {
            Caption = 'Instructor Level';
            DataClassification = ToBeClassified;
        }
        field(90101; "OSA No. of Courses"; Integer)
        {
            Caption = 'No. of Courses';
            FieldClass = FlowField;
            CalcFormula = count("OSA Course" where("Instructor Code" = field("No.")));
        }
    }
}

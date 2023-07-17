pageextension 90202 "OSB Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field("OSB Event Nos."; Rec."OSB Event Nos.")
            {
                ApplicationArea = All;
            }
        }
    }
}

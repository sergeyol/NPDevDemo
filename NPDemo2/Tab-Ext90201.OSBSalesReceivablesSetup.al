tableextension 90201 "OSB Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(90200; "OSB Event Nos."; Code[20])
        {
            Caption = 'OSB Event Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }
}

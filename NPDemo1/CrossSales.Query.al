query 90101 "Cross Sales"
{
    Caption = 'Cross Sales';
    QueryType = Normal;

    elements
    {
        dataitem(SalesHeader; "Sales Header")
        {
            filter(ShipmentDate; "Shipment Date")
            {
            }
            filter(DocumentDate; "Document Date")
            {
            }
            column(CurrencyCode; "Currency Code")
            {
            }
            column(HeaderAmount; Amount)
            {

            }
            // column(Last_Email_Notif_Cleared; "Last Email Notif Cleared")
            // { }
            filter(Status; Status)
            {
            }
            dataitem(SalesLine; "Sales Line")
            {
                SqlJoinType = InnerJoin;
                DataItemLink = "Document Type" = SalesHeader."Document Type", "Document No." = SalesHeader."No.";

                column(Amount; Amount)
                {
                    //Method = Sum;
                }
            }
        }
    }
}

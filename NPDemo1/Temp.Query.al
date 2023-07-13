query 90100 Temp
{
    QueryType = Normal;

    OrderBy = ascending(CurrencyCode);

    elements
    {
        dataitem(SalesHeader; "Sales Header")
        {
            DataItemTableFilter = "Document Type" = const(Order);
            filter(ShipmentDate; "Shipment Date")
            { }
            filter(Status; Status)
            { }
            filter(DocumentDate; "Document Date")
            { }
            column(CurrencyCode; "Currency Code")
            { }
            dataitem(SalesLine; "Sales Line")
            {
                DataItemLink = "Document Type" = SalesHeader."Document Type", "Document No." = SalesHeader."No.";
                column(Amount; Amount)
                {
                    Method = Sum;
                }
            }
        }
    }

}

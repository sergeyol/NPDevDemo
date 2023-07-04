pageextension 90100 "OSA Resource List OSA" extends "Resource List"
{
    layout
    {
        addafter(Type)
        {
            field("OSA No. of Courses"; Rec."OSA No. of Courses")
            {
                ApplicationArea = All;
            }
        }
    }

    procedure GetPrimaryContact(CustomerNo: Code[20]; var PrimaryContact: Record Contact)
    var
        Customer: Record Customer;
        CustLedgEntry: Record "Cust. Ledger Entry";
        filterText: Text;
    begin
        Clear(PrimaryContact);

        Customer.SetCurrentKey("No.");

        Customer.ReadIsolation := IsolationLevel::ReadCommitted;
        Customer.SetRange("No.");
        Customer.SetRange("No.", '10000');
        Customer.SetRange("No.", '10000', '30000');
        Customer.SetFilter("No.", '>10000&<30000');
        Customer.SetFilter("Last Date Modified", '>%1|%2', Today, 0D);

        filterText := Customer.GetFilter("No.");

        if Customer.Get(CustomerNo) then
            if PrimaryContact.Get(Customer."Primary Contact No.") then;

        Customer.Init();
        Customer.Validate("No.", '10000');
        Customer.Insert();

        Customer.SetAutoCalcFields(Balance, "Balance (LCY)");
        Customer.Get('10000');
        //Customer.CalcFields(Balance, "Balance (LCY)");

        Message('%1', Customer.Balance);

        CustLedgEntry.SetRange("Customer No.", Customer."No.");
        CustLedgEntry.CalcSums("Sales (LCY)");

        Message('%1', CustLedgEntry."Sales (LCY)");

        Message(Customer.FieldCaption("No."));

        Customer.TestField("No.", 'ZZZ');



    end;
}

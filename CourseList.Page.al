page 90100 "OSA Course List"
{
    ApplicationArea = All;
    Caption = 'OSA Course List';
    PageType = List;
    SourceTable = "OSA Course";
    UsageCategory = Lists;
    CardPageId = "OSA Course Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Price; Rec.Price)
                {
                }
                field("Instructor Code"; Rec."Instructor Code")
                {
                }
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            actionref(Test_Promoted; Test)
            { }
        }
        area(Processing)
        {
            action(Test)
            {
                Caption = 'Test Data Access';
                ApplicationArea = All;

                trigger OnAction()
                var
                    Customer: Record Customer;
                    CustLedgEntry: Record "Cust. Ledger Entry";
                    filterText: Text;
                    NoOfCustomers: Integer;
                begin
                    // Get, Insert
                    Customer.ReadIsolation := IsolationLevel::RepeatableRead;
                    if not Customer.Get('10000') then begin
                        Customer.Init();
                        Customer.Validate("No.", '10000');
                        Customer.Name := 'Test Customer';
                        Customer.Insert(true);
                    end;

                    Customer.LockTable();
                    Customer.Get('10000');
                    Customer.Name := 'Blocking Test';
                    Customer.Modify();
                    //Commit();

                    Customer.CalcFields(Balance);

                    Clear(Customer);

                    Customer.SetRange("No.", '10000', '10001');

                    NoOfCustomers := Customer.Count();

                    Customer.SetLoadFields("No.", Name, Address, City);
                    Customer.SetAutoCalcFields(Balance);
                    Customer.FindFirst();

                    Message('%1 - %2', Customer."No.", Customer.Name);


                end;
            }
        }
    }
}

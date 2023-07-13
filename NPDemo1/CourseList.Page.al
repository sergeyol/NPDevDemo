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
            action(TestXml)
            {
                trigger OnAction()
                var
                    XmlDoc: XmlDocument;
                begin

                end;
            }
            action(TestQuery)
            {
                Caption = 'Test Query';

                trigger OnAction()
                var
                    ActivityLog: Record "Activity Log" temporary;
                    CrossQuery: Query "Cross Sales";
                    Window: Dialog;
                begin
                    Window.Open('Query: #1 #2');
                    //CrossQuery.TopNumberOfRows(2);
                    CrossQuery.Open();
                    while CrossQuery.Read() do begin
                        ActivityLog.ID += 1;
                        ActivityLog."Activity Message" := CrossQuery.CurrencyCode;
                        ActivityLog.Description := Format(CrossQuery.Amount);
                        ActivityLog.Insert();

                        sleep(1000);

                        Window.Update(1, CrossQuery.CurrencyCode);
                        Window.Update(2, CrossQuery.Amount);

                        //Message('%1 - %2', CrossQuery.CurrencyCode, CrossQuery.Amount);
                    end;
                    CrossQuery.Close();
                    Window.Close();

                    //Page.RunModal(Page::"Activity Log", ActivityLog);
                end;
            }
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

pageextension 90240 "OSB Customer Card" extends "Customer Card"
{
    layout
    {
        addbefore(ShowMap)
        {
            usercontrol(GetLocation; GetLocation)
            {
                ApplicationArea = All;

                trigger Result(inLongitude: Text; inLatitude: Text)
                begin
                    Message('%1 - %2', inLongitude, inLatitude);
                end;
            }
        }
    }
    actions
    {
        addlast(Processing)
        {
            action(RequestGeoAction)
            {
                Caption = 'Request Geo';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    CurrPage.GetLocation.RequestGeo();
                end;
            }
        }
    }
}

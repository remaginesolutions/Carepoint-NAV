pageextension 16035530 pageextension16035530 extends "Posted Sales Invoices"
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HBSVK CAREPOINT1.00 2016-11-07 - Action "Print Service Invoice" added (ticket #10209)
    layout
    {
        addafter("<Document Exchange Status>")
        {
            field("NDIA Claim Reference"; "NDIA Claim Reference")
            {
                ApplicationArea = All;
            }
            field("NDIA Claim Uploaded"; "NDIA Claim Uploaded")
            {
                ApplicationArea = All;
            }
            field("Pantry Invoice"; "Pantry Invoice")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(IncomingDoc)
        {
            action("Reset NDIA Upload Status")
            {
                Caption = 'Reset NDIA Upload Status';
                Image = VoidCheck;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    // HBS VK CAREPOINT1.00 #10235 >>
                    Rec."NDIA Claim Uploaded" := FALSE;
                    MODIFY;
                    // HBS VK CAREPOINT1.00 #10235 <<
                end;
            }
        }
        addafter(Print)
        {
            action("&Print Service Invoice")
            {
                Caption = '&Print Service Invoice';
                ApplicationArea = All;
                Ellipsis = true;
                Image = Print;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;

                trigger OnAction()
                var
                    SalesInvHeader: Record "Sales Invoice Header";
                begin
                    // CAREPOINT1.00 >>
                    SalesInvHeader := Rec;
                    CurrPage.SETSELECTIONFILTER(SalesInvHeader);
                    REPORT.RUN(REPORT::"Sales - Invoice Service CAW", TRUE, FALSE, SalesInvHeader);
                    // CAREPOINT1.00 <<
                end;
            }
        }
    }
}


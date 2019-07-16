pageextension 16035528 pageextension16035528 extends "Posted Sales Invoice"
{
    // version NAVW113.00,CAREPOINT1.00

    // HBSML CAREPOINT1.00 2014-10-22 - Set DeleteAllowed property value to 'No'
    // HBSVK CAREPOINT1.00 2016-11-07 - Action "Print Service Invoice" added (ticket #10209)
    // HBSVK CAREPOINT1.00 2016-11-07 - Field "NDIS Claim Reference" added (ticket #10235)
    layout
    {
        addafter("No. Printed")
        {
            field("NDIA Claim Reference"; "NDIA Claim Reference")
            {
                ApplicationArea = All;
                Editable = false;
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
        addafter(Print)
        {
            action("&Print Service Invoice")
            {

                Caption = '&Print Service Invoice';
                Ellipsis = true;
                Image = Print;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;

                trigger OnAction()
                begin
                    // CAREPOINT1.00 >>
                    SalesInvHeader := Rec;
                    CurrPage.SETSELECTIONFILTER(SalesInvHeader);
                    REPORT.RUN(REPORT::"Sales - Invoice Service CAW", TRUE, FALSE, SalesInvHeader);
                    // CAREPOINT1.00 <<
                end;
            }
        }
        addafter(ShowCreditMemo)
        {
            action("Reset NDIA Upload Status")
            {
                Caption = 'Reset NDIA Upload Status';
                Image = VoidCheck;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // HBS VK CAREPOINT1.00 #10235 >>
                    Rec."NDIA Claim Uploaded" := FALSE;
                    MODIFY;
                    // HBS VK CAREPOINT1.00 #10235 <<
                end;
            }
        }
        addlast("&Invoice")
        {
            action("&ePDF Email Sales Invoice")
            {
                Image = SendEmailPDF;
                ApplicationArea = All;
                trigger OnAction();
                var
                    ePDFSetup: Record "ePDF Setup";
                    Cust: Record Customer;
                    EmailSent: Boolean;
                    QueueCreated: Boolean;
                    ePDF: Codeunit "ePDF Management";
                begin
                    ePDFSetup.GET;
                    Cust.GET("Sell-to Customer No.");
                    IF (ePDFSetup."Posted Sales Invoice" <> '') AND Cust."ePDF Email" THEN BEGIN
                        EmailSent := ePDF.SendDocument(ePDFSetup."Posted Sales Invoice", "No.");
                        QueueCreated := TRUE;
                    END ELSE
                        ERROR('Posted Sales Invoice Document not setup in ePDF Setup OR ePDF not enabled for this Customer.');

                    IF EmailSent THEN
                        MESSAGE('ePDF Email has been sent.')
                    ELSE
                        MESSAGE('ePDF Email Queue has been created.');
                end;
            }

        }
    }

    var
        SalesInvHeader: Record "Sales Invoice Header";
}


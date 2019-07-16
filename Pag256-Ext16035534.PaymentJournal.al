pageextension 16035534 pageextension16035534 extends "Payment Journal"
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    layout
    {
        addafter("Account No.")
        {
            field("Account Description"; "Account Description")
            {
                ApplicationArea = All;
            }
        }
        addafter("Bal. Account No.")
        {
            field("Bal. Account Description"; "Bal. Account Description")
            {
                ApplicationArea = All;
            }
        }
        addafter("Bal. Account Description")
        {
            field("Bank Reference"; "Bank Reference")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(SuggestVendorPayments)
        {
            action("Remittance Advice")
            {
                ApplicationArea = All;
                Caption = 'Print Remittance Advice';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // CAREPOINT1.00 >>
                    SETRANGE("Journal Template Name");
                    SETRANGE("Journal Batch Name");
                    REPORT.RUN(REPORT::"Remittance Advice Non-Sum", TRUE, FALSE, Rec);
                    // CAREPOINT1.00 <<
                end;
            }
        }
        // Add changes to page actions here
        addlast("Electronic Payments")
        {
            action("&ePDF Email Remittance Advices")
            {
                Image = SendEmailPDF;
                ApplicationArea = All;
                trigger OnAction();
                var
                    ePDFSetup: Record "ePDF Setup";
                    Vend: Record Vendor;
                    EmailSent: Boolean;
                    QueueCreated: Boolean;
                    ePDF: Codeunit "ePDF Management";
                    recGenJnlLine: Record "Gen. Journal Line";
                    ePDFDocSetup: Record "ePDF Document Setup";
                    ePDFQueue: Record "ePDF Queue";
                    QueueEntryNo: Integer;
                begin
                    ePDFSetup.GET;
                    IF ePDFSetup."Remittance Advice" <> '' THEN BEGIN
                        recGenJnlLine.RESET;
                        recGenJnlLine.SETRANGE("Journal Template Name", "Journal Template Name");
                        recGenJnlLine.SETRANGE("Journal Batch Name", "Journal Batch Name");
                        IF recGenJnlLine.FINDSET THEN BEGIN

                            IF NOT ePDFDocSetup.GET(ePDFSetup."Remittance Advice") THEN
                                ERROR('Could not find ePDF Document Setup for Document Code %1 .', ePDFSetup."Remittance Advice");

                            IF NOT ePDFDocSetup.Enable THEN
                                ERROR('Document Code %1 is not enabled in ePDF Document Setup.', ePDFSetup."Remittance Advice");

                            REPEAT
                                Vend.GET(recGenJnlLine."Account No.");
                                IF Vend."ePDF Email" THEN BEGIN
                                    IF Vend."ePDF Email-Remittance" THEN BEGIN
                                        ePDFQueue.RESET;
                                        ePDFQueue.SETRANGE("Document Code", ePDFSetup."Remittance Advice");
                                        ePDFQueue.SETRANGE("Document No.", recGenJnlLine."Account No.");
                                        IF NOT ePDFQueue.FINDFIRST THEN BEGIN
                                            ePDF.SetPaymentJnlTemplate_Batch(recGenJnlLine."Journal Template Name", recGenJnlLine."Journal Batch Name");
                                            QueueEntryNo := ePDF.CreateDocQueue(ePDFSetup."Remittance Advice", recGenJnlLine."Account No.");
                                            QueueCreated := TRUE;
                                        END;
                                    END;
                                END;
                            UNTIL recGenJnlLine.NEXT = 0;

                            ePDFQueue.RESET;
                            ePDFQueue.SETRANGE("Document Code", ePDFSetup."Remittance Advice");
                            IF NOT ePDFDocSetup."Use Batch Processing" AND ePDFQueue.FINDSET THEN
                                REPEAT
                                    ePDF.SetPaymentJnlTemplate_Batch("Journal Template Name", "Journal Batch Name");
                                    ePDF.CreatePDFandEmail(ePDFQueue."Entry No.");
                                    EmailSent := TRUE;
                                UNTIL ePDFQueue.NEXT = 0;
                        END;
                    END ELSE
                        ERROR('Posted Purchase Credit Memo Document not setup in ePDF Setup OR ePDF not enabled for this Vendor.');

                    IF EmailSent THEN
                        MESSAGE('ePDF Email has been sent.')
                    ELSE
                        MESSAGE('ePDF Email Queue has been created.');
                end;
            }

        }

    }
}


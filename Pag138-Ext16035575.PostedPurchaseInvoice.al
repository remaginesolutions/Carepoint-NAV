pageextension 16035575 pageextension16035575 extends "Posted Purchase Invoice"
{
    // version NAVW113.00,CAREPOINT1.00

    // ReSRP Ticket #10854 2017-11-01: Action added for Milestone lines
    actions
    {
        addafter(Dimensions)
        {
            action("Milestone Tracking Lines")
            {
                Caption = 'Milestone Tracking Lines';
                Image = Track;
                Promoted = true;
                PromotedCategory = "Report";
                ApplicationArea = All;

                trigger OnAction()
                var
                    PurchOrdMilestoneLine: Record "Purch. Ord. Milestone Line";
                    PurchOrdMilestoneLines: Page "Purch. Ord. Milestone Lines";
                begin
                    CLEAR(PurchOrdMilestoneLines);
                    PurchOrdMilestoneLine.RESET;
                    PurchOrdMilestoneLine.SETRANGE("Document Type", PurchOrdMilestoneLine."Document Type"::"Posted Invoice");
                    PurchOrdMilestoneLine.SETRANGE("No.", "No.");
                    PurchOrdMilestoneLines.SETTABLEVIEW(PurchOrdMilestoneLine);
                    PurchOrdMilestoneLines.RUNMODAL;
                end;
            }
        }
        addlast("Actions")
        {
            action("&ePDF Email Posted Purchase Invoice")
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
                begin
                    ePDFSetup.GET;
                    Vend.GET("Buy-from Vendor No.");
                    IF (ePDFSetup."Posted Purchase Invoice" <> '') AND Vend."ePDF Email" THEN BEGIN
                        EmailSent := ePDF.SendDocument(ePDFSetup."Posted Purchase Invoice", "No.");
                        QueueCreated := TRUE;
                    END ELSE
                        ERROR('Posted Purchase Invoice Document not setup in ePDF Setup OR ePDF not enabled for this Vendor.');

                    IF EmailSent THEN
                        MESSAGE('ePDF Email has been sent.')
                    ELSE
                        MESSAGE('ePDF Email Queue has been created.');
                end;
            }

        }

    }
}


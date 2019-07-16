pageextension 16035611 PurchaseOrderExt extends "Purchase Order"
{
    layout
    {
        // Add changes to page layout here
        addfirst(FactBoxes)
        {
            part(BudgetExpenditure; "Budget Expenditure Factbox")
            {
                ApplicationArea = All;
                SubPageLink = Code = FIELD ("Shortcut Dimension 1 Code");
            }

        }
    }

    actions
    {
        // Add changes to page actions here
        // Add changes to page actions here
        addlast(Print)
        {
            action("&ePDF Email Purchase Order")
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
                    IF (ePDFSetup."Purchase Order" <> '') AND Vend."ePDF Email" THEN BEGIN
                        EmailSent := ePDF.SendDocument(ePDFSetup."Purchase Order", "No.");
                        QueueCreated := TRUE;
                    END ELSE
                        ERROR('Purchase Order Document not setup in ePDF Setup OR ePDF not enabled for this Vendor.');

                    IF EmailSent THEN
                        MESSAGE('ePDF Email has been sent.')
                    ELSE
                        MESSAGE('ePDF Email Queue has been created.');
                end;
            }

        }

    }

    var
        myInt: Integer;
}
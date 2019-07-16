pageextension 16035606 epdfVendor extends "Vendor Card"
{
    layout
    {
        addlast(General)
        {
            // Add changes to page layout here
            field("ePDF Email"; "ePDF Email")
            {
                ApplicationArea = All;

            }
            field("ePDF Email-RCTI"; "ePDF Email-RCTI")
            {
                ApplicationArea = All;

            }
            field("ePDF Email - Remittance"; "ePDF Email-Remittance")
            {
                ApplicationArea = All;

            }

        }
    }

    actions
    {
        // Add changes to page actions here
        addlast(Creation)
        {
            group(function)
            {
                Action("&ePDF Email Vendor Statement")
                {
                    ApplicationArea = All;
                    Image = SendEmailPDF;
                    trigger OnAction();
                    var
                        ePDFSetup: record "ePDF Setup";
                        EmailSent: Boolean;
                        QueueCreated: Boolean;
                        ePDF: Codeunit "ePDF Management";
                    begin
                        ePDFSetup.GET;
                        IF (ePDFSetup."Vendor Statement" <> '') AND "ePDF Email" THEN BEGIN
                            EmailSent := ePDF.SendDocument(ePDFSetup."Vendor Statement", "No.");
                            QueueCreated := TRUE;
                        END ELSE
                            ERROR('Vendor Statement Document not setup in ePDF Setup OR ePDF not enabled for this Vendor.');

                        IF EmailSent THEN
                            MESSAGE('ePDF Email has been sent.')
                        ELSE
                            MESSAGE('ePDF Email Queue has been created.');
                    end;

                }
            }
        }
    }

}
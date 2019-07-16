pageextension 16035500 pageextension16035500 extends "Account Manager Activities"
{
    // version NAVW113.00,CAREPOINT1.00

    Caption = 'Activities';
    layout
    {
        addafter("POs Pending Approval")
        {
            field("PIs Pending Approval"; "PIs Pending Approval")
            {
                DrillDownPageID = "Purchase Invoices";
            }
        }
        addafter("Incoming Documents")
        {
            cuegroup("Documents Authorised for Posting")
            {
                Caption = 'Documents Authorised for Posting';
                field("Orders Authorized for Posting"; "Orders Authorized for Posting")
                {
                    Caption = '<Orders Authorised for Posting>';
                    DrillDownPageID = "Purchase Order List";
                }
                field("Invoice Authorized for Posting"; "Invoice Authorized for Posting")
                {
                    Caption = '<Invoice Authorised for Posting>';
                    DrillDownPageID = "Purchase Invoices";
                }

                actions
                {
                    action(IncomingDocuments)
                    {
                        Caption = 'View Incoming Documents';
                        RunObject = Page 190;
                        RunPageMode = View;
                    }
                }
            }
        }
    }
}


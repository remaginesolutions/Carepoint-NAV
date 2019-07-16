pageextension 16035582 pageextension16035582 extends "Purchases & Payables Setup"
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HBSML CAREPOINT1.00 26/06/2014 - "Add EFT Export Path" field and merge codes from HumeEFTNAV2013 database
    // HUMEEFT RK 16/07/14 : added field "EFT Bank Reference No. Series"
    // HBSTG CAREPOINT1.00 2015-10-01: Added field "Invoice Auth. Mandatory"
    // ReSRP #10882:"EFT Bank Reference No. Series" field Added
    // ReSRP Ticket #10854 2017-11-01: Field added "Enable Milestone"
    layout
    {
        addafter("Default Qty. to Receive")
        {
            field("EFT Bank Reference No. Series"; "EFT Bank Reference No. Series")
            {
                ApplicationArea = All;
            }
            field("Invoice Auth. Mandatory"; "Invoice Auth. Mandatory")
            {
                ApplicationArea = All;
            }
        }
        addafter("Allow Document Deletion Before")
        {
            field("Enable Milestones"; "Enable Milestones")
            {
                ApplicationArea = All;
            }
        }
    }

    var
        CommonDialog: Codeunit "File Management";
}


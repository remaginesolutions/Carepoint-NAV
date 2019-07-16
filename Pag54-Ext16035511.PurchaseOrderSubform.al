pageextension 16035511 pageextension16035511 extends "Purchase Order Subform"
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HBSTG CAREPOINT1.00 2015-09-19: Created new functions for changing GL Code and direct unit cost on Purchase Line
    // ReSRP Ticket #10854 2017-11-01: Action added for Milestone lines
    actions
    {
        addafter(DeferralSchedule)
        {
            action("Milestone Tracking Lines")
            {
                ApplicationArea = All;
                Caption = 'Milestone Tracking Lines';
                Image = ItemTrackingLines;

                trigger OnAction()
                begin
                    ShowMilestoneLines;  //ReSRP 2017-11-01
                end;
            }
        }
        addafter(OrderTracking)
        {
            action("Change G/L Account")
            {

                trigger OnAction()
                begin
                    ChangeGLAcc; // HBSTG CAREPOINT1.00 2015-09-19
                end;
            }
            action("Change Amount")
            {

                trigger OnAction()
                begin
                    ChangeDirectUnitCost; // HBSTG CAREPOINT1.00 2015-09-19
                end;
            }
        }
    }

    var
        ChangeGLAccount: Page "Change G/L Account";
        NewGLAccCode: Code[20];
}


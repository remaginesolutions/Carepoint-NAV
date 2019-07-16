pageextension 16035594 pageextension16035594 extends "Approval User Setup"
{
    // version NAVW113.00,CAREPOINT1.00

    // HBSTG CAREPOINT1.00 2014-09-17: Added field "User Full Name"
    // HBS SA CAREPOINT1.00: new action 'Level-Based Approvals' added
    layout
    {
        addafter("User ID")
        {
            field("User Full Name"; "User Full Name")
            {
            }
        }
    }
    actions
    {
        addafter("Notification Setup")
        {
            action("Level Based Approvals")
            {
                Image = SocialSecurityLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page 16035406;
            }
        }
    }
}


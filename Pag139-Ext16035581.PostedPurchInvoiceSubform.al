pageextension 16035581 pageextension16035581 extends "Posted Purch. Invoice Subform"
{
    // version NAVW113.00,CAREPOINT1.00

    // ReSRP Ticket #10854 2017-11-01: Action added for Milestone lines
    layout
    {
        addafter("Shortcut Dimension 2 Code")
        {
            field("Shortcut Dimension 3 Code"; ShortcutDimCode[3])
            {
                ApplicationArea = Suite;
                CaptionClass = '1,2,3';
                TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (3),
                                                              "Dimension Value Type" = CONST (Standard),
                                                              Blocked = CONST (false));
            }
            field("Shortcut Dimension 4 Code"; ShortcutDimCode[4])
            {
                ApplicationArea = Suite;
                CaptionClass = '1,2,4';
                TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (4),
                                                              "Dimension Value Type" = CONST (Standard),
                                                              Blocked = CONST (false));
            }
            field("Shortcut Dimension 5 Code"; ShortcutDimCode[5])
            {
                ApplicationArea = Suite;
                CaptionClass = '1,2,5';
                TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (5),
                                                              "Dimension Value Type" = CONST (Standard),
                                                              Blocked = CONST (false));
            }
            field("Shortcut Dimension 6 Code"; ShortcutDimCode[6])
            {
                ApplicationArea = Suite;
                CaptionClass = '1,2,6';
                TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (6),
                                                              "Dimension Value Type" = CONST (Standard),
                                                              Blocked = CONST (false));
            }
            field("Shortcut Dimension 7 Code"; ShortcutDimCode[7])
            {
                ApplicationArea = Suite;
                CaptionClass = '1,2,7';
                TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (7),
                                                              "Dimension Value Type" = CONST (Standard),
                                                              Blocked = CONST (false));
            }
            field("Shortcut Dimension 8 Code"; ShortcutDimCode[8])
            {
                ApplicationArea = Suite;
                CaptionClass = '1,2,8';
                TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (8),
                                                              "Dimension Value Type" = CONST (Standard),
                                                              Blocked = CONST (false));
            }
            field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(DeferralSchedule)
        {
            action("Milestone Tracking Lines")
            {
                Caption = 'Milestone Tracking Lines';
                Image = ItemTrackingLines;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    ShowMilestoneLines;
                end;
            }
        }
    }

    var
        ShortcutDimCode: array[8] of Code[20];
        DimMgt: Codeunit "DimensionManagement";

    [Scope('Personalization')]
    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID", ShortcutDimCode); // #11804
    end;

    // [EventSubscriber(ObjectType::"Page", 139, 'OnAfterGetRecordEvent', '', false, false)]
    // local procedure PostedPurchInvSubformOnAfterGetRecordEvent(var Rec: Record "Purch. Inv. Line")
    // begin
    //     ShowShortcutDimCode(ShortcutDimCode); // #11804
    // end;
}


pageextension 16035580 pageextension16035580 extends "Job Planning Lines"
{
    // version NAVW113.00,CAREPOINT1.00

    // ReSRP CAREPOINT1.00 2018-08-14: New field "NDIS Claim Reference Code" and code ( action) added (Ticket #10997)
    layout
    {
        addafter(Description)
        {
            field(CorrectionField; Correction)
            {
                ApplicationArea = All;
                Caption = 'Correction';
            }
            field("Ready to Credit and Invoice"; "Ready to Credit and Invoice")
            {
                ApplicationArea = All;
            }
        }
        addafter("Work Type Code")
        {
            field("NDIS Claim Reference Code"; "NDIS Claim Reference Code")
            {
                Editable = ClaimRefEditable;
            }
        }
        addafter(Overdue)
        {
            field("Scheduled Start"; "Scheduled Start")
            {
            }
            field("Scheduled End"; "Scheduled End")
            {
            }
        }
    }
    actions
    {
        addafter("F&unctions")
        {
            group(Correction)
            {
                Caption = 'Correction';
                Image = "Action";
                action("Create Correction Lines")
                {
                    Caption = 'Create Correction Lines';
                    Image = CreateLinesFromJob;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        JobPlanningLine: Record "Job Planning Line";
                        ProcessNDISErrorLines: Report "Process NDIS Error Lines";
                    begin
                        //ReSRP 2018-04-11:Start:
                        JobPlanningLine.COPY(Rec);
                        CurrPage.SETSELECTIONFILTER(JobPlanningLine);
                        IF JobPlanningLine.FINDSET THEN BEGIN
                            REPEAT
                                CLEAR(ProcessNDISErrorLines);
                                ProcessNDISErrorLines.CreateReversalJPLines(JobPlanningLine);
                            UNTIL JobPlanningLine.NEXT = 0;
                            MESSAGE(ReversalCompleted);
                        END;
                        //ReSRP 2018-04-11:End:
                    end;
                }
            }
        }
    }

    var
        ShowNDISWarning: Boolean;
        NDISMessageTxt: Label 'Please ensure line status is changed to ''CORRECTED''.';
        ReversalCompleted: Label 'Reversal Lines have(has) been created for the selected job planning lines.';
        ClaimRefEditable: Boolean;

    procedure SetShowNDISWarning(NewValue: Boolean)
    begin
        // CAREPOINT1.00 >>
        ShowNDISWarning := NewValue;
        // CAREPOINT1.00 <<
    end;

    local procedure CheckClaimRefereceNo()
    var
        Job1: Record "Job";
    begin
        // CAREPOINT1.00 >>
        IF Job1.GET(Rec."Job No.") THEN BEGIN
            IF (Job1."NDIA Claim") AND NOT (Rec."CRM-Imported Entry") AND Correction THEN
                Rec.TESTFIELD("NDIS Claim Reference Code");
        END;
        // CAREPOINT1.00 <<
    end;
}


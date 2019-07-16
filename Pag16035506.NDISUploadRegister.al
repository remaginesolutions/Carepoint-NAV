page 16035506 "NDIS Upload Register"
{
    // version CAREPOINT1.00

    // ReSRP CAREPOINT1.00 2018-04-10: New field "NDIS Claim Reference Code" and Work Type code added

    DelayedInsert = true;
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "NDIS Upload Register";
    UsageCategory = Lists;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Posted Sales Invoice No."; "Posted Sales Invoice No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Shipment Date"; "Shipment Date")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer Name"; "Sell-to Customer Name")
                {
                    ApplicationArea = All;
                }
                field("NDIS Claim Reference Code"; "NDIS Claim Reference Code")
                {
                    ApplicationArea = All;
                }
                field("Work Type Code"; "Work Type Code")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = All;
                }
                field("Job No."; "Job No.")
                {
                    ApplicationArea = All;
                }
                field("Job Task No."; "Job Task No.")
                {
                    ApplicationArea = All;
                }
                field(Status; Status)
                {
                    ApplicationArea = All;
                }
                field("Date Logged"; "Date Logged")
                {
                    ApplicationArea = All;
                }
                field("Time Logged"; "Time Logged")
                {
                    ApplicationArea = All;
                }
                field("Logged By"; "Logged By")
                {
                    ApplicationArea = All;
                }
                field("Date Uploaded"; "Date Uploaded")
                {
                    ApplicationArea = All;
                }
                field("Time Uploaded"; "Time Uploaded")
                {
                    ApplicationArea = All;
                }
                field("Uploaded By"; "Uploaded By")
                {
                    ApplicationArea = All;
                }
                field("Date Imported"; "Date Imported")
                {
                    ApplicationArea = All;
                }
                field("Time Imported"; "Time Imported")
                {
                    ApplicationArea = All;
                }
                field("Imported By"; "Imported By")
                {
                    ApplicationArea = All;
                }
                field("Error Text"; "Error Text")
                {
                    ApplicationArea = All;
                }
                field("Error Text2"; "Error Text2")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Job Planning Lines")
            {
                Image = Line;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    JobPlanningLine: Record "Job Planning Line";
                    JobPlanningLines: Page "Job Planning Lines";
                    CarepointSetup: Record "Carepoint Setup";
                begin
                    JobPlanningLine.SETRANGE("Job No.", "Job No.");
                    JobPlanningLine.SETRANGE("Job Task No.", "Job Task No.");
                    JobPlanningLine.SETRANGE("NDIS Claim Reference Code", "NDIS Claim Reference Code");
                    CarepointSetup.GET;
                    IF CarepointSetup."NDIS Upload Status Warning En." THEN
                        JobPlanningLines.SetShowNDISWarning(TRUE);
                    JobPlanningLines.SETTABLEVIEW(JobPlanningLine);
                    JobPlanningLines.RUNMODAL
                end;
            }
            action("Process ERROR Lines")
            {
                Image = MoveNegativeLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    JobPlanningLine: Record "Job Planning Line";
                    JobPlanningLines: Page "Job Planning Lines";
                    CarepointSetup: Record "Carepoint Setup";
                begin
                    JobPlanningLine.SETRANGE("Job No.", "Job No.");
                    JobPlanningLine.SETRANGE("Job Task No.", "Job Task No.");
                    JobPlanningLine.SETRANGE("NDIS Claim Reference Code", "NDIS Claim Reference Code");
                    CarepointSetup.GET;
                    IF CarepointSetup."NDIS Upload Status Warning En." THEN
                        JobPlanningLines.SetShowNDISWarning(TRUE);
                    JobPlanningLines.SETTABLEVIEW(JobPlanningLine);
                    JobPlanningLines.RUNMODAL
                end;
            }
            action("Process Bulk ERROR Lines")
            {
                Image = MoveNegativeLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ProcessNDISErrorLines: Report "Process NDIS Error Lines";
                begin
                    CurrPage.SETSELECTIONFILTER(Rec);
                    IF CONFIRM(ConfirmMsg, TRUE) THEN BEGIN
                        CLEAR(ProcessNDISErrorLines);
                        ProcessNDISErrorLines.SETTABLEVIEW(Rec);
                        ProcessNDISErrorLines.RUN;
                    END;
                    Rec.RESET;
                end;
            }
            action("Change Status to OPEN")
            {
                Image = Status;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    CurrPage.SETSELECTIONFILTER(Rec);
                    IF Rec.FINDSET THEN BEGIN
                        REPEAT
                            Rec.TESTFIELD(Status, Rec.Status::ERROR);
                            Rec.Status := Rec.Status::OPEN;
                            Rec.MODIFY;
                        UNTIL Rec.NEXT = 0;
                    END;
                    Rec.RESET;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.ASCENDING(FALSE);
    end;

    var
        ConfirmMsg: Label 'Do you want to process bulk error lines in the NDIS Upload register?';
}


report 16035420 "Process NDIS Error Lines"
{
    // version CAREPOINT1.00

    ProcessingOnly = true;
    UseRequestPage = false;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(DataItem1000000000; "NDIS Upload Register")
        {
            DataItemTableView = SORTING ("Entry No.")
                                ORDER(Ascending)
                                WHERE (Status = FILTER (ERROR));

            trigger OnAfterGetRecord()
            begin
                ReversalCreated := FALSE;
                IF "Corrections Created" THEN
                    ERROR(CorrectionCreatedErr, "NDIS Claim Reference Code");
                JobPlanningLine.RESET;
                JobPlanningLine.SETRANGE("Job No.", "Job No.");
                JobPlanningLine.SETRANGE("Job Task No.", "Job Task No.");
                JobPlanningLine.SETRANGE("NDIS Claim Reference Code", "NDIS Claim Reference Code");
                JobPlanningLine.SETFILTER(Quantity, '>0');
                IF JobPlanningLine.FINDSET THEN BEGIN
                    REPEAT
                        CreateReversalJPLines(JobPlanningLine);
                    UNTIL JobPlanningLine.NEXT = 0;
                END;
                IF ReversalCreated THEN BEGIN
                    "Corrections Created" := TRUE;
                    MODIFY;
                    RegisterCount += 1;
                END;
            end;

            trigger OnPostDataItem()
            begin
                MESSAGE(ProcessCompleteMsg, RegisterCount);
            end;

            trigger OnPreDataItem()
            begin
                RegisterCount := 0;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        JobPlanningLine: Record "Job Planning Line";
        ReversalCreated: Boolean;
        RegisterCount: Integer;
        ProcessCompleteMsg: Label 'Total no.= %1 of NDIS register entries have been processed.';
        CorrectionCreatedErr: Label 'Correction entries have already been created for the claim reference number= %1.';

    procedure CreateReversalJPLines(pJobPlanningLine: Record "Job Planning Line")
    var
        LJobPlanningLine: Record "Job Planning Line";
        LJobPlanningLine1: Record "Job Planning Line";
        LineNo: Integer;
    begin
        WITH LJobPlanningLine DO BEGIN
            LJobPlanningLine1.SETRANGE("Job No.", pJobPlanningLine."Job No.");
            LJobPlanningLine1.SETRANGE("Job Task No.", pJobPlanningLine."Job Task No.");
            IF LJobPlanningLine1.FINDLAST THEN
                LineNo := LJobPlanningLine1."Line No." + 10000;

            INIT;
            "Job No." := pJobPlanningLine."Job No.";
            "Job Task No." := pJobPlanningLine."Job Task No.";
            "Line No." := LineNo;
            VALIDATE(Type, pJobPlanningLine.Type);
            VALIDATE("No.", pJobPlanningLine."No.");
            VALIDATE("Line Type", pJobPlanningLine."Line Type");
            VALIDATE("Planning Date", pJobPlanningLine."Planning Date");
            VALIDATE(Quantity, -pJobPlanningLine.Quantity);
            VALIDATE("Unit Price", pJobPlanningLine."Unit Price");
            VALIDATE("NDIS Claim Reference Code", pJobPlanningLine."NDIS Claim Reference Code");
            VALIDATE("Work Type Code", pJobPlanningLine."Work Type Code");
            VALIDATE("Scheduled Start", pJobPlanningLine."Scheduled Start");
            VALIDATE("Scheduled End", pJobPlanningLine."Scheduled End");
            VALIDATE(Correction, TRUE);
            INSERT(TRUE);
            ReversalCreated := TRUE;
        END;
    end;
}


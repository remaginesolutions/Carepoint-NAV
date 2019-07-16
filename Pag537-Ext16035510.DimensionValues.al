pageextension 16035510 pageextension16035510 extends "Dimension Values"
{
    // version NAVW113.00,CAREPOINT1.00

    // CAREPOINT1.00 RK 22.07.14 : added cost centre extension fields
    // HBSTG CAREPOINT1.00 2014-09-22: Added field "User ID"
    // HUME081015 RK : Changed visisbility of fields for EIS
    // HBS SA CAREPOINT1.00: added code to OnLookup Triggers for Approver1,Approver2,Approver3,Approver4,Approver5,Approver6 fields (#10205)
    // HBS VK 2016-12-16: Action Group added (ticket #10021)
    layout
    {
        addafter("Consolidation Code")
        {
            field(BusinessUnit; BusinessUnit)
            {
                ApplicationArea = All;
                Visible = true;
            }
            field(Contract; Contract)
            {
                ApplicationArea = All;
            }
            field(Funder; Funder)
            {
                ApplicationArea = All;
            }
            field(Approver1; Approver1)
            {

                trigger OnLookup(var Text: Text): Boolean
                begin
                    GetDimensionCode(FIELDCAPTION(Approver1));
                end;
            }
            field(Approver2; Approver2)
            {

                trigger OnLookup(var Text: Text): Boolean
                begin
                    GetDimensionCode(FIELDCAPTION(Approver2));
                end;
            }
            field(Approver3; Approver3)
            {

                trigger OnLookup(var Text: Text): Boolean
                begin
                    GetDimensionCode(FIELDCAPTION(Approver3));
                end;
            }
            field(Approver4; Approver4)
            {

                trigger OnLookup(var Text: Text): Boolean
                begin
                    GetDimensionCode(FIELDCAPTION(Approver4));
                end;
            }
            field(Approver5; Approver5)
            {

                trigger OnLookup(var Text: Text): Boolean
                begin
                    GetDimensionCode(FIELDCAPTION(Approver5));
                end;
            }
            field(Approver6; Approver6)
            {

                trigger OnLookup(var Text: Text): Boolean
                begin
                    GetDimensionCode(FIELDCAPTION(Approver6));
                end;
            }
            field("Service Percentage"; "Service Percentage")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("Service Amount (Annualised)"; "Service Amount (Annualised)")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("Service Amount Starting Date"; "Service Amount Starting Date")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("Service Amount Ending Date"; "Service Amount Ending Date")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("Include in GIA"; "Include in GIA")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("GIA G/L Account"; "GIA G/L Account")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("GIA Income Account"; "GIA Income Account")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("Driver Allocation Code"; "Driver Allocation Code")
            {
                ApplicationArea = All;
            }
            field("Driver Allocable"; "Driver Allocable")
            {
                ApplicationArea = All;
            }
            field("Expense Account Filter"; "Expense Account Filter")
            {
                ApplicationArea = All;
            }
            field("Charge Out Account"; "Charge Out Account")
            {
                ApplicationArea = All;
            }
            field("User ID"; "User ID")
            {
                ApplicationArea = All;
            }
        }
    }

    var
        DimCode: Code[20];
        DimensionValue: Record "Dimension Value";
        ThereIsNoGlobalDimension1SetupTxt: Label 'There is no Global Dimension 1 Code setup for %1 in the %2.';

    local procedure GetDimensionCode(ApproverLevel: Text)
    var
        LevelBasedApprovalSetup: Record "Level Based Approval Setup";
        DimensionValues: Page "Dimension Values";
    begin
        // HBS SA CAREPOINT1.00 08/01/2016 >>
        LevelBasedApprovalSetup.GET;
        CASE ApproverLevel OF
            LevelBasedApprovalSetup.Approver1:
                BEGIN
                    IF LevelBasedApprovalSetup."Approver1 Dimension Code" <> '' THEN
                        DimCode := LevelBasedApprovalSetup."Approver1 Dimension Code"
                    ELSE
                        ERROR(ThereIsNoGlobalDimension1SetupTxt, LevelBasedApprovalSetup.FIELDCAPTION(Approver1), LevelBasedApprovalSetup.TABLECAPTION);
                END;
            LevelBasedApprovalSetup.Approver2:
                BEGIN
                    IF LevelBasedApprovalSetup."Approver2 Dimension Code" <> '' THEN
                        DimCode := LevelBasedApprovalSetup."Approver2 Dimension Code"
                    ELSE
                        ERROR(ThereIsNoGlobalDimension1SetupTxt, LevelBasedApprovalSetup.FIELDCAPTION(Approver2), LevelBasedApprovalSetup.TABLECAPTION);
                END;
            LevelBasedApprovalSetup.Approver3:
                BEGIN
                    IF LevelBasedApprovalSetup."Approver3 Dimension Code" <> '' THEN
                        DimCode := LevelBasedApprovalSetup."Approver3 Dimension Code"
                    ELSE
                        ERROR(ThereIsNoGlobalDimension1SetupTxt, LevelBasedApprovalSetup.FIELDCAPTION(Approver3), LevelBasedApprovalSetup.TABLECAPTION);
                END;
            LevelBasedApprovalSetup.Approver4:
                BEGIN
                    IF LevelBasedApprovalSetup."Approver4 Dimension Code" <> '' THEN
                        DimCode := LevelBasedApprovalSetup."Approver4 Dimension Code"
                    ELSE
                        ERROR(ThereIsNoGlobalDimension1SetupTxt, LevelBasedApprovalSetup.FIELDCAPTION(Approver4), LevelBasedApprovalSetup.TABLECAPTION);
                END;
            LevelBasedApprovalSetup.Approver5:
                BEGIN
                    IF LevelBasedApprovalSetup."Approver5 Dimension Code" <> '' THEN
                        DimCode := LevelBasedApprovalSetup."Approver5 Dimension Code"
                    ELSE
                        ERROR(ThereIsNoGlobalDimension1SetupTxt, LevelBasedApprovalSetup.FIELDCAPTION(Approver5), LevelBasedApprovalSetup.TABLECAPTION);
                END;
            LevelBasedApprovalSetup.Approver6:
                BEGIN
                    IF LevelBasedApprovalSetup."Approver6 Dimension Code" <> '' THEN
                        DimCode := LevelBasedApprovalSetup."Approver6 Dimension Code"
                    ELSE
                        ERROR(ThereIsNoGlobalDimension1SetupTxt, LevelBasedApprovalSetup.FIELDCAPTION(Approver6), LevelBasedApprovalSetup.TABLECAPTION);
                END;
                // TODO: add new Approvers here
        END;

        DimensionValue.RESET;
        DimensionValue.SETRANGE("Dimension Code", DimCode);
        IF DimensionValue.FINDSET THEN BEGIN
            CLEAR(DimensionValues);
            DimensionValues.LOOKUPMODE(TRUE);
            DimensionValues.SETTABLEVIEW(DimensionValue);
            IF DimensionValues.RUNMODAL = ACTION::LookupOK THEN BEGIN
                DimensionValues.GETRECORD(DimensionValue);
                CASE ApproverLevel OF
                    LevelBasedApprovalSetup.Approver1:
                        Approver1 := DimensionValue.Code;
                    LevelBasedApprovalSetup.Approver2:
                        Approver2 := DimensionValue.Code;
                    LevelBasedApprovalSetup.Approver3:
                        Approver3 := DimensionValue.Code;
                    LevelBasedApprovalSetup.Approver4:
                        Approver4 := DimensionValue.Code;
                    LevelBasedApprovalSetup.Approver5:
                        Approver5 := DimensionValue.Code;
                    LevelBasedApprovalSetup.Approver6:
                        Approver6 := DimensionValue.Code
                        //TODO: add new Approvers here
                END;
            END;
        END;
        CurrPage.UPDATE;
        // HBS SA CAREPOINT1.00 08/01/2016 <<
    end;
}


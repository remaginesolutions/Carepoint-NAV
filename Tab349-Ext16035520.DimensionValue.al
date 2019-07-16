tableextension 16035520 tableextension16035520 extends "Dimension Value"
{
    // version NAVW113.00,CAREPOINT1.00

    // HUME CAREPOINT1.00 22.07.14 RK : Added cost centre extension fields
    // HBSTG CAREPOINT1.00 2014-09-17: Added field "User ID"
    // HBSRP CAREPOINT1.00 2015-09-18: Field "Active Budget","Expediture Budget FY", Date filter and "Budget Expense Account filter" added
    // HUME081015 RK : changed field names ot reflect EIS Dimensions
    // HBSRP CAREPOINT1.00 2015-12-22: Field "Charge In" added
    // HBS SA CAREPOINT1.00 2016-01-08: removed TableRelation from fields Approver1,Approver2,Approver3,Approver4 (merge2016)
    // HBS VK CAREPOINT1.00 2016-10-24: Fields 50200 "Approver5", 50201 "Approver6" added (ticket #10205)
    fields
    {
        field(16035400; BusinessUnit; Code[20])
        {
            Caption = 'Business Unit';
            Description = 'CAREPOINT';
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = FILTER ('BUSINESSUNIT'));
        }
        field(16035401; Contract; Code[20])
        {
            Caption = 'Contract';
            Description = 'CAREPOINT';
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = FILTER ('CONTRACT'));
        }
        field(16035402; Funder; Code[20])
        {
            Caption = 'Funder';
            Description = 'CAREPOINT';
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = FILTER ('FUNDER'));
        }
        field(16035403; Approver1; Code[20])
        {
            CaptionClass = 'Approver1';
            Description = 'CAREPOINT';
        }
        field(16035404; Approver4; Code[20])
        {
            CaptionClass = 'Approver4';
            Description = 'CAREPOINT';
        }
        field(16035405; Approver3; Code[20])
        {
            CaptionClass = 'Approver3';
            Description = 'CAREPOINT';
        }
        field(16035406; "Service Percentage"; Decimal)
        {
            Description = 'CAREPOINT';
        }
        field(16035407; "Service Amount (Annualised)"; Decimal)
        {
            Description = 'CAREPOINT';
        }
        field(16035408; "Service Amount Starting Date"; Date)
        {
            Description = 'CAREPOINT';
        }
        field(16035409; "Service Amount Ending Date"; Date)
        {
            Description = 'CAREPOINT';
        }
        field(16035410; "Include in GIA"; Boolean)
        {
            Description = 'CAREPOINT';
        }
        field(16035411; "GIA G/L Account"; Code[10])
        {
            Caption = 'GIA G/L Account';
            Description = 'CAREPOINT';
            TableRelation = "G/L Account"."No." WHERE ("Account Type" = FILTER (Posting));
        }
        field(16035412; "GIA Income Account"; Code[10])
        {
            Caption = 'GIA Income Account';
            Description = 'CAREPOINT';
            TableRelation = "G/L Account"."No." WHERE ("Account Type" = FILTER (Posting));
        }
        field(16035413; Approver2; Code[20])
        {
            CaptionClass = 'Approver2';
            Description = 'CAREPOINT';
        }
        field(16035414; "Expenditure Budget FY"; Decimal)
        {
            CalcFormula = Sum ("G/L Budget Entry".Amount WHERE ("Global Dimension 1 Code" = FIELD (Code),
                                                               "Budget Name" = FIELD ("Active Budget"),
                                                               "G/L Account No." = FIELD (FILTER ("Budget Expenditure Accounts"))));
            Description = 'CAREPOINT';
            FieldClass = FlowField;
        }
        field(16035415; "Active Budget"; Code[20])
        {
            CalcFormula = Lookup ("General Ledger Setup"."Current Budget");
            Description = 'CAREPOINT';
            FieldClass = FlowField;
        }
        field(16035416; "Budget Expenditure Accounts"; Code[250])
        {
            CalcFormula = Lookup ("General Ledger Setup"."Budget Exp. Account Filter");
            Description = 'CAREPOINT';
            FieldClass = FlowField;
        }
        field(16035417; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            Description = 'CAREPOINT';
            FieldClass = FlowFilter;
        }
        field(16035418; "YTD Expenditure Budget"; Decimal)
        {
            Description = 'CAREPOINT';
        }
        field(16035419; "YTD Actuals"; Decimal)
        {
            Description = 'CAREPOINT';
        }
        field(16035420; "Value Of Open PO's"; Decimal)
        {
            CalcFormula = Sum ("Purchase Line"."Outstanding Amt. Ex. VAT (LCY)" WHERE ("Document Type" = FILTER (Order),
                                                                                      "Shortcut Dimension 1 Code" = FIELD (Code)));
            Description = 'CAREPOINT';
            FieldClass = FlowField;
        }
        field(16035421; "Value Of Open PI's"; Decimal)
        {
            CalcFormula = Sum ("Purchase Line"."Outstanding Amt. Ex. VAT (LCY)" WHERE ("Document Type" = FILTER (Invoice),
                                                                                      "Shortcut Dimension 1 Code" = FIELD (Code)));
            Description = 'CAREPOINT';
            FieldClass = FlowField;
        }
        field(16035422; "Driver Allocation Code"; Code[20])
        {
            Description = 'CAREPOINT';
            TableRelation = "Standard Purchase Code";
        }
        field(16035423; "Driver Allocable"; Boolean)
        {
            Description = 'CAREPOINT';
        }
        field(16035424; "Expense Account Filter"; Code[250])
        {
            Description = 'CAREPOINT';
            TableRelation = "G/L Account"."No." WHERE ("Account Type" = FILTER (Posting));
            ValidateTableRelation = false;

            trigger OnLookup()
            var
                GLAccountList: Page "G/L Account List";
            begin
                GLAccountList.LOOKUPMODE(TRUE);
                IF GLAccountList.RUNMODAL = ACTION::LookupOK THEN
                    "Expense Account Filter" := GLAccountList.GetSelectionFilter;
            end;
        }
        field(16035425; "Charge Out Account"; Code[20])
        {
            Description = 'CAREPOINT';
            TableRelation = "G/L Account"."No." WHERE ("Account Type" = FILTER (Posting));
        }
        field(16035426; "Charge In Account"; Code[20])
        {
            Description = 'CAREPOINT';
            TableRelation = "G/L Account"."No." WHERE ("Account Type" = FILTER (Posting));
        }
        field(16035427; "User ID"; Code[50])
        {
            Description = 'CAREPOINT';
            TableRelation = "User Setup"."User ID";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(16035428; "Committed Cost PO's"; Decimal)
        {
            CalcFormula = Sum ("Purchase Line".Amount WHERE ("Document Type" = FILTER (Order),
                                                            "Shortcut Dimension 1 Code" = FIELD (Code)));
            Description = 'CAREPOINT';
            FieldClass = FlowField;
        }
        field(16035429; "Committed Cost PI's"; Decimal)
        {
            CalcFormula = Sum ("Purchase Line".Amount WHERE ("Document Type" = FILTER (Invoice),
                                                            "Shortcut Dimension 1 Code" = FIELD (Code)));
            Description = 'CAREPOINT';
            FieldClass = FlowField;
        }
        field(16035430; Approver5; Code[20])
        {
            CaptionClass = 'Approver5';
            Description = 'CAREPOINT';
        }
        field(16035431; Approver6; Code[20])
        {
            CaptionClass = 'Approver6';
            Description = 'CAREPOINT';
        }
        field(16035432; "Job Task No. Series"; Code[20])
        {
            Description = 'CAREPOINT';
            TableRelation = "No. Series";
        }
    }
}


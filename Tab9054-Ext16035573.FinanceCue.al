tableextension 16035573 tableextension16035573 extends "Finance Cue"
{
    // version NAVW113.00,CAREPOINT1.00

    // HBS TG CAREPOINT1.00 2015-09-21: Added fields "Docs Authorized for Invoicing" and "Invoice Authorized for Posting"
    // HBS RP CAREPOINT1.00 2015-11-20: Field "PIs Pending Approval" added
    fields
    {
        field(16035400; "Orders Authorized for Posting"; Integer)
        {
            AccessByPermission = TableData 120 = R;
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = CONST (Order),
                                                         Status = FILTER (Released),
                                                         "Invoice Authorized" = CONST (true)));
            Caption = 'Orders Authorized for Posting';
            Description = 'CAREPOINT1.00';
            FieldClass = FlowField;
        }
        field(16035401; "Invoice Authorized for Posting"; Integer)
        {
            AccessByPermission = TableData 120 = R;
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = CONST (Invoice),
                                                         Status = FILTER (Released),
                                                         "Invoice Authorized" = CONST (true)));
            Caption = 'Invoice Authorized for Posting';
            Description = 'CAREPOINT1.00';
            FieldClass = FlowField;
        }
        field(16035402; "PIs Pending Approval"; Integer)
        {
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = CONST (Invoice),
                                                         Status = FILTER ("Pending Approval")));
            Description = 'CAREPOINT1.00';
            FieldClass = FlowField;
        }
    }
}


page 16035407 "Change G/L Account"
{
    // version CAREPOINT1.00

    // HBSTG PA1.02 2015-09-19: Created new page for changing GL Code on Purchase Lines

    DataCaptionFields = "No.", Description;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ConfirmationDialog;
    SourceTable = "Purchase Line";
    UsageCategory = Tasks;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            field("No."; "No.")
            {
                ApplicationArea = All;
            }
            field(Description; Description)
            {
                ApplicationArea = All;
            }
            field("New No."; NewNo)
            {
                ApplicationArea = All;
                TableRelation = "G/L Account" WHERE ("Account Type" = CONST (Posting),
                                                     Blocked = CONST (false),
                                                     "Direct Posting" = CONST (true));

                trigger OnValidate()
                begin
                    IF NewNo <> '' THEN BEGIN
                        GLAcc.GET(NewNo);
                        NewDescription := GLAcc.Name;
                    END;
                end;
            }
            field("New Description"; NewDescription)
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

    actions
    {
    }

    var
        GLAcc: Record "G/L Account";
        NewNo: Code[20];
        NewDescription: Text[50];

    procedure GetNewGLAcc(var pNewGLAccCode: Code[20])
    begin
        pNewGLAccCode := NewNo;
    end;
}


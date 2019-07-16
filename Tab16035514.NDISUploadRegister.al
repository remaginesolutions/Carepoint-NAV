table 16035514 "NDIS Upload Register"
{
    // version CAREPOINT1.00

    // ReSRP CAREPOINT1.00 2018-08-14: New fields related to  NDIS have been added (Ticket #10997)


    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(2; "Posted Sales Invoice No."; Code[20])
        {
            Editable = false;
            TableRelation = "Sales Invoice Header";
        }
        field(3; "Posting Date"; Date)
        {
            Editable = false;
        }
        field(4; "Sell-to Customer No."; Code[20])
        {
            Editable = false;
            TableRelation = Customer;
        }
        field(5; "Sell-to Customer Name"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup (Customer.Name WHERE ("No." = FIELD ("Sell-to Customer No.")));
            Editable = false;

        }
        field(6; Amount; Decimal)
        {
            Editable = false;
        }
        field(7; "Job No."; Code[20])
        {
            Editable = false;
            TableRelation = Job;
        }
        field(8; "Job Task No."; Code[20])
        {
            Editable = false;
            TableRelation = "Job Task"."Job Task No." WHERE ("Job No." = FIELD ("Job No."));
        }
        field(9; Status; Option)
        {
            OptionCaption = 'OPEN,UPLOADED,SUCCESSFUL,ERROR,CORRECTED,REVERSED';
            OptionMembers = OPEN,UPLOADED,SUCCESSFUL,ERROR,CORRECTED,REVERSED;

            trigger OnValidate()
            begin
                xRec.TESTFIELD(Status, Status::ERROR);
                IF NOT (Status IN [Status::OPEN, Status::CORRECTED]) THEN
                    FIELDERROR(Status);
            end;
        }
        field(10; "Error Text"; Text[250])
        {
            Editable = false;
        }
        field(11; "Error Text2"; Text[250])
        {
            Editable = false;
        }
        field(12; "Upload No."; Code[20])
        {
            Editable = false;
        }
        field(20; "NDIS Claim Reference Code"; Code[20])
        {
        }
        field(25; "Work Type Code"; Code[50])
        {
            Caption = 'Work Type Code';
            TableRelation = "Work Type";
        }
        field(30; Quantity; Decimal)
        {
        }
        field(35; "Date Logged"; Date)
        {
        }
        field(40; "Time Logged"; Time)
        {
        }
        field(45; "Logged By"; Code[50])
        {
            Description = 'USER ID';
        }
        field(50; "Date Uploaded"; Date)
        {
        }
        field(51; "Time Uploaded"; Time)
        {
        }
        field(52; "Uploaded By"; Code[50])
        {
        }
        field(55; "Uploaded No."; Code[20])
        {
        }
        field(60; "Shipment Date"; Date)
        {
        }
        field(65; PaidTotalAmount; Decimal)
        {
        }
        field(70; "Payment Request Number"; Code[20])
        {
        }
        field(75; "Participant Name"; Text[50])
        {
        }
        field(80; "Capped Price"; Decimal)
        {
        }
        field(85; "Posted Sales Invoice Line No."; Integer)
        {
        }
        field(90; "Corrections Created"; Boolean)
        {
        }
        field(95; "Date Imported"; Date)
        {
        }
        field(96; "Time Imported"; Time)
        {
        }
        field(97; "Imported By"; Code[50])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
        }
    }

    fieldgroups
    {
    }
}


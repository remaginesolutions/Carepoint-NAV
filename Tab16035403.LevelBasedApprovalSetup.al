table 16035403 "Level Based Approval Setup"
{
    // version CAREPOINT1.00

    // HBS VK 2016-12-05: Field 100 "Restrict Self-Approval" added (ticket #10296)


    fields
    {
        field(1;"Primary Key";Code[10])
        {
            NotBlank = true;
        }
        field(2;Approver1;Text[30])
        {
        }
        field(3;Approver2;Text[30])
        {
        }
        field(4;Approver3;Text[30])
        {
        }
        field(5;Approver4;Text[30])
        {
        }
        field(6;Approver5;Text[30])
        {
        }
        field(7;Approver6;Text[30])
        {
        }
        field(8;Approver7;Text[30])
        {
        }
        field(9;Approver8;Text[30])
        {
        }
        field(10;Approver9;Text[30])
        {
        }
        field(11;Approver10;Text[30])
        {
        }
        field(12;Approver11;Text[30])
        {
        }
        field(13;Approver12;Text[30])
        {
        }
        field(14;"Approver1 Dimension Code";Code[20])
        {
            TableRelation = Dimension.Code;
        }
        field(15;"Approver2 Dimension Code";Code[20])
        {
            TableRelation = Dimension.Code;
        }
        field(16;"Approver3 Dimension Code";Code[20])
        {
            TableRelation = Dimension.Code;
        }
        field(17;"Approver4 Dimension Code";Code[20])
        {
            TableRelation = Dimension.Code;
        }
        field(18;"Approver5 Dimension Code";Code[20])
        {
            TableRelation = Dimension.Code;
        }
        field(19;"Approver6 Dimension Code";Code[20])
        {
            TableRelation = Dimension.Code;
        }
        field(20;"Approver7 Dimension Code";Code[20])
        {
            TableRelation = Dimension.Code;
        }
        field(21;"Approver8 Dimension Code";Code[20])
        {
            TableRelation = Dimension.Code;
        }
        field(22;"Approver9 Dimension Code";Code[20])
        {
            TableRelation = Dimension.Code;
        }
        field(23;"Approver10 Dimension Code";Code[20])
        {
            TableRelation = Dimension.Code;
        }
        field(24;"Approver11 Dimension Code";Code[20])
        {
            TableRelation = Dimension.Code;
        }
        field(25;"Approver12 Dimension Code";Code[20])
        {
            TableRelation = Dimension.Code;
        }
        field(100;"Restrict Self-Approval";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
        }
    }

    fieldgroups
    {
    }
}


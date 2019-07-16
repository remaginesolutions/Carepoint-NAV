tableextension 16035570 tableextension16035570 extends "Sales Header" 
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HBS VK CAREPOINT1.00 2016-11-21 Field "NDIA Claim Reference" added
    // HBS CAREPOINT1.00 #10691: Work Type Code field type changed from Code10 to Code50
    fields
    {
        field(16035500;"NDIA Claim Reference";Code[20])
        {
            Description = 'NDIS';
        }
        field(16035502;"Pantry Invoice";Boolean)
        {
            Description = 'NDIS';
        }
        field(16035503;"Work Type Code";Code[50])
        {
            Description = 'NDIS';
            TableRelation = "Work Type";

            trigger OnValidate()
            begin
                // HBS VK CAREPOINT1.00 #10302 >>
                IF "Work Type Code" <> '' THEN
                  TESTFIELD("Pantry Invoice");
                // HBS VK CAREPOINT1.00 #10302 <<
            end;
        }
    }
}


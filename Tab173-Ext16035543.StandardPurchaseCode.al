tableextension 16035543 tableextension16035543 extends "Standard Purchase Code" 
{
    // version NAVW111.00,CAREPOINT1.00

    // HBS CAREPOINT1.00: Fields "Allocation Type", "Allocation Template" added
    fields
    {
        field(16035400;"Allocation Type";Option)
        {
            Description = 'CAREPOINT';
            NotBlank = true;
            OptionCaption = 'Employee,FTE,Executive,Sq Metres';
            OptionMembers = Employee,FTE,Executive,"Sq Metres";
        }
        field(16035401;"Allocation Template";Boolean)
        {
            Description = 'CAREPOINT';
        }
    }
}


table 16035502 msdyn_agreementbookingsetup
{
    // version CAREPOINT1.00

    // Dynamics CRM Version: 8.2.2.135

    Caption = 'Agreement Booking Setup';
    Description = 'Specify the maintenance bookings for the agreement.';
    ExternalName = 'msdyn_agreementbookingsetup';
    TableType = CRM;

    fields
    {
        field(1; msdyn_agreementbookingsetupId; Guid)
        {
            Caption = 'Agreement Booking Setup';
            Description = 'Shows the entity instances.';
            ExternalAccess = Insert;
            ExternalName = 'msdyn_agreementbookingsetupid';
            ExternalType = 'Uniqueidentifier';
        }
        field(2; CreatedOn; DateTime)
        {
            Caption = 'Created On';
            Description = 'Shows the date and time when the record was created. The date and time are displayed in the time zone selected in Microsoft Dynamics 365 options.';
            ExternalAccess = Read;
            ExternalName = 'createdon';
            ExternalType = 'DateTime';
        }
        field(3; ModifiedOn; DateTime)
        {
            Caption = 'Modified On';
            Description = 'Shows the date and time when the record was last updated. The date and time are displayed in the time zone selected in Microsoft Dynamics 365 options.';
            ExternalAccess = Read;
            ExternalName = 'modifiedon';
            ExternalType = 'DateTime';
        }
        field(4; statecode; Option)
        {
            Caption = 'Status';
            Description = 'Status of the Agreement Booking Setup';
            ExternalAccess = Modify;
            ExternalName = 'statecode';
            ExternalType = 'State';
            InitValue = " ";
            OptionCaption = ' ,Active,Inactive';
            OptionOrdinalValues = -1, 0, 1;
            OptionMembers = " ",Active,Inactive;
        }
        field(5; statuscode; Option)
        {
            Caption = 'Status Reason';
            Description = 'Reason for the status of the Agreement Booking Setup';
            ExternalName = 'statuscode';
            ExternalType = 'Status';
            InitValue = " ";
            OptionCaption = ' ,Active,Inactive';
            OptionOrdinalValues = -1, 1, 2;
            OptionMembers = " ",Active,Inactive;
        }
        field(6; VersionNumber; BigInteger)
        {
            Caption = 'Version Number';
            Description = 'Version Number';
            ExternalAccess = Read;
            ExternalName = 'versionnumber';
            ExternalType = 'BigInt';
        }
        field(7; ImportSequenceNumber; Integer)
        {
            Caption = 'Import Sequence Number';
            Description = 'Shows the sequence number of the import that created this record.';
            ExternalAccess = Insert;
            ExternalName = 'importsequencenumber';
            ExternalType = 'Integer';
        }
        field(8; OverriddenCreatedOn; Date)
        {
            Caption = 'Record Created On';
            Description = 'Shows the date and time that the record was migrated.';
            ExternalAccess = Insert;
            ExternalName = 'overriddencreatedon';
            ExternalType = 'DateTime';
        }
        field(9; TimeZoneRuleVersionNumber; Integer)
        {
            Caption = 'Time Zone Rule Version Number';
            Description = 'For internal use only.';
            ExternalName = 'timezoneruleversionnumber';
            ExternalType = 'Integer';
            MinValue = -1;
        }
        field(10; UTCConversionTimeZoneCode; Integer)
        {
            Caption = 'UTC Conversion Time Zone Code';
            Description = 'Shows the time zone code that was in use when the record was created.';
            ExternalName = 'utcconversiontimezonecode';
            ExternalType = 'Integer';
            MinValue = -1;
        }
        field(11; msdyn_name; Text[100])
        {
            Caption = 'Name';
            Description = 'Enter the name of the custom entity.';
            ExternalName = 'msdyn_name';
            ExternalType = 'String';
        }
        field(12; processid; Guid)
        {
            Caption = 'Process Id';
            Description = 'Contains the ID of the process associated with the entity.';
            ExternalName = 'processid';
            ExternalType = 'Uniqueidentifier';
        }
        field(13; stageid; Guid)
        {
            Caption = 'Stage Id';
            Description = 'Contains the ID of the stage where the entity is located.';
            ExternalName = 'stageid';
            ExternalType = 'Uniqueidentifier';
        }
        field(14; traversedpath; Text[250])
        {
            Caption = 'Traversed Path';
            Description = 'Shows a comma-separated list of string values that represent the unique identifiers of stages in a business process flow instance in the order that they occur.';
            ExternalName = 'traversedpath';
            ExternalType = 'String';
        }
        field(15; msdyn_Agreement; Guid)
        {
            Caption = 'Agreement';
            Description = 'Agreement this Booking Setup relates to';
            ExternalName = 'msdyn_agreement';
            ExternalType = 'Lookup';
            TableRelation = msdyn_agreement.msdyn_agreementId;
        }
        field(16; msdyn_AutoGenerateBooking; Boolean)
        {
            Caption = 'Auto Generate Booking';
            Description = 'Enable if the system should automatically generate Order Bookings for the Booking Dates of this Booking Setup';
            ExternalName = 'msdyn_autogeneratebooking';
            ExternalType = 'Boolean';
        }
        field(17; msdyn_AutoGenerateWO; Boolean)
        {
            Caption = 'Auto Generate Work Order';
            Description = 'Enable if the system should automatically generate Work Orders for the Booking Dates of this Booking Setup';
            ExternalName = 'msdyn_autogeneratewo';
            ExternalType = 'Boolean';
        }
        field(18; msdyn_Description; Text[200])
        {
            Caption = 'Description';
            Description = 'Type a description of this booking setup.';
            ExternalName = 'msdyn_description';
            ExternalType = 'String';
        }
        field(19; msdyn_EstimatedDuration; Integer)
        {
            Caption = 'Estimated Duration';
            Description = 'Shows the duration of the booking.';
            ExternalName = 'msdyn_estimatedduration';
            ExternalType = 'Integer';
            MinValue = 0;
        }
        field(20; msdyn_GenerateWODaysInAdvance; Integer)
        {
            Caption = 'Generate Work Order Days In Advance';
            Description = 'Specify how many days in advance of the Booking Date the system should automatically generate a Work Order';
            ExternalName = 'msdyn_generatewodaysinadvance';
            ExternalType = 'Integer';
            MinValue = 0;
        }
        field(21; msdyn_InternalFlags; BLOB)
        {
            Caption = 'Internal Flags';
            Description = 'For internal use only.';
            ExternalName = 'msdyn_internalflags';
            ExternalType = 'Memo';
            SubType = Memo;
        }
        field(22; msdyn_PostBookingFlexibility; Integer)
        {
            Caption = 'Post Booking Flexibility';
            Description = 'Shows the flexibility of days after the booking date.';
            ExternalName = 'msdyn_postbookingflexibility';
            ExternalType = 'Integer';
            MinValue = 0;
        }
        field(23; msdyn_PostponeGenerationUntil; DateTime)
        {
            Caption = 'Postpone Generation Until';
            Description = '';
            ExternalName = 'msdyn_postponegenerationuntil';
            ExternalType = 'DateTime';
        }
        field(24; msdyn_PreBookingFlexibility; Integer)
        {
            Caption = 'Pre Booking Flexibility';
            Description = 'Shows the flexibility of days prior to the booking date.';
            ExternalName = 'msdyn_prebookingflexibility';
            ExternalType = 'Integer';
            MinValue = 0;
        }
        field(25; msdyn_PreferredStartTime; DateTime)
        {
            Caption = 'Preferred Start Time';
            Description = 'Shows the preferred time to booking.';
            ExternalName = 'msdyn_preferredstarttime';
            ExternalType = 'DateTime';
        }
        field(26; msdyn_RecurrenceSettings; BLOB)
        {
            Caption = 'Recurrence Settings';
            Description = 'Stores the booking recurrence settings.';
            ExternalName = 'msdyn_recurrencesettings';
            ExternalType = 'Memo';
            SubType = Memo;
        }
        field(27; msdyn_Revision; Integer)
        {
            Caption = 'Revision';
            Description = 'For internal use only.';
            ExternalName = 'msdyn_revision';
            ExternalType = 'Integer';
            MinValue = 1;
        }
        field(28; msdyn_TimeWindowEnd; DateTime)
        {
            Caption = 'Time Window End';
            Description = 'Shows the time window up until when this can be booked.';
            ExternalName = 'msdyn_timewindowend';
            ExternalType = 'DateTime';
        }
        field(29; msdyn_TimeWindowStart; DateTime)
        {
            Caption = 'Time Window Start';
            Description = 'Shows the time window from when this can be booked.';
            ExternalName = 'msdyn_timewindowstart';
            ExternalType = 'DateTime';
        }
        field(30; msdyn_WorkOrderSummary; BLOB)
        {
            Caption = 'Work Order Summary';
            Description = 'Shows the work order summary to be set on the work orders generated.';
            ExternalName = 'msdyn_workordersummary';
            ExternalType = 'Memo';
            SubType = Memo;
        }
        field(31; msdyn_AgreementName; Text[100])
        {
            CalcFormula = Lookup (msdyn_agreement.msdyn_name WHERE (msdyn_agreementId = FIELD (msdyn_Agreement)));
            ExternalAccess = Read;
            ExternalName = 'msdyn_agreementname';
            ExternalType = 'String';
            FieldClass = FlowField;
        }
        field(32; rs_activityfee; Boolean)
        {
            Caption = 'Activity Fee';
            Description = '';
            ExternalName = 'rs_activityfee';
            ExternalType = 'Boolean';
        }
        field(33; rs_clientapprovalrequired; Boolean)
        {
            Caption = 'Client Approval Required';
            Description = '';
            ExternalName = 'rs_clientapprovalrequired';
            ExternalType = 'Boolean';
        }
        field(34; rs_methodofapproval; Option)
        {
            Caption = 'Method of Approval';
            Description = '';
            ExternalName = 'rs_methodofapproval';
            ExternalType = 'Picklist';
            InitValue = " ";
            OptionCaption = ' ,Phone,Email,Fax';
            OptionOrdinalValues = -1, 717810000, 717810001, 717810002;
            OptionMembers = " ",Phone,Email,Fax;
        }
        field(35; rs_allotmentsremaining; Decimal)
        {
            Caption = 'Allotments Remaining';
            Description = '';
            ExternalName = 'rs_allotmentsremaining';
            ExternalType = 'Decimal';
        }
        field(36; rs_allotmentsused; Decimal)
        {
            Caption = 'Allotments Used';
            Description = '';
            ExternalName = 'rs_allotmentsused';
            ExternalType = 'Decimal';
        }
        field(37; rs_totalallotments; Decimal)
        {
            Caption = 'Total Allotments';
            Description = '';
            ExternalName = 'rs_totalallotments';
            ExternalType = 'Decimal';
        }
        field(50; ModifiedBy; Guid)
        {
            Caption = 'Modified By';
            Description = 'Unique identifier of the user who modified the record.';
            ExternalAccess = Read;
            ExternalName = 'modifiedby';
            ExternalType = 'Lookup';
            TableRelation = "CRM Systemuser".SystemUserId;
        }
    }

    keys
    {
        key(Key1; msdyn_agreementbookingsetupId)
        {
        }
        key(Key2; msdyn_name)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; msdyn_name)
        {
        }
    }
}


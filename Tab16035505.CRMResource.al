table 16035505 "CRM Resource"
{
    // version CAREPOINT1.00

    // Dynamics CRM Version: 9.0.0.2226

    Caption = 'CRM Resource';
    Description = 'Resource that has capacity which can be allocated to work.';
    ExternalName = 'bookableresource';
    TableType = CRM;

    fields
    {
        field(1; BookableResourceId; Guid)
        {
            Caption = 'Bookable Resource';
            Description = 'Unique identifier of the resource.';
            ExternalAccess = Insert;
            ExternalName = 'bookableresourceid';
            ExternalType = 'Uniqueidentifier';
        }
        field(2; CreatedOn; DateTime)
        {
            Caption = 'Created On';
            Description = 'Date and time when the record was created.';
            ExternalAccess = Read;
            ExternalName = 'createdon';
            ExternalType = 'DateTime';
        }
        field(3; ModifiedOn; DateTime)
        {
            Caption = 'Modified On';
            Description = 'Date and time when the record was modified.';
            ExternalAccess = Read;
            ExternalName = 'modifiedon';
            ExternalType = 'DateTime';
        }
        field(4; VersionNumber; BigInteger)
        {
            Caption = 'Version Number';
            Description = 'Version Number';
            ExternalAccess = Read;
            ExternalName = 'versionnumber';
            ExternalType = 'BigInt';
        }
        field(5; ImportSequenceNumber; Integer)
        {
            Caption = 'Import Sequence Number';
            Description = 'Sequence number of the import that created this record.';
            ExternalAccess = Insert;
            ExternalName = 'importsequencenumber';
            ExternalType = 'Integer';
        }
        field(6; OverriddenCreatedOn; DateTime)
        {
            Caption = 'Record Created On';
            Description = 'Date and time that the record was migrated.';
            ExternalAccess = Insert;
            ExternalName = 'overriddencreatedon';
            ExternalType = 'DateTime';
        }
        field(7; TimeZoneRuleVersionNumber; Integer)
        {
            Caption = 'Time Zone Rule Version Number';
            Description = 'For internal use only.';
            ExternalName = 'timezoneruleversionnumber';
            ExternalType = 'Integer';
            MinValue = -1;
        }
        field(8; UTCConversionTimeZoneCode; Integer)
        {
            Caption = 'UTC Conversion Time Zone Code';
            Description = 'Time zone code that was in use when the record was created.';
            ExternalName = 'utcconversiontimezonecode';
            ExternalType = 'Integer';
            MinValue = -1;
        }
        field(9; Name; Text[100])
        {
            Caption = 'Name';
            Description = 'Type the name of the resource.';
            ExternalName = 'name';
            ExternalType = 'String';
        }
        field(10; ProcessId; Guid)
        {
            Caption = 'Process Id';
            Description = 'Contains the id of the process associated with the entity.';
            ExternalName = 'processid';
            ExternalType = 'Uniqueidentifier';
        }
        field(11; StageId; Guid)
        {
            Caption = 'Stage Id';
            Description = 'Contains the id of the stage where the entity is located.';
            ExternalName = 'stageid';
            ExternalType = 'Uniqueidentifier';
        }
        field(12; TraversedPath; Text[250])
        {
            Caption = 'Traversed Path';
            Description = 'A comma separated list of string values representing the unique identifiers of stages in a Business Process Flow Instance in the order that they occur.';
            ExternalName = 'traversedpath';
            ExternalType = 'String';
        }
        field(13; ResourceType; Option)
        {
            Caption = 'Resource Type';
            Description = 'Select whether the resource is a user, equipment, contact, account, generic resource or a group of resources.';
            ExternalAccess = Insert;
            ExternalName = 'resourcetype';
            ExternalType = 'Picklist';
            InitValue = User;
            OptionCaption = 'Generic,Contact,User,Equipment,Account,Group';
            OptionOrdinalValues = 1, 2, 3, 4, 5, 6;
            OptionMembers = Generic,Contact,User,Equipment,Account,Group;
        }
        field(14; StateCode; Option)
        {
            Caption = 'Status';
            Description = 'Status of the Bookable Resource';
            ExternalAccess = Modify;
            ExternalName = 'statecode';
            ExternalType = 'State';
            InitValue = " ";
            OptionCaption = ' ,Active,Inactive';
            OptionOrdinalValues = -1, 0, 1;
            OptionMembers = " ",Active,Inactive;
        }
        field(15; StatusCode; Option)
        {
            Caption = 'Status Reason';
            Description = 'Reason for the status of the Bookable Resource';
            ExternalName = 'statuscode';
            ExternalType = 'Status';
            InitValue = " ";
            OptionCaption = ' ,Active,Inactive';
            OptionOrdinalValues = -1, 1, 2;
            OptionMembers = " ",Active,Inactive;
        }
        field(16; TimeZone; Integer)
        {
            Caption = 'Time Zone';
            Description = 'Specifies the timezone for the resource''s working hours.';
            ExternalName = 'timezone';
            ExternalType = 'Integer';
            MaxValue = 1500;
            MinValue = -1500;
        }
        field(17; ExchangeRate; Decimal)
        {
            Caption = 'ExchangeRate';
            Description = 'Exchange rate for the currency associated with the bookableresource with respect to the base currency.';
            ExternalAccess = Read;
            ExternalName = 'exchangerate';
            ExternalType = 'Decimal';
        }
        field(18; msdyn_DisplayOnScheduleAssista; Boolean)
        {
            Caption = 'Enable for Availability Search';
            Description = 'Specify if this resource should be enabled for availablity search.';
            ExternalName = 'msdyn_displayonscheduleassistant';
            ExternalType = 'Boolean';
        }
        field(19; msdyn_DisplayOnScheduleBoard; Boolean)
        {
            Caption = 'Display On Schedule Board';
            Description = 'Specify if this resource should be displayed on the schedule board.';
            ExternalName = 'msdyn_displayonscheduleboard';
            ExternalType = 'Boolean';
        }
        field(20; msdyn_EndLocation; Option)
        {
            Caption = 'End Location';
            Description = 'Shows the default ending location type when booking daily schedules for this resource.';
            ExternalName = 'msdyn_endlocation';
            ExternalType = 'Picklist';
            InitValue = LocationAgnostic;
            OptionCaption = 'Location Agnostic,Resource Address,Organizational Unit Address';
            OptionOrdinalValues = 690970002, 690970000, 690970001;
            OptionMembers = LocationAgnostic,ResourceAddress,OrganizationalUnitAddress;
        }
        field(21; msdyn_GenericType; Option)
        {
            Caption = 'Generic Type';
            Description = '';
            ExternalName = 'msdyn_generictype';
            ExternalType = 'Picklist';
            InitValue = " ";
            OptionCaption = ' ,Service Center';
            OptionOrdinalValues = -1, 690970000;
            OptionMembers = " ",ServiceCenter;
        }
        field(22; msdyn_PrimaryEMail; Text[100])
        {
            Caption = 'Primary EMail';
            Description = '';
            ExtendedDatatype = EMail;
            ExternalName = 'msdyn_primaryemail';
            ExternalType = 'String';
        }
        field(23; msdyn_StartLocation; Option)
        {
            Caption = 'Start Location';
            Description = 'Shows the default starting location type when booking daily schedules for this resource.';
            ExternalName = 'msdyn_startlocation';
            ExternalType = 'Picklist';
            InitValue = LocationAgnostic;
            OptionCaption = 'Location Agnostic,Resource Address,Organizational Unit Address';
            OptionOrdinalValues = 690970002, 690970000, 690970001;
            OptionMembers = LocationAgnostic,ResourceAddress,OrganizationalUnitAddress;
        }
        field(24; msdyn_isgenericresourceproject; Boolean)
        {
            Caption = 'Is Default';
            Description = 'Is Default';
            ExternalName = 'msdyn_isgenericresourceprojectscoped';
            ExternalType = 'Boolean';
        }
        field(25; msdyn_targetutilization; Integer)
        {
            Caption = 'Target Utilization';
            Description = 'Shows the target utilization for the resource.';
            ExternalName = 'msdyn_targetutilization';
            ExternalType = 'Integer';
            MaxValue = 100;
            MinValue = 1;
        }
        field(26; msdyn_BookingsToDrip; Integer)
        {
            Caption = 'Bookings To Drip';
            Description = 'The number of bookings to drip on the Mobile . This field is disabled/enabled based on Enable Drip Scheduling field';
            ExternalName = 'msdyn_bookingstodrip';
            ExternalType = 'Integer';
            MaxValue = 50;
            MinValue = 1;
        }
        field(27; msdyn_EnableDripScheduling; Boolean)
        {
            Caption = 'Enable Drip Scheduling';
            Description = 'Enables drip scheduling on the mobile app.';
            ExternalName = 'msdyn_enabledripscheduling';
            ExternalType = 'Boolean';
        }
        field(28; msdyn_HourlyRate; Decimal)
        {
            Caption = 'Hourly Rate';
            Description = '';
            ExternalName = 'msdyn_hourlyrate';
            ExternalType = 'Money';
        }
        field(29; msdyn_hourlyrate_Base; Decimal)
        {
            Caption = 'Hourly Rate (Base)';
            Description = 'Value of the Hourly Rate in base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_hourlyrate_base';
            ExternalType = 'Money';
        }
        field(30; msdyn_TimeOffApprovalRequired; Boolean)
        {
            Caption = 'Time Off Approval Required';
            Description = 'Specifies if approval required for Time Off Requests.';
            ExternalName = 'msdyn_timeoffapprovalrequired';
            ExternalType = 'Boolean';
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
        key(Key1; BookableResourceId)
        {
        }
        key(Key2; Name)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Name)
        {
        }
    }
}


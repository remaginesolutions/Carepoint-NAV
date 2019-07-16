table 16035503 msdyn_workorder
{
    // version CAREPOINT1.00

    // Dynamics CRM Version: 8.2.2.135

    Caption = 'Work Order';
    Description = 'Work orders store all information about the job performed for an account. Stores incident details, resource, expenses, tasks, communications, billing and more';
    ExternalName = 'msdyn_workorder';
    TableType = CRM;

    fields
    {
        field(1; msdyn_workorderId; Guid)
        {
            Caption = 'WO Number';
            Description = 'Shows the entity instances.';
            ExternalAccess = Insert;
            ExternalName = 'msdyn_workorderid';
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
            Description = 'Status of the Work Order';
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
            Description = 'Reason for the status of the Work Order';
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
            Caption = 'Work Order Number';
            Description = 'Enter the name of the custom entity.';
            ExternalName = 'msdyn_name';
            ExternalType = 'String';
        }
        field(12; processid; Guid)
        {
            Caption = 'Process Id';
            Description = 'Shows the ID of the process associated with the entity.';
            ExternalName = 'processid';
            ExternalType = 'Uniqueidentifier';
        }
        field(13; stageid; Guid)
        {
            Caption = 'Stage Id';
            Description = 'Shows the ID of the stage where the entity is located.';
            ExternalName = 'stageid';
            ExternalType = 'Uniqueidentifier';
        }
        field(14; traversedpath; Text[250])
        {
            Caption = 'Traversed Path';
            Description = 'Shows a comma-separated list of string values representing the unique identifiers of stages in a business process flow instance in the order that they occur.';
            ExternalName = 'traversedpath';
            ExternalType = 'String';
        }
        field(15; msdyn_Address1; Text[250])
        {
            Caption = 'Address 1';
            ExternalName = 'msdyn_address1';
            ExternalType = 'String';
        }
        field(16; msdyn_Address2; Text[250])
        {
            Caption = 'Address 2';
            ExternalName = 'msdyn_address2';
            ExternalType = 'String';
        }
        field(17; msdyn_Address3; Text[250])
        {
            Caption = 'Address 3';
            ExternalName = 'msdyn_address3';
            ExternalType = 'String';
        }
        field(18; msdyn_AddressName; Text[250])
        {
            Caption = 'Address Name';
            ExternalName = 'msdyn_addressname';
            ExternalType = 'String';
        }
        field(19; msdyn_Agreement; Guid)
        {
            Caption = 'Agreement';
            Description = 'Shows the agreement linked to this work order.';
            ExternalName = 'msdyn_agreement';
            ExternalType = 'Lookup';
            TableRelation = msdyn_agreement.msdyn_agreementId;
        }
        field(20; msdyn_BookingSummary; BLOB)
        {
            Caption = 'Booking Summary';
            Description = 'Shows a synopsis of the bookings on the work order. This field is automatically updated by the system whenever a resource booking on the work order is changed.';
            ExternalName = 'msdyn_bookingsummary';
            ExternalType = 'Memo';
            SubType = Memo;
        }
        field(21; msdyn_ChildIndex; Integer)
        {
            Caption = 'Child Index';
            ExternalName = 'msdyn_childindex';
            ExternalType = 'Integer';
            MinValue = 1;
        }
        field(22; msdyn_City; Text[80])
        {
            Caption = 'City';
            ExternalName = 'msdyn_city';
            ExternalType = 'String';
        }
        field(23; msdyn_Country; Text[80])
        {
            Caption = 'Country/Region';
            ExternalName = 'msdyn_country';
            ExternalType = 'String';
        }
        field(24; msdyn_DateWindowEnd; Date)
        {
            Caption = 'Date Window End';
            ExternalName = 'msdyn_datewindowend';
            ExternalType = 'DateTime';
        }
        field(25; msdyn_DateWindowStart; Date)
        {
            Caption = 'Date Window Start';
            ExternalName = 'msdyn_datewindowstart';
            ExternalType = 'DateTime';
        }
        field(26; msdyn_EstimateSubtotalAmount; Decimal)
        {
            Caption = 'Estimate Subtotal Amount';
            Description = 'Enter the summary of total estimated billing amount for this work order';
            ExternalName = 'msdyn_estimatesubtotalamount';
            ExternalType = 'Money';
        }
        field(27; ExchangeRate; Decimal)
        {
            Caption = 'Exchange Rate';
            Description = 'Shows the exchange rate for the currency associated with the entity with respect to the base currency.';
            ExternalAccess = Read;
            ExternalName = 'exchangerate';
            ExternalType = 'Decimal';
        }
        field(28; msdyn_estimatesubtotalamount_B; Decimal)
        {
            Caption = 'Estimate Subtotal Amount (Base)';
            Description = 'Shows the value of the estimate subtotal amount in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_estimatesubtotalamount_base';
            ExternalType = 'Money';
        }
        field(29; msdyn_FollowUpNote; BLOB)
        {
            Caption = 'Follow Up Note (Deprecated)';
            Description = 'Indicate the details of the follow up work';
            ExternalName = 'msdyn_followupnote';
            ExternalType = 'Memo';
            SubType = Memo;
        }
        field(30; msdyn_FollowUpRequired; Boolean)
        {
            Caption = 'Follow Up Required (Deprecated)';
            Description = 'Allows indication if follow up work is required for a work order.';
            ExternalName = 'msdyn_followuprequired';
            ExternalType = 'Boolean';
        }
        field(31; msdyn_Instructions; BLOB)
        {
            Caption = 'Instructions';
            Description = 'Shows instructions for booked resources. By default, this information is taken from the work order instructions field on the service account.';
            ExternalName = 'msdyn_instructions';
            ExternalType = 'Memo';
            SubType = Memo;
        }
        field(32; msdyn_InternalFlags; BLOB)
        {
            Caption = 'Internal Flags';
            Description = 'For internal use only.';
            ExternalName = 'msdyn_internalflags';
            ExternalType = 'Memo';
            SubType = Memo;
        }
        field(33; msdyn_IsFollowUp; Boolean)
        {
            Caption = 'Is FollowUp (Deprecated)';
            ExternalName = 'msdyn_isfollowup';
            ExternalType = 'Boolean';
        }
        field(34; msdyn_IsMobile; Boolean)
        {
            Caption = 'Is Mobile';
            ExternalName = 'msdyn_ismobile';
            ExternalType = 'Boolean';
        }
        field(35; msdyn_Latitude; Decimal)
        {
            Caption = 'Latitude';
            Description = '';
            ExternalName = 'msdyn_latitude';
            ExternalType = 'Double';
        }
        field(36; msdyn_Longitude; Decimal)
        {
            Caption = 'Longitude';
            Description = '';
            ExternalName = 'msdyn_longitude';
            ExternalType = 'Double';
        }
        field(37; msdyn_ParentWorkOrder; Guid)
        {
            Caption = 'Parent Work Order';
            Description = 'Unique identifier for Work Order associated with Work Order.';
            ExternalName = 'msdyn_parentworkorder';
            ExternalType = 'Lookup';
            TableRelation = msdyn_workorder.msdyn_workorderId;
        }
        field(38; msdyn_PostalCode; Text[20])
        {
            Caption = 'Postal Code';
            ExternalName = 'msdyn_postalcode';
            ExternalType = 'String';
        }
        field(39; msdyn_PrimaryIncidentDescripti; BLOB)
        {
            Caption = 'Primary Incident Description';
            Description = 'Incident description';
            ExternalName = 'msdyn_primaryincidentdescription';
            ExternalType = 'Memo';
            SubType = Memo;
        }
        field(40; msdyn_PrimaryIncidentEstimated; Integer)
        {
            Caption = 'Primary Incident Estimated Duration';
            Description = 'Shows the time estimated to resolve this incident.';
            ExternalName = 'msdyn_primaryincidentestimatedduration';
            ExternalType = 'Integer';
            MinValue = 0;
        }
        field(41; msdyn_StateOrProvince; Text[50])
        {
            Caption = 'State Or Province';
            ExternalName = 'msdyn_stateorprovince';
            ExternalType = 'String';
        }
        field(42; msdyn_SubtotalAmount; Decimal)
        {
            Caption = 'Subtotal Amount';
            Description = 'Enter the summary of subtotal billing amount excluding tax for this work order.';
            ExternalName = 'msdyn_subtotalamount';
            ExternalType = 'Money';
        }
        field(43; msdyn_subtotalamount_Base; Decimal)
        {
            Caption = 'Subtotal Amount (Base)';
            Description = 'Shows the value of the subtotal amount in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_subtotalamount_base';
            ExternalType = 'Money';
        }
        field(44; msdyn_SystemStatus; Option)
        {
            Caption = 'System Status';
            Description = 'Tracks the current system status.';
            ExternalName = 'msdyn_systemstatus';
            ExternalType = 'Picklist';
            InitValue = " ";
            OptionCaption = ' ,Open - Unscheduled,Open - Scheduled,Open - In Progress,Open - Completed,Closed - Posted,Closed - Canceled';
            OptionOrdinalValues = -1, 690970000, 690970001, 690970002, 690970003, 690970004, 690970005;
            OptionMembers = " ","Open-Unscheduled","Open-Scheduled","Open-InProgress","Open-Completed","Closed-Posted","Closed-Canceled";
        }
        field(45; msdyn_Taxable; Boolean)
        {
            Caption = 'Taxable';
            Description = 'Shows whether sales tax is to be charged for this work order.';
            ExternalName = 'msdyn_taxable';
            ExternalType = 'Boolean';
        }
        field(46; msdyn_TimeClosed; DateTime)
        {
            Caption = 'Closed On';
            Description = 'Enter the time this work order was last closed.';
            ExternalName = 'msdyn_timeclosed';
            ExternalType = 'DateTime';
        }
        field(47; msdyn_TimeFromPromised; DateTime)
        {
            Caption = 'Time From Promised';
            Description = 'Enter the starting range of the time promised to the account that incidents will be resolved.';
            ExternalName = 'msdyn_timefrompromised';
            ExternalType = 'DateTime';
        }
        field(48; msdyn_TimeToPromised; DateTime)
        {
            Caption = 'Time To Promised';
            Description = 'Enter the ending range of the time promised to the account that incidents will be resolved.';
            ExternalName = 'msdyn_timetopromised';
            ExternalType = 'DateTime';
        }
        field(49; msdyn_TimeWindowEnd; DateTime)
        {
            Caption = 'Time Window End';
            ExternalName = 'msdyn_timewindowend';
            ExternalType = 'DateTime';
        }
        field(50; msdyn_TimeWindowStart; DateTime)
        {
            Caption = 'Time Window Start';
            ExternalName = 'msdyn_timewindowstart';
            ExternalType = 'DateTime';
        }
        field(51; msdyn_TotalAmount; Decimal)
        {
            Caption = 'Total Amount';
            Description = 'Enter the summary of total billing amount for this work order.';
            ExternalName = 'msdyn_totalamount';
            ExternalType = 'Money';
        }
        field(52; msdyn_totalamount_Base; Decimal)
        {
            Caption = 'Total Amount (Base)';
            Description = 'Shows the value of the total amount in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_totalamount_base';
            ExternalType = 'Money';
        }
        field(53; msdyn_TotalSalesTax; Decimal)
        {
            Caption = 'Total Sales Tax';
            Description = 'Enter the summary of total sales tax charged for this work order.';
            ExternalName = 'msdyn_totalsalestax';
            ExternalType = 'Money';
        }
        field(54; msdyn_totalsalestax_Base; Decimal)
        {
            Caption = 'Total Sales Tax (Base)';
            Description = 'Shows the value of the total sales tax in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_totalsalestax_base';
            ExternalType = 'Money';
        }
        field(55; msdyn_WorkLocation; Option)
        {
            Caption = 'Work Location';
            ExternalName = 'msdyn_worklocation';
            ExternalType = 'Picklist';
            InitValue = Onsite;
            OptionCaption = 'Onsite,Depot,Location Agnostic';
            OptionOrdinalValues = 690970000, 690970001, 690970002;
            OptionMembers = Onsite,Depot,LocationAgnostic;
        }
        field(56; msdyn_WorkOrderSummary; BLOB)
        {
            Caption = 'Work Order Summary';
            Description = 'Type a summary description of the job.';
            ExternalName = 'msdyn_workordersummary';
            ExternalType = 'Memo';
            SubType = Memo;
        }
        field(57; msdyn_AgreementName; Text[100])
        {
            CalcFormula = Lookup (msdyn_agreement.msdyn_name WHERE (msdyn_agreementId = FIELD (msdyn_Agreement)));
            ExternalAccess = Read;
            ExternalName = 'msdyn_agreementname';
            ExternalType = 'String';
            FieldClass = FlowField;
        }
        field(58; msdyn_ParentWorkOrderName; Text[100])
        {
            CalcFormula = Lookup (msdyn_workorder.msdyn_name WHERE (msdyn_workorderId = FIELD (msdyn_ParentWorkOrder)));
            ExternalAccess = Read;
            ExternalName = 'msdyn_parentworkordername';
            ExternalType = 'String';
            FieldClass = FlowField;
        }
        field(59; rs_participationcode; Option)
        {
            Caption = 'Participation Code';
            Description = '';
            ExternalName = 'rs_participationcode';
            ExternalType = 'Picklist';
            InitValue = " ";
            OptionCaption = ' ,Client,Support';
            OptionOrdinalValues = -1, 1, 2;
            OptionMembers = " ",Client,Support;
        }
        field(60; rs_attended; Boolean)
        {
            Caption = 'Attended';
            Description = '';
            ExternalName = 'rs_attended';
            ExternalType = 'Boolean';
        }
        field(61; rs_unidentifiedclientattendanc; Integer)
        {
            Caption = 'Unidentified Client Attendance';
            Description = '';
            ExternalName = 'rs_unidentifiedclientattendance';
            ExternalType = 'Integer';
            MinValue = 0;
        }
        field(62; rs_purchaseinvoiceno; Text[100])
        {
            Caption = 'Purchase Invoice No';
            Description = '';
            ExternalName = 'rs_purchaseinvoiceno';
            ExternalType = 'String';
        }
        field(63; rs_salesinvoiceno; Text[100])
        {
            Caption = 'Sales Invoice No';
            Description = '';
            ExternalName = 'rs_salesinvoiceno';
            ExternalType = 'String';
        }
        field(64; rs_dexupload; Boolean)
        {
            Caption = 'DEX Upload';
            Description = '';
            ExternalName = 'rs_dexupload';
            ExternalType = 'Boolean';
        }
        field(65; rs_agreementbooking; Guid)
        {
            Caption = 'Agreement Booking';
            Description = '';
            ExternalName = 'rs_agreementbooking';
            ExternalType = 'Lookup';
            TableRelation = msdyn_agreementbookingsetup.msdyn_agreementbookingsetupId;
        }
        field(66; rs_agreementbookingName; Text[100])
        {
            CalcFormula = Lookup (msdyn_agreementbookingsetup.msdyn_name WHERE (msdyn_agreementbookingsetupId = FIELD (rs_agreementbooking)));
            ExternalAccess = Read;
            ExternalName = 'rs_agreementbookingname';
            ExternalType = 'String';
            FieldClass = FlowField;
        }
        field(67; rs_referraltype; Option)
        {
            Caption = 'Referral Type';
            Description = '';
            ExternalName = 'rs_referraltype';
            ExternalType = 'Picklist';
            InitValue = " ";
            OptionCaption = ' ,Internal,External';
            OptionOrdinalValues = -1, 1, 2;
            OptionMembers = " ",Internal,External;
        }
        field(68; rs_referralpurpose; Option)
        {
            Caption = 'Referral Purpose';
            Description = '';
            ExternalName = 'rs_referralpurpose';
            ExternalType = 'Picklist';
            InitValue = " ";
            OptionCaption = ' ,Physical Health,Mental Health; Wellbeing and self-care,Personal and Family Safety,Age - appropriate Development,Community Participation and Networks,Family Functioning,Managing Money,Employment; Education and Training,Material Wellbeing,Housing';
            OptionOrdinalValues = -1, 717810000, 717810001, 717810002, 717810003, 717810004, 717810005, 717810006, 717810007, 717810008, 717810009;
            OptionMembers = " ",PhysicalHealth,"MentalHealthWellbeingandself-care",PersonalandFamilySafety,"Age-appropriateDevelopment",CommunityParticipationandNetworks,FamilyFunctioning,ManagingMoney,EmploymentEducationandTraining,MaterialWellbeing,Housing;
        }
        field(69; rs_activityfee; Boolean)
        {
            Caption = 'Activity Fee';
            Description = '';
            ExternalName = 'rs_activityfee';
            ExternalType = 'Boolean';
        }
        field(70; rs_activityfeeamount; Decimal)
        {
            Caption = 'Activity Fee Amount';
            Description = '';
            ExternalName = 'rs_activityfeeamount';
            ExternalType = 'Money';
        }
        field(71; rs_activityfeeamount_Base; Decimal)
        {
            Caption = 'Activity Fee Amount (Base)';
            Description = 'Value of the Activity Fee Amount in base currency.';
            ExternalAccess = Read;
            ExternalName = 'rs_activityfeeamount_base';
            ExternalType = 'Money';
        }
        field(72; rs_quantity; Decimal)
        {
            Caption = 'Quantity';
            Description = '';
            ExternalName = 'rs_quantity';
            ExternalType = 'Decimal';
        }
        field(73; rs_release; Boolean)
        {
            Caption = 'Release';
            Description = '';
            ExternalName = 'rs_release';
            ExternalType = 'Boolean';
        }
        field(74; rs_postalcode; Integer)
        {
            Caption = 'Postal Code';
            Description = '';
            ExternalName = 'rs_postalcode';
            ExternalType = 'Integer';
            MinValue = 0;
        }
        field(75; rs_servicestatus; Option)
        {
            Caption = 'Service Status';
            Description = '';
            ExternalName = 'rs_servicestatus';
            ExternalType = 'Picklist';
            InitValue = " ";
            OptionCaption = ' ,Open,Purchase Order,Ready';
            OptionOrdinalValues = -1, 1, 3, 2;
            OptionMembers = " ",Open,PurchaseOrder,Ready;
        }
        field(76; rs_approvalmethod; Option)
        {
            Caption = 'Approval Method';
            Description = '';
            ExternalName = 'rs_approvalmethod';
            ExternalType = 'Picklist';
            InitValue = " ";
            OptionCaption = ' ,Phone,Email,Letter';
            OptionOrdinalValues = -1, 1, 2, 3;
            OptionMembers = " ",Phone,Email,Letter;
        }
        field(77; rs_approvalcomments; BLOB)
        {
            Caption = 'Approval Comments';
            Description = '';
            ExternalName = 'rs_approvalcomments';
            ExternalType = 'Memo';
            SubType = Memo;
        }
        field(78; rs_subject; Text[100])
        {
            Caption = 'Subject';
            Description = '';
            ExternalName = 'rs_subject';
            ExternalType = 'String';
        }
        field(79; rs_description; BLOB)
        {
            Caption = 'Description';
            Description = '';
            ExternalName = 'rs_description';
            ExternalType = 'Memo';
            SubType = Memo;
        }
        field(80; rs_correctionwo; Guid)
        {
            Caption = 'Correction WO';
            Description = '';
            ExternalName = 'rs_correctionwo';
            ExternalType = 'Lookup';
            TableRelation = msdyn_workorder.msdyn_workorderId;
        }
        field(81; rs_correctionwoName; Text[100])
        {
            CalcFormula = Lookup (msdyn_workorder.msdyn_name WHERE (msdyn_workorderId = FIELD (rs_correctionwo)));
            ExternalAccess = Read;
            ExternalName = 'rs_correctionwoname';
            ExternalType = 'String';
            FieldClass = FlowField;
        }
        field(82; rs_totalcost; Decimal)
        {
            Caption = 'Total Cost';
            Description = '';
            ExternalName = 'rs_totalcost';
            ExternalType = 'Decimal';
        }
        field(150; ModifiedBy; Guid)
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
        key(Key1; msdyn_workorderId)
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


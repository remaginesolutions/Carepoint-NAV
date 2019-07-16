codeunit 16035401 "HBS Workflow Mgt."
{
    // version CAREPOINT1.00


    trigger OnRun()
    begin
    end;

    var
        NoteIsAddedTxt: Label 'Note is added to the record';
        CreateNotifEntryTxt: Label 'Create a Note added notification for %1.', Comment = 'Create a Note added notification for NAVUser.';
        BankAccLimitReachedTxt: Label 'Bank Account Balance limit is reached.';
        BankAccLimitNotificationTxt: Label 'Send Bank Account Balance limit reached notification.';

    local procedure RunWorkflowNoteAddedCode(): Code[128]
    begin
        EXIT(UPPERCASE('RunWorkflowNoteAdded'));
    end;

    local procedure CreateNoteAddedNotificationEmailCode(): Code[128]
    begin
        EXIT(UPPERCASE('CreateNewNoteEmailNotification'));
    end;

    local procedure BankAccountLimitReachedEventCode(): Code[128]
    begin
        EXIT(UPPERCASE('BankAccountLimitReachedEvent'));
    end;

    local procedure SendBankAccLimitReachedNotificationCode(): Code[128]
    begin
        EXIT(UPPERCASE('SendBankAccLimitReachedNotification'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure AddEventsToLibrary()
    var
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        WorkflowEventHandling.AddEventToLibrary(
          RunWorkflowNoteAddedCode, DATABASE::"Record Link", NoteIsAddedTxt, 0, FALSE);

        WorkflowEventHandling.AddEventToLibrary(
          BankAccountLimitReachedEventCode, DATABASE::"Bank Account", BankAccLimitReachedTxt, 0, FALSE);
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    local procedure AddResponsesToLibrary()
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
    begin
        WorkflowResponseHandling.AddResponseToLibrary(CreateNoteAddedNotificationEmailCode, 0, CreateNotifEntryTxt, 'GROUP 3');

        WorkflowResponseHandling.AddResponseToLibrary(SendBankAccLimitReachedNotificationCode, 270, BankAccLimitNotificationTxt, 'GROUP 0');
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnAddWorkflowResponsePredecessorsToLibrary', '', false, false)]
    local procedure AddHBSWorkflowEventResponseCombinationsToLibrary(ResponseFunctionName: Code[128])
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
    begin
        CASE ResponseFunctionName OF
            RunWorkflowNoteAddedCode:
                WorkflowResponseHandling.AddResponsePredecessor(CreateNoteAddedNotificationEmailCode, RunWorkflowNoteAddedCode);
            SendBankAccLimitReachedNotificationCode:
                WorkflowResponseHandling.AddResponsePredecessor(SendBankAccLimitReachedNotificationCode, BankAccountLimitReachedEventCode);
        END;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnAddWorkflowResponsePredecessorsToLibrary', '', false, false)]
    procedure AddCreateHBSRequestResponsePredecessors(ResponseFunctionName: Code[128])
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        CASE ResponseFunctionName OF
            RunWorkflowNoteAddedCode:
                BEGIN
                    WorkflowResponseHandling.AddResponsePredecessor(CreateNoteAddedNotificationEmailCode, RunWorkflowNoteAddedCode);
                END;
            SendBankAccLimitReachedNotificationCode:
                WorkflowResponseHandling.AddResponsePredecessor(BankAccountLimitReachedEventCode, SendBankAccLimitReachedNotificationCode);
        END;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnExecuteWorkflowResponse', '', false, false)]
    local procedure ExecWorkflowResponses(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            CASE WorkflowResponse."Function Name" OF
                CreateNoteAddedNotificationEmailCode:
                    BEGIN
                        CreateNewNoteEmailNotification(Variant, ResponseWorkflowStepInstance);
                        ResponseExecuted := TRUE;
                    END;
            END;
    end;

    [EventSubscriber(ObjectType::Table, 2000000068, 'OnAfterInsertEvent', '', false, false)]
    procedure HandleNoteEvent(var Rec: Record "Record Link"; RunTrigger: Boolean)
    var
        WorkflowManagement: Codeunit "Workflow Management";
    begin
        WorkflowManagement.HandleEvent(RunWorkflowNoteAddedCode(), Rec);
    end;

    local procedure CreateNewNoteEmailNotification(Variant: Variant; WorkflowStepInstance: Record "Workflow Step Instance")
    var
        RecordLink: Record "Record Link";
        WorkflowStepArgument: Record "Workflow Step Argument";
        NotificationEntry: Record "Notification Entry";
        RecRef: RecordRef;
        FRef: FieldRef;
    begin
        WITH NotificationEntry DO BEGIN
            IF WorkflowStepArgument.GET(WorkflowStepInstance.Argument) THEN;
            RecRef.GETTABLE(Variant);
            CLEAR(NotificationEntry);
            Type := NotificationEntry.Type::"New Record";

            FRef := RecRef.FIELD(RecordLink.FIELDNO("To User ID"));
            "Recipient User ID" := FORMAT(FRef.VALUE);

            "Triggered By Record" := RecRef.RECORDID;
            "Link Target Page" := WorkflowStepArgument."Link Target Page";
            "Custom Link" := WorkflowStepArgument."Custom Link";

            INSERT(TRUE);
        END;
    end;

    [EventSubscriber(ObjectType::Table, 5339, 'OnAfterInsertEvent', '', false, false)]
    [TryFunction]
    local procedure SendCRMIntegrationErrorLogEmail(var Rec: Record "Integration Synch. Job Errors"; RunTrigger: Boolean)
    var
        NotificationEntry: Record "Notification Entry";
        CarepointSetup: Record "Carepoint Setup";
    begin
        IF NOT CarepointSetup.GET THEN
            EXIT;

        IF CarepointSetup."Integr. Error Notif. User" = '' THEN
            EXIT;

        // NotificationEntry.CreateNew(NotificationEntry.Type::"",CarepointSetup."Integr. Error Notif. User",Rec.RECORDID,0,'');
    end;
}


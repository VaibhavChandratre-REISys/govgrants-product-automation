@closeoutExecution @closeout @grantor-regression @grantor-parallel-regression @regression @closeoutEmailNotification @EmailNotification @closeoutmailandPdf  @skipOnJenkins
Feature: Validate all scenarios in Closeout for Email Notification

  @76490 @VerifyEmailNotificationForApprovedCloseoutRequest
  Scenario: Validate user should receive email notification for approval of closeout Request
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "CloseoutID"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    And I wait for "4" seconds
    Then I softly see field "Override Justification" as "Automation Test justification"
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Closeout Request {SavedValue:closeoutID} has beenapproved
      """

  @87358 @86711 @86707 @86709 @VerifyEmailNoificationRecievedBySPIUserForCloseout  @buglogged-234888
  Scenario: To verify Email notification should be received to SPI user when closeout Request has Sent to Subrecipient in Closeout phase
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    Given I click on "Send To Subrecipient" in the page details
    And I pause execution for "3" seconds
    And I logout
    And I checkout to yopmail with mailid "automationspi31@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification of Closeout Request for {SavedValue:Automation Runtime Award for closeout}
      """
    #86711
    And I checkout to yopmail with mailid "automation.spa@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification of Closeout Request for {SavedValue:Automation Runtime Award for closeout}
      """
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    When I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:ProjectPeriodCloseoutTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    #86707
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Closeout Request {SavedValue:closeoutID} has beenSubmitted for your Approval
      """
    #86709
    And I checkout to yopmail with mailid "fo.automation@yopmail.com"
    And I pause execution for "5" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Closeout Request {SavedValue:closeoutID} has beenSubmitted for your Approval
      """

  @200169 @ValidatePOuserCloseoutApproverRejectedNotifyemailshoulbegeneratedinyopmailtonewcloseoutownerwhenownershipistransferfromonePOtootherPOisinSubmitforapprovalstate @sprint-12-US-226646  @reassignment
  Scenario: Validate PO user 'Closeout Approver Rejected Notify' email should be generated in yopmail to new closeout owner when ownership is transfer from one PO to other PO is in 'Submit for approval' state
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation PO user" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "input-1"
    And I select value "Automation PO1" into field "input-2"
    And I select module "Closeout" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    And I reset the table
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "automationpo1@yopmail.com"
    And I pause execution for "180" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Closeout Request {SavedValue:closeoutID} has beenRejected
      """

    Then I see the mail text is as follows :

      """
      Hello ,
      This email is to notify you that the Closeout Request {SavedValue:closeoutID} has been rejected by the Approver.
      Log in to EGMS and click here for further details.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200170 @ValidateEXEuserCloseoutSubmittedbyPeerRevieweremailshouldbegeneratedinyopmailtonewcloseoutownerwhenownershipistransferfromoneEXEtootherEXEisinReviewedstate @sprint-12-US-226646  @reassignment @Bug-Ticket-532346
  Scenario: Validate EXE user 'Closeout Submitted by Peer Reviewer' email should be generated in yopmail to new closeout owner when ownership is transfer from one EXE to other EXE is in 'Reviewed' state
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description                 | Due Date |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 5        |
    When I click on "Send for Review" icon for "{SavedValue:FO Username}" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Closeout" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    And I reset the table
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:homePendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:homePendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    Then I softly can see top right button "Complete Review" in page detail
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Review completed for {SavedValue:closeoutID}
      """

  @199774 @ValidatePMuserEmailCloseoutApproverSentBackNotifyshouldtriggertonewownerofcloseoutwhenonceownershiprelatedtaskisreassigntonewuserofcloseout @sprint-12-US-226646  @reassignment
  Scenario: Validate PM user Email 'Closeout Approver Sent Back Notify' should trigger to new owner of closeout when once ownership related task is reassign to new user of closeout
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Closeout Request {SavedValue:closeoutID} has beenSent Back
      """

    Then I see the mail text is as follows :
      """
      Hello,
      This email is to notify you that the Closeout Request {SavedValue:closeoutID} has been sent back by the Approver.
      Log in to EGMS and follow the link here for further details, and resubmit for approvals.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @199795 @ValidatePOuserEmailCloseoutApproverApprovedshouldtriggertonewownerofcloseoutwhenonceownershiprelatedtaskisreassigntonewuserofcloseout @sprint-12-US-226646  @reassignment
  Scenario: Validate PO user Email 'Closeout Approver Approved' should trigger to new owner of closeout when once ownership related task is reassign to new user of closeout
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 1   |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Completed"
    And I checkout to yopmail with mailid "automationpo1@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Closeout Request {SavedValue:closeoutID} has beenapproved
      """

    Then I see the mail text is as follows :

      """
      Hello ,

     This email is to notify you that the Closeout Request {SavedValue:closeoutID} for the Grant # {SavedValue:GrantEGMSID} has been approved.

      Closeout Details:
      Grant Number: {SavedValue:GrantEGMSID}
      Project Period Start Date: {Date:M/d/yyyy}
      Project Period End Date: {Date:M/d/yyyy::d+3650}
      Closeout Type: Early Completion

      Log in to EGMS and click here for more details.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com, if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @199819 @199765 @ValidatePOuserEmailshouldgeneratedinyopmailtonewownerofcloseoutwhenonceownershiprelatedtaskreassigntonewuserofcloseout @sprint-12-US-226646  @reassignment
  Scenario: Validate PO user Email should generated in yopmail to new owner of closeout when once ownership related task is reassign to new user of closeout
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    And I checkout to yopmail with mailid "automationpo1@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PO] to [Automation PO1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:closeoutID} Automation PO Closeout

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @199768 @ValidatePMuserEmailshouldgeneratedinyopmailtoold&newownerofcloseoutwhenonceownershiprelatedtaskisreassigntonewuserofcloseout @sprint-12-US-226646  @reassignment
  Scenario: Validate PM user Email should  generated in yopmail to old & new owner of closeout when once ownership related task is reassign to new user of closeout
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    And I logout
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:closeoutID} Automation PM Closeout

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:closeoutID} Automation PM Closeout

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @200126 @ValidatePOusercloseoutowneremailshouldbegeneratedfosystemadminpreviousownerandnewownerofcloseoutafterownershipofcloseoutischangedinCreatedstate @sprint-12-US-226646  @reassignment
  Scenario: Validate PO user(closeout owner)email should be generated for system admin, previous owner and new owner of closeout after ownership of closeout is changed in 'Created' state
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "input-1"
    And I select value "Automation PO1" into field "input-2"
    And I select module "Closeout" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    And I reset the table
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    And I checkout to yopmail with mailid "automationpo@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """

    Then I see the mail text is as follows :
      """
      Hello,

      The record(s) below have been reassigned from [Automation PO] to [Automation PO1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:closeoutID} Automation ADMIN Closeout

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "automationpo1@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PO] to [Automation PO1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:closeoutID} Automation ADMIN Closeout

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "govgrantsautomation@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
     Hello,

     The record(s) below have been reassigned from [Automation PO] to [Automation PO1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:closeoutID} Automation ADMIN Closeout

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @200171 @ValidatePMuserCloseoutApproverSentBackemailshouldbegeneratedinyopmailtonewcloseoutownerwheownershipistransferfromonePMtootherPMisinSubmittedforApprovalstate @sprint-11-US-224734  @reassignment
  Scenario: Validate PM user Email 'Closeout Approver Sent Back Notify' should trigger to new owner of closeout when once ownership related task is reassign to new user of closeout
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Closeout Request {SavedValue:closeoutID} has beenSent Back
      """

    Then I see the mail text is as follows :
      """
      Hello,
      This email is to notify you that the Closeout Request {SavedValue:closeoutID} has been sent back by the Approver.
      Log in to EGMS and follow the link here for further details, and resubmit for approvals.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200153 @ValidatePMuserCloseoutRequestAwardownernotifyemailshouldbegeneratedinyopmailtoawardownerwhencloseoutisinCreatedstate @sprint-5-US-197578  @reassignment
  Scenario: Validate PM user Closeout Request Award owner notify email should be generated in yopmail to award owner when closeout is in 'Created' state
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Closeout" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    And I reset the table
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "5" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: New Closeout has been Created.
      """

    Then I see the mail text is as follows :
      """
      Hello,

      This email is to notify you that the Early Completion Closeout request - {SavedValue:closeoutID} has been created for the Grant #{SavedValue:GrantEGMSID}.

     Closeout Details:
      Grant Number: {SavedValue:GrantEGMSID}
      Project Period Start Date: {Date:M/d/yyyy}
      Project Period End Date: {Date:M/d/yyyy::d+3650}
      Closeout Type: Early Completion

      Log in to EGMS and click here for more details.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @224656 @89222 @ValidateCloseoutnewownerofpeerreviewershouldabletosubmitthereviewcommentforcloseout @sprint-11-US-218319  @reassignment
  Scenario: Validate Closeout new owner of peer reviewer should able to submit the review comments for closeout
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility   | Description                 | Due Date |
      | {SavedValue:FO Username} | Program Reviewer | Automation Test Description | 5        |
    When I enter the following values into flex table with id "---closeout:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name             | Responsibility   | Description                 | Due Date |
      | {SavedValue:EXE Username} | Program Reviewer | Automation Test Description | 5        |
    #89222
    Then I softly see value "{SavedValue:FO Username}" for title "Reviewer Name" inside table "---closeout:-:closeoutPeerReviewTableId---"
    Then I softly see value "Program Reviewer" for title "Responsibility" inside table "---closeout:-:closeoutPeerReviewTableId---"
    Then I softly see value "Automation Test Description" for title "Description" inside table "---closeout:-:closeoutPeerReviewTableId---"
    When I click on "Send for Review" icon for "{SavedValue:FO Username}" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    When I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation EXE1" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Review completed for {SavedValue:closeoutID}
      """
    Then I see the mail text is as follows :
      """
      Hello Automation EXE,

      A review has been completed for Closeout {SavedValue:closeoutID} as per the details provided below:.

     Closeout Details:
      Grant Number: {SavedValue:GrantEGMSID}
      Project Period Start Date: {Date:M/d/yyyy}
      Project Period End Date: {Date:M/d/yyyy::d+3650}
      Closeout Type: Early Completion

      Log in to EGMS and click here for more details.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """


  @199794 @ValidateEXEuserEmailCloseoutApproverRejectNotifyshouldtriggertonewownerofcloseoutwhenonceownershiprelatedtaskisreassigntonewuserofcloseout @sprint-5-US-192940  @reassignment
  Scenario: Validate EXE user Email 'Closeout Approver Reject Notify' should trigger to new owner of closeout when once ownership related task is reassign to new user of closeout
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Closeout Request {SavedValue:closeoutID} has beenRejected
      """

    Then I see the mail text is as follows :

      """
      Hello ,
      This email is to notify you that the Closeout Request {SavedValue:closeoutID} has been rejected by the Approver.
      Log in to EGMS and click here for further details.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

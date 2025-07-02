@riskAssessment @awardLevelRiskAssessment @grantor-regression @grantor-parallel-regression @regression @RiskExecution @riskAssessmentEmailNotification @EmailNotification @riskassesmentemailandPdf  @skipOnJenkins
Feature: Validate all scenarios in the Risk Assessment for Email Notification

  @198041 @ValidatePOusercansubmittheawardriskassessmentforapprovalpostrevieweraddcommentswhenownershipistransferredforRAwhichisinSubmittedforReviewstatus @sprint-12-US-226646  @reassignment @Bug-Ticket-532346
  Scenario: Validate PO user can submit the award risk assessment for approval post reviewer add comments when ownership is transferred for a RA which is in Submitted for Review status
    Given I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FD Username} | Step 1          |
    And I enter the following values into flex table with id "---riskassessment:-:raPeerReviewFlexTableId---" by clicking "New" :
      | Name                      | Responsibility   | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Program Reviewer | Automation Test Description | 7        | Yes                  |
    And I click on "Send for Review" icon for "Program Reviewer" inside flex table with id "---riskassessment:-:raPeerReviewFlexTableId---" without waiting for record
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "input-1"
    And I select value "Automation PO1" into field "input-2"
    And I select module "Risk Assessment" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:RAEGMSID}" in "---riskassessment:-:riskAssSourceTableId---" panel
    When I check "{SavedValue:RAEGMSID}" boxes in flex table with id "---riskassessment:-:riskAssSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---riskassessment:-:riskAssSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:RAEGMSID}" in "---riskassessment:-:riskAssTargetTableId---" panel
    Then I see value "{SavedValue:RAEGMSID}" for title "Risk Assessment ID" inside table "---riskassessment:-:riskAssTargetTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:RAEGMSID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    Then I do not see value "{SavedValue:RAEGMSID}" for title "EGMS ID" inside table "---subAwardStandAlone:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:RAEGMSID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:RAEGMSID}" for title "EGMS ID" inside table "---subAwardStandAlone:-:pendingTaskTableId---"
    Then I softly see value "Review Subaward Risk Assessment" for title "Task Type" inside table "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:RAEGMSID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    When I navigate to "Assessment" sub tab
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I enter value "Checked" into field "Signature__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---riskassessment:-:raPeerReviewFlexTableId---"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I logout
    And I wait for "2" seconds
    And I checkout to yopmail with mailid "automationpo1@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Subaward Risk Assessment for {SavedValue:RAEGMSID} has been Peer Reviewed.
      """
    Then I see the mail text is as follows :
      """
      Hello Automation PO1,
     This email to notify you that a Subaward Risk Assessment for Subaward {SavedValue:AwardEGMSID} has been peer reviewed.
     Log in to EGMS and click here for more details.
     Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com If you have any questions or need assistance with this task.
     Thank you.
     The EGMS Team
      """
    Then I refresh the page
    And I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "PO1" user
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Subaward Risk Assessments - All"
    And I perform quick search for "{SavedValue:RAEGMSID}" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:RAEGMSID}" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "{SavedValue:EXE Username}" in flex table with id "---riskassessment:-:raPeerReviewFlexTableId---"
    Then I softly see value "Automation PO1" for title "Name" inside table "---riskassessment:-:riskAssOwnerTableId---"
    And I click on "Complete Review" in the page details
    Then I softly see status in Progress-bar is "Reviewed" and is "dark blue"
    Then I softly can see top right button "Submit for Approval" in page detail
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"

  @198047 @ValidateFDprofileusercanrejecttheawardrisassessmentforstep1approvalswhenownershipistransferredforRAwhichisinSubmittedforapprovalstatus @sprint-12-US-226646  @reassignment @Bug-Ticket-532353
  Scenario: Validate FD profile user can reject the award risk assessment for step 1 approvals when ownership is transferred for a RA which is in Submitted for approval status
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FD Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                      | Risk Assessment |
      | {SavedValue:EXE Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Risk Assessment" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:RAEGMSID}" in "---riskassessment:-:riskAssSourceTableId---" panel
    When I check "{SavedValue:RAEGMSID}" boxes in flex table with id "---riskassessment:-:riskAssSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---riskassessment:-:riskAssSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:RAEGMSID}" in "---riskassessment:-:riskAssTargetTableId---" panel
    Then I see value "{SavedValue:RAEGMSID}" for title "Risk Assessment ID" inside table "---riskassessment:-:riskAssTargetTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Subaward Risk Assessments - All"
    And I perform quick search for "{SavedValue:RAEGMSID}" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:RAEGMSID}" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation EXE1" for title "Name" inside table "---riskassessment:-:riskAssOwnerTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:RAEGMSID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    Then I softly do not see value "{SavedValue:RAEGMSID}" for title "EGMS ID" inside table "---subAwardStandAlone:-:pendingTaskTableId---"
    Then I softly do not see value "Approve Subaward Risk Assessment" for title "Task Type" inside table "---subAwardStandAlone:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:RAEGMSID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    Then I softly see value "Approve Subaward Risk Assessment" for title "Task Type" inside table "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:RAEGMSID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Approver Rejected Subaward Risk Assessmentfor {SavedValue:AwardEGMSID}
      """

    Then I see the mail text is as follows :

      """
      Hello,
      This email is to inform you that the Subaward Risk Assessment for {SavedValue:AwardEGMSID} has been rejected by the Approver.
      Log in to EGMS and click here for more details.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @198046 @ValidateEXEprofileusercanapprovetheawardriskassessmentforstep2approvalswhenownershipistransferredforRAwhichisinSubmittedforapprovalstatus @sprint-12-US-226646  @reassignment @Bug-Ticket-532353
  Scenario: Validate EXE profile user can approve the award risk assessment for step 2 approvals when ownership is transferred for a RA which is in Submitted for approval status
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name           | Risk Assessment |
      | Automation FD1 | Step 1          |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name           | Risk Assessment |
      | Automation EXE | Step 2          |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FD1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Risk Assessment" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:RAEGMSID}" in "---riskassessment:-:riskAssSourceTableId---" panel
    When I check "{SavedValue:RAEGMSID}" boxes in flex table with id "---riskassessment:-:riskAssSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---riskassessment:-:riskAssSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:RAEGMSID}" in "---riskassessment:-:riskAssTargetTableId---" panel
    Then I softly see value "{SavedValue:RAEGMSID}" for title "Risk Assessment ID" inside table "---riskassessment:-:riskAssTargetTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Subaward Risk Assessments - All"
    And I perform quick search for "{SavedValue:RAEGMSID}" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:RAEGMSID}" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM1" for title "Name" inside table "---riskassessment:-:riskAssOwnerTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:RAEGMSID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    Then I softly do not see value "{SavedValue:RAEGMSID}" for title "EGMS ID" inside table "---subAwardStandAlone:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:RAEGMSID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:RAEGMSID}" for title "EGMS ID" inside table "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:RAEGMSID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Active" and is "dark blue"
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Subaward Risk Assessment for {SavedValue:AwardEGMSID} hasbeen approved by approver
      """

    Then I see the mail text is as follows :

      """
      Hello,
      This email is to inform you that the Subaward Risk Assessment for {SavedValue:AwardEGMSID} has been approved.
      Log in to EGMS and click here for more details.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at mmailto:govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @198628 @ValidatePMprofileusercansendbacktheawardriskassessmentforstep2approvalswhenownershipistransferredforaRAwhichisinSubmittedforapprovalstatus @sprint-12-US-226646  @reassignment @FieldHistoryExclude @Bug-Ticket-532353
  Scenario: Validate PM profile user can send back the award risk assessment for step 2 approvals when ownership is transferred for a RA which is in Submitted for approval status
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name          | Risk Assessment |
      | Automation PM | Step 1          |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name           | Risk Assessment |
      | Automation EXE | Step 2          |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Risk Assessment" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:RAEGMSID}" in "---riskassessment:-:riskAssSourceTableId---" panel
    When I check "{SavedValue:RAEGMSID}" boxes in flex table with id "---riskassessment:-:riskAssSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---riskassessment:-:riskAssSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:RAEGMSID}" in "---riskassessment:-:riskAssTargetTableId---" panel
    Then I softly see value "{SavedValue:RAEGMSID}" for title "Risk Assessment ID" inside table "---riskassessment:-:riskAssTargetTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Subaward Risk Assessments - All"
    And I perform quick search for "{SavedValue:RAEGMSID}" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:RAEGMSID}" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Automation PM1" for title "New Value" inside field history table
    Then I softly see value "Automation PM" for title "Original Value" inside field history table
    And I click on back arrow
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM1" for title "Name" inside table "---riskassessment:-:riskAssOwnerTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:RAEGMSID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    Then I softly do not see value "{SavedValue:RAEGMSID}" for title "EGMS ID" inside table "---subAwardStandAlone:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:RAEGMSID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:RAEGMSID}" for title "EGMS ID" inside table "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:RAEGMSID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Approver Sent Back Subaward Risk Assessmentfor {SavedValue:AwardEGMSID}
      """

    Then I see the mail text is as follows :
      """
      Hello,
      This email is to inform you that the Subaward Risk Assessment for {SavedValue:AwardEGMSID} has been sent back by the Approver.
      Log in to EGMS and click here for more details.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @223678 @ValidateRiskAssessmentIfapeerreviewerisalreadyaddedforsimilarroleandreviewertriestoreassignsuchtasktootherreviewerwithsameresponsibilityFiscalreviewervalidatereassignmentfails @sprint-12-US-226646  @reassignment @Bug-Ticket-532353
  Scenario: Validate Risk Assessment If a peer reviewer is already added for similar role and reviewer tries to reassign such task to other reviewer with same responsibility (Fiscal reviewer)validate reassignment fails
    Given I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name           | Risk Assessment |
      | Automation FO1 | Step 1          |
    And I enter the following values into flex table with id "---riskassessment:-:raPeerReviewFlexTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I enter the following values into flex table with id "---riskassessment:-:raPeerReviewFlexTableId---" by clicking "New" :
      | Name           | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | Automation FO1 | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside flex table with id "---riskassessment:-:raPeerReviewFlexTableId---" without waiting for record
    And I click on "Send for Review" icon for "Automation FO1" inside flex table with id "---riskassessment:-:raPeerReviewFlexTableId---" without waiting for record
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:RAEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:RAEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:RAEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:RAEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I logout
    And I wait for "2" seconds
    And I checkout to yopmail with mailid "fo1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
     The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

     EGMS ID	Type	Status	Subject	Assigned By	Reason of Failure
     {SavedValue:RAEGMSID}	Review Subaward Risk Assessment	Not Started	Review Subaward Risk Assessment {SavedValue:RAEGMSID} for Organization SAN DIEGO ELECTRICAL TRAINING TRUST	Automation FO	Responsibilities Tab - A person with the same role cannot be added again.

     Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

     Thank you,
     The EGMS Team.
      """
    And I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "FO1" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---riskassessment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---riskassessment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO1" inside flex table with id "RiskAssessmentApproverRoles"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---riskassessment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---riskassessment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "RiskAssessmentApproverRoles"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Subaward Risk Assessments - All"
    And I perform quick search for "{SavedValue:RAEGMSID}" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:RAEGMSID}" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see status in Progress-bar is "Reviewed" and is "dark blue"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"

  @201483 @ValidateEmailNotificationissentADMINoldowner&newownerwithrespecttoownershiptransferofActiveRiskAssessment @sprint-12-US-226646  @reassignment @FieldHistoryExclude @Bug-Ticket-532353
  Scenario: Validate Email Notification is sent to ADMIN old owner & new owner with respect to ownership transfer of a Active Risk Assessment
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name           | Risk Assessment |
      | Automation EXE | Step 1          |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Risk Assessment" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:RAEGMSID}" in "---riskassessment:-:riskAssSourceTableId---" panel
    When I check "{SavedValue:RAEGMSID}" boxes in flex table with id "---riskassessment:-:riskAssSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---riskassessment:-:riskAssSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:RAEGMSID}" in "---riskassessment:-:riskAssTargetTableId---" panel
    Then I softly see value "{SavedValue:RAEGMSID}" for title "Risk Assessment ID" inside table "---riskassessment:-:riskAssTargetTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Subaward Risk Assessments - All"
    And I perform quick search for "{SavedValue:RAEGMSID}" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:RAEGMSID}" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Automation PM1" for title "New Value" inside field history table
    Then I softly see value "Automation PM" for title "Original Value" inside field history table
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "120" seconds
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
      {SavedValue:RAEGMSID} Automation ADMIN Risk Assessment

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
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
      {SavedValue:RAEGMSID} Automation ADMIN Risk Assessment

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

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:RAEGMSID} Automation ADMIN Risk Assessment

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @224658 @ValidateRiskAssfailureemailshouldgeneratedforRAownerifusertrytoreassignreviewtasktoalreadyassignreviewer @sprint-11-US-218319  @reassignment
  Scenario: Validate Risk Ass failure email should generated for RA owner if user try to reassign review task to already assign reviewer
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID"
    When I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---riskassessment:-:raPeerReviewFlexTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I enter the following values into flex table with id "---riskassessment:-:raPeerReviewFlexTableId---" by clicking "New" :
      | Name           | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | Automation FO1 | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside flex table with id "---riskassessment:-:raPeerReviewFlexTableId---" without waiting for record
#    And I click on "Send for Review" icon for "Automation FO1" inside flex table with id "---riskassessment:-:raPeerReviewFlexTableId---" without waiting for record
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:RAEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:RAEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:RAEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:RAEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:RAEGMSID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    Then I softly do not see value "{SavedValue:RAEGMSID}" for title "EGMS ID" inside table "---subAwardStandAlone:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---riskassessment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---riskassessment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation FO" for title "Name" against the value "Fiscal Reviewer" inside table "---riskassessment:-:raPeerReviewFlexTableId---"
    And I checkout to yopmail with mailid "fo1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
     Hello,

      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure
      {SavedValue:RAEGMSID} Review Subaward Risk Assessment Not Started Review Subaward Risk Assessment {SavedValue:RAEGMSID} for Organization SAN DIEGO ELECTRICAL TRAINING TRUST Automation FO Responsibilities Tab - A person with the same role cannot be added again.


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """

  @223375 @ValidateRiskAssessmentModuleusershouldabletoreassignthetasktonewuserofmorethan10records&1emailshouldbetriggeredforallrecords @sprint-10-US-205576  @reassignment @Bug-Ticket-532353
  Scenario: Validate Risk Assessment Module user should able to reassign the task to new user of more than 10 records & 1 email should be triggered for all records
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantsBulksRecords" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime Bulks Grants Records"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID1"
    #Risk Assessment 2
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantsBulksRecords" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime Bulks Grants Records"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID2"
    #Risk Assessment 3
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantsBulksRecords" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime Bulks Grants Records"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID3"
    #Risk Assessment 4
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantsBulksRecords" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime Bulks Grants Records"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID4"
    #Risk Assessment 5
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantsBulksRecords" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime Bulks Grants Records"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID5"
    #Risk Assessment 6
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantsBulksRecords" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime Bulks Grants Records"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID6"
    #Risk Assessment 7 Submitted for approval
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantsBulksRecords" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime Bulks Grants Records"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID7"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 1          |
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    #Risk Assessment 8 Submitted for approval
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantsBulksRecords" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime Bulks Grants Records"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID8"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 1          |
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    #Risk Assessment 9 Submitted for approval
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantsBulksRecords" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime Bulks Grants Records"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID9"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 1          |
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    #Risk Assessment 10 Submitted for approval
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantsBulksRecords" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime Bulks Grants Records"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID10"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 1          |
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    #Risk Assessment 11 Submitted for approval
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantsBulksRecords" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime Bulks Grants Records"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID11"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 1          |
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Risk Assessment" from reassign ownership dropdown
    When I perform quick search for "Automation Runtime Bulks Grants Records" in "---riskassessment:-:riskAssSourceTableId---" panel
    And I select value inside table "---riskassessment:-:riskAssSourceTableId---" is "All"
    When I check "All" boxes in flex table with id "---riskassessment:-:riskAssSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---riskassessment:-:riskAssSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:RAEGMSID1}" in "---riskassessment:-:riskAssTargetTableId---" panel
    Then I softly see value "{SavedValue:RAEGMSID1}" for title "Risk Assessment ID" inside table "---riskassessment:-:riskAssTargetTableId---"
    When I perform quick search for "{SavedValue:RAEGMSID2}" in "---riskassessment:-:riskAssTargetTableId---" panel
    Then I softly see value "{SavedValue:RAEGMSID2}" for title "Risk Assessment ID" inside table "---riskassessment:-:riskAssTargetTableId---"
    When I perform quick search for "{SavedValue:RAEGMSID3}" in "---riskassessment:-:riskAssTargetTableId---" panel
    Then I softly see value "{SavedValue:RAEGMSID3}" for title "Risk Assessment ID" inside table "---riskassessment:-:riskAssTargetTableId---"
    When I perform quick search for "{SavedValue:RAEGMSID4}" in "---riskassessment:-:riskAssTargetTableId---" panel
    Then I softly see value "{SavedValue:RAEGMSID4}" for title "Risk Assessment ID" inside table "---riskassessment:-:riskAssTargetTableId---"
    When I perform quick search for "{SavedValue:RAEGMSID5}" in "---riskassessment:-:riskAssTargetTableId---" panel
    Then I softly see value "{SavedValue:RAEGMSID5}" for title "Risk Assessment ID" inside table "---riskassessment:-:riskAssTargetTableId---"
    When I perform quick search for "{SavedValue:RAEGMSID6}" in "---riskassessment:-:riskAssTargetTableId---" panel
    Then I softly see value "{SavedValue:RAEGMSID6}" for title "Risk Assessment ID" inside table "---riskassessment:-:riskAssTargetTableId---"
    When I perform quick search for "{SavedValue:RAEGMSID7}" in "---riskassessment:-:riskAssTargetTableId---" panel
    Then I softly see value "{SavedValue:RAEGMSID7}" for title "Risk Assessment ID" inside table "---riskassessment:-:riskAssTargetTableId---"
    When I perform quick search for "{SavedValue:RAEGMSID8}" in "---riskassessment:-:riskAssTargetTableId---" panel
    Then I softly see value "{SavedValue:RAEGMSID8}" for title "Risk Assessment ID" inside table "---riskassessment:-:riskAssTargetTableId---"
    When I perform quick search for "{SavedValue:RAEGMSID9}" in "---riskassessment:-:riskAssTargetTableId---" panel
    Then I softly see value "{SavedValue:RAEGMSID9}" for title "Risk Assessment ID" inside table "---riskassessment:-:riskAssTargetTableId---"
    When I perform quick search for "{SavedValue:RAEGMSID10}" in "---riskassessment:-:riskAssTargetTableId---" panel
    Then I softly see value "{SavedValue:RAEGMSID10}" for title "Risk Assessment ID" inside table "---riskassessment:-:riskAssTargetTableId---"
    When I perform quick search for "{SavedValue:RAEGMSID11}" in "---riskassessment:-:riskAssTargetTableId---" panel
    Then I softly see value "{SavedValue:RAEGMSID11}" for title "Risk Assessment ID" inside table "---riskassessment:-:riskAssTargetTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Subaward Risk Assessments - All"
    And I perform quick search for "{SavedValue:RAEGMSID1}" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:RAEGMSID1}" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---riskassessment:-:raPeerReviewFlexTableId---"
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---"
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---orgRiskAssessment:-:awardRiskAssessmentTableId---"
    Then I softly can see top right button "New" in flex table with id "---riskassessment:-:riskAssNotesTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Subaward Risk Assessments - All"
    And I perform quick search for "{SavedValue:RAEGMSID2}" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:RAEGMSID2}" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---riskassessment:-:raPeerReviewFlexTableId---"
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---"
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---orgRiskAssessment:-:awardRiskAssessmentTableId---"
    Then I softly can see top right button "New" in flex table with id "---riskassessment:-:riskAssNotesTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Subaward Risk Assessments - All"
    And I perform quick search for "{SavedValue:RAEGMSID3}" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:RAEGMSID3}" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---riskassessment:-:raPeerReviewFlexTableId---"
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---"
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---orgRiskAssessment:-:awardRiskAssessmentTableId---"
    Then I softly can see top right button "New" in flex table with id "---riskassessment:-:riskAssNotesTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Subaward Risk Assessments - All"
    And I perform quick search for "{SavedValue:RAEGMSID4}" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:RAEGMSID4}" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---riskassessment:-:raPeerReviewFlexTableId---"
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---"
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---orgRiskAssessment:-:awardRiskAssessmentTableId---"
    Then I softly can see top right button "New" in flex table with id "---riskassessment:-:riskAssNotesTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Subaward Risk Assessments - All"
    And I perform quick search for "{SavedValue:RAEGMSID5}" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:RAEGMSID5}" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---riskassessment:-:raPeerReviewFlexTableId---"
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---"
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---orgRiskAssessment:-:awardRiskAssessmentTableId---"
    Then I softly can see top right button "New" in flex table with id "---riskassessment:-:riskAssNotesTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Subaward Risk Assessments - All"
    And I perform quick search for "{SavedValue:RAEGMSID6}" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:RAEGMSID6}" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---riskassessment:-:raPeerReviewFlexTableId---"
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---"
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---orgRiskAssessment:-:awardRiskAssessmentTableId---"
    Then I softly can see top right button "New" in flex table with id "---riskassessment:-:riskAssNotesTableId---"
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "120" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:RAEGMSID1} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID2} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID3} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID4} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID5} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID6} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID7} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID8} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID9} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID10} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID11} Automation ADMIN Risk Assessment

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
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
      {SavedValue:RAEGMSID1} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID2} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID3} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID4} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID5} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID6} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID7} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID8} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID9} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID10} Automation ADMIN Risk Assessment
      {SavedValue:RAEGMSID11} Automation ADMIN Risk Assessment

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
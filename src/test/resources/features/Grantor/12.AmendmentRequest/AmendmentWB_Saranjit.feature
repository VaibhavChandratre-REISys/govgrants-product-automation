@amendmentRequestsWB @amendmentRequest @t5 @grantor-regression @grantor-parallel-regression @regression
Feature: Amendment Request scenarios without background

  @done @196615 @Validateusershouldnotabletoreassignownershiptothenewuserforamendedaward @sprint-12-US-226646 @vaibhav @reassignment @buglogged-240523
  Scenario: Validate user should not able to reassign ownership to the new user for amended award
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                    | Field          |
      | Automation Justification | TncComments__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "TermsCondId"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:TermsCondId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---subAwardStandAlone:-:subawardOwnerTableId---"
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Amended" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Amended" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---subAwardStandAlone:-:subawardOwnerTableId---"

  @done @200102 @ValidateafterchangingtheownershipofARthenallsectio&pagelevelbuttonvisibletoamendmentnewowner&awardownerforBPCchangeatS/Rside @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate after changing the ownership of AR then all section & page level button visible to amendment new owner & award owner for BPC change at S/R side
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PM1 user" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientBPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "input-1"
    And I select value "Automation PM" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:budgetPChangeId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:budgetPChangeId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    Then I softly see value "Automation SPI3" for title "Name" inside table "---amendment:-:amendmentOwnerTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

  @ch1 @229051 @ValidatePMusershouldabletoseealleditaccesspage&sectionleveltonewowneraftertaskreassignmentforcombinationofSOW&BPCARbys/rsideattachment @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate PM user should able to see all edit access(page & section level) to new owner after task reassignment for combination of  SOW & BPC AR by s/r side attachment
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Scope&BudgetPeriod_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPC&ScopeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    #Bug415742
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started" for title "Status" against the value "{SavedValue:budgetPC&ScopeId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:budgetPC&ScopeId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send to Subrecipient" in page detail
    Then I softly cannot see top right button "Delete" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"

  @ch1 @229664 @ValidateCarryForwardPMusercanreassignownershiptonewownerinsubmittograntorstateofcarryforwardAR @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate Carry Forward PM user can reassign ownership to new owner  in submit to grantor state of carry forward AR
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I pause execution for "2" seconds
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "PurposeRTA__c"
    And I enter value "500" into field "RequestedChangeInBudget__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:CFAmendmentId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"

  @done @224654 @ValidateAmendmenttheeffectsontheR&Ronamendmen&award @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate Amendment the effects on the R&R on amendment & award
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime Direct Award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I pause execution for "3" seconds
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
#    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  | Progress Report | Reimbursement | Amendment Request |
      | {SavedValue:PO Username} | Step 1 | Step 1          | Step 1        | Step 1            |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see that "Subaward" is in "Activated" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Direct Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
      | 2000                        | RequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    Then I softly see value "Step 2" for title "Amendment Request" against the value "Automation EXE" inside table "---amendment:-:fundingChangeApproversTableId---"
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 4100  | RevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 3" for title "Amendment Request" against the value "Automation FO1" inside table "---amendment:-:fundingChangeApproversTableId---"
    Then I softly see value "Step 2" for title "Amendment Request" against the value "Automation EXE" inside table "---amendment:-:fundingChangeApproversTableId---"
    Then I softly see value "NA" for title "Amendment Request" against the value "Automation FO" inside table "---amendment:-:fundingChangeApproversTableId---"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
#    To Do:- Field history deployment not done in LWC hence commented this part
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation PM1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation PM" for title "Old Value" inside table "---amendment:-:historyTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 3" for title "Amendment Request" against the value "Automation FO1" inside table "---amendment:-:fundingChangeApproversTableId---"
    Then I softly see value "Step 2" for title "Amendment Request" against the value "Automation EXE" inside table "---amendment:-:fundingChangeApproversTableId---"
    Then I softly see value "Step 1" for title "Amendment Request" against the value "Automation PO" inside table "---amendment:-:fundingChangeApproversTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Direct Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---subAwardStandAlone:-:subawardOwnerTableId---"
    Then I softly see value "Step 1" for title "Progress Report" against the value "Automation PO" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    Then I softly see value "Step 1" for title "Reimbursement" against the value "Automation PO" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    Then I softly see value "Step 2" for title "Amendment Request" against the value "Automation EXE" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    Then I softly see value "Step 1" for title "Award" against the value "Automation PO" inside table "---subAwardStandAlone:-:awardApproversTableId---"

  @ch1 @224650 @Validateapprovertableshouldnotupdateonawardafteramendmentrequestreassignhisapprover @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate approver table should not update on award after amendment request reassign his approver
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
#    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I pause execution for "3" seconds
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                      | Award  | Reimbursement |
      | {SavedValue:EXE Username} | Step 1 | Step 1        |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Progress Report |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Sent to Subrecipient"
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientBPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FD Username} | Step 3            |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FD1"
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:budgetPChangeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:budgetPChangeId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:budgetPChangeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "FD1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "NA" for title "Amendment Request" against the value "Automation FD" inside table "---amendment:-:fundingChangeApproversTableId---"
    Then I softly see value "Step 3" for title "Amendment Request" against the value "Automation FD1" inside table "---amendment:-:fundingChangeApproversTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "NA" for title "Award" against the value "Automation FD" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    Then I softly see value "NA" for title "Amendment Request" against the value "Automation FD" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    Then I softly see value "NA" for title "Progress Report" against the value "Automation FD" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    Then I softly see value "NA" for title "Reimbursement" against the value "Automation FD" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    Then I softly see value "NA" for title "Desk Review" against the value "Automation FD" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    Then I softly see value "NA" for title "Site Visit" against the value "Automation FD" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    Then I softly see value "NA" for title "Closeout" against the value "Automation FD" inside table "---subAwardStandAlone:-:awardApproversTableId---"

  @done @200106 @ValidateEmailshouldbetriggeredwhenownershipischangeofBPCARatS/Rside @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate Email should be triggered when ownership is change of BPC  AR  at S/R side
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PM1 user" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientBPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "input-1"
    And I select value "Automation PM" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:budgetPChangeId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
#  And I logout
#    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#      Hello,
#
#     The record(s) below have been reassigned from [Automation PM1] to [Automation PM] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:budgetPChangeId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """
#    Given I am on "INTERNAL" portal
#    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#      Hello,
#
#     The record(s) below have been reassigned from [Automation PM1] to [Automation PM] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:budgetPChangeId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """
#    Given I am on "INTERNAL" portal
#    And I checkout to yopmail with mailid "govgrantsautomation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#     Hello,
#
#     The record(s) below have been reassigned from [Automation PM1] to [Automation PM] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:budgetPChangeId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """

  @done @200515 @ValidateafterchangingthetaskownershipofcombinationSOW/BPCchangebyS/Rsidethenemailshouldtriggeredto&newOwner @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate after changing the task ownership of combination SOW/BPC  change by S/R side then email should triggered to old & new Owner
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PM1 user" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BPCSOW_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetSOWChangeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:budgetSOWChangeId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:budgetSOWChangeId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:budgetSOWChangeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:budgetSOWChangeId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Overview" sub tab
    Then I can see top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    Then I can see top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    Then I softly can see row level action button "Edit" against "Automation Permanent KPI" in flex table with id "---amendment:-:keyOutcomesTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    Then I softly see value "Automation SPI3" for title "Name" inside table "---amendment:-:amendmentOwnerTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    And I logout
#    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#
#    Then I see the mail text is as follows :
#      """
#      Hello,
#
#     The record(s) below have been reassigned from [Automation PM1] to [Automation PM] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:budgetSOWChangeId} Automation PM1 Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """

  @done @200318 @ValidateBudgetRedirectionemailshouldbegeneratedfornewownerafterReviewamendmentrequesttaskownershipreassigntonewowner @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate Budget Redirection email should be generated for new owner after 'Review amendment request' task ownership reassign to new owner
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter value "Automation Justification" into field "Justification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BudgetRedirectId"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:BudgetRedirectId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:BudgetRedirectId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I logout
#    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#
#    Then I see the mail text is as follows :
#      """
#      Hello,
#
#     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:BudgetRedirectId} Automation PM Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """

  @done @200104 @ValidateEmailshouldbetriggeredwhenownershipischangeofBPCARatgrantorside @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate Email should be triggered when ownership is change of BPC AR at grantor side
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:budgetPChangeId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I logout
#    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#      Hello,
#
#     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:budgetPChangeId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """
#    Given I am on "INTERNAL" portal
#    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#      Hello,
#
#     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:budgetPChangeId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """
#    Given I am on "INTERNAL" portal
#    And I checkout to yopmail with mailid "govgrantsautomation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#     Hello,
#
#     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:budgetPChangeId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """

  @done @200302 @ValidateBudgetredirectionthatWhentheownershipofrecordischangedanemailisgeneratedtotheAdminuser @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate Budget redirection that When the ownership of a record is changed, an email is generated to the Admin user
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter value "Automation Justification" into field "Justification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BudgetRedirectId"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:BudgetRedirectId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I logout
#    And I checkout to yopmail with mailid "govgrantsautomation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#     Hello,
#
#     The record(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:BudgetRedirectId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """

  @done @202311 @ValidateBudgeRedirectionawardownershouldnotseeamendmentlevelbuttonsaccessafterownershipreassigntonewowner
  Scenario: Validate Budget Redirection_ Verify award owner should not see amendment level buttons access  after ownership reassign to new owner
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PM1 user" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter value "Automation Justification" into field "Justification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BudgetRedirectId"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "input-1"
    And I select value "Automation PM" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:BudgetRedirectId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BudgetRedirectId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right button "Submit For Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"

  @done @200304 @200305 @ValidateBudgetredirectionthatWhenownershipofrecordischangedemailisgeneratedtothepreviousowner @sprint-5-US-198235 @vaibhav @reassignment @Buglogged-258400
  Scenario: Validate Budget redirection that When the ownership of a record is changed, an email is generated to the previous owner
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter value "Automation Justification" into field "Justification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BudgetRedirectId"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "input-1"
    And I select value "Automation PO1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:BudgetRedirectId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
#    And I checkout to yopmail with mailid "automationpo@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#     Hello,
#
#     The record(s) below have been reassigned from [Automation PO] to [Automation PO1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:BudgetRedirectId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """
#      #200305
#    Given I am on "INTERNAL" portal
#    And I checkout to yopmail with mailid "automationpo1@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#     Hello,
#
#     The record(s) below have been reassigned from [Automation PO] to [Automation PO1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:BudgetRedirectId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """

  @done @200493 @200494 @ValidateKeyPersonalchangethatWhentheownershipofrecordischangedemailisgeneratedtothepreviousowner @sprint-5-US-198235 @vaibhav @reassignment
  Scenario: Validate Key Personal change that When the ownership of a record is changed an email is generated to the previous owner
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "kpcId"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Current Contact | Project Role |
      | Automation SPI3 | Other        |
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:kpcId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
#    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#     Hello,
#
#     The record(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:kpcId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """
#      #200494
#    Given I am on "INTERNAL" portal
#    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#     Hello,
#
#     The record(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:kpcId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """

  @done @200492 @ValidateKeypersoanlchangethatWhentheownershipofrecordischangedanemailisgeneratedtotheAdminuser @sprint-5-US-198235 @vaibhav @reassignment
  Scenario: Validate Key personal change that When the ownership of a record is changed, an email is generated to the Admin user
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "kpcId"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Current Contact | Project Role |
      | Automation SPI3 | Other        |
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:kpcId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
#    And I checkout to yopmail with mailid "govgrantsautomation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#     Hello,
#
#     The record(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:kpcId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """

  @ch1 @200181 @ValidateCarryforwardemailshouldbegeneratednewownerafterReviewamendmentrequesttaskownershipreassigntonewowner @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Carry forward email should be generated for new owner after 'Review amendment request' task ownership reassign to new owner
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
#    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
#    And I pause execution for "3" seconds
#    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
#    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
#    And I pause execution for "3" seconds
#    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PO | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "PurposeRTA__c"
    And I enter value "500" into field "RequestedChangeInBudget__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:CFAmendmentId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:CFAmendmentId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
#    And I checkout to yopmail with mailid "automationpo1@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#
#    Then I see the mail text is as follows :
#      """
#      Hello,
#
#     The record(s) below have been reassigned from [Automation PO] to [Automation PO1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:CFAmendmentId} Automation PO Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """

  @done @200443 @ValidateKeypersonalchangeemailshouldbegeneratedfornewownerafterReviewamendmentrequesttaskownershipreassigntonewowner @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Key personal change email should be generated for new owner after 'Review amendment request' task ownership reassign to new owner
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "kpcId"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Current Contact | Project Role |
      | Automation SPI3 | Other        |
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:kpcId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:kpcId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:kpcId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:kpcId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
#    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#
#    Then I see the mail text is as follows :
#      """
#      Hello,
#
#     The record(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:kpcId} Automation EXE Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """

  @ch1 @200516 @ValidateafterchangingthetaskownershipofSOW/BPCchangebygrantorsidethenemailshouldtriggeredtoold&newOwner @sprint-5-US-198153 @vaibhav @reassignment
  Scenario: Validate after changing the task ownership of SOW/BPC change by grantor side then email should triggered to old & new Owner
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Scope&BudgetPeriod_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPC&ScopeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started" for title "Status" against the value "{SavedValue:budgetPC&ScopeId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:budgetPC&ScopeId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
#    And I logout
#    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
#    And I pause execution for "100" seconds
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#
#    Then I see the mail text is as follows :
#      """
#      Hello,
#
#     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:budgetPC&ScopeId} Automation PM Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """
#    Given I am on "INTERNAL" portal
#    And I login to "As a Grantor" app as "PM1" user
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit For Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"

  @done @200103 @ValidateEmailshouldbetriggeredwhenownershipischangofSOWARatgrantorside @sprint-5-US-198419 @vaibhav @reassignment
  Scenario: Validate Email should be triggered when ownership is change of SOW AR  at grantor side
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:scopeWorkId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
#    And I checkout to yopmail with mailid "govgrantsautomation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#     Hello,
#
#     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:scopeWorkId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """
#    Given I am on "INTERNAL" portal
#    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#     Hello,
#
#     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:scopeWorkId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """
#    Given I am on "INTERNAL" portal
#    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#     Hello,
#
#     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:scopeWorkId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """

  @done @200105 @ValidateEmailshouldbetriggeredwhenownershipischangeofSOWARatS/Rside @sprint-5-US-198419 @vaibhav @reassignment
  Scenario: Validate Email should be triggered when ownership is change of SOW AR at S/R side
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_SOW_creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    And I get the "EGMS ID"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:scopeWorkId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
#    And I checkout to yopmail with mailid "govgrantsautomation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#     Hello,
#
#     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:scopeWorkId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """
#    Given I am on "INTERNAL" portal
#    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#     Hello,
#
#     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:scopeWorkId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """
#    Given I am on "INTERNAL" portal
#    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#     Hello,
#
#     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:scopeWorkId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """

  @done @229672 @ValidateemailshouldbetriggeredofAmendmentRequestRejected&forTaskreassignmenttonewuser @sprint-13-US-231194 @vaibhav @reassignment
  Scenario: Validate email should be triggered of Amendment Request Rejected & for Task reassignment to new user
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Scope&BudgetPeriod_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPC&ScopeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:budgetPC&ScopeId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:budgetPC&ScopeId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
#    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
#    And I pause execution for "20" seconds
#    And I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Amendment Request #{SavedValue:budgetPC&ScopeId} has beenRejected
#      """
#
#    Then I see the mail text is as follows :
#
#      """
#      Hello,
#      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Amendment Award} has been Rejected.
#      Amendment Request Summary:
#      Amendment Request Number #: {SavedValue:budgetPC&ScopeId}
#      Amendment Request Type: Budget Period Change; Scope of Work Change
#      Comments: Automation Testing
#      Log in to EGMS and click here to access the record.
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com, if you have any questions or need assistance with this task.
#      Thank you.
#      The EGMS Team
#      """

  @done @229674 @ValidateemailshouldbetriggeredofAmendmentRequestsendback&forTaskreassignmenttonewuser @sprint-13-US-231194 @vaibhav @reassignment
  Scenario: Validate email should be triggered of Amendment Request send back & for Task reassignment to new user
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Scope&BudgetPeriod_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPC&ScopeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:budgetPC&ScopeId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:budgetPC&ScopeId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
#    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
#    And I pause execution for "10" seconds
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Amendment Request #{SavedValue:budgetPC&ScopeId} has been SentBack by an Approver
#      """
#    Then I see the mail text is as follows :
#
#      """
#     Hello,
#     This email is to inform you that the amendment request #{SavedValue:budgetPC&ScopeId} which has been created for the award #{SavedValue:AwardEGMSID} has been sent back by the approver.
#     Amendment Details:
#     Amendment Type: Budget Period Change; Scope of Work Change
#     Amendment ID: {SavedValue:budgetPC&ScopeId}
#     Status: Created
#     Grant: {SavedValue:GrantEGMSID}
#     Log in to EGMS and click here to access the record.
#     Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
#     Thank you.
#     The EGMS Team
#      """

  @done @229677 @ValidateemailshouldbetriggeredofAmendmentRequestApproved&forTaskreassignmenttonewuser @sprint-13-US-231194 @vaibhav @reassignment
  Scenario: Validate email should be triggered of Amendment Request Approved & for Task reassignment to new user
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Scope&BudgetPeriod_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPC&ScopeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:budgetPC&ScopeId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:budgetPC&ScopeId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
#    And I checkout to yopmail with mailid "automationpo@yopmail.com"
#    And I pause execution for "5" seconds
#    And I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Sandbox: Notification: Amendment Request #{SavedValue:budgetPC&ScopeId} has beenApproved
#      """
#
#    Then I see the mail text is as follows :
#
#      """
#      Hello,
#      This email is to inform you that the amendment request #{SavedValue:budgetPC&ScopeId} for the award #   has been approved and a new award can be created.
#      Amendment Details:
#      Amendment Type:  Budget Period Change; Scope of Work Change
#      Amendment ID: {SavedValue:budgetPC&ScopeId}
#      Status: Approved
#      Grant: {SavedValue:GrantEGMSID}
#
#      Log in to EGMS and click here to access the record
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
#      Thank you.
#      The EGMS Team
#      """

  @done @232515 @ValidateemailshouldbetriggeredofAmendmentRequestRejected&forChangeownershiptonewusergrantorSide @sprint-13-US-231194 @vaibhav @reassignment
  Scenario: Validate email should be triggered of Amendment Request Rejected & for Change ownership to new user
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Scope&BudgetPeriod_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPC&ScopeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:budgetPC&ScopeId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
#    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
#    And I pause execution for "20" seconds
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#      Hello,
#
#     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:budgetPC&ScopeId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """
#    Given I am on "INTERNAL" portal
#    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
#    And I pause execution for "20" seconds
#    And I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Amendment Request #{SavedValue:budgetPC&ScopeId} has beenRejected
#      """
#
#    Then I see the mail text is as follows :
#
#      """
#      Hello,
#      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Amendment Award} has been Rejected.
#      Amendment Request Summary:
#      Amendment Request Number #: {SavedValue:budgetPC&ScopeId}
#      Amendment Request Type: Budget Period Change; Scope of Work Change
#      Comments: Automation Testing
#      Log in to EGMS, and click here to access the record.
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com, if you have any questions or need assistance with this task.
#      Thank you.
#      The EGMS Team
#      """

  @done @232517 @ValidateemailshouldbetriggeredofAmendmentRequestsendback&forchangeownershiptonewuserFromgrantorside @sprint-13-US-231194 @vaibhav @reassignment
  Scenario: Validate email should be triggered of Amendment Request send back & for change ownership to new user From grantor side
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Scope&BudgetPeriod_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPC&ScopeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:budgetPC&ScopeId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    And I reset the table
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
#    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
#    And I pause execution for "20" seconds
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#      Hello,
#
#     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:budgetPC&ScopeId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """
#    Given I am on "INTERNAL" portal
#    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
#    And I pause execution for "10" seconds
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Amendment Request #{SavedValue:budgetPC&ScopeId} has been SentBack by an Approver
#      """
#    Then I see the mail text is as follows :
#
#      """
#     Hello,
#     This email is to inform you that the amendment request #{SavedValue:budgetPC&ScopeId} which has been created for the award #{SavedValue:AwardEGMSID} has been sent back by the approver.
#     Amendment Details:
#     Amendment Type: Budget Period Change; Scope of Work Change
#     Amendment ID: {SavedValue:budgetPC&ScopeId}
#     Status: Created
#     Grant: {SavedValue:GrantEGMSID}
#     Log in to EGMS and click here to access the record.
#     Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
#     Thank you.
#     The EGMS Team
#      """

  @done @232519 @ValidateemailshouldbetriggeredofAmendmentRequestApproved&forchangeownershiptonewuserfromgrantorside @sprint-13-US-231194 @vaibhav @reassignment
  Scenario: Validate email should be triggered of Amendment Request Approved & for change ownership to new user from grantor side
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Scope&BudgetPeriod_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPC&ScopeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:budgetPC&ScopeId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    And I reset the table
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
#    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
#    And I pause execution for "20" seconds
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#      Hello,
#
#     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:budgetPC&ScopeId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """
#    Given I am on "INTERNAL" portal
#    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
#    And I pause execution for "20" seconds
#    And I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Sandbox: Notification: Amendment Request #{SavedValue:budgetPC&ScopeId} has beenApproved
#      """
#
#    Then I see the mail text is as follows :
#
#      """
#      Hello,
#      This email is to inform you that the amendment request #{SavedValue:budgetPC&ScopeId} for the award #   has been approved and a new award can be created.
#      Amendment Details:
#      Amendment Type:  Budget Period Change; Scope of Work Change
#      Amendment ID: {SavedValue:budgetPC&ScopeId}
#      Status: Approved
#      Grant: {SavedValue:GrantEGMSID}
#
#      Log in to EGMS and click here to access the record
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
#      Thank you.
#      The EGMS Team
#      """

  @done @232520 @ValidateemailshouldbetriggeredofAmendmentRequestRejected&forChangeownershiptonewusers/rSide @sprint-13-US-231194 @vaibhav @reassignment
  Scenario: Validate email should be triggered of Amendment Request Rejected & for Change ownership to new user s/r Side
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BPCSOW_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetSOWChangeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I pause execution for "4" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 1            |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:budgetSOWChangeId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    And I reset the table
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
#    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
#    And I pause execution for "20" seconds
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#      Hello,
#
#     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:budgetSOWChangeId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """
#    Given I am on "INTERNAL" portal
#    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
#    And I pause execution for "20" seconds
#    And I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Amendment Request #{SavedValue:budgetSOWChangeId} has beenRejected
#      """
#
#    Then I see the mail text is as follows :
#
#      """
#      Hello,
#      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Award} has been Rejected.
#      Amendment Request Summary:
#      Amendment Request Number #: {SavedValue:budgetSOWChangeId}
#      Amendment Request Type: Budget Period Change; Scope of Work Change
#      Comments: Automation Testing
#      Log in to EGMS, and click here to access the record.
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com, if you have any questions or need assistance with this task.
#      Thank you.
#      The EGMS Team
#      """

  @done @232521 @ValidateemailshouldbetriggeredofAmendmentRequestsendback&forChangeownershiptonewusers/rSide @sprint-13-US-231194 @vaibhav @reassignment
  Scenario: Validate email should be triggered of Amendment Request send back & for Change ownership to new user s/r Side
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BPCSOW_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetSOWChangeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I pause execution for "4" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 1            |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:budgetSOWChangeId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    And I reset the table
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
#    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
#    And I pause execution for "20" seconds
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#      Hello,
#
#     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:budgetSOWChangeId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """
#    Given I am on "INTERNAL" portal
#    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
#    And I pause execution for "10" seconds
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Amendment Request #{SavedValue:budgetSOWChangeId} has been SentBack by an Approver
#      """
#    Then I see the mail text is as follows :
#
#      """
#     Hello,
#     This email is to inform you that the amendment request #{SavedValue:budgetSOWChangeId} which has been created for the award #{SavedValue:AwardEGMSID} has been sent back by the approver.
#     Amendment Details:
#     Amendment Type: Budget Period Change; Scope of Work Change
#     Amendment ID: {SavedValue:budgetSOWChangeId}
#     Status: Created
#     Grant: {SavedValue:GrantEGMSID}
#     Log in to EGMS and click here to access the record.
#     Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
#     Thank you.
#     The EGMS Team
#      """

  @done @232374 @ValidateemailshouldbetriggeredofAmendmentRequestsendback&forTaskreassignmenttonewuserFromS/rSide @sprint-13-US-231194 @vaibhav @reassignment
  Scenario: Validate email should be triggered of Amendment Request send back & for Task reassignment to new user From S/r Side
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BPCSOW_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetSOWChangeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I pause execution for "4" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation EXE | Step 1            |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started" for title "Status" against the value "{SavedValue:budgetSOWChangeId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:budgetSOWChangeId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:budgetSOWChangeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
#    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
#    And I pause execution for "20" seconds
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#     Task Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#      Hello,
#
#      The task(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:
#
#      EGMS ID Type Status Subject Assigned By Due Date
#      {SavedValue:budgetSOWChangeId} Approve Amendment Request Not Started Approve Amendment Request for Subaward #{SavedValue:Automation Runtime Award} for SAN DIEGO ELECTRICAL TRAINING TRUST Automation EXE {Date:yyyy/MM/dd 00:00:00::d+10}
#
#
#      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
#      Login in to EGMS and click on EGMS IDs to access the assigned record.
#
#
#      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.
#
#      EGMS ID Type Status Subject Assigned By Reason of Failure
#
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
#
#      Thank you,
#
#      The EGMS Team.
#      """
#    Given I am on "INTERNAL" portal
#    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
#    And I pause execution for "10" seconds
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Amendment Request #{SavedValue:budgetSOWChangeId} has been SentBack by an Approver
#      """
#    Then I see the mail text is as follows :
#
#      """
#     Hello,
#     This email is to inform you that the amendment request #{SavedValue:budgetSOWChangeId} which has been created for the award #{SavedValue:AwardEGMSID} has been sent back by the approver.
#     Amendment Details:
#     Amendment Type: Budget Period Change; Scope of Work Change
#     Amendment ID: {SavedValue:budgetSOWChangeId}
#     Status: Created
#     Grant: {SavedValue:GrantEGMSID}
#     Log in to EGMS and click here to access the record.
#     Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
#     Thank you.
#     The EGMS Team
#      """

  @done @232389 @ValidateemailshouldbetriggeredofAmendmentRequestApproved&forTaskreassignmenttonewuserfroms/rside @sprint-13-US-231194 @vaibhav @reassignment
  Scenario: Validate email should be triggered of Amendment Request Approved & for Task reassignment to new user(from s/r side)
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BPCSOW_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetSOWChangeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I pause execution for "4" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation EXE | Step 1            |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started" for title "Status" against the value "{SavedValue:budgetSOWChangeId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:budgetSOWChangeId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:budgetSOWChangeId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
#    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
#    And I pause execution for "20" seconds
#    And I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Amendment Request #{SavedValue:budgetSOWChangeId} has beenApproved
#      """
#
#    Then I see the mail text is as follows :
#
#      """
#      Hello,
#      This email is to inform you that the amendment request #{SavedValue:budgetSOWChangeId} for the award #{SavedValue:AwardEGMSID}   has been approved and a new award can be created.
#      Amendment Details:
#      Amendment Type:  Budget Period Change; Scope of Work Change
#      Amendment ID: {SavedValue:budgetSOWChangeId}
#      Status: Approved
#      Grant: {SavedValue:GrantEGMSID}
#
#      Log in to EGMS and click here to access the record
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
#      Thank you.
#      The EGMS Team
#      """

  @done @232522 @ValidateemailshouldbetriggeredofAmendmentRequestapproved&forChangeownershiptonewusers/rSide @sprint-13-US-231194 @vaibhav @reassignment @buglogged-265020
  Scenario: Validate email should be triggered of Amendment Request approved & for Change ownership to new user(s/r Side)
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BPCSOW_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetSOWChangeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I pause execution for "4" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PO1 | Step 1            |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:budgetSOWChangeId}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    And I reset the table
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
#    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
#    And I pause execution for "20" seconds
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#      Hello,
#
#     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:budgetSOWChangeId} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """
#    Given I am on "INTERNAL" portal
#    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
#    And I pause execution for "20" seconds
#    And I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Amendment Request #{SavedValue:budgetSOWChangeId} has beenApproved
#      """
#
#    Then I see the mail text is as follows :
#
#      """
#      Hello,
#      This email is to inform you that the amendment request #{SavedValue:budgetSOWChangeId} for the award #{SavedValue:AwardEGMSID}   has been approved and a new award can be created.
#      Amendment Details:
#      Amendment Type:  Budget Period Change; Scope of Work Change
#      Amendment ID: {SavedValue:budgetSOWChangeId}
#      Status: Approved
#      Grant: {SavedValue:GrantEGMSID}
#
#      Log in to EGMS and click here to access the record
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
#      Thank you.
#      The EGMS Team
#      """

  @ch1 @223385 @ValidateAmendmentRequestModuleusershouldabletoreassignthetasktonewuserofmorethan10records&1emailshouldbetriggeredforallrecords @sprint-11-US-217998 @vaibhav @reassignment
  Scenario: Validate Amendment Request Module user should able to reassign the task to new user of more than 10 records & 1 email should be triggered for all records
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL1"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL2"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL3"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL4"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL5"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
#    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
#    And I pause execution for "3" seconds
#    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
#    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
#    And I pause execution for "3" seconds
#    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL6"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I pause execution for "3" seconds
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL7"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I pause execution for "3" seconds
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL8"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I pause execution for "3" seconds
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL9"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I pause execution for "3" seconds
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL9}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL9}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---amendment:-:RecipientKeyPersonalTableId---" without waiting for record
    And I enter value "Principal Investigator" into field "ProjectRole__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL10"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I pause execution for "3" seconds
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL10}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL10}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---amendment:-:RecipientKeyPersonalTableId---" without waiting for record
    And I enter value "Principal Investigator" into field "ProjectRole__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL11"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I pause execution for "3" seconds
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL11}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL11}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---amendment:-:RecipientKeyPersonalTableId---" without waiting for record
    And I enter value "Principal Investigator" into field "ProjectRole__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I activated standalone subaward "Automation Runtime Bulk Award for Amendment" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award for Amendment}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award for Amendment}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentFundingAccountTableId---" by clicking "Edit" :
      | Funding Account                    | Revised Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL12"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I pause execution for "3" seconds
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL12}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL12}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---amendment:-:RecipientKeyPersonalTableId---" without waiting for record
    And I enter value "Principal Investigator" into field "ProjectRole__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Amendment Request" from reassign ownership dropdown
    When I perform quick search for "Automation Runtime Bulk Award for Amendment" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "All" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    And I reset the table
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:PERIODICRENEWAL1}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL1}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL2}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL2}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL3}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL3}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL4}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL4}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL5}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL5}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL6}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL6}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL7}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL7}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL8}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL8}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL9}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL9}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL10}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL10}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL11}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL11}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL12}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL12}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL1}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL1}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL1}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send to Subrecipient" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:approversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
#    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Notification: Owner Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#      Hello,
#
#     The record(s) below have been reassigned from [Automation PM1] to [Automation PM] successfully. Please find the details below:
#
#      EGMS ID Assigned By Module Name
#      {SavedValue:PERIODICRENEWAL1} Automation ADMIN Amendment Request
#      {SavedValue:PERIODICRENEWAL2} Automation ADMIN Amendment Request
#      {SavedValue:PERIODICRENEWAL3} Automation ADMIN Amendment Request
#      {SavedValue:PERIODICRENEWAL4} Automation ADMIN Amendment Request
#      {SavedValue:PERIODICRENEWAL5} Automation ADMIN Amendment Request
#      {SavedValue:PERIODICRENEWAL6} Automation ADMIN Amendment Request
#      {SavedValue:PERIODICRENEWAL7} Automation ADMIN Amendment Request
#      {SavedValue:PERIODICRENEWAL8} Automation ADMIN Amendment Request
#      {SavedValue:PERIODICRENEWAL9} Automation ADMIN Amendment Request
#      {SavedValue:PERIODICRENEWAL10} Automation ADMIN Amendment Request
#      {SavedValue:PERIODICRENEWAL11} Automation ADMIN Amendment Request
#      {SavedValue:PERIODICRENEWAL12} Automation ADMIN Amendment Request
#
#      Because these records have been reassigned, the original reviewer may have only view access to the record.
#
#      Log in to EGMS and click on EGMS IDs to access the assigned record.
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.
#
#      Thank you,
#      The EGMS Team
#      """
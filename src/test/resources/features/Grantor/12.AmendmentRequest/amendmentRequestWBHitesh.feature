@amendmentRequestsWBhitesh @amendmentRequests @grantor-regression @grantor-parallel-regression @regression @AmendmentWBRunForLWC
Feature: Amendment Request scenarios without background

  @200059 @ValidatePMusershouldabletoseetheARisupdatedafterchangetheownershipbyGrantorSideatcreatedstateforScopeofWorkChangeARtype @sprint-5-US-198419 @vaibhav @reassignment
  Scenario: Validate PM user should able to see the AR is updated after change the ownership by Grantor Side at created state for Scope of Work Change AR type
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    Then I see status in Progress-bar is "Created" and is "dark blue"
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send to Subrecipient" in page detail
    Then I softly can see top right button "Delete" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send to Subrecipient" in page detail
    Then I softly cannot see top right button "Delete" in page detail

  @200067 @ValidateEXEusershouldabletoseetheARisupdatedafterchangetheownershipbyGrantorSideatSubmittedtoGrantorstateforcombinationofSOW/BPCARtype @sprint-5-US-198419 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate EXE user should able to see the AR is updated after change the ownership by Grantor Side at Submitted to Grantor state for combination of SOW/BPC AR type
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
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
    And I wait for "4" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
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
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Submit for Approval" in page detail
      #    To Do:- Field history deployment not done in LWC hence commented this part
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation EXE1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation EXE" for title "Old Value" inside table "---amendment:-:historyTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly cannot see top right button "Submit for Approval" in page detail
#    To Do:- Field history deployment not done in LWC hence commented this part
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation EXE1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation EXE" for title "Old Value" inside table "---amendment:-:historyTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:budgetPC&ScopeId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly cannot see top right button "Submit for Approval" in page detail

  @200068 @ValidateFOusershouldabletoseetheARisupdatedafterchangetheownershipbyGrantorSideatSubmittedforapprovalstateforSOWARtype @sprint-5-US-198419 @vaibhav @reassignment
  Scenario: Validate FO user should able to see the AR is updated after change the ownership by Grantor Side at Submitted for  approval state for SOW AR type
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation FO" into field "input-1"
    And I select value "Automation FO1" into field "input-2"
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
    When I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#   To Do:- Field history deployment not done in LWC hence commented this part
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation FO1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation FO" for title "Old Value" inside table "---amendment:-:historyTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    To Do:- Field history deployment not done in LWC hence commented this part
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation FO1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation FO" for title "Old Value" inside table "---amendment:-:historyTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I softly cannot see top right button "Amend Subaward" in page detail
    When I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly can see top right button "Amend Subaward" in page detail

  @200069 @ValidatePMusershouldabletoseetheARisupdatedafterchangetheownershipbyGrantorSideatrejectedstateforSOWAR @sprint-5-US-198419 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate PM user should able to see the AR is updated after change the ownership by Grantor Side at rejected state for SOW AR
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---amendment:-:amendmentOwnerTableId---"
    #   To Do:- Field history deployment not done in LWC hence commented this part
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation PM1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation PM" for title "Old Value" inside table "---amendment:-:historyTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    #   To Do:- Field history deployment not done in LWC hence commented this part
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation PM1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation PM" for title "Old Value" inside table "---amendment:-:historyTableId---"

  @200486 @ValidatePMusershouldabletoseealleditaccesspage&sectionleveltonewowneraftertaskreassignmentforcombinationofBPC&SOWARbygrantorsideattachment @sprint-5-US-198153 @vaibhav @reassignment @taskreassign
  Scenario: Validate PM user should able to see all edit access(page & section level) to new owner after task reassignment for combination of BPC & SOW AR by grantor side attachment
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:scopeWorkId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

  @200070 @ValidatePOusershouldabletoseetheARisupdatedafterchangetheownershipbyGrantorSideatapprovedstateforSOWAR @sprint-5-US-198419 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate PO user should able to see the AR is updated after change the ownership by Grantor Side at approved state for SOW AR
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "input-1"
    And I select value "Automation PO1" into field "input-2"
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
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
     #   To Do:- Field history deployment not done in LWC hence commented this part
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation PO1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation PO" for title "Old Value" inside table "---amendment:-:historyTableId---"
    Then I softly can see top right button "Amend Subaward" in page detail
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
     #   To Do:- Field history deployment not done in LWC hence commented this part
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation PO1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation PO" for title "Old Value" inside table "---amendment:-:historyTableId---"
    Then I softly cannot see top right button "Amend Subaward" in page detail

  @200071 @ValidateusershouldabletoseetheARisupdatedafterchangetheownershipbyS/RSideatcreatedstateforcombinationofBPC&SOWARtype @sprint-5-US-198419 @vaibhav @reassignment
  Scenario: Validate user should able to see the AR is updated after change the ownership by S/R Side at created state for combination of BPC&SOW AR type
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
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted to Grantor"
#    To Do:- Field history deployment not done in LWC hence commented this part
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation PM1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation PM" for title "Old Value" inside table "---amendment:-:historyTableId---"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:budgetSOWChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:budgetSOWChangeId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:budgetSOWChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted to Grantor"
#    To Do:- Field history deployment not done in LWC hence commented this part
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation PM1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation PM" for title "Old Value" inside table "---amendment:-:historyTableId---"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail

  @200072 @ValidateusershouldabletoseetheARisupdatedafterchangetheownershipbyS/RSideatSubmittedtoGrantorstateforSOWARtype@sprint-5-US-198419 @vaibhav @reassignment
  Scenario: Validate user should able to see the AR is updated after change the ownership by S/R Side at Submitted to Grantor state for SOW AR type
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
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
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
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
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
#    To Do:- Field history deployment not done in LWC hence commented this part
  #    And I navigate to "History" sub tab
#    Then I softly see value "Automation EXE1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation EXE" for title "Old Value" inside table "---amendment:-:historyTableId---"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation SPI3" for title "Name" inside table "---amendment:-:amendmentOwnerTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
#    To Do:- Field history deployment not done in LWC hence commented this part
  #    And I navigate to "History" sub tab
#    Then I softly see value "Automation EXE1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation EXE" for title "Old Value" inside table "---amendment:-:historyTableId---"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail

  @200073 @ValidateusershouldabletoseetheARisupdatedafterchangetheownershipbyS/RSideatrejectedstateforSOWAR @sprint-5-US-198419 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate user should able to see the AR is updated after change the ownership by S/R Side at rejected state for SOW AR
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    #    To Do:- Field history deployment not done in LWC hence commented this part
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation PM1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation PM" for title "Old Value" inside table "---amendment:-:historyTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation SPI3" for title "Name" inside table "---amendment:-:amendmentOwnerTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    #    To Do:- Field history deployment not done in LWC hence commented this part
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation PM1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation PM" for title "Old Value" inside table "---amendment:-:historyTableId---"

  @200074 @ValidateusershouldabletoseetheARisupdatedafterchangetheownershipbyS/RatSubmittedforapprovalstateforSOWARtype @sprint-5-US-198419 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate user should able to see the AR is updated after change the ownership by S/R at Submitted for approval state for SOW AR type
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I click on "Submit for Approval" in the page details
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    #    To Do:- Field history deployment not done in LWC hence commented this part
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation PM1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation PM" for title "Old Value" inside table "---amendment:-:historyTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation SPI3" for title "Name" inside table "---amendment:-:amendmentOwnerTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    #    To Do:- Field history deployment not done in LWC hence commented this part
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation PM1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation PM" for title "Old Value" inside table "---amendment:-:historyTableId---"

  @200079 @ValidateusershouldabletoseetheaccesstonewownerafterchangingtheownershipBudgetperiodchangefromgrantorside @sprint-5-US-198419 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate user should able to see the access to new owner after changing the ownership Budget period change from grantor side
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
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
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
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
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:budgetPChangeId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send to Subrecipient" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:budgetPChangeId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send to Subrecipient" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
#    To Do:- Field history deployment not done in LWC hence commented this part
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation EXE1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation EXE" for title "Old Value" inside table "---amendment:-:historyTableId---"

  @200080 @ValidateusershouldabletoseetheaccesstonewownerafterchangingtheownershipSOWfromgrantorside @sprint-5-US-198419 @vaibhav @reassignment
  Scenario: Validate user should able to see the access to new owner after changing the ownership SOW from grantor side
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    Then I see status in Progress-bar is "Created" and is "dark blue"
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send to Subrecipient" in page detail
    Then I softly can see top right button "Delete" in page detail
    When I navigate to "Overview" sub tab
    Then I can see top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    Then I can see top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    Then I softly can see row level action button "Edit" against "Automation Permanent KPI" in flex table with id "---amendment:-:keyOutcomesTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    Then I softly see value "Automation PM" for title "Name" inside table "---amendment:-:amendmentOwnerTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send to Subrecipient" in page detail
    Then I softly cannot see top right button "Delete" in page detail
    When I navigate to "Overview" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    Then I cannot see top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent KPI" in flex table with id "---amendment:-:keyOutcomesTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

  @200081 @ValidateusershouldabletoseetheaccesstonewownerafterchangingtheownershipBudgetperiodchangefromS/Rside @sprint-5-US-198419 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate user should able to see the access to new owner after changing the ownership Budget period change from S/R side
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
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
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
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
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:budgetPChangeId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
#    To Do:- Field history deployment not done in LWC hence commented this part
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation EXE1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation EXE" for title "Old Value" inside table "---amendment:-:historyTableId---"

  @200082 @ValidateusershouldabletoseetheaccesstonewownerafterchangingtheownershipscopeofworkchangefromS/Rside @sprint-5-US-198419 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate user should able to see the access to new owner after changing the ownership scope of work change from S/R side
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
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
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
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
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
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
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    When I navigate to "Overview" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    Then I cannot see top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent KPI" in flex table with id "---amendment:-:keyOutcomesTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
#    To Do:- Field history deployment not done in LWC hence commented this part
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation EXE1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation EXE" for title "Old Value" inside table "---amendment:-:historyTableId---"

  @200090 @ValidateHistoryshouldbeupdatedafterchangingtheownershipofAmendment @sprint-5-US-198419 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate History should be updated after changing the ownership of Amendment
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    Then I see status in Progress-bar is "Created" and is "dark blue"
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation PM1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation PM" for title "Old Value" inside table "---amendment:-:historyTableId---"

  @200488 @ValidatePMusershouldabletoseealleditaccesspage&sectionleveltonewowneraftertaskreassignmentforcombinationofBPC&SOWARbygrantorsideattachment @sprint-5-US-201628 @vaibhav @reassignment @ownvai
  Scenario: Validate PM user should able to see all edit access page & section level to new owner after task reassignment for combination of BPC & SOW AR by grantor side attachment
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-source"
    And I select value "Automation PM1" into field "input-target"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---program:-:adminTaskReassignmentTableId---" panel
    When I check "{SavedValue:scopeWorkId}" boxes in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---program:-:adminTaskReassignmentTableId---" panel
    Then I softly do not see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---program:-:adminTaskReassignmentTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Overview" sub tab
    Then I can see top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    Then I can see top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    Then I softly can see row level action button "Edit" against "Automation Permanent KPI" in flex table with id "---amendment:-:keyOutcomesTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

  @200831 @200841 @ValidateFundingchangependingtaskshouldbegeneratedfornewPMownerinmytaskandinpendingtask @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Funding change pending task should be generated for new PM owner in my task and in pending task
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 2            |
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
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundingID}" inside table "---program:-:grantorTaskReassignTableId---"
      #200841
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundingID}" inside table "---amendment:-:pendingTaskTableId---"

  @200845 @ValidateFundingchangeasEXEuseIcanreassignReviewAmendmentRequestownershiptasktootherEXEuser @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Funding change as EXE user I can reassign 'Review Amendment Request' ownership task to other EXE user
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 2            |
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundingID}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundingID}" inside table "---amendment:-:pendingTaskTableId---"

  @200847 @ValidateFundingchangeasFOuserIcanreassignReviewAmendmentRequestownershiptasktootherFOuser @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Funding change as FO user I can reassign 'Review Amendment Request' ownership task to other FO user
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 2            |
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
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundingID}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundingID}" inside table "---amendment:-:pendingTaskTableId---"

  @200853 @ValidateFundingchangefollowingbuttonsshouldbedisplayfornewPOowner @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Funding change following buttons should be display for new PO owner
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "Automation PO user" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 2            |
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundingID}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundingID}" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

  @200854 @ValidateFundingchangefieldhistoryshouldbeupdatedfornewownerofamendmentrequest @sprint-5-US-194231 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate Funding change field history should be updated for new owner of amendment request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 2            |
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundingID}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundingID}" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation PM" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation PM1" for title "Old Value" inside table "---amendment:-:historyTableId---"

  @200870 @ValidateFundingchangeasFDuseIcanreassignReviewAmendmentRequestownershiptasktootherFDuser @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Funding change as FD user I can reassign Review Amendment Request ownership task to other FD user
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "Automation PO user" of type "Competitive"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 2            |
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
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FD1"
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundingID}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "FD1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundingID}" inside table "---amendment:-:pendingTaskTableId---"

  @200873 @ValidateFundingchangePMusercanreassignownershiptaskofcombinationoffundingchangeandT&CARtootherownerincreatedstateofAR @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Funding change PM user can reassign ownership task of combination of funding change and T & C AR to other owner in created state of AR
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Funding_Terms_creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
      | 2000                        | RequestedChangeInBudget__c    |
    When I enter values into fields
      | Value                    | Field               |
      | Automation Justification | TncComments__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundTermsID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundTermsID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundTermsID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:FundTermsID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:FundTermsID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundTermsID}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:FundTermsID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:FundTermsID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:FundTermsID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundTermsID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundTermsID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundTermsID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundTermsID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundTermsID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundTermsID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

   @200874 @ValidatePeriodicrenewalPMusercanreassignownershiptasktootheruser @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Periodic renewal PM user can reassign ownership task to other user
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role             |
      | {SavedValue:SPI3 Username} | Principal Investigator   |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:PERIODICRENEWAL}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

  @200857 @ValidateFundingVerifyAmendmentRequestRejectedemailshouldbegenerateforEXEnewownerofamendmentrequest @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Funding change Amendment Request Rejected email should be generate for EXE new owner of amendment request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | {SavedValue:PM Username} | Step 1            |
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundingID}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:FundingID} has beenRejected
      """

    Then I see the mail text is as follows :

      """
      Hello,
      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Amendment Award} has been Rejected.
      Amendment Request Summary:
      Amendment Request Number #: {SavedValue:FundingID}
      Amendment Request Type: Funding Change
      Comments: Automation Testing
      Log in to EGMS and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com, if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200860 @200867 @ValidateFundingchangeallsectionlevelandpagelevelbuttonwillbevisibletoamendmentowneronlyandnotawardowner @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Funding change all section level and page level button will be visible to amendment owner only and not award owner
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | {SavedValue:PM Username} | Step 1            |
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundingID}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    #200860,200867
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    #200867
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

   @200879 @ValidatePeriodicrenewalSenttoS/rpendingtaskshouldgeneratedforPMuserinmytask @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Periodic renewal Sent to S/r pending task should generated for PM user in my task
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role             |
      | {SavedValue:SPI3 Username} | Principal Investigator   |
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:PERIODICRENEWAL}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:pendingTaskTableId---"

  @200643 @ValidateuserchangetheawardowneraftercreatingARthenallaccessgotothenewownerforAR @sprint-5-US-201628 @vaibhav @reassignment @taskreassign
  Scenario: Validate user change the award owner after creating AR then all access go to the new owner for AR
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
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    Then I softly see field "Status" as "Acknowledged"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Delete" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

   @200882 @ValidatePeriodicrenewalasPOuserIcanreassignReviewAmendmentRequestownershiptasktootherPOuser @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Periodic renewal as PO user I can reassign 'Review Amendment Request' ownership task to other PO user
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role             |
      | {SavedValue:SPI3 Username} | Principal Investigator   |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:PERIODICRENEWAL}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:pendingTaskTableId---"

   @200883 @ValidatePeriodicrenewalasPMnewownerofARIhavefollowingbuttonaccess @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Periodic renewal as PM new owner of AR I have following button access
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PM1 user" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role             |
      | {SavedValue:SPI3 Username} | Principal Investigator   |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:PERIODICRENEWAL}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

  @200889 @ValidatePeriodicrenewalFDasawardownerIcanseefollowingbuttonsafterReviewAmendmentRequesttaskownershipreassigntonewowner @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Periodic renewal FD as award owner I can see following buttons after 'Review Amendment Request' task ownership reassign to new owner
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role             |
      | {SavedValue:SPI3 Username} | Principal Investigator   |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FD1"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:PERIODICRENEWAL}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "FD1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:projectAreasTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

   @200891 @validatePeriodicrenewalifawardandamendmentownerissametheawardownerscanabletoseeallbuttonsaccessofAR @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Periodic renewal if award and amendment owner is same the award owners can able to see all buttons access of AR
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role             |
      | {SavedValue:SPI3 Username} | Principal Investigator   |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:projectAreasTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

   @200892 @ValidatePeriodicrenewalfiledhistoryshouldbeupdatedfornewownerofAR @sprint-5-US-194231 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate Periodic renewal filed history should be updated for new owner of AR
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role             |
      | {SavedValue:SPI3 Username} | Principal Investigator   |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:PERIODICRENEWAL}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation PM1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation PM" for title "Old Value" inside table "---amendment:-:historyTableId---"

   @200893 @ValidatePeriodicrenewalAmendmentRequestRejectedemailshouldbegenerateforPMnewownerofamendmentrequestaftertheReviewAmendmentRequestownershiptaskreassigntohim @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Periodic renewal 'Amendment Request Rejected' email should be generate for PM new owner of amendment request after the Review Amendment Request ownership task reassign to him
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role             |
      | {SavedValue:SPI3 Username} | Principal Investigator   |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:PERIODICRENEWAL}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:PERIODICRENEWAL} has beenRejected
      """

    Then I see the mail text is as follows :

      """
      Hello,
      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Amendment Award} has been Rejected.
      Amendment Request Summary:
      Amendment Request Number #: {SavedValue:PERIODICRENEWAL}
      Amendment Request Type: Periodic Renewal
      Comments: Automation Testing
      Log in to EGMS, and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com, if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

   @200898 @ValidatePeriodicrenewalonlyamendmentownershouldseefollowingbuttonsaccess @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Periodic renewal only amendment owner should see following buttons access
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role             |
      | {SavedValue:SPI3 Username} | Principal Investigator   |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:PERIODICRENEWAL}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:projectAreasTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:projectAreasTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

   @200899 @ValidatePeriodicrenewalawardhistorytableshouldbeupdateperiodicrenewalARownershipreassigntonewowner @sprint-5-US-194231 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate Periodic renewal award history table should be update periodic renewal  AR ownership reassign to new owner
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PM1 user" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role             |
      | {SavedValue:SPI3 Username} | Principal Investigator   |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:PERIODICRENEWAL}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation PM" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation PM1" for title "Old Value" inside table "---amendment:-:historyTableId---"

   @200900 @ValidatePeriodicrenewaloldARoldownershouldnothaveanybuttonaccessafterownershipreassigntonewowner @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Periodic renewal old AR old owner should not have any button access  after ownership reassign to new owner
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role             |
      | {SavedValue:SPI3 Username} | Principal Investigator   |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:PERIODICRENEWAL}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:projectAreasTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:projectAreasTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

   @200961 @ValidatePeriodicrenewalronlyawardownercanseeactivatebuttonandactivatenewawardevenifARownerinitiateamendsubaward @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Periodic renewal only award owner can see activate button and activate new award even if AR owner initiate amend sub award
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role             |
      | {SavedValue:SPI3 Username} | Principal Investigator   |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:PERIODICRENEWAL}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    Then I softly cannot see top right button "Activate" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail

   @200963 @ValidateT&CPMusercanreassignAcknowledgementAmendmentRequestownershiptasktootheruser @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate T & C PM user can reassign 'Acknowledgement Amendment Request' ownership task to other user
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
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
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Acknowledged Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:TermsCondId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:TermsCondId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Acknowledged Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"

  @200965 @ValidateT&CEXEusercanreassignAcknowledgementAmendmentRequestownershiptasktootheruser @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate T & C EXE user can reassign 'Acknowledgement Amendment Request' ownership task to other user
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
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
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Acknowledged Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:TermsCondId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:TermsCondId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Acknowledged Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"

  @200967 @ValidateT&CAcknowledgementAmendmentRequestpendingtaskshouldbegenerateforFOinmytask @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate T & C 'Acknowledgement Amendment Request' pending task should be generate for FO in my task
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
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
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Acknowledged Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Acknowledged Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:TermsCondId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:TermsCondId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Acknowledged Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"

  @200968 @200972 @ValidateT&CAcknowledgementAmendmentRequestpendingtaskshouldbegenerateforPOinmytask @sprint-5-US-194231 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate T & C 'Acknowledgement Amendment Request' pending task should be generate for PO in my task
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
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
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Acknowledged Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Acknowledged Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:TermsCondId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:TermsCondId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Acknowledged Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    #200972
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation PO1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation PO" for title "Old Value" inside table "---amendment:-:historyTableId---"

   @201021 @ValidateT&Callsectionlevelandpagelevelbuttonwillbevisibletoamendmentowner @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate T & C all section level and page level button will be visible to amendment owner and  award owner
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
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
      | Name           | Amendment Request |
      | Automation PM1 | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Acknowledged Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:TermsCondId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:TermsCondId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Amend Subaward" in the page details
    Then I softly cannot see top right button "Activate" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
#    And I click on parallel menu button in flex table title "Subawards"
#    And I select "Reset Table" from parallel lines dropdown of "Subawards"
    When I click on button "resetIcon" in flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "View" icon for "Pending Activation" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"

   @201036 @ValidateT&Casawardownerheshouldnotabletoseeanybuttonsaccessonamendmentrecord @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate T & C as award owner he should not able to see any buttons access on amendment record
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
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
      | Name           | Amendment Request |
      | Automation PO1 | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Acknowledged Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:TermsCondId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:TermsCondId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Amend Subaward" in the page details
    Then I softly cannot see top right button "Activate" in page detail
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
#    And I click on parallel menu button in flex table title "Subawards"
#    And I select "Reset Table" from parallel lines dropdown of "Subawards"
    When I click on button "resetIcon" in flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "View" icon for "Pending Activation" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
#    And I click on parallel menu button in flex table title "Subawards"
#    And I select "Reset Table" from parallel lines dropdown of "Subawards"
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
    And I save the field labeled "EGMS ID" as "TermsCondId1"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:TermsCondId1}" inside flex table with id "---amendment:-:amendmentRequestTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send to Subrecipient" in page detail
    Then I softly cannot see top right button "Delete" in page detail
    When I navigate to "Overview" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:TermsCondId1}" inside flex table with id "---amendment:-:amendmentRequestTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send to Subrecipient" in page detail
    Then I softly can see top right button "Delete" in page detail
    When I navigate to "Overview" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

   @200887 @ValidatePeriodicrenewalasEXEnewownerofARIhavefollowingbuttonaccess @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Periodic renewal as EXE new owner of AR I have following button access
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "Automation EXE user" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role             |
      | {SavedValue:SPI3 Username} | Principal Investigator   |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:PERIODICRENEWAL}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:projectAreasTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

   @200895 @ValidatePeriodicrenewalAmendmentRequestSentBackemailshouldbegenerateforEXEnewownerofamendmentrequestaftertheReviewAmendmentRequestownershiptaskreassigntohim @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate Periodic renewal 'Amendment Request Sent Back' email should be generate for EXE new owner of amendment request after the 'Review Amendment Request' ownership task reassign to him
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "Automation EXE user" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role             |
      | {SavedValue:SPI3 Username} | Principal Investigator   |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:PERIODICRENEWAL}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:PERIODICRENEWAL} has been SentBack by an Approver
      """

    Then I see the mail text is as follows :

      """
      Hello,

      This email is to inform you that the amendment request #{SavedValue:PERIODICRENEWAL} which has been created for the award # has been sent back by the approver.

      Amendment Details:
      Amendment Type: Periodic Renewal
      Amendment ID: {SavedValue:PERIODICRENEWAL}
      Status: Created
      Grant: {SavedValue:GrantEGMSID}
      Log in to EGMS and click here to access the record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @200971 @ValidateT&CfollowingbuttonsshouldbedisplayfornewPMowner @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate T & C following buttons should be display for new PM owner
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
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
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Acknowledged Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Acknowledged Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:TermsCondId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:TermsCondId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Acknowledged Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

  @201022 @ValidateT&ColdARoldownershouldnothaveanybuttonaccessafterownershiptaskreassigntonewowner @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate T & C old AR old owner should not have any button access  after ownership task reassign to new owner
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                    | Field               |
      | Automation Justification | TncComments__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "TermsCondId"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Acknowledged Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Acknowledged Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:TermsCondId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:TermsCondId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

   @200134 @200151 @ValidateCarryForwardReviewAmendmentRequestpendingtaskshouldgenerateforPMuserinmytaskandinpendingtasksection @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Carry Forward 'Review Amendment Request' pending task should generate for PM user in my task and in pending task section
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
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
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    #200151
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:CFAmendmentId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:CFAmendmentId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"

  @201025 @ValidateT&CPMusercanreassignownerofcombinationoffundingchangeandT&CARtootherownerincreatedstateofAR @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate T & C PM user can reassign owner of combination of funding change and T & C AR to other owner in created state of AR
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Funding_Terms_creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                          |
      | Automation Test Description | FundingChangeJustification__c  |
      | 2000                        | RequestedChangeInBudget__c     |
    When I enter values into fields
      | Value                    | Field               |
      | Automation Justification | TncComments__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundTermsID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundTermsID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundTermsID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:FundTermsID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:FundTermsID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundTermsID}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:FundTermsID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:FundTermsID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:FundTermsID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundTermsID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundTermsID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:projectAreasTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundTermsID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundTermsID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:projectAreasTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundTermsID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundTermsID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:FundTermsID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:projectAreasTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

  @200976 @ValidateT&CAmendmentRequestRejectemailshouldbegenerateforPOnewownerofamendmentrequest @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate T & C 'Amendment Request Reject' email should be generate for PO new owner of amendment request
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                    | Field               |
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Acknowledged Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:TermsCondId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:TermsCondId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "automationpo1@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:TermsCondId} has beenRejected
      """

    Then I see the mail text is as follows :

      """
      Hello,
      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Award} has been Rejected.
      Amendment Request Summary:
      Amendment Request Number #: {SavedValue:TermsCondId}
      Amendment Request Type: Terms and Conditions Change
      Comments: Automation Testing
      Log in to EGMS and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com, if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200978 @ValidateT&CAmendmentRequestsentbackemailshouldbegenerateforEXEnewownerofamendmentrequest @sprint-5-US-194231 @vaibhav @reassignment
  Scenario: Validate T & C 'Amendment Request sent back' email should be generate for EXE new owner of amendment request
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Acknowledged Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:TermsCondId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:TermsCondId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:TermsCondId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:TermsCondId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:TermsCondId} has been SentBack by an Approver
      """

    Then I see the mail text is as follows :

      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:TermsCondId} which has been created for the award #{SavedValue:AwardEGMSID} has been sent back by the approver.
      Amendment Details:
      Amendment Type:
      Amendment ID: {SavedValue:TermsCondId}
      Status: Created
      Grant: {SavedValue:GrantEGMSID}
      Log in to EGMS and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

   @200136 @200158 @ValidateCarryForwardReviewAmendmentRequestpendingtaskshouldgenerateforEXEuserinmytaskandinpendingtasksection @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Carry Forward 'Review Amendment Request' pending task should generate for EXE user in my task  and in pending task section
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
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
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    #200158
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:CFAmendmentId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:CFAmendmentId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"

  @200137 @200160 @ValidateCarryForwardReviewAmendmentRequestpendingtaskshouldgenerateforPOuserinmytaskandinpendingtasksection @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Carry Forward 'Review Amendment Request' pending task should generate for PO user in my task  and in pending task section
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
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
    #200160
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:CFAmendmentId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:CFAmendmentId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"

  @200163 @ValidateCarryForwardasAdminusercanreassignReviewAmendmentRequestownershiptaskfromsourcePMusertotargetPMuser @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Carry Forward as Admin user can reassign 'Review Amendment Request' ownership task from source PM user to target PM user
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-source"
    And I select value "Automation PM1" into field "input-target"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:adminTaskReassignmentTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:CFAmendmentId}" inside table "---program:-:adminTaskReassignmentTableId---"
    When I check "{SavedValue:CFAmendmentId}" boxes in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:adminTaskReassignmentTableId---" panel
    Then I softly do not see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:adminTaskReassignmentTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"

   @200207 @ValidateCarryForwardasPMnewownerofARIhavefollowingbuttonaccess @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Carry Forward as PM new owner of AR I have following button access
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PM1 user" of type "Competitive"
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

   @200212 @ValidateCarryForwardasEXEnewownerofARIhavefollowingbuttonaccess @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Carry Forward as EXE new owner of AR I have following button access
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
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
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

  @200219 @ValidateCarryForwardPOasawardownercannotseeanybuttonsafterReviewAmendmentRequesttaskownershipreassigntonewownerifamendmentcreatedbyEXEuser @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Carry Forward PO as award owner can not see any buttons after 'Review Amendment Request' task ownership reassign to new owner if amendment created by EXE user
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
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
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:projectAreasTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

   @200230 @ValidateCarryforwardPMasoldownerofARdoesnothaveanybuttonaccessifownershiptaskreassigntonewowner @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Carry forward PM as old owner of AR does not have any button access if ownership task reassign to new owner
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:projectAreasTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

  @200256 @ValidateCarryForwardawardownercanseeamendmentlevelbuttonsaccessifamendmentcreatedonawardowneroramendmentowner&awardownerissame @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Carry Forward award owner can see amendment level buttons access if amendment created on award owner or (amendment owner & award owner is same)
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PM1 user" of type "Competitive"
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

  @200261 @ValidateCarryForwardfiledhistoryshouldbeupdatedfornewownerofAR @sprint-5-US-197424 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate Carry Forward filed history should be updated for new owner of AR
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation PM1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation PM" for title "Old Value" inside table "---amendment:-:historyTableId---"

  @200277 @ValidateCarryForwardeAmendmentRequestSentBackemailshouldbegenerateforEXEnewownerofamendmentrequestaftertheReviewAmendmentRequestownershiptaskreassigntohim @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Carry Forward 'Amendment Request Sent Back' email should be generate for EXE new owner of amendment request after the 'Review Amendment Request' ownership task reassign to him
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
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
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area  | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
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
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1500                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "5" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:CFAmendmentId} has been SentBack by an Approver
      """

    Then I see the mail text is as follows :

      """
      Hello,

      This email is to inform you that the amendment request #{SavedValue:CFAmendmentId} which has been created for the award #{SavedValue:AwardEGMSID} has been sent back by the approver.

      Amendment Details:
      Amendment Type: Carry Forward
      Amendment ID: {SavedValue:CFAmendmentId}
      Status: Created
      Grant: {SavedValue:GrantEGMSID}

      Log in to EGMS and click here to access the record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @200314 @ValidateBudgetRedirectionReviewAmendmentRequestpendingtaskshouldgenerateforPMuserinmytaskandinpendingtasksection @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Budget Redirection 'Review Amendment Request' pending task should generate for PM user in my task  and in pending task section
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
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

  @200315 @ValidateBudgetRedirectionReviewAmendmentRequestpendingtaskshouldgenerateforEXEuserinmytaskandinpendingtasksection @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Budget Redirection Review Amendment Request pending task should generate for EXE user in my task and in pending task section
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"

  @200316 @ValidateBudgetRedirectionasPMuserIcanreassignReviewAmendmentRequestownershiptasktootherPMuser @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Budget Redirection as PM user I can reassign 'Review Amendment Request' ownership task to other PM user
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:BudgetRedirectId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"

   @200317 @ValidateBudgetRedirectionasPOuserIcanreassignReviewAmendmentRequestownershiptasktootherPOuser @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Budget Redirection as PO user I can reassign 'Review Amendment Request' ownership task to other PO user
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:BudgetRedirectId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"

  @200321 @ValidateBudgetRedirectionasPMnewownerofARIhavefollowingbuttonaccess @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Budget Redirection as PM new owner of AR I have following button access
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:BudgetRedirectId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:BudgetRedirectId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"

  @200339 @ValidateBudgetRedirectionasPOnewownerofARIhavefollowingbuttonaccess @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Budget Redirection as PO new owner of AR I have following button access
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:BudgetRedirectId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:BudgetRedirectId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"

   @200413 @ValidateBudgetRedirectionifS\RusercreateamendmentandsubmittograntorthenARinternalownershouldbeawardownerevenifpreviousamendmentownershiptaskreassigntootheruserotheruser @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Budget Redirection if S\R user create amendment and submit to grantor then AR internal owner should be award owner even if previous amendment ownership task reassign to other user other user
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:BudgetRedirectId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:BudgetRedirectId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BudgetRedirectId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BudgetRedirectId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I click on "Activate" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    And I save the field labeled "EGMS ID" as "BudgetRedirectId1"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId1}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId1}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:BudgetRedirectId1}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BudgetRedirectId1}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BudgetRedirectId1}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"

  @200414 @ValidateBudgetRedirectionfiledhistoryshouldbeupdatedfornewownerofAR @sprint-5-US-197424 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate Budget Redirection filed history should be updated for new owner of AR
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
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
    When I check "{SavedValue:BudgetRedirectId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:BudgetRedirectId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation PM1" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation PM" for title "Old Value" inside table "---amendment:-:historyTableId---"

  @200415 @ValidateBudgetRedirectionAmendmentRequestRejectedemailshouldbegenerateforPMnewownerofamendmentrequestaftertheReviewAmendmentRequestownershiptaskreassigntohim @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Budget Redirection 'Amendment Request Rejected' email should be generate for PM new owner of amendment request after the 'Review Amendment Request' ownership task reassign to him
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
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
    When I check "{SavedValue:BudgetRedirectId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:BudgetRedirectId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BudgetRedirectId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:BudgetRedirectId} has beenRejected
      """

    Then I see the mail text is as follows :

      """
      Hello,

      This email is to notify you that Amendment Request for the Award {SavedValue:Automation Runtime Award} has been Rejected.

      Amendment Request Summary:
      Amendment Request Number #: {SavedValue:BudgetRedirectId}
      Amendment Request Type: Budget Redirection
      Comments: Automation Testing

      Log in to EGMS and click here to access the record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com, if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @200416 @ValidateBudgetRedirectionAmendmentRequestSentBackemailshouldbegenerateforEXEnewownerofamendmentrequestaftertheReviewAmendmentRequestownershiptaskreassigntohim @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Budget Redirection 'Amendment Request Sent Back' email should be generate for EXE new owner of amendment request after the 'Review Amendment Request' ownership task reassign to him'
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:BudgetRedirectId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:BudgetRedirectId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BudgetRedirectId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:BudgetRedirectId} has been SentBack by an Approver
      """

    Then I see the mail text is as follows :

      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:BudgetRedirectId} which has been created for the award # has been sent back by the approver.
      Amendment Details:
      Amendment Type:
      Amendment ID: {SavedValue:BudgetRedirectId}
      Status: Created
      Grant: {SavedValue:GrantEGMSID}
      GrantName: {SavedValue:GrantEGMSID}
      Log in to EGMS and click here to access the record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200418 @ValidateBudgetRedirectionawardownershouldnotchangeifitsrelatedamendmentownershiptaskreassigntootheruser @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Budget Redirection award owner should not change if it's related amendment ownership task reassign to other user
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BudgetRedirectId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:BudgetRedirectId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:BudgetRedirectId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:BudgetRedirectId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation EXE" for title "Name" inside table "---subAwardStandAlone:-:subawardOwnerTableId---"

  @200426 @200436 @200450 @ValidateKeypersonachangeReviewAmendmentRequestpendingtaskshouldgenerateforPMuserinmytaskandinpendingtasksection @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Key personal change 'Review Amendment Request' pending task should generate for PM user in my task  and in pending task section
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation PM1 user" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
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
      | Name                       | Project Role  |
      | {SavedValue:SPI3 Username} | other         |
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:kpcId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    #200436
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:kpcId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:kpcId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:kpcId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    #200450
    And I click on "Start" icon for "{SavedValue:kpcId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"

  @200432 @200438 @ValidateKeypersonalchangeReviewAmendmentRequestpendingtaskshouldgenerateforEXEuserinmytaskandinpendingtasksection @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Key personal change 'Review Amendment Request' pending task should generate for EXE user in my task  and in pending task section
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
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
      | Name                       | Project Role |
      | {SavedValue:SPI3 Username} | other        |
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
    #200438
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:kpcId}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:kpcId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:kpcId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"

  @200453 @ValidateKeypersonalchangeasPOnewownerofARIhavefollowingbuttonaccess @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Key personal change as PO new owner of AR I have following button access
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
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
      | Name                       | Project Role     |
      | {SavedValue:SPI3 Username} | other            |
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
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
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:kpcId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"

  @200454 @ValidateKeypersonalchangeEXEasawardownerIcanseefollowingbuttonsafterReviewAmendmentRequesttaskownershipreassigntonewowner @sprint-5-US-197424 @vaibhav @reassignment
  Scenario: Validate Key personal change EXE as award owner I can see following buttons after 'Review Amendment Request' task ownership reassign to new owner
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
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
      | Name                       | Project Role             |
      | {SavedValue:SPI3 Username} | Principal Investigator   |
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
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:kpcId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---amendment:-:amendmentAddNotesTableId---"

  @200455 @ValidateKeypersonalchangefiledhistoryshouldbeupdatedfornewownerofAR @sprint-5-US-197424 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate Key personal change filed history should be updated for new owner of AR
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation PM1 user" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
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
      | Name                       | Project Role             |
      | {SavedValue:SPI3 Username} | Principal Investigator   |
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:kpcId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:kpcId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:kpcId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I navigate to "History" sub tab
#    Then I softly see value "Automation PM" for title "New Value" inside table "---amendment:-:historyTableId---"
#    Then I softly see value "Automation PM1" for title "Old Value" inside table "---amendment:-:historyTableId---"
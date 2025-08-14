 @product @grantor-regression @RemainingSanitySuite @wip
Feature: Validate sanity testing of Complete Business Flow

  @72357 @deskReviewAcceptAndCloseOrgLevel @ProdSan2
  Scenario: Validate once the Org level Desk Review is clicked on Accept and Close butted then status changes to closed
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:PM Username} | NA          |
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:PM Username} | Step 1      |
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "EGMS ID" inside table "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Start" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---" without waiting for record
    And I click on "Accept And Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "dark blue"

  @CarryForwardAmendmentRequest @ProdSan2 @run2 @data
  Scenario: Validate Carry Forward Amendment Request End to End flow
    And I activated standalone subaward "Automation Runtime award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Then I softly see that "Subaward" is in "Activated" status
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 4000  | RevisedCommitment__c       |
      | 2000  | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | NA                |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I wait for "2" seconds
    And I refresh the page
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
    And I pause execution for "5" seconds
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
    And I enter value "700" into field "RequestedChangeInBudget__c"
    And I wait for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 200           |
    And I wait for "2" seconds
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    When I click on button "resetIcon" in flex table with id "---progressReport:-:budgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1200                 | 120        | 0              |
    And I wait for "2" seconds
    And I click on page navigation arrow "---progressReport:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I wait for "2" seconds
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2700                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | NA                |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    And I wait for "3" seconds
    When I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see that "Subaward" is in "Activated" status

  @AwardWithFocusNo @ProdSan4 @data
  Scenario: Award with focus area no
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_ByApp_Focus_No" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I navigate to "Budget" sub tab
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
    And I wait for "2" seconds
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 1 |
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
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
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
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
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
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

  @userRegistrationSanity @ProdSan4 @data
  Scenario: Scenario for user registration
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Organization}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID}"
    And I click on mail with subject "Sandbox: Welcome to GovGrants 3.0 Recipient Portal"
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Organization}" in the page details
    #Create Secondary User
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I enter "Secondary_User" values from "SubrecipientOrganization_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "fieldEmail"
    When I click on "Save" in the page details
    And I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime} User" inside flex table with id "---home:-:userContactsTableId---" without waiting for record
    And I click "Send" button in modal
    Then I softly see the following messages in the page details :
      | Email Sent Successfully. |
    When I click modal button "Ok"
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID1}"
    And I navigate to maildrop portal for "{SavedValue:uniqueEmailID}" with subject "Sandbox: Notification: You have been Invited to Register in the"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Confirmation Message |
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID1}"
    And I click on mail with subject "Sandbox: Welcome to GovGrants 3.0 Recipient Portal"
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime} User" in the page details

  @IndividualRegistration @ProdSan4 @data
  Scenario: Scenario for Individual registration
    Given I begin "Individual" registration as "Register As Individual"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    And I pause execution for "9" seconds
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random maildropEmail and save as "uniqueEmailID"
    When I enter value as "{SavedValue:uniqueEmailID}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I enter "Individual_PrimaryDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:uniqueEmailID}" in "{grantor_tableId:SubrecipientIndRegistration}" panel
    When I click on "Start" icon for "{SavedValue:uniqueEmailID}" inside flex table with id "{grantor_tableId:SubrecipientIndRegistration}"
    And I "Approve" in the approval decision
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID}"
    And I click on mail with subject "Sandbox: Welcome to GovGrants 3.0 Recipient Portal"
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Individual Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Individual Subrecipient" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime} User" in the page details

  @SMEreviewerFlowSanity @ProdSan4 @data
  Scenario: Scenario for SME reviewer
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:reviewersTableId---"
    And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:Automation Runtime} Contact" in "---home:-:reviewersTableId---" panel
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime} Contact" inside flex table with id "---home:-:reviewersTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I click "Send" button in modal
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Email Sent Successfully. |
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID}"
    And I navigate to maildrop portal for "{SavedValue:uniqueEmailID}" with subject "Sandbox: Notification: You have been Invited to Register in the"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I enter "Edition" values from "PotentialReviewersContact_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Confirmation Message |
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID}"
    And I click on mail with subject "Sandbox: Welcome to GovGrants 3.0 Recipient Portal"
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    And I select "My Profile" from user dropdown
    Then I see the header is "{SavedValue:Automation Runtime} Contact" in the page details


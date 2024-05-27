@grantsAwardAllocationSaranjit @grantor-regression @grantor-parallel-regression @grantAndAward @regression
Feature: Validate all scenarios of grants and award for Allocation Saranjit

  @269836 @269840 @ValidateAdminUserWillseeProposedEstimatedFundingfieldismandatoryfield @sprint-21-US-265547 @vaibhav @Allocation
  Scenario: Validate Admin User Will see Proposed Estimated Funding field is mandatory field
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation ADMIN user" of type "Formula_By_Applicant_Focus_Area"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    Then I softly can see top right button "Revise Estimated Funding" in page detail
    When I click on "Revise Estimated Funding" in the page details
    Then I see field "Estimated Funding" as "$0.00" on modal
    Then I see field "Cumulative Obligation" as "$1,000.00" on modal
    Then I softly see "Proposed Estimated Funding" inside page block detail
    When I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Proposed Estimated Funding is required to save under Overview |
    #269840
    And I enter in modal value "500" into field "ProposedEstimatedFunding__c"
    When I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | The Estimated Funding must be equal to or greater than the Cumulative Obligation 1000.00 |

  @269839 @269843 @ValidateEXEusercannotenternegativevalueinProposedEstimatedFundingfield @sprint-21-US-265547 @vaibhav @Allocation
  Scenario: Validate EXE user can not enter negative value in Proposed Estimated Funding field
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Formula_By_Applicant_Focus_Area"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    Then I softly can see top right button "Revise Estimated Funding" in page detail
    When I click on "Revise Estimated Funding" in the page details
    And I enter in modal value "-2000" into field "ProposedEstimatedFunding__c"
    When I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | The Estimated Funding must be equal to or greater than the Cumulative Obligation 1000.00 |
    #269843
    And I enter in modal value "2000" into field "ProposedEstimatedFunding__c"
    When I click modal button "Save and Continue"
    And I navigate to "Budget" sub tab
    Then I softly see field "Estimated Funding" as "$2,000.00"

  @269842 @270487 @ValidatePOuserwillseeCumulativeObligationasreadOnlyFieldandValuesandvalueswillpopulatefromActivegrant @sprint-21-US-265547 @vaibhav @Allocation
  Scenario: Validate PO user will see Cumulative Obligation as read Only Field and Values and values will populate from Active grant
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Formula_By_Applicant_Focus_Area"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    Then I softly can see top right button "Revise Estimated Funding" in page detail
    When I click on "Revise Estimated Funding" in the page details
    Then I see field "Cumulative Obligation" as "$1,000.00" on modal
    #270487
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "input-1"
    And I select value "Automation PO1" into field "input-2"
    And I select module "Grant" from reassign ownership dropdown
    And I wait for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:grantSourceOwnerTableId---" panel
    When I check "{SavedValue:Automation Runtime Award}" boxes in flex table with id "---subAwardStandAlone:-:grantSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---subAwardStandAlone:-:grantSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "GrantTargetOwnerReplace" panel
    Then I softly see value "{SavedValue:Automation Runtime Award}" for title "Grant Title" inside table "GrantTargetOwnerReplace"
    And I pause execution for "2" seconds
#    And I close the tab
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    Then I softly can see top right button "Revise Estimated Funding" in page detail
    When I click on "Revise Estimated Funding" in the page details
    And I enter in modal value "2000" into field "ProposedEstimatedFunding__c"
    When I click modal button "Save and Continue"
    And I navigate to "Budget" sub tab
    Then I softly see field "Estimated Funding" as "$2,000.00"

  @270802 @ValidateARisinProgressValueofProposedEstimatedfundingwillbecomparedwiththevalueofcumulativeobligationatthatmomentonGrant @sprint-21-US-265547 @vaibhav @Allocation
  Scenario: Validate AR is in Progress Value of Proposed Estimated funding will be compared with the value of cumulative obligation at that moment on Grant
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "Automation PM user" of type "Formula_By_Applicant_Focus_Area"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | New Obligation |
      | Automation Permanent Focus Area | 2000           |
    And I refresh the page
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    Then I softly can see top right button "Revise Estimated Funding" in page detail
    When I click on "Revise Estimated Funding" in the page details
    Then I see field "Cumulative Obligation" as "$1,000.00" on modal
    And I refresh the page
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
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
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 3000                 | 150        | 150            |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 3000  | RevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    Then I softly can see top right button "Revise Estimated Funding" in page detail
    When I click on "Revise Estimated Funding" in the page details
    Then I see field "Cumulative Obligation" as "$1,000.00" on modal
    And I refresh the page
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---closeout:-:grantsTableId---"
    Then I softly can see top right button "Revise Estimated Funding" in page detail
    When I click on "Revise Estimated Funding" in the page details
    Then I see field "Cumulative Obligation" as "$3,000.00" on modal

  @267400 @ValidateFormulaGrantvalidationisdisplayedtoPMuseroncreateGrantmodalwhenuserselectallocationlevelasByapplicantwithFocusareaasYesandAdvancepaymentasYes @sprint-21-US-265727 @vaibhav @Allocation
  Scenario: Validate Formula Grant validation is displayed to PM user on create Grant modal, when user select allocation level as By applicant with Focus area as Yes and Advance payment as Yes
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_By_App_Focus_Yes" values from "Award_Field_Values.xlsx"
    And I enter values into fields
      | Value | Field                 |
      | Yes   | IsAdvancePermitted__c |
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | If the Focus Area Required is Yes, then the Advance Payment Allowed must be selected as No. |

  @ch1 @275291 @ValidatetheFunctionalityofMultipleFundingAccounts @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario: Validate the Functionality of Multiple Funding Accounts
    When I login to "As a Grantor" app as "PM" user
    And I navigate to url "https://test8-internal--prolwcut.sandbox.lightning.force.com/lightning/r/Grant__c/a2RDV000001hY5J2AU/view"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    And I enter value "Yes" into field "IsBuildUpFunctionality__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I enter value "2000" into field "NewObligation__c"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account2" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I wait for "4" seconds
    And I save the value from row "1" for column name "Funding Account" as "FundingAccount2" from flex table "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Encumbrance |
      | {SavedValue:FundingAccount2} | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I pause execution for "3" seconds
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:budgetLineItems---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:budgetLineItems---" by clicking "New" :
      | Title        | Narrative     | Award Amount | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 2000         | 100        | 100            |
    When I close "Subaward Budget Category" modal by clicking the top right x button
    And I refresh the page
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
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
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
    And I wait for "4" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
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
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 500        | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    #Bug418240
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    #Bug418244
    #nbelowfieldsare not editable - https://test8-internal--prolwcut.sandbox.lightning.force.com/lightning/r/PaymentRequest__c/a2xDV000001cFkLYAU/view
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 500                   |
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account              | Net Spent This Action |
      | {SavedValue:FundingAccount2} | 1000                  |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:PM Username} | Step 1        |
    When I get the "EGMS ID"
    And I wait for "7" seconds
    When I click on "Submit for Approval" in the page details
    Then I see the following messages in the page details :
      | Financial Tab - Total of Net Spent This Action for funding accounts should match Net Spent This Action. |

  @247546 @VerifyEXEusershouldseeAwardedAmountfieldrenamedasCumulativeObligationfieldwithvaluepopulatedunderActualsummarysectionofActualtabonGrantlayoutwhenGrantisinClosedstate @Sprint-17-US-246018 @hitesh
  Scenario: Verify EXE user should see Awarded Amount field renamed as Cumulative Obligation field with value populated under Actual summary section of Actual tab on Grant layout when Grant is in Closed state
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I pause execution for "4" seconds
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---closeout:-:grantsTableId---"
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
      | Name           | Closeout |
      | Automation EXE | Step 1   |
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
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I refresh the page
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Completed" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---closeout:-:grantsTableId---"
    Then I softly see field "Status" as "Closed/Completed"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    When I navigate to "Actuals" sub tab
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligationAward1"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Actuals" sub tab
    Then I softly see "Cumulative Obligation" inside page block detail
    Then I softly do not see "Awarded Amount" inside page block detail
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation"
    Then I softly see value "{SavedValue:CumulativeObligationAward1}" is "Equals to" the value "{SavedValue:CumulativeObligation}"

  @327067 @VerifyPMasnewownershouldabletoeditalleditablefieldsonawardaftergrantorchangehisownership @Sprint-21-US-266911 @hitesh @Allocation
  Scenario:Verify PM as new owner should able to edit all editable fields on award after grantor change his ownership
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "SECOND_FOCUS_AREA_BY_APPL_RISK_ASS_NO-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "SECOND_BUDGET_CATEGORY"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I enter value "Automation Test Description" into field "GrantAwardDescription__c"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Grant" from reassign ownership dropdown
    And I wait for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:grantSourceOwnerTableId---" panel
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---subAwardStandAlone:-:grantSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---subAwardStandAlone:-:grantSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "GrantTargetOwnerReplace" panel
    Then I softly see value "{SavedValue:Automation Runtime FDM Announcement}" for title "Grant Title" inside table "GrantTargetOwnerReplace"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Send to Subrecipient" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    When I navigate to "Budget" sub tab
    Then I can see top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:awardApproversTableId---"
    And I navigate to "Files" sub tab
    Then I softly can see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I can see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"

  @247420 @ValidateCompAnnEXEusershouldseebudgetsummarybyfocusareasectiononGrantunderbudgettabisinClosedStatewhenselectAllocationTypeisNA&FocusAreaisYESwhilecreatingDirectGrant @sprint-17-US-246018 @vaibhav @Allocation
  Scenario: Validate Comp Ann EXE user should see 'budget summary by focus area' section on Grant under budget tab is in Closed State when select Allocation Type is NA & Focus Area is 'YES' while creating Direct Grant
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY-Automation EXE user" of type "Competitive"
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
      | Name           | Closeout |
      | Automation EXE | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
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
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I pause execution for "5" seconds
    And I refresh the page
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Completed" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    Then I softly see field "Status" as "Closed/Completed"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I navigate to "Budget" sub tab
    And I save the value from row "1" for column name "Cumulative Obligation" as "CumulativeObligationFA1" from flex table "---subAwardStandAlone:-:focusAreaTableId---"
    And I save the value from row "2" for column name "Cumulative Obligation" as "CumulativeObligationFA2" from flex table "---subAwardStandAlone:-:focusAreaTableId---"
    And I save the value from row "3" for column name "Cumulative Obligation" as "CumulativeObligationFATotal" from flex table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Cumulative Obligation" against the value "Grand Total" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    And I save the field labeled "Grant ID" as "GrantId"
    And I click "{SavedValue:GrantId}" lookup link
    Then I softly see field "Status" as "Closed/Completed"
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary By Focus Area" page block displayed
    And I save the value from row "1" for column name "Cumulative Obligation" as "CumulativeObligationFA1Grant" from flex table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    And I save the value from row "2" for column name "Cumulative Obligation" as "CumulativeObligationFA2Grant" from flex table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    And I save the value from row "3" for column name "Cumulative Obligation" as "CumulativeObligationFATotalGrant" from flex table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Cumulative Obligation" against the value "Grand Total" inside table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    Then I softly see value "{SavedValue:CumulativeObligationFA1}" is "Equals to" the value "{SavedValue:CumulativeObligationFA1Grant}"
    Then I softly see value "{SavedValue:CumulativeObligationFA2}" is "Equals to" the value "{SavedValue:CumulativeObligationFA2Grant}"
    Then I softly see value "{SavedValue:CumulativeObligationFATotal}" is "Equals to" the value "{SavedValue:CumulativeObligationFATotalGrant}"

  @274096 @ValidateFANoasPOasreviewerIshouldabletoedittheTotalCommitmentfieldinsentforreviewstatesofawardifalloweditaccesisYesforreviewer @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario: Validate FA No Verify as PO as reviewer I should able to edit the "Total Commitment" field in sent for review states of award if allow edit access is 'Yes' for reviewer
    When I login to "As a Grantor" app as "EXE" user
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
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | Automation PO | Program Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "Program Reviewer" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    Then I softly see that "Sent for Review" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Budget" sub tab
    Then I can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    Then I softly see fields "TotalCommitment__c" is in edit mode

  @329672 @329830 @ValidatePMusercannotsee0allocationamountFocusAreaonActiveGrant @Sprint-11-US-328848 @vaibhav @Allocation
  Scenario: Validate PM user cannot see 0 allocation amount Focus Area on Active Grant
    And I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "THREE_FOCUS_BY_APP_FOCUS_AREA_RISK_NO_PROGRAM_INCOME_NO_SUB_MATCH_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "SECOND_BUDGET_CATEGORY"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    Then I softly see field "Status" as "Active"
    And I navigate to "Budget" sub tab
    Then I softly cannot see field "Estimated Program Income For Project Period" inside page block
    Then I softly cannot see field "Match this Budget Period" inside page block
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    Then I softly do not see value "Test Focus Area" for title "Title" inside table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    #329830
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
      | Name          | Closeout |
      | Automation PM | Step 1   |
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
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I refresh the page
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Completed" and is "green"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---closeout:-:grantsTableId---"
    Then I softly see field "Status" as "Closed/Completed"
    And I navigate to "Budget" sub tab
    Then I softly cannot see field "Estimated Program Income For Project Period" inside page block
    Then I softly cannot see field "Match this Budget Period" inside page block
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    Then I softly do not see value "Test Focus Area" for title "Title" inside table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"

  @329840 @ValidatePMuserseeEstimatedFundingCumulativeObligationTotalCommitmentRequiredMatchAmountForProjectPeriodfieldsinBudgetSummarysectionandvaluesaregettingpopulatedfromAwardBudgetSummarysection @Sprint-11-US-328848 @vaibhav @Allocation
  Scenario: Validate PM user see Estimated Funding Cumulative Obligation Total Commitment Required Match Amount  For Project Period fields in Budget Summary section and values are getting populated from Award Budget Summary section
    Given I activated standalone subaward "Automation Runtime Award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation"
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    And I save the field labeled "Total Commitment" as "TotalCommitment"
    Then I softly see field "Total Commitment" as "$1,000.00"
    And I save the field labeled "Match this Budget Period" as "RequiredMatchAmount"
    Then I softly see field "Match this Budget Period" as "$400.00"
    And I save the field labeled "Grant ID" as "GrantId"
    And I click "{SavedValue:GrantId}" lookup link
    Then I softly see field "Status" as "Active"
    And I navigate to "Budget" sub tab
    Then I softly see field "Estimated Program Income For Project Period" inside page block
    Then I softly see field "Required Match Amount" inside page block
    Then I softly see field "Estimated Funding" inside page block
    Then I softly see field "Cumulative Obligation" inside page block
    Then I softly see field "Total Commitment" inside page block
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligationGrant"
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    And I save the field labeled "Total Commitment" as "TotalCommitmentGrant"
    Then I softly see field "Total Commitment" as "$1,000.00"
    And I save the field labeled "Required Match Amount" as "RequiredMatchAmountGrant"
    Then I softly see field "Required Match Amount" as "$400.00"
    Then I softly see value "{SavedValue:CumulativeObligation}" is "Equals to" the value "{SavedValue:CumulativeObligationGrant}"
    Then I softly see value "{SavedValue:TotalCommitment}" is "Equals to" the value "{SavedValue:TotalCommitmentGrant}"
    Then I softly see value "{SavedValue:RequiredMatchAmount}" is "Equals to" the value "{SavedValue:RequiredMatchAmountGrant}"

  @276446 @ValidateFormulaByapplicantFocusAreaFAYESPMusershouldseeFocusAreawithZeroObligationunderbudgetsummarybyfocusareasectiononAwardinActiveStatewhilecreatingDirectGrant @Sprint-24-US-275864 @vaibhav @Allocation
  Scenario: Validate Formula By applicant & Focus Area FA YES PM user should see Focus Area with Zero Obligation under 'budget summary by focus area' section on Award in Active State while creating Direct Grant
    Given I activated standalone subaward "Automation Runtime Award" with properties "THREE_FOCUS_AREA_NO_BUDGET_CATEGORY_THIRD_FOCUS" of type "Formula_By_Applicant_Focus_Area"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$500.00" for title "New Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:focusAreaTableId---"

  @276331 @ValidateDirectGrantByapplicantandFABalanceisnotdeductedfromFundingaccountwhensubawardisrejectedfromapprovalprocess @Sprint-24-US-275864 @vaibhav @Allocation
  Scenario: Validate Direct Grant By applicant and FA Balance is not deducted from Funding account when subaward is rejected from approval process
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_By_App_Focus_Yes" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Budget" sub tab
    Then I softly see fields "EstimatedFunding__c" is in edit mode
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_ByAppFocusYes" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date | New Obligation |
      | Automation Permanent Focus Area | 0          | 3650     | 1000           |
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---subAwardStandAlone:-:AssociateFocusArea---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date | New Obligation |
      | Automation Permanent Focus Area2 | 0          | 3650     | 1000           |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 2000        |
    And I click in table hyperlink containing value "{SavedValue:fundingAccount}"
    And I save the field labeled "Appropriation Amount" as "AppropriationAmount"
    And I save the field labeled "Pre-Encumbrance" as "PreEncumbrance"
    And I save the field labeled "Encumbrance" as "Encumbrance"
    And I save the field labeled "Spent" as "Spent"
    And I save the field labeled "Total Obligation" as "TotalObligation"
    And I save the field labeled "Available Balance" as "AvailableBalance"
    And I switch to parent tab
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I pause execution for "3" seconds
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    And I click on page navigation arrow "---subAwardStandAlone:-:subAwardBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    And I refresh the page
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
      | Name                     | Award  |
      | {SavedValue:PO Username} | Step 1 |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside table with wait for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I wait for "5" seconds
    And I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I pause execution for "3" seconds
    And I click toggle button to select "Grants - All"
    When I perform quick search for "GT-GA-00836" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "GT-GA-00836" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "AD-GA-849" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    And I navigate to "Budget" sub tab
    And I click in table hyperlink containing value "{SavedValue:fundingAccount}"
    And I save the field labeled "Appropriation Amount" as "AppropriationAmount1"
    And I save the field labeled "Pre-Encumbrance" as "PreEncumbrance1"
    And I save the field labeled "Encumbrance" as "Encumbrance1"
    And I save the field labeled "Spent" as "Spent1"
    And I save the field labeled "Total Obligation" as "TotalObligation1"
    And I save the field labeled "Available Balance" as "AvailableBalance1"
    Then I softly see value "{SavedValue:AppropriationAmount1}" is "Equals to" the value "{SavedValue:AppropriationAmount}"
    Then I softly see value "{SavedValue:PreEncumbrance}" is "Equals to" the value "{SavedValue:PreEncumbrance1}"
    Then I softly see value "{SavedValue:Encumbrance}" is "Equals to" the value "{SavedValue:Encumbrance1}"
    Then I softly see value "{SavedValue:Spent}" is "Equals to" the value "{SavedValue:Spent1}"
    Then I softly see value "{SavedValue:TotalObligation}" is "Equals to" the value "{SavedValue:TotalObligation1}"
    Then I softly see value "{SavedValue:AvailableBalance}" is "Equals to" the value "{SavedValue:AvailableBalance1}"

  @275076 @275273 @Validatecorrectspentamountdisplayonawardinpaymentsummarybyfocusareasectionforeachfocusarea @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario: Validate correct spent amount display on award in payment summary by focus area section for each focus area
    And I activated standalone subaward "Automation Runtime Award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Formula_By_Applicant_Focus_Area"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 500        | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on page navigation arrow "---paymentRequest:-:paymentRequestBudgetTableId---" for table id "Next"
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 500        | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 1000                  |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                      | Reimbursement |
      | {SavedValue:EXE Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    And I click modal button "Close"
    Then I softly see status in Progress-bar is "Paid" and is "dark blue"
    And I save the field labeled "Subaward" as "Subaward"
    And I click "{SavedValue:Subaward}" lookup link
    And I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$1,000.00"
    Then I softly see value "$500.00" for title "Spent" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Spent" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Spent" against the value "Total" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    #275273
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    Then I softly see field "Status" as "Active"
    And I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$1,000.00"
    Then I softly see value "$500.00" for title "Spent" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Spent" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Spent" against the value "Total" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"

  @274260 @ValidatePMuserseeBudgetperiodnumberNewObligationCumulativeObligationTotalCommitmentMatchthisBudgetPeriodandBudgetedAmountfieldsshouldbereadonlyinbudgetsummarysectiononaward @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario Outline: Validate  PM user see 'Budget period number', 'New Obligation', 'Cumulative Obligation', 'Total Commitment', 'Match this Budget Period' and 'Budgeted Amount' fields should be read only in budget summary section on award
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO_RISKASSESSMENT_NO-<UserName>"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FIRST_BUDGET_CATEGORY_NO_FOCUS_AREA"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I enter value "Automation Test Description" into field "GrantAwardDescription__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    When I click on "Edit" in the page details
    Then I softly see "New Obligation" inside page block detail
    Then I softly see "Cumulative Obligation" inside page block detail
    Then I softly see "Total Commitment" inside page block detail
    Then I softly see "Budgeted Amount" inside page block detail
    Then I softly see "Match this Budget Period" inside page block detail
#    Then I softly see that "New Obligation" rendered in view mode only
#    Then I softly see that "Cumulative Obligation" rendered in view mode only
#    Then I softly see that "Total Commitment" rendered in view mode only
#    Then I softly see that "Budgeted Amount" rendered in view mode only
#    Then I softly see that "Match this Budget Period" rendered in view mode only

    Examples:
      | User  | UserName              |
      | PM    | Automation PM user    |
      | EXE   | Automation EXE user   |
      | ADMIN | Automation ADMIN user |

  @272114 @272423 @ValidatePMusershouldseeupdatedspentamountonawardandgrantunderactualtabifpaymentrequestisinpaidstate @Sprint-22-US-270869 @vaibhav @Allocation
  Scenario: Validate PM user should see updated spent amount on award and grant under actual tab if payment request is in paid state
    And I activated standalone subaward "Automation Runtime Award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Directed"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$0.00"
    Then I softly see value "$0.00" for title "Spent" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    Then I softly see value "$0.00" for title "Spent" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    Then I softly see value "$0.00" for title "Spent" against the value "Total" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    And I expand nested table containing column value "BP01"
    And I wait for "3" seconds
    Then I softly see value "$0.00" for title "Spent" against the value "Construction" inside table "---subAwardStandAlone:-:subrecipientGrantActualSummaryBudgetTableId---"
    And I click on page navigation arrow "---subAwardStandAlone:-:subrecipientGrantActualSummaryBudgetTableId---" for table id "Next"
    Then I softly see value "$0.00" for title "Spent" against the value "Construction" inside table "---subAwardStandAlone:-:subrecipientGrantActualSummaryBudgetTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$0.00"
    Then I softly see value "$0.00" for title "Spent" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    Then I softly see value "$0.00" for title "Spent" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    Then I softly see value "$0.00" for title "Spent" against the value "Total" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    And I select value inside table "---subAwardStandAlone:-:paymentSummaryBudgetTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:paymentSummaryBudgetTableId---" :
      | Spent |
      | $0.00 |
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 500        | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on page navigation arrow "---paymentRequest:-:paymentRequestBudgetTableId---" for table id "Next"
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 500        | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 1000                  |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                      | Reimbursement |
      | {SavedValue:EXE Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    And I click modal button "Close"
    Then I softly see status in Progress-bar is "Paid" and is "dark blue"
    And I save the field labeled "Subaward" as "Subaward"
    And I click "{SavedValue:Subaward}" lookup link
    And I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$1,000.00"
    Then I softly see value "$500.00" for title "Spent" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Spent" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Spent" against the value "Total" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    And I select value inside table "---subAwardStandAlone:-:paymentSummaryBudgetTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:paymentSummaryBudgetTableId---" :
      | Spent     |
      | $1,000.00 |
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    Then I softly see field "Status" as "Active"
    And I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$1,000.00"
    Then I softly see value "$500.00" for title "Spent" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Spent" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Spent" against the value "Total" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    And I expand nested table containing column value "BP01"
    And I wait for "3" seconds
    Then I softly see value "$500.00" for title "Spent" against the value "Construction" inside table "---subAwardStandAlone:-:paymentSummaryFocusAreaTableid---"
    And I click on page navigation arrow "---subAwardStandAlone:-:paymentSummaryFocusAreaTableid---" for table id "Next"
    Then I softly see value "$500.00" for title "Spent" against the value "Construction" inside table "---subAwardStandAlone:-:paymentSummaryFocusAreaTableid---"
    #272423
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I pause execution for "3" seconds
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$1,000.00"
    Then I softly see value "$500.00" for title "Spent" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Spent" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Spent" against the value "Total" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    And I expand nested table containing column value "BP01"
    And I pause execution for "5" seconds
    Then I softly see value "$500.00" for title "Spent" against the value "Construction" inside table "---subAwardStandAlone:-:subrecipientGrantActualSummaryBudgetTableId---"
    And I click on page navigation arrow "---subAwardStandAlone:-:subrecipientGrantActualSummaryBudgetTableId---" for table id "Next"
    Then I softly see value "$500.00" for title "Spent" against the value "Construction" inside table "---subAwardStandAlone:-:subrecipientGrantActualSummaryBudgetTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$1,000.00"
    Then I softly see value "$500.00" for title "Spent" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Spent" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Spent" against the value "Total" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    And I select value inside table "---subAwardStandAlone:-:paymentSummaryBudgetTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:paymentSummaryBudgetTableId---" :
      | Spent     |
      | $1,000.00 |

  @272148 @Validatecorrectspentamountshouldgetupdatedonpaymentrequestwhichcreatedpreviouslyanditisincreatedstate @Sprint-22-US-270869 @vaibhav @Allocation
  Scenario: Validate correct spent amount should get updated on payment request which created previously and it is in created state
    And I activated standalone subaward "Automation Runtime Award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId1"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 500        | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on page navigation arrow "---paymentRequest:-:paymentRequestBudgetTableId---" for table id "Next"
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 500        | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 1000                  |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                      | Reimbursement |
      | {SavedValue:EXE Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click modal button "Close"
    Then I softly see status in Progress-bar is "Paid" and is "dark blue"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    #Getting navigation error in toggle below - PR-1234-308
    And I click toggle button to select "Reimbursements - All"
    When I perform quick search for "{SavedValue:PayreqId}" in "RecipientPaymentRequestReimbursement" panel
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "RecipientPaymentRequestReimbursement" without waiting for record
    And I navigate to "Financials" sub tab
    Then I softly see field "Subaward Spent" as "$1,000.00"

  @354313 @ValidateDirectedthatPMuserdonnotseeBudgetSummaryByFocusAreasectionifAllocationSettingissetasByapplicantandFAisNO @sprint-16-US-238128 @vaibhav @Allocation
  Scenario: Validate Directed that PM user don not see Budget Summary By Focus Area section if Allocation Setting is set as By applicant and FA is NO
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
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly do not see "Budget Summary by Focus Area" page block displayed

  @276538 @ValidateCompetitiveFAYesusercanseefocusareaswith0obligationonactiveSubawardwhenawardiscreatedfromdirectgrant @Sprint-23-US-275864 @vaibhav @Allocation
  Scenario: Validate Competitive FA Yes user can see focus areas with 0 obligation on active Subaward when award is created from direct grant
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "THREE_FOCUS_AREA_NO_BUDGET_CATEGORY_THIRD_FOCUS-Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    And I navigate to "Budget" sub tab
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$500.00" for title "New Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:focusAreaTableId---"

  @276336 @ValidateFormulaByApplicantFAYesusercanseefocusareaswith0obligationonactivesubawardwhenawardiscreatedfromdirectgrant @Sprint-23-US-275864 @vaibhav @Allocation
  Scenario: Validate Formula By Applicant FAYes user can see focus areas with 0 obligation on active subaward when award is created from direct grant
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "THREE_FOCUS_AREA_NO_BUDGET_CATEGORY_THIRD_FOCUS-Automation EXE user" of type "Formula_By_Applicant"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    And I navigate to "Budget" sub tab
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$0.00" for title "New Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$0.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:focusAreaTableId---"

  @116309 @ValidateDirectedValidateAwardActivationfailurewhenInternalUserselectsRiskAssessmentasYESontheGrant @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario Outline: Validate Directed Award Activation failure when Internal User selects Risk Assessment as YES on the Grant
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Ed_Directed_Risk_Yes" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
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
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I get the "EGMS ID"
    And I wait for "9" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---riskassessment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---riskassessment:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I see the following messages in the page details contains:
      | Management Tab - Create and activate a Risk Assessment as the Subaward cannot be accepted without an active Risk Assessment. |
    Examples:
      | Award Name                                                | Grant Name                                                |
      | {SavedValue:Automation Runtime Award for Risk Assessment} | {SavedValue:Automation Runtime Award for Risk Assessment} |

  @248587 @ValidateCompAnnSPAusershouldseeAwardedAmountfieldrenamedasCumulativeObligationfieldwithvaluepopulateunderActualsummarysectionofActualtabonGrantlayoutwhenGrantisinClosedstate @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario: Validate Comp Ann SPA user should see Awarded Amount field renamed as Cumulative Obligation field with value populated under Actual summary section of Actual tab on Grant layout when Grant is in Closed state
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY-Automation EXE user" of type "Competitive"
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
      | Name           | Closeout |
      | Automation EXE | Step 1   |
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
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I refresh the page
    #Bug418608
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Completed" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    Then I softly see field "Status" as "Closed/Completed"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    Then I softly see field "Status" as "Closed/Completed"
    And I navigate to "Budget" sub tab
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligationBudgetSummary"
    When I navigate to "Actuals" sub tab
    Then I softly see "Cumulative Obligation" inside page block detail
    Then I softly do not see "Awarded Amount" inside page block detail
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligationActualsSummary"
    Then I softly see value "{SavedValue:CumulativeObligationBudgetSummary}" is "Equals to" the value "{SavedValue:CumulativeObligationActualsSummary}"

  @243845 @ValidateFormulaEXEusershouldnotabltoedittheNewobligationfieldinSenttoSRsubmiforapprovalApprovedSentSrAfterapprovalAmendedorPendingActivationorActivatedstatesFANo
  Scenario: Validate Formula EXE user should not able to edit the "New obligation" field in  Sent to S/R, submit for approval Approved Sent to S/r After approval Amended or Pending Activation or Activated states FA=No)
    When I login to "As a Grantor" app as "EXE" user
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
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    And I refresh the page
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
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I navigate to "Budget" sub tab
    When I click on "Edit" in the page details
    Then I softly see that "New Obligation" rendered in view mode only
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside table with wait for record
#    When I navigate to "Terms" sub tab
     #Button is Missing below
    #Bug418247
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Budget" sub tab
    Then I cannot see top right button "Edit" in page detail
    Then I softly see that "New Obligation" rendered in view mode only
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Budget" sub tab
    Then I cannot see top right button "Edit" in page detail
    Then I softly see that "New Obligation" rendered in view mode only
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Budget" sub tab
    Then I cannot see top right button "Edit" in page detail
    Then I softly see that "New Obligation" rendered in view mode only
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I cannot see top right button "Edit" in page detail
    Then I softly see that "New Obligation" rendered in view mode only
    And I click on "Activate" in the page details
    Then I softly see that "Subaward" is in "Activated" status
    And I navigate to "Budget" sub tab
    Then I cannot see top right button "Edit" in page detail
    Then I softly see that "New Obligation" rendered in view mode only
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I wait for "4" seconds
    When I click on "Save" in the page details
    And I refresh the page
    And I navigate to "Overview" sub tab
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I wait for "5" seconds
    And I "Approve" in the approval decision
    And I wait for "4" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I navigate to "Budget" sub tab
    Then I cannot see top right button "Edit" in page detail
    Then I softly see that "New Obligation" rendered in view mode only
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I navigate to "Budget" sub tab
    Then I cannot see top right button "Edit" in page detail
    Then I softly see that "New Obligation" rendered in view mode only

  @274080 @ValidateDirectedAnnEXEusershouldseevalidationmessageshouldbedisplayiftheTotalEncumbrancevaluenotequaltototalawardamountintheawardgridonawardwhilesubmittheawardforapproval @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario: Validate Directed Ann EXE user should see validation message should be display if the Total Encumbrance value not equal to total award amount in the award grid on award while submit the award for approval
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "SECOND_FOCUS_AREA_RISK_ASS_NO-Automation EXE user"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "SECOND_BUDGET_CATEGORY"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I enter value "Automation Test Description" into field "GrantAwardDescription__c"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Budget" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                          | End Date                      |
      | Automation Permanent Focus Area | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodDate} |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date                          | End Date                      |
      | Automation Permanent Focus Area2 | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodDate} |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    And I click on "Remove" icon for "Project Director/Manager" inside flex table with id "---subAwardFromFDM:-:associateContactTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    When I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Responsibilities" sub tab
    And I get the "EGMS ID"
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name           | Award  |
      | Automation EXE | Step 1 |
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 800         |
    And I wait for "9" seconds
    And I click on "Submit for Approval" in the page details
    Then I see the following messages in the page details contains:
      | Budget Tab - Total Encumbrance must be equal to the total Award Amount in the Subaward budget section |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 3000        |
    And I wait for "9" seconds
    And I click on "Submit for Approval" in the page details
    Then I see the following messages in the page details contains:
      | Budget Tab - Total Encumbrance must be equal to the total Award Amount in the Subaward budget section |

  @117269 @ValidatetheAwardandGrantBudgetpostsinglereimbursementpaymentrequestisapproved @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario: Validate the Award and Grant Budget post single reimbursement payment request is approved
    And I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-Automation EXE user" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 500        | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 500                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:PM Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$500.00"
    Then I softly see field "Balance" as "$500.00"
    And I expand nested table containing column value "BP01"
    And I pause execution for "4" seconds
    Then I softly see value "$500.00" for title "Spent" against the value "Construction" inside table "---subAwardStandAlone:-:paymentSummaryFocusAreaTableid---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$500.00"
    Then I softly see field "Balance" as "$500.00"
    Then I softly see value "$500.00" for title "Spent" against the value "{SavedValue:fundingAccount}" inside table "---subAwardStandAlone:-:FundingAccountActualsTableId---"
    Then I softly see value "$1,000.00" for title "Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---subAwardStandAlone:-:FundingAccountActualsTableId---"
    Then I softly see value "$500.00" for title "Encumbrance Balance" against the value "{SavedValue:fundingAccount}" inside table "---subAwardStandAlone:-:FundingAccountActualsTableId---"
    Then I softly see value "$500.00" for title "Spent" against the value "Construction" inside table "---subAwardStandAlone:-:paymentSummaryBudgetTableId---"
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$500.00"
    Then I softly see field "Balance" as "$500.00"
    And I expand nested table containing column value "BP01"
    Then I softly see value "$500.00" for title "Spent" against the value "Construction" inside table "---subAwardStandAlone:-:grantsPaymentSummaryBudgetTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$500.00"
    Then I softly see field "Balance" as "$500.00"
    Then I softly see value "$500.00" for title "Spent" against the value "Construction" inside table "---subAwardStandAlone:-:paymentSummaryBudgetTableId---"
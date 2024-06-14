@amendmentRequestsAllocation @amendmentRequestsSaranjit @grantor-regression @grantor-parallel-regression @parallel-regression @regression
Feature: Validate all scenarios in the Amendment Request Allocation Feature

  @257686 @257701 @257708 @257692 @257717 @257709 @257736 @257744 @257745 @257747 @257746 @257748 @257749 @ValidatePOusercanseeNewObligationfieldasuserenterdollarfieldenterPositivevalueinNewObligationfieldunderBudgetSummarysectionwhenPeriodicRenewalamendmentrequestincreatedstateFAYES @sprint-19-US-250552 @vaibhav @Allocation
  Scenario: Validate PO user can see New Obligation field as user enter dollar field & enter Positive Value in New Obligation field under Budget Summary section when Periodic Renewal amendment request in created state(FA=YES)
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "SECOND_FOCUS_AREA_RISK_ASS_NO-Automation PO user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "SECOND_BUDGET_CATEGORY"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation PO user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    And I save the field containing "Subaward Title" as "Automation Runtime FDM Announcement"
    And I navigate to "Budget" sub tab
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value                | Field                      |
      | 20000000000000000.30 | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    #257701 #Bug420753
#    Then I softly see the following messages in the page details contains:
#      | New Obligation : Number is too large. |
    #257708
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | -2000 | RevisedCommitment__c       |
    And I click on "Save" in the page details
    Then I softly see field "Revised Commitment" as "($2,000.00)"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 2000  | RevisedCommitment__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PeriodicID"
    And I pause execution for "5" seconds
    #257686
    Then I softly see field "New Obligation" as "$2,000.00"
    Then I softly do not see "Requested Change in Budget" inside page block detail
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date                                | End Date                                |
      | Automation Permanent Focus Area2 | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
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
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---progressReport:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    #257692
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value                 | Field                      |
      | -2000                 | RequestedChangeInBudget__c |
      | 200000000000000000.30 | RevisedCommitment__c       |
    When I click on "Save" in the page details
    #257717 #Bug420758
#    Then I softly see the following messages in the page details contains:
#      | Revised Commitment : Number is too large. |
    When I enter values into fields
      | Value | Field                |
      | 5000  | RevisedCommitment__c |
    And I click on "Save" in the page details
    Then I softly see field "New Obligation" as "($2,000.00)"
    #257709
    Then I softly see field "Revised Commitment" as "$5,000.00"
    #257736
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 1000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:projectAreasTableId---" without waiting for record
    Then I softly see field "NewObligationFormula__c" not in edit mode
    Then I softly see field "BudgetedAmount__c" not in edit mode
    And I click on top right button "Save" in flex table with id "---amendment:-:projectAreasTableId---"
    Then I softly see value "$2,000.00" for title "New Obligation" against the value "Grand Total" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$2,000.00" for title "Budgeted Amount" against the value "Grand Total" inside table "---amendment:-:projectAreasTableId---"
    #257744
    And I wait for "9" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Budgeted Amount must be equal to the New Obligation in the Budget Summary section. |
    #257747
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The New Obligation ($1000.00) must be equal to the total of Revised Encumbrance in the Funding Account ($2000.00) |
    #257745,257748
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 5000  | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    And I wait for "9" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Budgeted Amount must be equal to the New Obligation in the Budget Summary section.                            |
      | Overview Tab - The New Obligation ($5000.00) must be equal to the total of Revised Encumbrance in the Funding Account ($2000.00) |
    #257746,257749
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"

  @257705 @ValidatePOusercanseeCurrentCommitmentasReadonlyfieldwhichisCopyoftotalcommitmentfromtheAwardonwhichPeriodicRenewalAmendmentrequestiscreated @sprint-19-US-250552 @vaibhav @Allocation
  Scenario: Validate PO user can see Current Commitment as Read-only field which is Copy of total commitment from the Award on which Periodic Renewal Amendment request is created
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NO_RISK_ASSESSMENT-Automation PO user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation PO user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see field "Total Commitment" as "$1,000.00"
    And I save the field labeled "Total Commitment" as "TotalCommitment"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    Then I softly see that "Current Commitment" rendered in view mode only
    And I enter value "1000" into field "RequestedChangeInBudget__c"
    When I click on "Save" in the page details
    And I pause execution for "4" seconds
    Then I softly see field "Current Commitment" as "$1,000.00"
    And I save the field labeled "Current Commitment" as "CurrentCommitment"
    Then I softly see value "{SavedValue:TotalCommitment}" is "Equals to" the value "{SavedValue:CurrentCommitment}"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                                | Start Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodEndDate} | {SavedValue:updatedBudgetPeriodStartDate} |
    And I refresh the page
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
    And I wait for "5" seconds
    And I "Approve" in the approval decision
    And I wait for "4" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    And I navigate to "Budget" sub tab
    And I save the field labeled "Total Commitment" as "TotalCommitment1"
    Then I softly see field "Total Commitment" as "$2,000.00"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Runtime FDM Announcement95444" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Automation Runtime FDM Announcement95444" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see field "Total Commitment" as "$2,000.00"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    Then I softly see that "Current Commitment" rendered in view mode only
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I refresh the page
    Then I softly see field "Current Commitment" as "$2,000.00"
    And I save the field labeled "Current Commitment" as "CurrentCommitment1"
    Then I softly see value "{SavedValue:TotalCommitment1}" is "Equals to" the value "{SavedValue:CurrentCommitment1}"

  @257883 @ValidatePOusercannotseevalidationonSubmitforApprovalbuttonwhenRevisedCommitmentisgreaterthantotalofCumulativeObligationfromActiveAward&newObligationonPeriodicRenewalamendmentrequestFAYES @sprint-19-US-250552 @vaibhav @Allocation
  Scenario: Validate PO user cannot see validation on Submit for Approval button when Revised Commitment is greater than total of Cumulative Obligation from Active Award & new Obligation on Periodic Renewal amendment request (FA=YES)
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NO_RISK_ASSESSMENT-Automation PO user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation PO user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                                | Start Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodEndDate} | {SavedValue:updatedBudgetPeriodStartDate} |
    And I refresh the page
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
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    #257883
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 100   | RevisedCommitment__c |
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Revised Commitment should be equal to or greater than the total of Cummulative Obligation $2000.00 across all budget periods. |
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 5000  | RevisedCommitment__c |
    And I click on "Save" in the page details
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"

  @257886 @257889 @257887 @261579 @261581 @ValidatePOusercanseevalidationonsenttosubrecipientbuttonwhenNewobligationfieldiszeroinbudgetsummarysection @sprint-19-US-250552 @vaibhav @Allocation
  Scenario: Validate PO user can see validation on sent to subrecipient button when New obligation field is zero in budget summary section
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NO_RISK_ASSESSMENT-Automation PO user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation PO user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 0     | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PeriodicID"
    And I pause execution for "5" seconds
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I wait for "9" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - New Obligation must be greater than $0 |
    #257889
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I clear the value from field "RequestedChangeInBudget__c"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - New Obligation must be greater than $0 |
    #257887
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    When I enter values into fields
      | Value | Field                      |
      | 1000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    #257886
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
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 0     | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I wait for "9" seconds
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - New Obligation must be greater than $0 |
    #257889
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I clear the value from field "RequestedChangeInBudget__c"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - New Obligation must be greater than $0 |
    And I refresh the page
    #261579
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 0     | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I wait for "9" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - New Obligation must be greater than $0 |
    #261581
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | -200  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I wait for "9" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - New Obligation must be greater than $0 |

  @258053 @258326 @258349 @258522 @258525 @258530 @258536 @258537 @258538 @258333 @258348 @ValidateCompetitiveFDusercanseeNewObligationfieldasuserenterdollarfield&enternegativeValueinNewObligationfieldunderBudgetSummarysectionwhenPeriodicRenewalamendmentrequestincreatedstateFANO @sprint-19-US-250552-250556 @vaibhav @Allocation
  Scenario: Validate Competitive FD user can see New Obligation field as user enter dollar field & enter negative Value in New Obligation field under Budget Summary section when Periodic Renewal amendment request in created state(FA=NO)
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    When I login to "As a Grantor" app as "FD" user
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
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PeriodicID"
    And I pause execution for "5" seconds
    #258333
    Then I softly see field "New Obligation" as "$2,000.00"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | -2000 | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    #258053
    Then I softly see field "New Obligation" as "($2,000.00)"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I wait for "9" seconds
    And I click on "Send to Subrecipient" in the page details
    #258326
    Then I softly see the following messages in the page details contains:
      | Overview Tab - New Obligation must be greater than $0 |
    #258349
    And I navigate to "Overview" sub tab
    Then I softly see field "Revised Commitment" as "$2,000.00"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    #258522
    Then I softly cannot see field "Current Obligation" inside page block
    Then I softly cannot see field "Revised Obligation" inside page block
    Then I softly cannot see field "Spent" inside page block
    #258530,258525
    And I click on "Edit" in the page details
    Then I softly see that "Revised Commitment" rendered in view mode only
    Then I softly see that "New Obligation" rendered in view mode only
    And I click on "Save" in the page details
    Then I softly cannot see field "Requested Change in Budget" inside page block
    Then I softly see field "New Obligation" as "$2,000.00"
    #258536
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 500                  | 100        | 0              |
    And I wait for "9" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Budgeted Amount must be equal to the New Obligation in the Budget Summary section. |
    #258537
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 5000                 | 500        | 0              |
    And I wait for "9" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Budgeted Amount must be equal to the New Obligation in the Budget Summary section. |
    #258538
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 2000                 | 200        | 0              |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | -2000 | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I wait for "9" seconds
    And I click on "Send Back to Subrecipient" in the page details
    #258326
    Then I softly see the following messages in the page details contains:
      | Overview Tab - New Obligation must be greater than $0 |
    #258348
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"

  @wip @257892 @ValidateCompetitivePOusercanseeerrormessageafterclickonremovebuttonwhileremovingthefocusareawithbudgetassociatedwithitFAYES @sprint-19-US-250552 @vaibhav @Allocation
  Scenario: Validate Competitive PO user can see error message after click on remove button while removing the focus area, with budget associated with it (FA=YES)
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NO_RISK_ASSESSMENT-Automation PO user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation PO user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on top right button "Associate" in flex table with id "---amendment:-:projectAreasTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---amendment:-:focusAreaTableId---"
    Then I softly see that "Automation Permanent Focus Area2" has been added in flextable with Id "---amendment:-:projectAreasTableId---"
    Then I softly can see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:projectAreasTableId---"
    Then I softly can see row level action button "Remove" against "Automation Permanent Focus Area2" in flex table with id "---amendment:-:projectAreasTableId---"
    #Bug423185
    When I click on "Remove" icon for "Automation Permanent Focus Area2" inside flex table with id "---amendment:-:projectAreasTableId---" without waiting for record
    Then I softly do not see value "Automation Permanent Focus Area2" for title "Title" inside table "---amendment:-:projectAreasTableId---"
    When I click on "Remove" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:projectAreasTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | You cannot delete this Focus Area as the Budgeted Amount is not zero. |

  @258487 @258508 @258515 @258516 @258539 @ValidateINDusercanseeNewObligationfieldasreadyonlyfieldwhenPeriodicRenewalamendmentrequestinSendtoSubrecipientstateFAYES @sprint-19-US-250556 @vaibhav @Allocation
  Scenario: Validate IND user can see New Obligation field as ready only field when Periodic Renewal amendment request in Send to Subrecipient state(FA=YES)
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NO_RISK_ASSESSMENT-Automation PO user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default-Automation IND user"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation PO user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PeriodicID"
    And I pause execution for "5" seconds
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    When I click on top right button "Associate" in flex table with id "---amendment:-:projectAreasTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---amendment:-:focusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date                                | End Date                                |
      | Automation Permanent Focus Area2 | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    Then I softly see that "New Obligation" rendered in view mode only
    Then I softly see field "New Obligation" as "$2,000.00"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 500                  | 100        | 0              |
    And I refresh the page
    #258508
    Then I cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:subrecipientProjectAreasTableId---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---amendment:-:subrecipientProjectAreasTableId---"
    Then I softly see value "$1,000.00" for title "New Obligation" against the value "Automation Permanent Focus Area" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    Then I softly see value "$500.00" for title "New Obligation" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    Then I softly see value "$1,500.00" for title "New Obligation" against the value "Grand Total" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    #258515
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Budgeted Amount must be equal to the New Obligation in the Budget Summary section. |
    #258516
    And I click on parallel menu button in flex table title "Budget Change"
    And I select "Reset Table" from parallel lines dropdown of "Budget Change"
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 5000                 | 500        | 0              |
    And I wait for "3" seconds
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Budgeted Amount must be equal to the New Obligation in the Budget Summary section. |
    #258539
    And I click on parallel menu button in flex table title "Budget Change"
    And I select "Reset Table" from parallel lines dropdown of "Budget Change"
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

  @wip @257462 @257583 @257652 @257631 @257644 @257483 @ValidateUsershouldabletoeditthenewobligationfieldwhentherecordisinCreated&SubmittoGrantorStateFANo @sprint-19-US-242374 @vaibhav @Allocation
  Scenario: Validate User should able to edit the new obligation field when the record is in Created & Submit to Grantor State(FA No)
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-Automation EXE user" of type "Formula_By_Applicant_Focus_Area_No"
    When I login to "As a Grantor" app as "EXE1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see field "Total Commitment" as "$1,000.00"
    And I save the field labeled "Total Commitment" as "TotalCommitment"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    Then I softly see fields "RequestedChangeInBudget__c" is in edit mode
    #257652
    Then I softly see fields "RevisedCommitment__c" is in edit mode
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 4000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    #257652
    Then I softly see field "Revised Commitment" as "$4,000.00"
    And I save the field labeled "EGMS ID" as "PeriodicID"
    And I refresh the page
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    #257583
    Then I softly see value "$1,000.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    #257631
    Then I softly see field "Current Commitment" as "$1,000.00"
    And I save the field labeled "Current Commitment" as "CurrentCommitment"
    Then I softly see value "{SavedValue:TotalCommitment}" is "Equals to" the value "{SavedValue:CurrentCommitment}"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                       | Amendment Request |
      | {SavedValue:EXE1 Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    #257483
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    Then I softly see that "RequestedChangeInBudget__c" rendered in view mode only
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 2000                 | 200        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I click on "Edit" in the page details
    Then I softly see fields "RequestedChangeInBudget__c" is in edit mode
    #257652
    Then I softly see fields "RevisedCommitment__c" is in edit mode
    When I enter values into fields
      | Value | Field                |
      | 1000  | RevisedCommitment__c |
    And I click on "Save" in the page details
    #257652
    Then I softly see field "Revised Commitment" as "$1,000.00"
    #257644
    And I wait for "5" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Revised Commitment should be equal to or greater than the total of Cummulative Obligation $3000.00 across all budget periods. |
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 4000  | RevisedCommitment__c |
    When I click on "Save" in the page details
    And I click on "Submit for Approval" in the page details
    #257483
    Then I see field "Status" as "Submitted for Approval"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "New Obligation" rendered in view mode only
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    #257483
    Then I see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "New Obligation" rendered in view mode only

  @257491 @257674 @257803 @257868 @257908 @257732 @257798 @257801 @257662 @ValidateusershouldnoteditnewobligationfiledinRejectedstateFANo @sprint-19-US-242374 @vaibhav @Allocation
  Scenario: Validate user should not edit new obligation filed in Rejected state(FA No)
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-Automation EXE user" of type "Formula_By_Applicant_Focus_Area_No"
    When I login to "As a Grantor" app as "EXE1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I save the field labeled "New Obligation" as "newObligation"
    Then I softly see field "New Obligation" as "$1,000.00"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    Then I softly see fields "RequestedChangeInBudget__c" is in edit mode
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 4000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PeriodicID"
    And I pause execution for "5" seconds
    #257674
    Then I softly see value "10.00%" for the field "Budget Redirection Threshold"
#    Then I softly see field "Budget Redirection Threshold" as "10.00%"
    Then I softly see field "Subrecipient Match (%)" as "10.00%"
    #257732
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    And I save the field labeled "Budgeted Amount" as "BudgetedAmount"
    Then I softly see value "{SavedValue:newObligation}" is "Equals to" the value "{SavedValue:BudgetedAmount}"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                       | Amendment Request |
      | {SavedValue:EXE1 Username} | Step 1            |
    #257803
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 0     | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I wait for "9" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - New Obligation must be greater than $0 |
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | -12   | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I wait for "9" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - New Obligation must be greater than $0 |
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    #257868
    When I click on "Edit" in the page details
    Then I softly see that "New Obligation" rendered in view mode only
    Then I softly see that "Budgeted Amount" rendered in view mode only
    Then I softly see that "Current Commitment" rendered in view mode only
    Then I softly see that "Revised Commitment" rendered in view mode only
    When I click on "Save" in the page details
    #257908
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 200        | 0              |
    And I refresh the page
    And I wait for "9" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Budgeted Amount must be equal to the New Obligation in the Budget Summary section. |
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 2000                 | 200        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I click on "Edit" in the page details
    Then I softly see fields "RequestedChangeInBudget__c" is in edit mode
    #257798
    When I enter values into fields
      | Value | Field                      |
      | 1000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I wait for "9" seconds
    And I click on "Submit for Approval" in the page details
    #257798,257801
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Budgeted Amount must be equal to the New Obligation in the Budget Summary section.                            |
      | Overview Tab - The New Obligation ($1000.00) must be equal to the total of Revised Encumbrance in the Funding Account ($2000.00) |
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    And I pause execution for "3" seconds
    And I "Reject" in the approval decision
    Then I see status in Progress-bar is "Rejected" and is "red"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "New Obligation" inside page block
    #257662
    Then I softly see field "Revised Commitment" inside page block

  @wip @257867 @257877 @ValidateusershouldabletoseebelowreadonlyfieldinbudgetsummarysectionFAYes @sprint-19-US-247769 @vaibhav @Allocation
  Scenario: Validate user should able to see below read only field in budget summary section(FA Yes)
    And I activated standalone subaward "Automation Runtime award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY-Automation EXE user" of type "Formula_By_Applicant"
    When I login to "As a Grantor" app as "EXE1" user
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
    And I navigate to "Budget" sub tab
    And I save the field labeled "New Obligation" as "newObligation"
    Then I softly see field "New Obligation" as "$1,000.00"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 4000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PeriodicID"
    And I pause execution for "5" seconds
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                                | Start Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodEndDate} | {SavedValue:updatedBudgetPeriodStartDate} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | End Date                                | Start Date                                |
      | Automation Permanent Focus Area2 | {SavedValue:updatedBudgetPeriodEndDate} | {SavedValue:updatedBudgetPeriodStartDate} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                       | Amendment Request |
      | {SavedValue:EXE1 Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    #257867
    When I click on "Edit" in the page details
    Then I softly see that "New Obligation" rendered in view mode only
    Then I softly see that "Budgeted Amount" rendered in view mode only
    Then I softly see that "Current Commitment" rendered in view mode only
    Then I softly see that "Revised Commitment" rendered in view mode only
    When I click on "Save" in the page details
    #257877
    Then I softly see value "$1,000.00" for title "New Obligation" against the value "Grand Total" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    Then I softly see value "$1,000.00" for title "Budgeted Amount" against the value "Grand Total" inside table "---amendment:-:subrecipientProjectAreasTableId---"

  @258816 @258820 @ValidateSPISPAusercannoteditbudgetwhenperiodicrenewalAmendmentrequestisinApprovedstatewhenFAYes @sprint-19-US-247769 @vaibhav @Allocation
  Scenario: Validate SPI user cannot edit budget when periodic renewal Amendment request is in Approved state when FA Yes
    And I activated standalone subaward "Automation Runtime Award" with properties "SECOND_FOCUS_AREA_BUD_CAT_BUILDUP_YES-Automation EXE1 user" of type "Formula_By_Applicant"
    When I login to "As a Grantor" app as "EXE1" user
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
    When I enter values into fields
      | Value | Field                      |
      | 3000  | RequestedChangeInBudget__c |
      | 4000  | RevisedCommitment__c       |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                                | Start Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodEndDate} | {SavedValue:updatedBudgetPeriodStartDate} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | End Date                                | Start Date                                |
      | Automation Permanent Focus Area2 | {SavedValue:updatedBudgetPeriodEndDate} | {SavedValue:updatedBudgetPeriodStartDate} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                       | Amendment Request |
      | {SavedValue:EXE1 Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount |
      | Extra Salary | The narrative | 1000         |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount |
      | Extra Salary | The narrative | 1000         |
    When I close "Add Line Items" modal by clicking the top right x button
    And I refresh the page
    #258820
    And I click on "Edit" in the page details
    Then I softly see that "RevisedCommitment__c" rendered in view mode only
    And I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "Record Id" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:amendmentLineItemsTableId---"
    Then I cannot see row level action button "Edit" against "Extra Salary" in flex table with id "---amendment:-:amendmentLineItemsTableId---"

  @258236 @258277 @258316 @258367 @258395 @ValidateNewObligationValueshouldgetpopulatesfromtheNewobligationvaluesfromtheparticularFocusAreasfromtheamendmentrequest @sprint-19-US-250549 @vaibhav @Allocation
  Scenario: Validate New Obligation Value should get populates from the New obligation values from the particular Focus Areas from the amendment request
    And I activated standalone subaward "Automation Runtime award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY-Automation EXE user" of type "Formula_By_Applicant"
    When I login to "As a Grantor" app as "EXE1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 4000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PeriodicID"
    And I pause execution for "5" seconds
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                                | Start Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodEndDate} | {SavedValue:updatedBudgetPeriodStartDate} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | End Date                                | Start Date                                |
      | Automation Permanent Focus Area2 | {SavedValue:updatedBudgetPeriodEndDate} | {SavedValue:updatedBudgetPeriodStartDate} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                       | Amendment Request |
      | {SavedValue:EXE1 Username} | Step 1            |
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
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I save the value from row "1" for column name "New Obligation" as "newObligation" from flex table "---amendment:-:projectAreasTableId---"
    And I save the value from row "2" for column name "New Obligation" as "newObligation1" from flex table "---amendment:-:projectAreasTableId---"
    And I save the value from row "3" for column name "New Obligation" as "newObligation2" from flex table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$1,000.00" for title "New Obligation" against the value "Automation Permanent Focus Area" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$1,000.00" for title "New Obligation" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$2,000.00" for title "New Obligation" against the value "Grand Total" inside table "---amendment:-:projectAreasTableId---"
    And I save the field labeled "Revised Commitment" as "RevisedCommitment"
    Then I softly see field "Revised Commitment" as "$4,000.00"
    Then I softly see value "$2,000.00" for title "Revised Encumbrance" inside table "---amendment:-:amendmentFundingAccountsTableId---"
    When I save the value from row "1" for column name "Revised Encumbrance" as "RevisedEncumbrance" from flex table "---amendment:-:amendmentFundingAccountsTableId---"
    And I click on "Amend Subaward" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I navigate to "Budget" sub tab
    And I save the value from row "1" for column name "New Obligation" as "newObligation3" from flex table "---subAwardStandAlone:-:focusAreaTableId---"
    And I save the value from row "2" for column name "New Obligation" as "newObligation4" from flex table "---subAwardStandAlone:-:focusAreaTableId---"
    And I save the value from row "3" for column name "New Obligation" as "newObligation5" from flex table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$1,000.00" for title "New Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$1,000.00" for title "New Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$2,000.00" for title "New Obligation" against the value "Grand Total" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "{SavedValue:newObligation}" is "Equals to" the value "{SavedValue:newObligation3}"
    Then I softly see value "{SavedValue:newObligation1}" is "Equals to" the value "{SavedValue:newObligation4}"
    Then I softly see value "{SavedValue:newObligation2}" is "Equals to" the value "{SavedValue:newObligation5}"
    #258277
    And I save the field labeled "Total Commitment" as "TotalCommitment"
    Then I softly see field "Total Commitment" as "$4,000.00"
    Then I softly see value "{SavedValue:RevisedCommitment}" is "Equals to" the value "{SavedValue:TotalCommitment}"
    #258367
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation"
    Then I softly see field "Cumulative Obligation" as "$2,000.00"
    Then I softly see value "{SavedValue:RevisedEncumbrance}" is "Equals to" the value "{SavedValue:CumulativeObligation}"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I navigate to "Budget" sub tab
    #258316
    And I save the field labeled "Total Commitment" as "TotalCommitment2"
    Then I softly see field "Total Commitment" as "$4,000.00"
    Then I softly see value "{SavedValue:RevisedCommitment}" is "Equals to" the value "{SavedValue:TotalCommitment2}"
    #258395
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation2"
    Then I softly see field "Cumulative Obligation" as "$2,000.00"
    Then I softly see value "{SavedValue:RevisedEncumbrance}" is "Equals to" the value "{SavedValue:CumulativeObligation2}"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see that "Subaward" is in "Activated" status
    And I navigate to "Budget" sub tab
    And I save the value from row "1" for column name "New Obligation" as "newObligation6" from flex table "---subAwardStandAlone:-:focusAreaTableId---"
    And I save the value from row "2" for column name "New Obligation" as "newObligation7" from flex table "---subAwardStandAlone:-:focusAreaTableId---"
    And I save the value from row "3" for column name "New Obligation" as "newObligation8" from flex table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "{SavedValue:newObligation}" is "Equals to" the value "{SavedValue:newObligation6}"
    Then I softly see value "{SavedValue:newObligation1}" is "Equals to" the value "{SavedValue:newObligation7}"
    Then I softly see value "{SavedValue:newObligation2}" is "Equals to" the value "{SavedValue:newObligation8}"
    Then I softly see value "$1,000.00" for title "New Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$1,000.00" for title "New Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$2,000.00" for title "New Obligation" against the value "Grand Total" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    #258277
    And I save the field labeled "Total Commitment" as "TotalCommitment1"
    Then I softly see field "Total Commitment" as "$4,000.00"
    Then I softly see value "{SavedValue:RevisedCommitment}" is "Equals to" the value "{SavedValue:TotalCommitment1}"
    #258367
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation1"
    Then I softly see field "Cumulative Obligation" as "$2,000.00"
    Then I softly see value "{SavedValue:RevisedEncumbrance}" is "Equals to" the value "{SavedValue:CumulativeObligation1}"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    When I navigate to "Budget" sub tab
    #258316
    And I save the field labeled "Total Commitment" as "TotalCommitment2"
    Then I softly see field "Total Commitment" as "$4,000.00"
    Then I softly see value "{SavedValue:RevisedCommitment}" is "Equals to" the value "{SavedValue:TotalCommitment2}"
    #258395
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation3"
    Then I softly see field "Cumulative Obligation" as "$2,000.00"
    Then I softly see value "{SavedValue:RevisedEncumbrance}" is "Equals to" the value "{SavedValue:CumulativeObligation3}"

  @258309 @258318 @258392 @258396 @ValidateTotalCommitmentfieldshouldcopiedfromtheRevisedCommitmentfieldfromthebudgetsummarysectionfromapprovedamendmentFANo @sprint-19-US-250549 @vaibhav @Allocation
  Scenario: Validate Total Commitment field should copied from the Revised Commitment field from the budget summary section from approved amendment (FA No)
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-Automation EXE user" of type "Formula_By_Applicant_Focus_Area_No"
    When I login to "As a Grantor" app as "EXE1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 4000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PeriodicID"
    And I pause execution for "5" seconds
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                       | Amendment Request |
      | {SavedValue:EXE1 Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 2000                 | 200        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I save the field labeled "Revised Commitment" as "RevisedCommitment"
    Then I softly see field "Revised Commitment" as "$4,000.00"
    Then I softly see value "$2,000.00" for title "Revised Encumbrance" inside table "---amendment:-:amendmentFundingAccountsTableId---"
    When I save the value from row "1" for column name "Revised Encumbrance" as "RevisedEncumbrance" from flex table "---amendment:-:amendmentFundingAccountsTableId---"
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I navigate to "Budget" sub tab
    And I save the field labeled "Total Commitment" as "TotalCommitment"
    Then I softly see field "Total Commitment" as "$4,000.00"
    Then I softly see value "{SavedValue:RevisedCommitment}" is "Equals to" the value "{SavedValue:TotalCommitment}"
    #258392
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation"
    Then I softly see field "Cumulative Obligation" as "$2,000.00"
    Then I softly see value "{SavedValue:RevisedEncumbrance}" is "Equals to" the value "{SavedValue:CumulativeObligation}"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I navigate to "Budget" sub tab
    #258318
    And I save the field labeled "Total Commitment" as "TotalCommitment2"
    Then I softly see field "Total Commitment" as "$4,000.00"
    Then I softly see value "{SavedValue:RevisedCommitment}" is "Equals to" the value "{SavedValue:TotalCommitment2}"
    #258396
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation2"
    Then I softly see field "Cumulative Obligation" as "$2,000.00"
    Then I softly see value "{SavedValue:RevisedEncumbrance}" is "Equals to" the value "{SavedValue:CumulativeObligation2}"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    When I navigate to "Budget" sub tab
    And I save the field labeled "Total Commitment" as "TotalCommitment1"
    Then I softly see field "Total Commitment" as "$4,000.00"
    Then I softly see value "{SavedValue:RevisedCommitment}" is "Equals to" the value "{SavedValue:TotalCommitment1}"
    #258392
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation1"
    Then I softly see field "Cumulative Obligation" as "$2,000.00"
    Then I softly see value "{SavedValue:RevisedEncumbrance}" is "Equals to" the value "{SavedValue:CumulativeObligation1}"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    When I navigate to "Budget" sub tab
    #258318
    And I save the field labeled "Total Commitment" as "TotalCommitment3"
    Then I softly see field "Total Commitment" as "$4,000.00"
    Then I softly see value "{SavedValue:RevisedCommitment}" is "Equals to" the value "{SavedValue:TotalCommitment3}"
    #258396
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation3"
    Then I softly see field "Cumulative Obligation" as "$2,000.00"
    Then I softly see value "{SavedValue:RevisedEncumbrance}" is "Equals to" the value "{SavedValue:CumulativeObligation3}"

  @257448 @257461 @257667 @257691 @257797 @257800 @257479 @ValidateusershouldabletoseeNewObligationissimilarasAwardBudgetthisPeriodincreatedstateofPeriodicRenewalrequestFAYes @sprint-19-US-242374 @vaibhav @Allocation
  Scenario: Validate user should able to see New Obligation is similar as Award Budget this Period in created state of Periodic Renewal request (FA Yes)
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "SECOND_FOCUS_AREA_BY_APPL_RISK_ASS_NO-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "SECOND_BUDGET_CATEGORY"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation EXE user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see that "Subaward" is in "Activated" status
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    #257448
    Then I softly see field "New Obligation" inside page block
    Then I softly cannot see field "Award Budget this Period" inside page block
    And I click on "Edit" in the page details
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 4000  | RevisedCommitment__c       |
    #257461
    Then I softly see fields "RequestedChangeInBudget__c" is in edit mode
    And I click on "Save" in the page details
    Then I softly see field "New Obligation" as "$2,000.00"
    #257667
    Then I softly see field "Budget Redirection Threshold" as "10.00%"
    Then I softly see field "Subrecipient Match (%)" as "10.00%"
    #257691
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly do not see "Funding Change - Focus Areas" page block displayed
    And I save the field labeled "EGMS ID" as "PeriodicID"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date                                | End Date                                |
      | Automation Permanent Focus Area2 | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    #257479
    And I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    Then I softly see that "RequestedChangeInBudget__c" rendered in view mode only
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
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 1000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I wait for "7" seconds
    And I click on "Submit For Approval" in the page details
    #257797,257800
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Budgeted Amount must be equal to the New Obligation in the Budget Summary section.                            |
      | Overview Tab - The New Obligation ($1000.00) must be equal to the total of Revised Encumbrance in the Funding Account ($2000.00) |
    And I click on "Edit" in the page details
    #257461
    Then I softly see fields "RequestedChangeInBudget__c" is in edit mode
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    Then I softly see field "New Obligation" as "$2,000.00"
    And I click on "Submit for Approval" in the page details
    #257479
    Then I see field "Status" as "Submitted for Approval"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "New Obligation" rendered in view mode only
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    #257479
    Then I see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "New Obligation" rendered in view mode only

  @wip @257574 @257623 @257657 @257643 @257651 @257657 @ValidateBudgetAmountshouldRolledupfromthebudgetchangesectionsRevisedAwardAmountcolumnFAYes @sprint-19-US-242374 @vaibhav @Allocation
  Scenario: Validate Budget Amount should Rolled up from the budget change section's Revised Award Amount column(FA Yes)
    Given I activated standalone subaward "Automation Runtime Award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY-Automation EXE user" of type "Formula_By_Applicant"
    When I login to "As a Grantor" app as "EXE1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see field "Total Commitment" as "$1,000.00"
    And I save the field labeled "Total Commitment" as "TotalCommitment"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 4000  | RevisedCommitment__c       |
    #257651
    Then I softly see fields "RevisedCommitment__c" is in edit mode
    And I click on "Save" in the page details
    Then I softly see field "Revised Commitment" as "$4,000.00"
    And I save the field labeled "EGMS ID" as "PeriodicID"
    And I refresh the page
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date                                | End Date                                |
      | Automation Permanent Focus Area2 | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    And I refresh the page
    Then I softly see value "$500.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    Then I softly see value "$500.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I see the following rows under the following headers in table with id "---amendment:-:grantorBudgetChangeTableId---" :
      | Revised Award Amount |
      | $1,000.00            |
    #257623
    Then I softly see field "Current Commitment" as "$1,000.00"
    And I save the field labeled "Current Commitment" as "CurrentCommitment"
    Then I softly see value "{SavedValue:TotalCommitment}" is "Equals to" the value "{SavedValue:CurrentCommitment}"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                       | Amendment Request |
      | {SavedValue:EXE1 Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    #257657
    And I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    Then I softly see that "RevisedCommitment__c" rendered in view mode only
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 500   | RevisedCommitment__c       |
      | 1000  | RequestedChangeInBudget__c |
    #257651
    Then I softly see fields "RevisedCommitment__c" is in edit mode
    And I click on "Save" in the page details
    Then I softly see field "Revised Commitment" as "$500.00"
    And I wait for "7" seconds
    And I click on "Submit for Approval" in the page details
    #257643
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Revised Commitment should be equal to or greater than the total of Cummulative Obligation $2000.00 across all budget periods. |
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 4000  | RevisedCommitment__c       |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I click on "Submit for Approval" in the page details
    #257657
    Then I see field "Status" as "Submitted for Approval"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Revised Commitment" rendered in view mode only
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    #257657
    Then I see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Revised Commitment" rendered in view mode only

  @wip @257716 @257727 @257730 @257802 @257532 @ValidateuserseealltheFocusareaswhichwereassociatedontheannouncementevenwithzeroallocationandcopiedtoawardlaterwhenawardiscreated @sprint-19-US-242374 @vaibhav @Allocation
  Scenario: Validate user see all the Focus areas, which were associated on the announcement even with zero allocation and copied to award later when award is created
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "SECOND_FOCUS_AREA_BY_APPL_RISK_ASS_NO-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation EXE user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "EXE1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PeriodicID"
    And I pause execution for "5" seconds
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$0.00" for title "Budgeted Amount" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$0.00" for title "New Obligation" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:projectAreasTableId---"
    #257727
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I see the following rows under the following headers in table with id "---amendment:-:grantorBudgetChangeTableId---" :
      | Revised Award Amount |
      | $1,000.00            |
    #257730
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:projectAreasTableId---" without waiting for record
    Then I softly see field "NewObligationFormula__c" not in edit mode
    Then I softly see field "BudgetedAmount__c" not in edit mode
    And I click on top right button "Save" in flex table with id "---amendment:-:projectAreasTableId---"
    And I click on "Edit" icon for "Automation Permanent Focus Area2" inside flex table with id "---amendment:-:projectAreasTableId---" without waiting for record
    Then I softly see field "NewObligationFormula__c" not in edit mode
    Then I softly see field "BudgetedAmount__c" not in edit mode
    And I click on top right button "Save" in flex table with id "---amendment:-:projectAreasTableId---"
    Then I softly see value "$1,000.00" for title "Budgeted Amount" against the value "Grand Total" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$1,000.00" for title "New Obligation" against the value "Grand Total" inside table "---amendment:-:projectAreasTableId---"
    #257802
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 0     | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - New Obligation must be greater than $0 |
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | -12   | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - New Obligation must be greater than $0 |
    #257532
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                | Field                      |
      | 20000000000000000.30 | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    #Bug420753
#    Then I softly see the following messages in the page details contains:
#      | New Obligation : Number is too large. |

  @wip @257862 @257907 @257912 @ValidateusercanseeanewsectionofBudgetSummaryinsteadofFundingChangeontheamendmentrequestwhichiscreatedFAYes @sprint-19-US-247769 @vaibhav @Allocation
  Scenario: Validate user can see a new section of "Budget Summary" instead of "Funding Change" on the amendment request which is created (FA Yes)
    And I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "SECOND_FOCUS_AREA_BY_APPL_RISK_ASS_NO-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "SECOND_BUDGET_CATEGORY"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation EXE user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "EXE1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 4000  | RevisedCommitment__c       |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
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
    #257862
    Then I softly see "Budget Summary" page block displayed
    Then I softly do not see "Funding Change" page block displayed
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I refresh the page
    And I wait for "5" seconds
    And I click on "Submit to Grantor" in the page details
    #257907
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Budgeted Amount must be equal to the New Obligation in the Budget Summary section. |
    #257912
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

  @258224 @258225 @258402 @ValidateusershouldabletoseethebudgetsummarybyfocusareasectionshoulddisplaywhenfocusAreaisYes @sprint-19-US-250549 @vaibhav @Allocation
  Scenario Outline: Validate user should able to see the budget summary by focus area section should display when focus Area is Yes
    And I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "SECOND_FOCUS_AREA_BY_APPL_RISK_ASS_NO-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "SECOND_BUDGET_CATEGORY"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation EXE user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "EXE1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 4000  | RevisedCommitment__c       |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                       | Amendment Request |
      | {SavedValue:EXE1 Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I save the field labeled "Revised Commitment" as "RevisedCommitment"
    Then I softly see field "Revised Commitment" as "$4,000.00"
    Then I softly see value "$2,000.00" for title "Revised Encumbrance" inside table "---amendment:-:amendmentFundingAccountsTableId---"
    When I save the value from row "1" for column name "Revised Encumbrance" as "RevisedEncumbrance" from flex table "---amendment:-:amendmentFundingAccountsTableId---"
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I navigate to "Budget" sub tab
    #258402
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    When I re-login to "Grants Portal" app as "<User>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I navigate to "Budget" sub tab
    #258225,258402
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    When I navigate to "Budget" sub tab
    #258402
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    When I re-login to "Grants Portal" app as "<User>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    When I navigate to "Budget" sub tab
    #258225,258402
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"

    Examples:
      | User |
      | SPI3 |
      | SPA  |

  @258405 @ValidateuseraddNewObligationiszero&SpentisalsoZeroFocusAreashouldnotbevisibleonthenewAwardiftheinitialAwardisfromFDM @sprint-19-US-250549 @vaibhav @Allocation @wip
  Scenario: Validate user add New Obligation is zero & Spent is also Zero, Focus Area should not be visible on the new Award if the initial Award is from FDM
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "SECOND_FOCUS_AREA_BY_APPL_RISK_ASS_NO-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation EXE user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see that "Subaward" is in "Activated" status
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 4000  | RevisedCommitment__c       |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I wait for "10" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 2000                 | 200        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I see field "Status" as "Submitted to Grantor"
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
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I navigate to "Budget" sub tab
    Then I softly do not see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    When I navigate to "Budget" sub tab
    Then I softly do not see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"

  @258406 @258412 @ValidatewhentheinitialAwardisnotfromFDMthenthefocusareawithzeroNewObligationshouldbevisible @sprint-19-US-250549 @vaibhav @Allocation
  Scenario: Validate when the initial Award is not from FDM,then the focus area with zero New Obligation should be visible
    And I activated standalone subaward "Automation Runtime award" with properties "SECOND_FOCUS_AREA-Automation EXE user" of type "Formula_By_Applicant"
    When I login to "As a Grantor" app as "EXE1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
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
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I get the "EGMS ID"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                       | Amendment Request |
      | {SavedValue:EXE1 Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 2000                 | 200        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    And I wait for "5" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I wait for "5" seconds
    And I click on "Amend Subaward" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    When I navigate to "Budget" sub tab
    Then I softly see value "$0.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$0.00" for title "New Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I navigate to "Budget" sub tab
    #258412
    Then I softly see value "$0.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see value "$0.00" for title "New Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see that "Subaward" is in "Activated" status
    When I navigate to "Budget" sub tab
    Then I softly see value "$0.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$0.00" for title "New Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see that "Subaward" is in "Activated" status
    When I navigate to "Budget" sub tab
    #258412
    Then I softly see value "$0.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see value "$0.00" for title "New Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"

  @258410 @258414 @258422 @258423 @ValidateCumulativeObligationvalueshouldbereadonlycolumnandRolluptheAwardAmountforeachfocusareafromtheawardbudgetgrid @sprint-19-US-250549 @vaibhav @Allocation
  Scenario: Validate Cumulative Obligation value should be read-only column and Roll up the Award Amount for each focus area from the award budget grid.
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "SECOND_FOCUS_AREA_BY_APPL_RISK_ASS_NO-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "SECOND_BUDGET_CATEGORY"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation EXE user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "EXE1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 4000  | RevisedCommitment__c       |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                       | Amendment Request |
      | {SavedValue:EXE1 Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
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
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
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
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I navigate to "Budget" sub tab
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$2,000.00" for title "Cumulative Obligation" against the value "Grand Total" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Award Amount" against the value "Construction" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I click on page navigation arrow "---subAwardStandAlone:-:subAwardBudgetTableId---" for table id "Next"
    Then I softly see value "$1,000.00" for title "Award Amount" against the value "Construction" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see that "Subaward" is in "Pending Activation" status
    When I navigate to "Budget" sub tab
    #258414
    #Buttons are not visible
#    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
#    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see value "$2,000.00" for title "Cumulative Obligation" against the value "Grand Total" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Award Amount" against the value "Construction" inside table "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    And I click on page navigation arrow "---subAwardStandAlone:-:sRBudgetCategoryTableId---" for table id "Next"
    Then I softly see value "$1,000.00" for title "Award Amount" against the value "Construction" inside table "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    When I navigate to "Budget" sub tab
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation2"
    Then I softly see field "Cumulative Obligation" as "$2,000.00"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$2,000.00" for title "Cumulative Obligation" against the value "Grand Total" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    And I click on parallel menu button in flex table title "Subaward budget"
    And I select "Reset Table" from parallel lines dropdown of "Subaward budget"
    Then I softly see value "$1,000.00" for title "Award Amount" against the value "Construction" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I click on page navigation arrow "---subAwardStandAlone:-:subAwardBudgetTableId---" for table id "Next"
    Then I softly see value "$1,000.00" for title "Award Amount" against the value "Construction" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    #258422
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Budget" sub tab
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation1"
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    Then I softly see field "Status" as "Active"
    When I navigate to "Budget" sub tab
    #258422
    And I save the value from row "3" for column name "Cumulative Obligation" as "CumulativeObligation3" from flex table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    Then I softly see value "$3,000.00" for title "Cumulative Obligation" against the value "Grand Total" inside table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    Then I softly see addition of two fields "{SavedValue:CumulativeObligation1}" and "{SavedValue:CumulativeObligation2}" is equal to "{SavedValue:CumulativeObligation3}"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see that "Subaward" is in "Activated" status
    When I navigate to "Budget" sub tab
    #258414
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see value "$2,000.00" for title "Cumulative Obligation" against the value "Grand Total" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    And I click on parallel menu button in flex table title "Subaward budget"
    And I select "Reset Table" from parallel lines dropdown of "Subaward budget"
    Then I softly see value "$1,000.00" for title "Award Amount" against the value "Construction" inside table "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    And I click on page navigation arrow "---subAwardStandAlone:-:sRBudgetCategoryTableId---" for table id "Next"
    Then I softly see value "$1,000.00" for title "Award Amount" against the value "Construction" inside table "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    #258422
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    Then I softly see field "Status" as "Active"
    And I navigate to "Budget" sub tab
    #258422,258423
    And I save the value from row "3" for column name "Cumulative Obligation" as "CumulativeObligation4" from flex table "---subAwardStandAlone:-:grantSubrecipientFocusAreaTableId---"
    Then I softly see value "$3,000.00" for title "Cumulative Obligation" against the value "Grand Total" inside table "---subAwardStandAlone:-:grantSubrecipientFocusAreaTableId---"
    Then I softly see addition of two fields "{SavedValue:CumulativeObligation1}" and "{SavedValue:CumulativeObligation2}" is equal to "{SavedValue:CumulativeObligation4}"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
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
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Completed" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---closeout:-:grantsTableId---"
    Then I softly see field "Status" as "Closed/Completed"
    When I navigate to "Budget" sub tab
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation5"
    #258422
    And I save the value from row "3" for column name "Cumulative Obligation" as "CumulativeObligation5" from flex table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    Then I softly see value "$3,000.00" for title "Cumulative Obligation" against the value "Grand Total" inside table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    Then I softly see addition of two fields "{SavedValue:CumulativeObligation1}" and "{SavedValue:CumulativeObligation2}" is equal to "{SavedValue:CumulativeObligation5}"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    Then I softly see field "Status" as "Closed/Completed"
    And I navigate to "Budget" sub tab
    #258422,258423
    And I save the value from row "3" for column name "Cumulative Obligation" as "CumulativeObligation6" from flex table "---subAwardStandAlone:-:grantSubrecipientFocusAreaTableId---"
    Then I softly see value "$3,000.00" for title "Cumulative Obligation" against the value "Grand Total" inside table "---subAwardStandAlone:-:grantSubrecipientFocusAreaTableId---"
    Then I softly see addition of two fields "{SavedValue:CumulativeObligation1}" and "{SavedValue:CumulativeObligation2}" is equal to "{SavedValue:CumulativeObligation6}"

  @258596 @ValidateCompPOusercanseecorrectamountdisplayinPreEncumbranceAppropriationAmountEncumbranceSpentTotalObligationandAvailableBalanceunderfundingaccount @sprint-19-US-250551 @vaibhav @Allocation
  Scenario: Validate Comp PO user can see correct $ amount display in Pre-Encumbrance, Appropriation Amount, Encumbrance, Spent, Total Obligation and Available Balance under funding account
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" and properties "SECOND_FOCUS_AREA_BY_APPL_RISK_ASS_NO-Automation PO user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "SECOND_BUDGET_CATEGORY"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PO user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
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
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I get the "EGMS ID"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 2000                 | 200        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                        | Revised Encumbrance |
      | {SavedValue:FundingAccount2} | 2000                |
    And I wait for "5" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I wait for "5" seconds
    And I click on "Amend Subaward" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    When I navigate to "Budget" sub tab
    And I click in table hyperlink containing value "{SavedValue:FundingAccount2}"
    Then I see the header is "Funding Account" in the page details
    Then I softly see field "Pre-Encumbrance" as "$4,000.00"
    Then I softly see field "Encumbrance" as "$11,000.00"
    Then I softly see field "Spent" as "$0.00"
    Then I softly see field "Total Obligation" as "$15,000.00"
    Then I softly see field "Available Balance" as "$985,000.00"
    Then I softly see field "Appropriation Amount" as "$1,000,000.00"

  @248483 @ValidateDirectAnnEXEusershouldnotseeFocusAreawithZeroObligationunderbudgetsummarybyfocusareasectiononGrantunderbudgettabisinClosedStatewhenselectAllocationTypeisNA&FocusAreaisYES @sprint-21-US-263183 @vaibhav @Allocation
  Scenario: Validate Direct Ann EXE user should not see Focus Area with Zero Obligation under 'budget summary by focus area' section on Grant under budget tab is in Closed State when select Allocation Type is NA & Focus Area is 'YES'
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "SECOND_FOCUS_AREA_RISK_ASS_NO-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation EXE user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 4000  | RevisedCommitment__c       |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
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
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 2000                 | 200        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 0                    | 0          | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
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
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
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
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Completed" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---closeout:-:grantsTableId---"
    Then I softly see field "Status" as "Closed/Completed"
    When I navigate to "Budget" sub tab
    Then I softly do not see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"

  @ValidateDirectAnnPMusershouldseeupdatevaluesinCumulativeObligation&TotalCommitmentfieldsunderBudgetSummarysectionofBudgettabisinClosestateonGrantlayout @sprint-21-US-263183 @vaibhav @Allocation
  Scenario: Validate Direct Ann PM user should see update values in Cumulative Obligation & Total Commitment fields under Budget Summary section of Budget tab is in Close state on Grant layout
    And I activated standalone subaward "Automation Runtime Award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Directed"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 4000  | RevisedCommitment__c       |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I pause execution for "5" seconds
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
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
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
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
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate" in the page details
    And I pause execution for "3" seconds
    And I refresh the page
    Then I softly see field "Status" as "Activated"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
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
      | Closeout | Name          |
      | Step 1   | Automation PM |
    And I pause execution for "2" seconds
    And I refresh the page
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
    When I "Approve" in the approval decision
    And I refresh the page
    Then I softly see status in Progress-bar is "Completed" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---closeout:-:grantsTableId---"
    Then I softly see field "Status" as "Closed/Completed"
    When I navigate to "Budget" sub tab
    Then I softly see field "Cumulative Obligation" as "$3,000.00"
    Then I softly see field "Total Commitment" as "$4,000.00"

  @wip @256668 @256677 @256710 @256715 @256717 @256718 @256721 @256803 @256808 @256838 @256841 @256842 @256843 @256844 @256850 @256861 @256864 @256919 @256924 @256925 @256930 @256934 @256940 @256944 @256951 @256956 @256972 @308952 @VerifyFieldsdisplayedtoFOuseroninthebudgetsummarySection @sprint-19-US-229281 @hitesh @Allocation
  Scenario:Verify Fields displayed to FO user on in the budget summary Section
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Directed"
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see field "Total Commitment" as "$1,000.00"
    And I save the field labeled "Total Commitment" as "TotalCommitment"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    #256864
    When I click on top right button "Associate" in flex table with id "---amendment:-:projectAreasTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---amendment:-:focusAreaTableId---"
    Then I softly see that "Automation Permanent Focus Area2" has been added in flextable with Id "---amendment:-:projectAreasTableId---"
    When I click on "Remove" icon for "Automation Permanent Focus Area2" inside flex table with id "---amendment:-:projectAreasTableId---" without waiting for record
    And I refresh the page
    Then I softly do not see value "Automation Permanent Focus Area2" for title "Title" inside table "---amendment:-:projectAreasTableId---"
    And I pause execution for "3" seconds
    #Need to check this with Abhisek
#    When I click on "Remove" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:projectAreasTableId---" without waiting for record
#    Then I softly see the following messages in the page details contains:
#      | You cannot delete this Focus Area as the Budgeted Amount is not zero. |
    #256668
    Then I softly see field "New Obligation" inside page block
    Then I softly see field "Budgeted Amount" inside page block
    Then I softly see "Current Commitment" inside page block detail
    Then I softly see "Revised Commitment" inside page block detail
    Then I softly see "Subrecipient Match (%)" inside page block detail
    Then I softly see "Budget Redirection Threshold" inside page block detail
    #256861
    Then I softly can see page block "Budget Summary by Focus Area"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:projectAreasTableId---" without waiting for record
    Then I softly see field "NewObligationFormula__c" not in edit mode
    And I save the value from row "1" for column name "New Obligation" as "NewObligation" from flex table "---amendment:-:projectAreasTableId---"
    And I save the value from row "1" for column name "Budgeted Amount" as "BudgetedAmount" from flex table "---amendment:-:projectAreasTableId---"
    Then I softly see value "{SavedValue:NewObligation}" is "Equals to" the value "{SavedValue:BudgetedAmount}"
    #256677
    When I click on "Edit" in the page details
    Then I softly see that "Budgeted Amount" rendered in view mode only
    Then I softly see that "Current Commitment" rendered in view mode only
    Then I softly see that "Subrecipient Match" rendered in view mode only
    When I click on "Save" in the page details
    #256710
    Then I softly see field "New Obligation" inside page block
    Then I softly cannot see field "Award Budget this Period" inside page block
    #256715
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value  | Field                      |
      | -10000 | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "Record Id"
    And I wait for "9" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - New Obligation must be greater than $0 |
    #256721
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value                | Field                      |
      | 20000000000000000.30 | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    #Bug420753
#    Then I softly see the following messages in the page details contains:
#      | New Obligation : Number is too large. |
    When I enter values into fields
      | Value | Field                      |
      | 10000 | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    #256842
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value                | Field                |
      | 20000000000000000.30 | RevisedCommitment__c |
    And I click on "Save" in the page details
    #Bug420758
#    Then I softly see the following messages in the page details contains:
#      | Revised Commitment : Number is too large. |
    #256838
    When I enter values into fields
      | Value | Field                |
      | 11000 | RevisedCommitment__c |
    When I click on "Save" in the page details
    Then I softly see field "Revised Commitment" as "$11,000.00"
    #256718
    Then I see field "New Obligation" as "$10,000.00"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    #256919
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter values into fields
      | Value | Field                      |
      | 0     | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    And I wait for "9" seconds
    Then I softly see the following messages in the page details contains:
      | Overview Tab - New Obligation must be greater than $0 |
    #256924
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I clear the value from field "RequestedChangeInBudget__c"
    When I click on "Save" in the page details
    And I wait for "9" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - New Obligation must be greater than $0 |
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter values into fields
      | Value | Field                      |
      | 10000 | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    #308952
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 11000 | RevisedCommitment__c |
    And I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    #256843
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see that "New Obligation" rendered in view mode only
    Then I softly see that "Revised Commitment" rendered in view mode only
    When I click on "Save" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 10000                | 1000       | 0              |
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    #256841
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter values into fields
      | Value | Field                |
      | 11000 | RevisedCommitment__c |
    When I click on "Save" in the page details
    Then I softly see field "Revised Commitment" as "$11,000.00"
    #256808
    Then I softly see field "Current Commitment" as "$1,000.00"
    And I save the field labeled "Current Commitment" as "CurrentCommitment"
    Then I softly see value "{SavedValue:TotalCommitment}" is "Equals to" the value "{SavedValue:CurrentCommitment}"
    #256803
    Then I softly see field "Budgeted Amount" as "$10,000.00"
    Then I softly see value "$10,000.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    #256944
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 11000               |
    And I wait for "9" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The New Obligation ($10000.00) must be equal to the total of Revised Encumbrance in the Funding Account ($11000.00) |
    #256951
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 8000                |
    And I wait for "9" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The New Obligation ($10000.00) must be equal to the total of Revised Encumbrance in the Funding Account ($8000.00) |
          #256717
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter values into fields
      | Value  | Field                      |
      | -10000 | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - New Obligation must be greater than $0 |
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter values into fields
      | Value | Field                      |
      | 8000  | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    And I wait for "9" seconds
    And I click on "Submit for Approval" in the page details
    #256930
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Budgeted Amount must be equal to the New Obligation in the Budget Summary section. |
    #256934
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter values into fields
      | Value | Field                      |
      | 12000 | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    And I wait for "9" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Budgeted Amount must be equal to the New Obligation in the Budget Summary section. |
    #256972
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 2000  | RevisedCommitment__c |
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Revised Commitment should be equal to or greater than the total of Cummulative Obligation $13000.00 across all budget periods. |
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 11000 | RevisedCommitment__c |
    And I click on "Save" in the page details
      #256490
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter values into fields
      | Value | Field                      |
      | 10000 | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 10000               |
    #256956
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    #256844
    When I navigate to "Overview" sub tab
    Then I softly see that "New Obligation" rendered in view mode only
    Then I softly see that "Revised Commitment" rendered in view mode only
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    #256850
    When I navigate to "Overview" sub tab
    Then I softly see that "New Obligation" rendered in view mode only
    Then I softly see that "Revised Commitment" rendered in view mode only

  @wip @257055 @VerifyvalidationisnotdisplayedtoFOuseronsenttoSrwhenuserenterRevisedCommitmentgreaterthanNewobligationincurrentAR+cumulativeobligationinGrantWhenFAYes @sprint-19-US-229281 @hitesh @Allocation
  Scenario:Verify validation is not displayed to FO user on sent to Sr when user enter Revised Commitment greater than New obligation in current AR cumulative obligation in Grant When FA Yes
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Directed"
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date           | Start Date         |
      | Automation Permanent Focus Area | {SavedValue:PBPED} | {SavedValue:PBPSD} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | End Date           | Start Date         |
      | Automation Permanent Focus Area2 | {SavedValue:PBPED} | {SavedValue:PBPSD} |
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 10000 | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 40000 | RevisedCommitment__c |
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"

  @268291 @ValidatespentvalueiscopiedtothePaymentsummarysectionofActivatedAwardfromCarryforwardamendmentafterPaymentrequestisapprovedwhenFANO @sprint-21-US-265880 @vaibhav @Allocation
  Scenario: Validate spent value is copied to the Payment summary section of Activated Award from Carry forward amendment after Payment request is approved when FA NO
    And I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-Automation PO user" of type "Formula_By_Applicant_Focus_Area_No"
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
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 4000  | RevisedCommitment__c       |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
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
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 2000                 | 200        | 0              |
    And I refresh the page
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
      | Construction    | 2500                 | 250        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2500                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Amend Subaward" in the page details
    And I wait for "4" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    When I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$0.00"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
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
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 500                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                      | Reimbursement |
      | {SavedValue:EXE Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Paid" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$500.00"
    Then I softly see field "Balance" as "$2,000.00"

  @268294 @ValidatespentvalueiscopiedtothePaymentsummarybythefocusareasectionofActivatedAwardfromPeriodicrenewalamendmentafterPaymentrequestisapprovedFAYes @sprint-21-US-265880 @vaibhav @Allocation
  Scenario: Validate spent value is copied to the  Payment summary by the focus area section of Activated Award from Periodic renewal amendment after Payment request is approved FA Yes
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NO_RISK_ASSESSMENT-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation EXE user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Spent This Action |
      | Construction    | 500               |
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
    And I pause execution for "5" seconds
    And I refresh the page
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Paid" and is "dark blue"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId1"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 4000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PeriodicID"
    And I pause execution for "5" seconds
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    When I click on top right button "Associate" in flex table with id "---amendment:-:projectAreasTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---amendment:-:focusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date                                | End Date                                |
      | Automation Permanent Focus Area2 | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FD Username} | Step 1            |
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
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see that "Subaward" is in "Activated" status
    When I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$0.00"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Spent This Action |
      | Construction    | 300               |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 300                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:PM Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Paid" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    Then I softly see value "$1,000.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    Then I softly see value "$2,000.00" for title "Cumulative Obligation" against the value "Total" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    Then I softly see value "$0.00" for title "Spent" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    Then I softly see value "$0.00" for title "Spent" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    Then I softly see value "$0.00" for title "Spent" against the value "Total" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Balance" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Balance" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    Then I softly see value "$2,000.00" for title "Balance" against the value "Total" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I navigate to "Actuals" sub tab
    Then I softly see value "$2,000.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    Then I softly see value "$3,000.00" for title "Cumulative Obligation" against the value "Total" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    Then I softly see value "$800.00" for title "Spent" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    Then I softly see value "$0.00" for title "Spent" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    Then I softly see value "$800.00" for title "Spent" against the value "Total" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    Then I softly see value "$1,200.00" for title "Balance" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Balance" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    Then I softly see value "$2,200.00" for title "Balance" against the value "Total" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"

  @257069 @VerifyValuesonFundingaccountarecorrectlyupdatedafterAmendmentrequestisapproved @sprint-19-US-229281 @hitesh @Allocation
  Scenario: Validate Values on Funding account are correctly updated after Amendment request is approved
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_Directed" values from "Award_Field_Values.xlsx"
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
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodDate"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account2" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                          | End Date                      |
      | Automation Permanent Focus Area | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodDate} |
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---subAwardStandAlone:-:associateModalTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date                          | End Date                      |
      | Automation Permanent Focus Area2 | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodDate} |
    And I save the value from row "1" for column name "Funding Account" as "FundingAccount2" from flex table "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Encumbrance |
      | {SavedValue:FundingAccount2} | 1000        |
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
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 1 |
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
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
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
    When I navigate to "Budget" sub tab
    And I click in table hyperlink containing value "{SavedValue:FundingAccount2}"
    Then I see the header is "Funding Account" in the page details
    And I save the field labeled "Appropriation Amount" as "AppropriationAmount"
    And I save the field labeled "Pre-Encumbrance" as "PreEncumbrance"
    And I save the field labeled "Encumbrance" as "Encumbrance"
    And I save the field labeled "Spent" as "Spent"
    And I save the field labeled "Total Obligation" as "TotalObligation"
    And I save the field labeled "Available Balance" as "AvailableBalance"
    And I switch to parent tab
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "Record Id"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 2000  | RevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Revised Encumbrance |
      | {SavedValue:FundingAccount2} | 1000                |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click in table hyperlink containing value "{SavedValue:FundingAccount2}"
    Then I see the header is "Funding Account" in the page details
    And I save the field labeled "Appropriation Amount" as "AppropriationAmount1"
    And I save the field labeled "Pre-Encumbrance" as "PreEncumbrance1"
    And I save the field labeled "Encumbrance" as "Encumbrance1"
    And I save the field labeled "Spent" as "Spent1"
    And I save the field labeled "Total Obligation" as "TotalObligation1"
    And I save the field labeled "Available Balance" as "AvailableBalance1"
    Then I softly see value "{SavedValue:AppropriationAmount}" is "Equals to" the value "{SavedValue:AppropriationAmount1}"
    Then I softly see value "{SavedValue:PreEncumbrance}" is "Equals to" the value "{SavedValue:PreEncumbrance1}"
    Then I softly see value "{SavedValue:Encumbrance}" is "Equals to" the value "{SavedValue:Encumbrance1}"
    Then I softly see value "{SavedValue:Spent}" is "Equals to" the value "{SavedValue:Spent1}"
    Then I softly see value "{SavedValue:TotalObligation}" is "Equals to" the value "{SavedValue:TotalObligation1}"
    Then I softly see value "{SavedValue:AvailableBalance}" is "Equals to" the value "{SavedValue:AvailableBalance1}"

  @wip @257077 @308950 @VerifyNewObligationfieldisaneditablefieldandusercannotenternegativevalueinNewObligationfieldwhenamendmentisincreatedstateFANO @sprint-19-US-229281 @hitesh @Allocation
  Scenario: Verify New Obligation field is an editable field and user cannot enter negative value in New Obligation field when amendment is in created state FA NO
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Directed"
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value  | Field                      |
      | -10000 | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - New Obligation must be greater than $0 |
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 10000 | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 10000               |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "Record Id"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 10000                | 1000       | 0              |
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value  | Field                      |
      | -10000 | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - New Obligation must be greater than $0 |

  @wip @256855 @257074 @VerifyFDusercannotseeanewsectionofBudgetSummarybyFocusAreawhenFocusAreaisNo @sprint-19-US-229281 @hitesh @Allocation
  Scenario: Verify FD user cannot see a new section of Budget Summary by Focus Area when Focus Area is No
    And I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "FOCUS_AREA_NO-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly do not see "Budget Summary by Focus Area" page block displayed
    #257074
    Then I softly see field "New Obligation" inside page block
    Then I softly see field "Budgeted Amount" inside page block
    Then I softly see "Current Commitment" inside page block detail
    Then I softly see "Revised Commitment" inside page block detail
    Then I softly see "Subrecipient Match (%)" inside page block detail
    Then I softly see "Budget Redirection Threshold" inside page block detail

  @wip @257051 @VerifyvalidationisdisplayedtoFDuseronSubmitforapprovalwhenuserenterRevisedCommitmentlessthanNewobligationincurrentARcumulativeobligationinGrantWhenFANo @sprint-19-US-229281 @hitesh @Allocation
  Scenario: Verify validation is displayed to FD user on Submit for approval when user enter Revised Commitment less than New obligation in current AR + cumulative obligation in Grant When FANo
    And I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "FOCUS_AREA_NO-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 10000 | RequestedChangeInBudget__c |
    When I enter values into fields
      | Value | Field                |
      | 20000 | RevisedCommitment__c |
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 10000               |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "Record Id"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 10000                | 1000       | 0              |
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 10000 | RequestedChangeInBudget__c |
    When I enter values into fields
      | Value | Field                |
      | 5000  | RevisedCommitment__c |
    And I click on "Save" in the page details
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Revised Commitment should be equal to or greater than the total of Cummulative Obligation $11000.00 across all budget periods. |

  @wip @257057 @VerifyvalidationisnotdisplayedtoFDuseronsubmitforapprovalwhenuserenterRevisedCommitmentequaltoNewobligationincurrentARcumulativeobligationinGrantWhenFANo @sprint-19-US-229281 @hitesh @Allocation
  Scenario: Verify validation is not displayed to FD user on submit for approval when user enter Revised Commitment equal to New obligation in current AR cumulative obligation in Grant When FA No
    And I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "FOCUS_AREA_NO-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 10000 | RequestedChangeInBudget__c |
    When I enter values into fields
      | Value | Field                |
      | 20000 | RevisedCommitment__c |
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 10000               |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "Record Id"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 10000                | 1000       | 0              |
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 10000 | RequestedChangeInBudget__c |
    When I enter values into fields
      | Value | Field                |
      | 11000 | RevisedCommitment__c |
    And I click on "Save" in the page details
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"

  @wip @256959 @257081 @257080 @VerifyvalidationisnotdisplayedtoFDuserwhenNewObligationisequaltoRevisedEncumbrancewhenfocusareaisNo @sprint-19-US-229281 @hitesh @Allocation
  Scenario: Verify validation is not displayed to FD user when New Obligation is equal to Revised Encumbrance when focus area is No
    And I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "FOCUS_AREA_NO-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value                | Field                      |
      | 20000000000000000.30 | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    #257081 #Bug420753
#    Then I softly see the following messages in the page details contains:
#      | New Obligation : Number is too large. |
    #257080
    When I enter values into fields
      | Value | Field                      |
      | 10000 | RequestedChangeInBudget__c |
    When I enter values into fields
      | Value | Field                |
      | 11000 | RevisedCommitment__c |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 10000               |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "Record Id"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 10000                | 1000       | 0              |
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 10000 | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    Then I softly see field "Budgeted Amount" as "$10,000.00"
    Then I softly see value "$10,000.00" for title "Revised Encumbrance" inside table "---amendment:-:amendmentFundingAccountsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"

  @wip @257075 @257086 @VerifyFDusercanseeBudgetedAmountCurrentCommitmentSubrecipientMatchasreadonlyfieldsinBudgetsummarysectionwhenAmendmentisincreatedstateFANO @sprint-19-US-229281 @hitesh @Allocation
  Scenario: Verify FD user can see Budgeted Amount, Current Commitment, Subrecipient Match  as read only fields in Budget summary section when Amendment is in created state FA NO
    And I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "FOCUS_AREA_NO-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    Then I softly see that "Budgeted Amount" rendered in view mode only
    Then I softly see that "Current Commitment" rendered in view mode only
    Then I softly see that "Subrecipient Match" rendered in view mode only
    When I enter values into fields
      | Value | Field                      |
      | 10000 | RequestedChangeInBudget__c |
    When I enter values into fields
      | Value | Field                |
      | 20000 | RevisedCommitment__c |
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 10000               |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "Record Id"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 10000                | 1000       | 0              |
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    #257086
    When I enter values into fields
      | Value | Field                |
      | 30000 | RevisedCommitment__c |
    When I click on "Save" in the page details
    Then I softly see field "Revised Commitment" as "$30,000.00"

  @wip @257083 @VerifyCurrentCommitmentfieldvalueiscopiedfromtotalcommitmentfromtheawardonwhichrequestiscreatedFANo @sprint-19-US-229281 @hitesh @Allocation
  Scenario: Verify Current Commitment field value is copied from total commitment from the award on which request is created FA No
    And I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "FOCUS_AREA_NO-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see field "Total Commitment" as "$1,000.00"
    And I save the field labeled "Total Commitment" as "TotalCommitment"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "Current Commitment" as "$1,000.00"
    And I save the field labeled "Current Commitment" as "CurrentCommitment"
    Then I softly see value "{SavedValue:TotalCommitment}" is "Equals to" the value "{SavedValue:CurrentCommitment}"

  @wip @256952 @VerifyvalidationisdisplayedtoFDuserwhenNewObligationisgreaterthantheRevisedEncumbrancewhenfocusareaisNo @sprint-19-US-229281 @hitesh @Allocation
  Scenario: Verify validation is displayed to FD user when New Obligation is greater than the Revised Encumbrance when focus area is No
    And I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "FOCUS_AREA_NO-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 10000 | RequestedChangeInBudget__c |
    When I enter values into fields
      | Value | Field                |
      | 10000 | RevisedCommitment__c |
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 6000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "Record Id"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 10000                | 1000       | 0              |
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter values into fields
      | Value | Field                      |
      | 20000 | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I wait for "9" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The New Obligation ($20000.00) must be equal to the total of Revised Encumbrance in the Funding Account ($6000.00) |

  @wip @256948 @VerifyvalidationisdisplayedtoFDuserwhenNewObligationislessthantheRevisedEncumbrancewhenfocusareaisNo @sprint-19-US-229281 @hitesh @Allocation
  Scenario: Verify validation is displayed to FD user when New Obligation is less than the Revised Encumbrance when focus area is No
    And I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "FOCUS_AREA_NO-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 10000 | RequestedChangeInBudget__c |
    When I enter values into fields
      | Value | Field                |
      | 20000 | RevisedCommitment__c |
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 20000               |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "Record Id"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 10000                | 1000       | 0              |
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 10000 | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I click on "Submit for Approval" in the page details
    And I pause execution for "9" seconds
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The New Obligation ($10000.00) must be equal to the total of Revised Encumbrance in the Funding Account ($20000.00) |

  @wip @257082 @256931 @256935 @256941 @DirectedVerifyvaluedisplayedforRolleBudgetedAmountfieldfromthebudgetchangesectionsRevisedAwardAmountcolumnFANo @sprint-19-US-229281 @hitesh @Allocation
  Scenario: Directed Verify value displayed for Rolle Budgeted Amount field from the budget change section's Revised Award Amount column FA No
    And I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "FOCUS_AREA_NO-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 10000 | RequestedChangeInBudget__c |
    When I enter values into fields
      | Value | Field                |
      | 20000 | RevisedCommitment__c |
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 10000               |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "Record Id"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 10000                | 1000       | 0              |
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    #257082
    Then I softly see value "$10,000.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly see field "Budgeted Amount" as "$10,000.00"
    Then I see the following rows under the following headers in table with id "---amendment:-:grantorBudgetChangeTableId---" :
      | Revised Award Amount |
      | $10,000.00           |
    #256931
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter values into fields
      | Value | Field                      |
      | 5000  | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Budgeted Amount must be equal to the New Obligation in the Budget Summary section |
    #256935
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter values into fields
      | Value | Field                      |
      | 20000 | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Budgeted Amount must be equal to the New Obligation in the Budget Summary section |
    #256941
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter values into fields
      | Value | Field                      |
      | 10000 | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"

  @257728 @ValidateBudgetedAmountshouldberolledfromtherevisedawardamountcolumnfrombudgetedgridFAYes @sprint-19-US-242374 @vaibhav @Allocation
  Scenario: Validate Budgeted Amount should be rolled from the revised award amount column from budgeted grid(FA=Yes)
    And I activated standalone subaward "Automation Runtime award" with properties "THREE_FOCUS_AREA_NO_BUDGET_CATEGORY_THIRD_FOCUS-Automation EXE user" of type "Formula_By_Applicant"
    When I login to "As a Grantor" app as "EXE1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 1500  | RequestedChangeInBudget__c |
      | 4000  | RevisedCommitment__c       |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    Then I softly see value "$500.00" for title "Budgeted Amount" against the value "Automation Permanent Focus Area" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$500.00" for title "Budgeted Amount" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$1,000.00" for title "Budgeted Amount" against the value "Grand Total" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$500.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    Then I softly see value "$500.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    Then I softly see value "$0.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I see the following rows under the following headers in table with id "---amendment:-:grantorBudgetChangeTableId---" :
      | Revised Award Amount |
      | $1,000.00            |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                       | Amendment Request |
      | {SavedValue:EXE1 Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see value "$1,000.00" for title "Budgeted Amount" against the value "Automation Permanent Focus Area" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$500.00" for title "Budgeted Amount" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$1,500.00" for title "Budgeted Amount" against the value "Grand Total" inside table "---amendment:-:projectAreasTableId---"
    And I click on parallel menu button in flex table title "Budget Change"
    And I select "Reset Table" from parallel lines dropdown of "Budget Change"
    Then I softly see value "$1,000.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    Then I softly see value "$500.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    Then I softly see value "$0.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I see the following rows under the following headers in table with id "---amendment:-:grantorBudgetChangeTableId---" :
      | Revised Award Amount |
      | $1,500.00            |
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 2500  | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    And I click on "Send Back to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on parallel menu button in flex table title "Budget Change"
    And I select "Reset Table" from parallel lines dropdown of "Budget Change"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1500                 | 150        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see value "$1,000.00" for title "Budgeted Amount" against the value "Automation Permanent Focus Area" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$1,500.00" for title "Budgeted Amount" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$2,500.00" for title "Budgeted Amount" against the value "Grand Total" inside table "---amendment:-:projectAreasTableId---"
    And I click on parallel menu button in flex table title "Budget Change"
    And I select "Reset Table" from parallel lines dropdown of "Budget Change"
    Then I softly see value "$1,000.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    Then I softly see value "$1,500.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    Then I softly see value "$0.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I see the following rows under the following headers in table with id "---amendment:-:grantorBudgetChangeTableId---" :
      | Revised Award Amount |
      | $2,500.00            |

  @256862 @ValidateFOusercanseeBudgetedAmountcolumnvalueasRollupfromthebudgetgridsRevisedAwardAmountColumn @sprint-19-US-229281 @vaibhav @Allocation
  Scenario: Validate FO user can see Budgeted Amount column value as Rollup from the budget grid's Revised Award Amount Column
    And I activated standalone subaward "Automation Runtime award" with properties "THREE_FOCUS_AREA_NO_BUDGET_CATEGORY_THIRD_FOCUS" of type "Directed"
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 1500  | RequestedChangeInBudget__c |
      | 4000  | RevisedCommitment__c       |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    Then I softly see value "$500.00" for title "Budgeted Amount" against the value "Automation Permanent Focus Area" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$500.00" for title "Budgeted Amount" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$1,000.00" for title "Budgeted Amount" against the value "Grand Total" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$500.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    Then I softly see value "$500.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
#    Then I softly see value "$0.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I see the following rows under the following headers in table with id "---amendment:-:grantorBudgetChangeTableId---" :
      | Revised Award Amount |
      | $1,000.00            |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                       | Amendment Request |
      | {SavedValue:EXE1 Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see value "$1,000.00" for title "Budgeted Amount" against the value "Automation Permanent Focus Area" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$500.00" for title "Budgeted Amount" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$1,500.00" for title "Budgeted Amount" against the value "Grand Total" inside table "---amendment:-:projectAreasTableId---"
    And I click on parallel menu button in flex table title "Budget Change"
    And I select "Reset Table" from parallel lines dropdown of "Budget Change"
    Then I softly see value "$1,000.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    Then I softly see value "$500.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    Then I softly see value "$0.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I see the following rows under the following headers in table with id "---amendment:-:grantorBudgetChangeTableId---" :
      | Revised Award Amount |
      | $1,500.00            |
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 2500  | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    And I click on "Send Back to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on parallel menu button in flex table title "Budget Change"
    And I select "Reset Table" from parallel lines dropdown of "Budget Change"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1500                 | 150        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see value "$1,000.00" for title "Budgeted Amount" against the value "Automation Permanent Focus Area" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$1,500.00" for title "Budgeted Amount" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$2,500.00" for title "Budgeted Amount" against the value "Grand Total" inside table "---amendment:-:projectAreasTableId---"
    And I click on parallel menu button in flex table title "Budget Change"
    And I select "Reset Table" from parallel lines dropdown of "Budget Change"
    Then I softly see value "$1,000.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    Then I softly see value "$1,500.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    Then I softly see value "$0.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I see the following rows under the following headers in table with id "---amendment:-:grantorBudgetChangeTableId---" :
      | Revised Award Amount |
      | $2,500.00            |

  @264151 @264152 @264574 @264576 @264586 @264768 @264797 @308967 @265760 @ValidatePOusercanseeBudgetedAmountasRolledupfromthebudgetchangesectionsRevisedAwardAmountcolumn @sprint-20-US-228432-244399 @vaibhav @Allocation
  Scenario: Validate PO user can see Budgeted Amount as Rolled up from the budget change sections Revised Award Amount column
    And I activated standalone subaward "Automation Runtime award" with properties "SECOND_FOCUS_AREA_BUD_CAT_SUB_ORG_IND-Automation PO user" of type "Formula_By_Applicant_Focus_Area"
    When I login to "As a Grantor" app as "PO" user
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
      | Value | Field                |
      | 4000  | RevisedCommitment__c |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
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
    And I refresh the page
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
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId1"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Spent This Action |
      | Construction    | 200               |
    And I click on page navigation arrow "---paymentRequest:-:paymentRequestBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Spent This Action |
      | Construction    | 300               |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 500                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:PO Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    And I wait for "5" seconds
    When I "Approve" in the approval decision
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Paid" and is "dark blue"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
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
    And I wait for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    And I refresh the page
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #264151
    Then I softly see field "Carry Forward Amount" as "$0.00"
    And I edit the following rows inline in flex table with id "---amendment:-:carryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Carry Forward Amount |
      | Automation Permanent Focus Area | 200                  |
    And I edit the following rows inline in flex table with id "---amendment:-:carryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Carry Forward Amount |
      | Automation Permanent Focus Area2 | 500                  |
    #264151,264152
    Then I softly see field "Carry Forward Amount" as "$700.00"
    Then I softly see field "Current Obligation" as "$2,000.00"
    Then I softly see field "Revised Obligation" as "$2,700.00"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 200           |
    And I expand nested table containing column value "BP01"
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1200                 | 120        | 0              |
    And I click on page navigation arrow "---progressReport:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I refresh the page
    Then I softly see field "Budgeted Amount" as "$2,700.00"
    And I wait for "10" seconds
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    Then I softly see value "$1,200.00" for title "Budgeted Amount" against the value "Automation Permanent Focus Area" inside table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly see value "$1,500.00" for title "Budgeted Amount" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly see value "$2,700.00" for title "Budgeted Amount" against the value "Grand Total" inside table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly see value "$1,200.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    Then I softly see value "$1,500.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I see the following rows under the following headers in table with id "---amendment:-:grantorBudgetChangeTableId---" :
      | Revised Award Amount |
      | $2,700.00            |
    #264576
    When I click on "Edit" in the page details
    Then I softly see that "Current Obligation" rendered in view mode only
    Then I softly see that "Spent" rendered in view mode only
    Then I softly see that "Revised Obligation" rendered in view mode only
    Then I softly see that "Budgeted Amount" rendered in view mode only
    Then I softly see that "Current Commitment" rendered in view mode only
    Then I softly see that "Revised Commitment" rendered in view mode only
    Then I softly see that "Carry Forward Amount" rendered in view mode only
    When I click on "Save" in the page details
    #264586
    Then I softly see field "Carry Forward Amount" as "$700.00"
    #264768
    Then I softly see field "Revised Obligation" as "$2,700.00"
    #264797
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    #308967
    And I edit the following rows inline in flex table with id "---amendment:-:grantorCarryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Carry Forward Amount |
      | Automation Permanent Focus Area | 100                  |
    And I wait for "9" seconds
    When I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Carry Forward Amount in the budget period section must be equal to the Carry Forward amount on the Budget Summary by Focus Area Section for the Following Focus areas - (Automation Permanent Focus Area) |
    #265760
    And I edit the following rows inline in flex table with id "---amendment:-:grantorCarryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Carry Forward Amount |
      | Automation Permanent Focus Area | 200                  |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2700                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I wait for "7" seconds
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"

  @264263 @264283 @264379 @264365 @264383 @264150 @264237 @264242 @264246 @264580 @264783 @264785 @264787 @264794 @264798 @264801 @264811 @264849 @264852 @308964 @ValidatevaluesdisplayedinSpentfieldwhenCarryforwardamendmentisinsubmittedtograntorstate @sprint-20-US-228432-244399 @vaibhav @Allocation
  Scenario: Validate values displayed in Spent field when Carry forward amendment is in submitted to grantor state
    And I activated standalone subaward "Automation Runtime award" with properties "SECOND_FOCUS_AREA_BUD_CAT_SUB_ORG_IND-Automation PO user" of type "Formula_By_Applicant_Focus_Area"
    When I login to "As a Grantor" app as "PO" user
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
    And I enter "PeriodicEditionFocusYes" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                |
      | 4000  | RevisedCommitment__c |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    And I pause execution for "5" seconds
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
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
    And I refresh the page
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
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId1"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 200        | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on page navigation arrow "---paymentRequest:-:paymentRequestBudgetTableId---" for table id "Next"
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 300        | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 500                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:PO Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    And I wait for "5" seconds
    When I "Approve" in the approval decision
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Paid" and is "dark blue"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
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
    And I wait for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I refresh the page
    #264263
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---amendment:-:carryForwardFocusAreaTableId---"
    #264283
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area2" in flex table with id "---amendment:-:carryForwardFocusAreaTableId---"
    #264150
    Then I softly see field "Spent" as "$500.00"
    And I edit the following rows inline in flex table with id "---amendment:-:carryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Carry Forward Amount |
      | Automation Permanent Focus Area | 200                  |
    And I edit the following rows inline in flex table with id "---amendment:-:carryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Carry Forward Amount |
      | Automation Permanent Focus Area2 | 500                  |
    #264246
    Then I softly see value "$200.00" for title "Carry Forward Amount" against the value "Automation Permanent Focus Area" inside table "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Carry Forward Amount" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:carryForwardFocusAreaTableId---"
    #264237
    Then I softly see "Current Obligation" in flex table header "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly see "Spent" in flex table header "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly see "Carry Forward Amount" in flex table header "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly see "Revised Obligation" in flex table header "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly see "Budgeted Amount" in flex table header "---amendment:-:carryForwardFocusAreaTableId---"
    #264242
    Then I softly see value "$200.00" for title "Spent" against the value "Automation Permanent Focus Area" inside table "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly see value "$300.00" for title "Spent" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Spent" against the value "Grand Total" inside table "---amendment:-:carryForwardFocusAreaTableId---"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 200           |
    And I expand nested table containing column value "BP01"
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1200                 | 120        | 0              |
    And I click on page navigation arrow "---progressReport:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I refresh the page
    Then I softly see field "Budgeted Amount" as "$2,700.00"
    #264365
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---"
    Then I softly see value "$200.00" for title "Carry Forward" against the value "Construction" inside table "---amendment:-:RecipientCarryForwardBudgetTableId---"
    And I wait for "3" seconds
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---"
    Then I softly see value "$500.00" for title "Carry Forward" against the value "Construction" inside table "---amendment:-:RecipientCarryForwardBudgetTableId---"
    And I collapse nested table containing column value "BP01"
    And I click on parallel menu button in flex table title "Budget Change"
    And I select "Reset Table" from parallel lines dropdown of "Budget Change"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---progressReport:-:budgetChangeTableId---"
    Then I softly see value "$1,200.00" for title "Revised Award Amount" against the value "Construction" inside table "---progressReport:-:budgetChangeTableId---"
    And I wait for "3" seconds
    And I click on page navigation arrow "---progressReport:-:budgetChangeTableId---" for table id "Next"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---progressReport:-:budgetChangeTableId---"
    Then I softly see value "$1,500.00" for title "Revised Award Amount" against the value "Construction" inside table "---progressReport:-:budgetChangeTableId---"
    #264379,264383
    And I edit the following rows inline in flex table with id "---amendment:-:carryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Carry Forward Amount |
      | Automation Permanent Focus Area | 100                  |
    And I wait for "9" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Carry Forward Amount in the budget period section must be equal to the Carry Forward amount on the Budget Summary by Focus Area Section for the Following Focus areas - (Automation Permanent Focus Area) |
      | Overview Tab - The Budgeted Amount must be equal to the Revised Obligation for the following Focus Areas - (Automation Permanent Focus Area)                                                                             |
    And I edit the following rows inline in flex table with id "---amendment:-:carryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Carry Forward Amount |
      | Automation Permanent Focus Area | 200                  |
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    Then I softly see field "Spent" as "$500.00"
    #264783
    Then I softly see "Current Obligation" in flex table header "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly see "Spent" in flex table header "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly see "Carry Forward Amount" in flex table header "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly see "Revised Obligation" in flex table header "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly see "Budgeted Amount" in flex table header "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    #264785
    Then I softly see value "$200.00" for title "Spent" against the value "Automation Permanent Focus Area" inside table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly see value "$300.00" for title "Spent" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Spent" against the value "Grand Total" inside table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
     #264787
    And I edit the following rows inline in flex table with id "---amendment:-:grantorCarryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Carry Forward Amount |
      | Automation Permanent Focus Area | 100                  |
    And I edit the following rows inline in flex table with id "---amendment:-:grantorCarryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Carry Forward Amount |
      | Automation Permanent Focus Area2 | 400                  |
    Then I softly see value "$100.00" for title "Carry Forward Amount" against the value "Automation Permanent Focus Area" inside table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly see value "$400.00" for title "Carry Forward Amount" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    #264794
    Then I softly see field "Current Obligation" as "$2,000.00"
    Then I softly see field "Carry Forward Amount" as "$700.00"
    Then I softly see field "Revised Obligation" as "$2,700.00"
    #264798
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    #264801
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area2" in flex table with id "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2700                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I wait for "9" seconds
    When I click on "Submit for Approval" in the page details
    #264811,264849
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Revised Obligation must be equal to the Budgeted Amount for the following Focus Areas - (Automation Permanent Focus Area, Automation Permanent Focus Area2) |
      | Overview Tab - The Revised Obligation ($2500.0) must be equal to the total of Revised Encumbrance in the Funding Account ($2700.0)                                             |
    #264852,308964
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:grantorCarryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Carry Forward Amount |
      | Automation Permanent Focus Area | 200                  |
    And I edit the following rows inline in flex table with id "---amendment:-:grantorCarryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Carry Forward Amount |
      | Automation Permanent Focus Area2 | 500                  |
    And I refresh the page
    Then I softly see field "Budgeted Amount" as "$2,700.00"
    Then I softly see field "Revised Obligation" as "$2,700.00"
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"

  @265763 @263893 @ValidatePOusercansubmitcarryforwardamendmentforapprovalwhenusercarryforwardremainingbalancefrompreviousBudgetperiodFA1tofocusareafromCurrentBudgetperiod @sprint-20-US-228432-244399 @vaibhav @Allocation
  Scenario: Validate PO user can submit carry forward amendment for approval when user carry forward remaining balance from previous Budget period FA1 to focus area from Current Budget period
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" and properties "SECOND_FOCUS_AREA_BY_APPLICANT_FOCUS_AREA_RISK_ASS_NO-Automation PO user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "SECOND_BUDGET_CATEGORY-Automation IND user"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PO user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                |
      | 4000  | RevisedCommitment__c |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
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
    And I refresh the page
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
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
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
    And I wait for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    And I refresh the page
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #263893
    Then I softly see field "Budgeted Amount" as "$2,000.00"
    Then I softly see value "$1,000.00" for title "Revised Award Amount" against the value "Construction" inside table "---progressReport:-:budgetChangeTableId---"
    And I click on page navigation arrow "---progressReport:-:budgetChangeTableId---" for table id "Next"
    Then I softly see value "$1,000.00" for title "Revised Award Amount" against the value "Construction" inside table "---progressReport:-:budgetChangeTableId---"
    Then I see the following rows under the following headers in table with id "---progressReport:-:budgetChangeTableId---" :
      | Revised Award Amount |
      | $2,000.00            |
    And I edit the following rows inline in flex table with id "---amendment:-:carryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Carry Forward Amount |
      | Automation Permanent Focus Area | 500                  |
    And I edit the following rows inline in flex table with id "---amendment:-:carryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Carry Forward Amount |
      | Automation Permanent Focus Area2 | 500                  |
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    And I expand nested table containing column value "BP01"
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    And I refresh the page
    And I click on parallel menu button in flex table title "Budget Change"
    And I select "Reset Table" from parallel lines dropdown of "Budget Change"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I click on page navigation arrow "---progressReport:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I refresh the page
    Then I softly see field "Budgeted Amount" as "$3,000.00"
    And I wait for "10" seconds
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I wait for "7" seconds
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
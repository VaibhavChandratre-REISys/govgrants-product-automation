@grantsAwardAllocation @grantor-regression @grantor-parallel-regression @grantAndAward @regression
Feature: Validate all scenarios of grants and award for Allocation

  @245229 @ValidateDirectedThatBudgetSummarybyfocusareawillnotbevisibletoSPAuserIfFocusAreaisno @sprint-16-US-242771 @vaibhav @Allocation
  Scenario Outline: Validate Directed That Budget Summary by focus area will not be visible to <SPA> user If Focus Area is no
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "<grantEdition>" values from "Award_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldIsBuildUpFunctionality__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 1000         | 100        | 100            |
    When I close "Subaward Budget Category" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
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
    And I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly cannot see page block "Budget Summary by Focus Area"
    Examples:
      | grantEdition                    |
      | Grant_Edition_Directed_Focus_No |

  @245231 @245236 @245240 @245247 @ValidateDirectedThatSPAuserwillseebudgetedamountcolumninBudgetSummarybyfocusAreasectionwhentheawardisSenttoSrbeforeapproval @sprint-16-US-242771 @vaibhav @Allocation
  Scenario Outline: Validate That <SPA> user will see budgeted amount column in Budget Summary by focus Area section when the award is Sent to S/r before approval, in review and peer reviewed states
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_Directed" values from "Award_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldIsBuildUpFunctionality__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 1000         | 100        | 100            |
    When I close "Subaward Budget Category" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
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
    And I re-login to "Grants Portal" app as "<User>" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    And I click on "Accept" in the page details
    And I navigate to "Budget" sub tab
    Then I softly see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside table with wait for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Program Reviewer" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    Then I softly see that "Sent for Review" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "Grants Portal" app as "<User>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Budget" sub tab
    Then I softly see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation PM" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside table with wait for record
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "Grants Portal" app as "<User>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Budget" sub tab
    Then I softly see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #245236
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    Then I see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I re-login to "Grants Portal" app as "<User>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Budget" sub tab
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #245240
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #245247
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    Then I cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Extra Salary" in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Extra Salary" in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    When I close "Subaward Budget Category" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "<User>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    When I navigate to "Budget" sub tab
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #245240
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #245247
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    Then I cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Extra Salary" in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Extra Salary" in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    When I close "Subaward Budget Category" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Approved" and is "green"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "<User>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Budget" sub tab
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #245240
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #245247
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    Then I cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Extra Salary" in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Extra Salary" in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    When I close "Subaward Budget Category" modal by clicking the top right x button
    And I click on "Accept after Approval" in the page details
    When I navigate to "Budget" sub tab
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #245240
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #245247
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    Then I cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Extra Salary" in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Extra Salary" in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    When I close "Subaward Budget Category" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see that "Subaward" is in "Activated" status
    When I re-login to "Grants Portal" app as "<User>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    When I navigate to "Budget" sub tab
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #245240
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #245247
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    Then I cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Extra Salary" in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Extra Salary" in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"

    Examples:
      | User |
      | SPI3 |
      | IND  |

  @245237 @245241 @ValidateDirectedThatSPAuserwillseeNewObligationinBudgetSummarybyfocusAreasectionwhenawardisinrejectedstate @sprint-16-US-242771 @vaibhav @Allocation
  Scenario: Validate Directed - Verify That <SPA> user will seeNew Obligation in Budget Summary by focus Area section when award is in rejected state
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_Directed" values from "Award_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldIsBuildUpFunctionality__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 1000         | 100        | 100            |
    When I close "Subaward Budget Category" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    Then I see status in Progress-bar is "Submitted for Approval" and is "Green"
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
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Reject" in the page details
    Then I softly see field "Status" as "Rejected"
    When I navigate to "Budget" sub tab
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #245241
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"

  @245244 @245245 @245246 @ValidateDirectedThatIncaseofdetailbudgetActioncolumnwiththeAddlineitemoptionwillbevisibleINDinSubawardbudgetsection @sprint-16-US-242771 @vaibhav @Allocation
  Scenario: Validate Directed That In case of detail budget, Action column with the Add line item option will be visible<IND >user in Subaward budget section
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields3" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_Directed" values from "Award_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldIsBuildUpFunctionality__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 1000         | 100        | 100            |
    And I refresh the page
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                        | Award  |
      | {SavedValue:ADMIN Username} | Step 1 |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    Then I softly do not see "Budget Period Details" page block displayed
    Then I softly see "Actions" in flex table header "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    Then I softly can see row level action button "Add Line Items" against "Construction" in flex table with id "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    #245245
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
    Then I softly can see row level action button "Edit" against "Extra Salary" in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Extra Salary" in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    #245246
    When I enter the following values into flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative | Award Amount | Cash Match | Non-Cash Match |
      | Extra Salary | Test      | 1200         | 100        | 100            |
    When I click on "Delete" icon for "Test" inside flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    Then I softly do not see value "Test" for title "Narrative" inside table "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"

  @245249 @245250 @ValidateDirectedINdseevalidationonAcceptButtonwhentheBudgetedAmountisnotequaltotheNewObligation @sprint-16-US-242771 @vaibhav @Allocation
  Scenario: Validate Directed <INd> see validation on Accept Button when the Budgeted Amount is not equal to the New Obligation
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields3" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_Directed" values from "Award_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldIsBuildUpFunctionality__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I refresh the page
    Then I softly see "Actions" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 900          | 100        | 100            |
    When I close "Subaward Budget Category" modal by clicking the top right x button
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                        | Award  |
      | {SavedValue:ADMIN Username} | Step 1 |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount must be equal to the New Obligation in the budget summary section. |
    #245250
    And I navigate to "Budget" sub tab
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---" by clicking "Edit" :
      | Title        | Narrative     | Award Amount | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 1000         | 100        | 100            |
    When I close "Subaward Budget Category" modal by clicking the top right x button
    And I click on "Accept" in the page details
    Then I softly see field "Status" as "Accepted"

  @246424 @246425 @246431 @246433 @246449 @ValidatecompetativethatSPIUserwillseeBudgetperiodDetailssectionrenamedtoBudgetSummarysectioninsendtosrstate @sprint-16-US-242771 @vaibhav @Allocation
  Scenario: Validate competative that <SPI> User will see Budget period Details section renamed to Budget Summary section in send to s/r state
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields3" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I refresh the page
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
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                        | Award  |
      | {SavedValue:ADMIN Username} | Step 1 |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    Then I softly do not see "Budget Period Details" page block displayed
    #246425
    When I click on "Edit" in the page details
    Then I softly see that "Budget Period End Date" rendered in view mode only
    Then I softly see that "New Obligation" rendered in view mode only
    Then I softly see that "Cumulative Obligation" rendered in view mode only
    Then I softly see that "Total Commitment" rendered in view mode only
    Then I softly see that "Budgeted Amount" rendered in view mode only
    Then I softly see that "Match this Budget Period" rendered in view mode only
    Then I softly see that "Required Match %" rendered in view mode only
    #246431
    Then I softly see "Budget Summary by Focus Area" page block displayed
    #246433
    Then I softly see field "BudgetedAmount__c" not in edit mode
    #246449
    Then I softly see "Actions" in flex table header "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    Then I can see row level action button "Edit" against "Construction" in flex table with id "---subAwardStandAlone:-:sRBudgetCategoryTableId---"

  @246426 @ValidatecompetativethatSPIUserwillseeBudgetedAmountfieldinbudgetsummarySectionInSenttoSrbeforeapprovalsentforpeerreviewreviewedstateonly @sprint-16-US-242771 @vaibhav @Allocation
  Scenario: Validate competative that <SPI> User will see Budgeted Amount field in budget summary Section In Sent to S/r before approval ,sent for peer review, reviewed state only
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields3" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldIsBuildUpFunctionality__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 1000         | 100        | 100            |
    When I close "Subaward Budget Category" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                        | Award  |
      | {SavedValue:ADMIN Username} | Step 1 |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" inside "Budget Summary" section
    And I click on "Accept" in the page details
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" inside "Budget Summary" section
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside table with wait for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Program Reviewer" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    Then I softly see that "Sent for Review" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" inside "Budget Summary" section
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation PM" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside table with wait for record
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" inside "Budget Summary" section

  @246432 @ValidatecompetativeThatBudgetSummarybyfocusareawillnotbevisibletoSPAuserIfFocusAreaisno @sprint-16-US-242771 @vaibhav @Allocation
  Scenario: Validate competative That Budget Summary by focus area will not be visible to <SPA> user If Focus Area is no
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_Comp_Focus_No" values from "Award_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldIsBuildUpFunctionality__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I refresh the page
    Then I softly see "Actions" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 900          | 100        | 100            |
    When I close "Subaward Budget Category" modal by clicking the top right x button
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
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
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly do not see "Budget Summary by Focus Area" page block displayed

  @246434 @246441 @246443 @246445 @246447 @ValidatecompetativeThatSPAuserwillseebudgetedamountcolumninBudgetSummarybyfocusAreasectionwhentheawardisSenttoSrbeforeapprovalinreviewandpeerreviewedstates @sprint-16-US-242771 @vaibhav @Allocation
  Scenario: Validate competative That <SPA> user will see budgeted amount column in Budget Summary by focus Area section when the award is  Sent to S/r before approval, in review and peer reviewed states.
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldIsBuildUpFunctionality__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 1000         | 100        | 100            |
    When I close "Subaward Budget Category" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
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
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" inside "Budget Summary" section
    And I click on "Accept" in the page details
    And I navigate to "Budget" sub tab
    Then I softly see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside table with wait for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Program Reviewer" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    Then I softly see that "Sent for Review" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Budget" sub tab
    Then I softly see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation PM" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside table with wait for record
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Budget" sub tab
    Then I softly see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #246441
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    Then I see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Budget" sub tab
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #246447
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    When I navigate to "Budget" sub tab
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #246447
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Approved" and is "green"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Budget" sub tab
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #246447
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    And I click on "Accept after Approval" in the page details
    When I navigate to "Budget" sub tab
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #246447
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    When I navigate to "Budget" sub tab
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #246447
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #246445
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see field "CumulativeObligation__c" not in edit mode
    #246443
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
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
    Then I softly see status in Progress-bar is "Completed" and is "green"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---closeout:-:grantsTableId---"
    Then I softly see field "Status" as "Closed/Completed"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Closed" and is "Green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see field "Status" as "Closed"
    When I navigate to "Budget" sub tab
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #246447
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"

  @246442 @246448 @ValidatecompetativeThatSPAuserwillseeNewObligationinBudgetSummarybyfocusAreasectionwhenawardisinrejectedstate @sprint-16-US-242771 @vaibhav @Allocation
  Scenario: Validate competative That <SPA> user will seeNew Obligation in Budget Summary by focus Area section when award is in rejected state
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldIsBuildUpFunctionality__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 1000         | 100        | 100            |
    When I close "Subaward Budget Category" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
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
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" inside "Budget Summary" section
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    Then I see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    And I navigate to "Budget" sub tab
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #246448
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"

  @246444 @246447 @ValidatecompetativeThatSPAuserwillseeNewobligationinBudgetSummarybyfocusAreasectionwhenawardisinPendingActivationandamendedstate @sprint-16-US-242771 @vaibhav @Allocation
  Scenario: Validate competative That <SPA> user will see New obligation in Budget Summary by focus Area section  when award is in Pending Activation and amended state
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    Then I see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "Green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #246447
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    And I navigate to "Budget" sub tab
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #246447
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I see status in Progress-bar is "Amended" and is "Green"
    And I navigate to "Budget" sub tab
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #246447
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"

  @246450 @246451 @246452 @246455 @246456 @ValidatecompetativeThatIncaseofdetailbudgetActioncolumnwiththeAddlineitemoptionwillbevisibleINDuserinSubawardbudgetsection @sprint-16-US-242771 @vaibhav @Allocation
  Scenario: Validate competative That In case of detail budget, Action column with the Add line item option will be visible IND user in Subaward budget section
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields3" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldIsBuildUpFunctionality__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 800          | 100        | 100            |
    When I close "Subaward Budget Category" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                        | Award  |
      | {SavedValue:ADMIN Username} | Step 1 |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see "Actions" in flex table header "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    Then I softly can see row level action button "Add Line Items" against "Construction" in flex table with id "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    #246451
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
    Then I softly can see row level action button "Edit" against "Extra Salary" in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Extra Salary" in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    #246452
    When I enter the following values into flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative | Award Amount | Cash Match | Non-Cash Match |
      | Extra Salary | Test      | 1200         | 100        | 100            |
    When I click on "Delete" icon for "Test" inside flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    Then I softly do not see value "Test" for title "Narrative" inside table "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    When I close "Subaward Budget Category" modal by clicking the top right x button
    #246455
    And I click on "Accept" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount must be equal to the New Obligation in the budget summary section. |
    #246456
    And I navigate to "Budget" sub tab
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---" by clicking "Edit" :
      | Title        | Narrative     | Award Amount | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 1000         | 100        | 100            |
    When I close "Subaward Budget Category" modal by clicking the top right x button
    And I click on "Accept" in the page details
    Then I softly see field "Status" as "Accepted"

  @239772 @239775 @ValidateEXEusershouldnotseebudgetedamountcolumninamendedandpendingactivationstateofaward @sprint-15-US-237846 @vaibhav @Allocation
  Scenario: Validate EXE user should not see 'budgeted amount' column in amended and pending activation state of award
    And I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_FOCUS_AREA_RISK_ASSESSMENT_NO-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation EXE user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    Then I see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "Green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I navigate to "Budget" sub tab
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    #239775
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Budget" sub tab
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    #239775
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Amended" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I see status in Progress-bar is "Amended" and is "Green"
    And I navigate to "Budget" sub tab
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    #239775
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"

  @240305 @ValidateCarryforwardfiledshouldbeonlydisplayonawardwhenbudgetperiodchangetoBP02andbeyondFAYes @sprint-16-US-220612 @vaibhav @Allocation 
  Scenario: Validate Carry forward' filed should be only display on award when budget period change to BP02 and beyond(FA=Yes)
    And I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_RISK_ASSESSMENT_NO-Automation ADMIN user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation ADMIN user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "ADMIN" user
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
    And I refresh the page
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                | New Obligation |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} | 1000           |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                        | Amendment Request |
      | {SavedValue:ADMIN Username} | Step 1            |
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
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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
    Then I softly see field "Budget Period Number" as "BP02"
    Then I softly see "Carry-Forward" inside page block detail

  @240306 @ValidateCarryforwardfiledshouldbeonlydisplayonawardwhenbudgetperiodchangetoBP02andbeyondFANO @sprint-16-US-220612 @vaibhav @Allocation
  Scenario: Validate Carry forward' filed should be only display on award when budget period change to BP02 and beyond(FA=No)
    And I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO_RISKASSESSMENT_NO-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation EXE user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "EXE" user
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
    And I refresh the page
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
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
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    And I navigate to "Budget" sub tab
    Then I softly see field "Budget Period Number" as "BP02"
    Then I softly see "Carry-Forward" inside page block detail

  @240517 @240525 @243120 @ValidateEXEusershouldnotseebudgetedamountcolumninamendedandpendingactivationstateofawardFAYes @sprint-16-US-220612 @vaibhav @Allocation
  Scenario: Validate EXE user should not see 'budgeted amount' column in amended and pending activation state of award (FA=Yes)
    And I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_RISK_ASSESSMENT_NO-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation EXE user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    Then I see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "Green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I navigate to "Budget" sub tab
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    #240525
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    #243120
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    When I navigate to "Budget" sub tab
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Budget" sub tab
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    #240525
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    #243120
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Activated" and is "Green"
    When I navigate to "Budget" sub tab
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Amended" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I see that "Subaward" is in "Amended" status
    When I navigate to "Budget" sub tab
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Amended" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I see status in Progress-bar is "Amended" and is "Green"
    And I navigate to "Budget" sub tab
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    #240525
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"

  @240529 @ValidatePMusershouldseeNewobligation&CumulativeObligationreadonlycolumninAmendedPendingactivationstateofawardFANo @sprint-16-US-220612 @vaibhav @Allocation
  Scenario: Validate PM user should see 'New obligation' & 'Cumulative Obligation' read only column in Amended, Pending activation state of award (FA=No)
    And I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO_RISKASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    Then I see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "Green"
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
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I navigate to "Budget" sub tab
    Then I softly see that "New Obligation" rendered in view mode only
    Then I softly see that "Cumulative Obligation" rendered in view mode only
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Budget" sub tab
    Then I softly see that "New Obligation" rendered in view mode only
    Then I softly see that "Cumulative Obligation" rendered in view mode only
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Amended" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I see status in Progress-bar is "Amended" and is "Green"
    And I navigate to "Budget" sub tab
    Then I softly see that "New Obligation" rendered in view mode only
    Then I softly see that "Cumulative Obligation" rendered in view mode only

  @243730 @ValidateCompAnnPMusershouldseefollowingreadonlyfields&BudgetAmountfieldshouldnotseeunderBudgetSummarysectioninAmendedPendingactivation @sprint-16-US-226122 @vaibhav @Allocation
  Scenario: Validate Comp Ann PM user should see following read only fields & Budget Amount field should not see under Budget Summary section in Amended, Pending activation
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NO_RISK_ASSESSMENT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "default"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
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
    And I refresh the page
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    And I refresh the page
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I navigate to "Budget" sub tab
    Then I softly cannot see field "Budgeted Amount" inside page block
    Then I softly see field "New Obligation" inside page block
    Then I softly see field "Cumulative Obligation" inside page block
    Then I softly see field "Total Commitment" inside page block
    Then I softly see field "Match this Budget Period" inside page block
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Budget" sub tab
    Then I softly see field "Budget Period Number" inside page block
    Then I softly cannot see field "Budgeted Amount" inside page block
    Then I softly see field "New Obligation" inside page block
    Then I softly see field "Cumulative Obligation" inside page block
    Then I softly see field "Total Commitment" inside page block
    Then I softly see field "Match this Budget Period" inside page block
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "BP01" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see field "Budget Period Number" inside page block
    Then I softly cannot see field "Budgeted Amount" inside page block
    Then I softly see field "New Obligation" inside page block
    Then I softly see field "Cumulative Obligation" inside page block
    Then I softly see field "Total Commitment" inside page block
    Then I softly see field "Match this Budget Period" inside page block

  @243816 @243819 @244245 @ValidateCompAnnPMuserseeCarryforwardfieldwithzerovalueshouldbeonlydisplayonawardunderBudgetSummarysectionwhenbudgetperiodchangetoBP02andbeyond @sprint-16-US-226122 @vaibhav @Allocation
  Scenario: Validate Comp Ann PM user see 'Carry forward' field with zero value should be only display on award under Budget Summary section when budget period change to BP02 and beyond
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NO_RISK_ASSESSMENT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "default"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly do not see "Carry-Forward" inside page block detail
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    Then I see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "Green"
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
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Budget" sub tab
    #243819
    Then I softly see field "Budget Period Number" as "BP01"
    Then I softly do not see "Carry-Forward" inside page block detail
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I refresh the page
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    And I refresh the page
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    And I navigate to "Budget" sub tab
    Then I softly cannot see field "Budgeted Amount" inside page block
    Then I softly see field "New Obligation" inside page block
    Then I softly see field "Cumulative Obligation" inside page block
    Then I softly see field "Total Commitment" inside page block
    Then I softly see field "Match this Budget Period" inside page block
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Budget" sub tab
    Then I softly see field "Budget Period Number" as "BP02"
    Then I softly see "Carry-Forward" inside page block detail
    When I save the field labeled "Carry-Forward" as "carryForwrdAmount"
    Then I softly see field "Carry-Forward" as "{SavedValue:carryForwrdAmount}"
    #244245
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID2}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Activated" and is "Green"
    When I navigate to "Budget" sub tab
    Then I softly see field "Budget Period Number" as "BP02"
    Then I softly do not see "Carry-Forward" inside page block detail

  @244020 @244021 @244026 @244364 @ValidateDirectAnnPOuserseeCarryforwardfieldwithzerovalueshouldbeonlydisplayonawardunderBudgetSummarysectionwhenbudgetperiodchangetoBP02andbeyond @sprint-16-US-226122 @vaibhav @Allocation
  Scenario: Validate Direct Ann PO user see 'Carry forward' field with zero value should be only display on award under Budget Summary section when budget period change to BP02 and beyond
    And I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "NO_RISK_ASSESSMENT-Automation PO user"
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
    Then I softly do not see "Carry-Forward" inside page block detail
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    Then I see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "Green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Budget" sub tab
    #244021
    Then I softly see field "Budget Period Number" as "BP01"
    Then I softly do not see "Carry-Forward" inside page block detail
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I refresh the page
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
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
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    #244026
    And I navigate to "Budget" sub tab
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Budget" sub tab
    Then I softly see field "Budget Period Number" as "BP02"
    Then I softly see "Carry-Forward" inside page block detail
    When I save the field labeled "Carry-Forward" as "carryForwrdAmount"
    Then I softly see field "Carry-Forward" as "{SavedValue:carryForwrdAmount}"
    #244026
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "BP01" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    #244026
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    #244364
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID2}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Activated" and is "Green"
    When I navigate to "Budget" sub tab
    Then I softly see field "Budget Period Number" as "BP02"
    Then I softly do not see "Carry-Forward" inside page block detail

  @244220 @244230 @ValidateCompAnnSPISPAusershouldseefollowingreadonlyfields&BudgetAmountfieldshouldnotseeunderBudgetSummarysectioninAmendedPendingactivation @sprint-16-US-226926 @vaibhav @Allocation
  Scenario: Validate Comp Ann SPI/SPA user should see following read only fields & Budget Amount field should not see under Budget Summary section in Amended, Pending activation
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NO_RISK_ASSESSMENT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "default"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    Then I see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "Green"
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
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I navigate to "Budget" sub tab
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    When I navigate to "Budget" sub tab
    Then I softly cannot see field "Budgeted Amount" inside page block
    Then I softly see field "New Obligation" inside page block
    Then I softly see field "Cumulative Obligation" inside page block
    Then I softly see field "Total Commitment" inside page block
    Then I softly see field "Match this Budget Period" inside page block
    #244230
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Activated" and is "Green"
    When I navigate to "Budget" sub tab
    Then I softly see field "Budget Period Number" inside page block
    Then I softly cannot see field "Budgeted Amount" inside page block
    Then I softly see field "New Obligation" inside page block
    Then I softly see field "Cumulative Obligation" inside page block
    Then I softly see field "Total Commitment" inside page block
    Then I softly see field "Match this Budget Period" inside page block
    #244230
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Amended" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I see that "Subaward" is in "Amended" status
    When I navigate to "Budget" sub tab
    Then I softly see field "Budget Period Number" inside page block
    Then I softly cannot see field "Budgeted Amount" inside page block
    Then I softly see field "New Obligation" inside page block
    Then I softly see field "Cumulative Obligation" inside page block
    Then I softly see field "Total Commitment" inside page block
    Then I softly see field "Match this Budget Period" inside page block
    #244230
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"

  @244342 @244354 @validateDirectAnnINDusershouldseefollowingreadonlyfields&BudgetAmountfieldshouldnotseeunderBudgetSummarysectionAmendedPendingactivation
  Scenario Outline: Validate Direct Ann IND user should see following read only fields & Budget Amount field should not see under Budget Summary section in Amended, Pending activation
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_RISK_ASSESSMENT_NO-Automation ADMIN user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default-<User>"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "default"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    Then I see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "Green"
    When I re-login to "Grants Portal" app as "<User1>" user on "SUBPORTAL" portal
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
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I navigate to "Budget" sub tab
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    When I re-login to "Grants Portal" app as "<User1>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    When I navigate to "Budget" sub tab
    Then I softly cannot see field "Budgeted Amount" inside page block
    Then I softly see field "New Obligation" inside page block
    Then I softly see field "Cumulative Obligation" inside page block
    Then I softly see field "Total Commitment" inside page block
    Then I softly see field "Match this Budget Period" inside page block
    #244354
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    When I re-login to "Grants Portal" app as "<User1>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Activated" and is "Green"
    When I navigate to "Budget" sub tab
    Then I softly see field "Budget Period Number" inside page block
    Then I softly cannot see field "Budgeted Amount" inside page block
    Then I softly see field "New Obligation" inside page block
    Then I softly see field "Cumulative Obligation" inside page block
    Then I softly see field "Total Commitment" inside page block
    Then I softly see field "Match this Budget Period" inside page block
    #244354
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Amended" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I see that "Subaward" is in "Amended" status
    When I navigate to "Budget" sub tab
    Then I softly see field "Budget Period Number" inside page block
    Then I softly cannot see field "Budgeted Amount" inside page block
    Then I softly see field "New Obligation" inside page block
    Then I softly see field "Cumulative Obligation" inside page block
    Then I softly see field "Total Commitment" inside page block
    Then I softly see field "Match this Budget Period" inside page block
    #244354
    Then I softly do not see "Budgeted Amount" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"

    Examples:
      | User                 | User1 |
      | Automation SPI3 user | SPI3  |
      | Automation SPI3 user | IND   |

  @246079 @ValidateAdminusershouldnotacceptnegativevalueinencumbranceandnewobligationfiledonaward @sprint-16-US-238049 @Vaibhav @Allocation
  Scenario: Validate Admin user should not accept negative value in encumbrance and new obligation filed on award
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields3" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_By_App_Focus_Yes" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date | New Obligation |
      | Automation Permanent Focus Area | 0          | 3650     | -1000          |
    Then I softly see the following messages in the page details contains:
      | The New Obligation cannot be less than zero. |
# To Do currently encumbrance accepted negative value and not generate error message hence commented below steps and created US for this issue US-303725
#    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
#      | Funding Account             | Encumbrance |
#      | {SavedValue:fundingAccount} | -1000       |
#    Then I softly see the following messages in the page details contains:
#      | The Encumbrance cannot be less than zero. |

  @268449 @ValidateValidationWillComeonsavewhenPMusertrytoenterNegativeValueinNewObligationFieldinBudgetSummarySection @sprint-21-US-265545 @vaibhav @Allocation
  Scenario: Validate Validation Will Come on save when PM user try to enter Negative Value in New Obligation Field in Budget Summary Section
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
    Then I see status in Progress-bar is "Created" and is "green"
    Then I softly see field "Budgeted Amount" inside page block
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    Then I softly see fields "fieldNewObligation__c" is in edit mode
    And I enter value "-2000" into field "fieldNewObligation__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The New Obligation cannot be less than zero. |

  @268451 @ValidateValidationWillComeonsavewhenEXEusertrytoenterNegativeValueinTotalCommitmentFieldinBudgetSummarySection @sprint-21-US-265545 @vaibhav @Allocation
  Scenario: Validate Validation Will Come on save when EXE user try to enter Negative Value in Total Commitment Field in Budget Summary Section
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldIsBuildUpFunctionality__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    Then I softly see fields "fieldTotalCommitment__c" is in edit mode
    And I enter value "-2000" into field "fieldTotalCommitment__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The Total Commitment cannot be less than zero. |

  @268454 @268455 @268456 @270275 @ValidateAdminusercanseeFieldHistoryismaintainedforNewObligationField @sprint-21-US-265545 @vaibhav @Allocation @FieldHistoryExclude
  Scenario: Validate Admin user can see Field History is maintained for New Obligation Field
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields3" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_By_App_Focus_Yes" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date | New Obligation |
      | Automation Permanent Focus Area | 0          | 3650     | 1000           |
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I refresh the page
    And I navigate to "History" sub tab
    Then I softly see value "New Obligation" for title "Changed Field" inside table "---subAwardStandAlone:-:historyTableId---"
    Then I softly see value "$1,000.00" for title "New Value" against the value "New Obligation" inside table "---subAwardStandAlone:-:historyTableId---"
    Then I softly see value "$0.00" for title "Old Value" against the value "New Obligation" inside table "---subAwardStandAlone:-:historyTableId---"
    #268455
    Then I softly see value "Total Commitment" for title "Changed Field" inside table "---subAwardStandAlone:-:historyTableId---"
    Then I softly see value "$2,000.00" for title "New Value" against the value "Total Commitment" inside table "---subAwardStandAlone:-:historyTableId---"
    #268456
    Then I softly see value "Cumulative Obligation" for title "Changed Field" inside table "---subAwardStandAlone:-:historyTableId---"
    Then I softly see value "$1,000.00" for title "New Value" against the value "Cumulative Obligation" inside table "---subAwardStandAlone:-:historyTableId---"
    Then I softly see value "$0.00" for title "Old Value" against the value "Cumulative Obligation" inside table "---subAwardStandAlone:-:historyTableId---"
    #270275
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Provide the Award Amount before submitting for approval. |

  @269829 @ValidatePMuserwillseeUpdateRevisedFundingbuttononactivatedgrants @sprint-21-US-265547 @vaibhav @Allocation
  Scenario: Validate PM user will see Update Revised Funding button on activated grants
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Formula_By_Applicant_Focus_Area"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    Then I softly can see top right button "Revise Estimated Funding" in page detail

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
      | Proposed Estimated Funding is required to save. |
    #269840
    And I enter in modal value "500" into field "fieldProposedEstimatedFunding__c"
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
    And I enter in modal value "-2000" into field "fieldProposedEstimatedFunding__c"
    When I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | The Estimated Funding must be equal to or greater than the Cumulative Obligation 1000.00 |
    #269843
    And I enter in modal value "2000" into field "fieldProposedEstimatedFunding__c"
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
    And I select value "Automation PO" into field "s2id_autogen1"
    And I select value "Automation PO1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PO" without tableid
    And I pause execution for "3" seconds
    And I Click on "Reassign Records" icon for "Grant" without tableid
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:grantSourceOwnerTableId---" panel
    When I check "{SavedValue:Automation Runtime Award}" boxes in flex table with id "---subAwardStandAlone:-:grantSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---subAwardStandAlone:-:grantSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:grantTargetOwnerTableId---" panel
    Then I see value "{SavedValue:Automation Runtime Award}" for title "Grant Title" inside table "---subAwardStandAlone:-:grantTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    Then I softly can see top right button "Revise Estimated Funding" in page detail
    When I click on "Revise Estimated Funding" in the page details
    And I enter in modal value "2000" into field "fieldProposedEstimatedFunding__c"
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
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | New Obligation |
      | Automation Permanent Focus Area | 2000           |
    And I refresh the page
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
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "Green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                     |
      | 3000  | fieldRevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
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
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
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
      | Value | Field                      |
      | Yes   | fieldIsAdvancePermitted__c |
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | If the Focus Area Required is Yes, then the Advance Payment Allowed must be selected as No. |

  @275291 @ValidatetheFunctionalityofMultipleFundingAccounts @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario: Validate the Functionality of Multiple Funding Accounts
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldIsBuildUpFunctionality__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I enter value "2000" into field "fieldNewObligation__c"
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
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---" by clicking "New" :
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
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
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
    Then I see status in Progress-bar is "Submitted for Approval" and is "Green"
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
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
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
    And I enter value "Automation Test justification" into field "fieldJustification__c"
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
    Then I softly see status in Progress-bar is "Completed" and is "green"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---closeout:-:grantsTableId---"
    Then I softly see field "Status" as "Closed/Completed"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Closed" and is "Green"
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
    And I enter value "Automation Test Description" into field "fieldGrantAwardDescription__c"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    And I Click on "Reassign Records" icon for "Grant" without tableid
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:grantSourceOwnerTableId---" panel
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---subAwardStandAlone:-:grantSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---subAwardStandAlone:-:grantSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:grantTargetOwnerTableId---" panel
    Then I see value "{SavedValue:Automation Runtime FDM Announcement}" for title "Grant Title" inside table "---subAwardStandAlone:-:grantTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
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
    And I enter value "Automation Test justification" into field "fieldJustification__c"
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
    Then I softly see status in Progress-bar is "Completed" and is "green"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    Then I softly see field "Status" as "Closed/Completed"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Closed" and is "Green"
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
    Then I softly see "Budget Summary by Focus Area" page block displayed
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
    Then I see status in Progress-bar is "Created" and is "green"
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
    Then I softly see fields "fieldTotalCommitment__c" is in edit mode

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
    And I enter value "Automation Test justification" into field "fieldJustification__c"
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
    Then I softly see value "Test Focus Area" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$0.00" for title "New Obligation" against the value "Test Focus Area" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$0.00" for title "Cumulative Obligation" against the value "Test Focus Area" inside table "---subAwardStandAlone:-:focusAreaTableId---"

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
    Then I softly see fields "fieldEstimatedFunding__c" is in edit mode
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date | New Obligation |
      | Automation Permanent Focus Area | 0          | 3650     | 1000           |
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---subAwardStandAlone:-:associateModalTableId---"
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
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
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
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    And I navigate to "Budget" sub tab
    And I click in table hyperlink containing value "{SavedValue:fundingAccount}"
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
    When I close "{SavedValue:PayreqId}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
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
    And I enter value "Automation Test Description" into field "fieldGrantAwardDescription__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    When I click on "Edit" in the page details
    Then I softly see that "New Obligation" rendered in view mode only
    Then I softly see that "Cumulative Obligation" rendered in view mode only
    Then I softly see that "Total Commitment" rendered in view mode only
    Then I softly see that "Budgeted Amount" rendered in view mode only
    Then I softly see that "Match this Budget Period" rendered in view mode only

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
    Then I softly see value "$0.00" for title "Spent" against the value "Construction" inside table "---subAwardStandAlone:-:grantsPaymentSummaryBudgetTableId---"
    And I click on page navigation arrow "---subAwardStandAlone:-:grantsPaymentSummaryBudgetTableId---" for table id "Next"
    Then I softly see value "$0.00" for title "Spent" against the value "Construction" inside table "---subAwardStandAlone:-:grantsPaymentSummaryBudgetTableId---"
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
    When I close "{SavedValue:PayreqId}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
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
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$1,000.00"
    Then I softly see value "$500.00" for title "Spent" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Spent" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Spent" against the value "Total" inside table "---subAwardStandAlone:-:grantActualsTabFocusAreaTableId---"
    And I expand nested table containing column value "BP01"
    Then I softly see value "$500.00" for title "Spent" against the value "Construction" inside table "---subAwardStandAlone:-:grantsPaymentSummaryBudgetTableId---"
    And I click on page navigation arrow "---subAwardStandAlone:-:grantsPaymentSummaryBudgetTableId---" for table id "Next"
    Then I softly see value "$500.00" for title "Spent" against the value "Construction" inside table "---subAwardStandAlone:-:grantsPaymentSummaryBudgetTableId---"
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
    When I close "{SavedValue:PayreqId1}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - Draft"
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
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
    Then I see status in Progress-bar is "Created" and is "green"
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
    Then I softly see value "Test Focus Area" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$0.00" for title "New Obligation" against the value "Test Focus Area" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$0.00" for title "Cumulative Obligation" against the value "Test Focus Area" inside table "---subAwardStandAlone:-:focusAreaTableId---"

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
    Then I softly see value "Test Focus Area" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$0.00" for title "New Obligation" against the value "Test Focus Area" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$0.00" for title "Cumulative Obligation" against the value "Test Focus Area" inside table "---subAwardStandAlone:-:focusAreaTableId---"

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
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
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
    And I enter value "Automation Test justification" into field "fieldJustification__c"
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
    Then I softly see status in Progress-bar is "Completed" and is "green"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    Then I softly see field "Status" as "Closed/Completed"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Closed" and is "Green"
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
    Then I see status in Progress-bar is "Created" and is "green"
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
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
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
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "Green"
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
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I navigate to "Budget" sub tab
    Then I cannot see top right button "Edit" in page detail
    Then I softly see that "New Obligation" rendered in view mode only
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    Then I softly see status in Progress-bar is "Activated" and is "green"
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
    And I enter value "Automation Test Description" into field "fieldGrantAwardDescription__c"
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
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    When I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
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
      | Name                      | Reimbursement |
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
    Then I softly see value "$500.00" for title "Spent" against the value "Construction" inside table "---amendment:-:GrantsActualBudgetPeriodTableId---"
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

  @275245 @ValidatePMusercannotseeFocusAreaswithNewObligationaszeroandSpentisalsoZeroonAwardsPaymentsummarybyfocusareasectioniftheinitialAwardisfromFDMFAisYES @Sprint-23-US-273843 @vaibhav @Allocation @wip @BugLogged-275248
  Scenario: Validate PM user cannot see Focus Areas with New Obligation as zero and Spent is also Zero on Awards Payment summary by focus area section if the initial Award is from FDM FA is YES
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---announcement:-:selectAnnouncementServiceArea1TableId---"
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Test Focus Area" by showing entries "All" in flex table with id "---announcement:-:selectAnnouncementServiceArea1TableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 5000            |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "Automation PM" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 1000              |
    And I wait for "5" seconds
    And I wait for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I wait for "4" seconds
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "green"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary by Focus Area"
    Then I softly do not see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    And I navigate to "Actuals" sub tab
    Then I softly do not see value "Automation Permanent Focus Area2" for title "Title" inside table "---subAwardStandAlone:-:awardPaymentSummaryFocusAreaTableId---"
@globalSearch @grantor-regression @grantor-parallel-regression @regression
Feature: Validate all scenarios for the global search

  @389003  @sprint-2-US-386939 @Pooja @GlobalSearch
  Scenario Outline: Verify that the record owner is able to edit the access for record when Award is in the Created, submit for review, Reviewed, Accepted state
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Created"
#    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
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
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I pause execution for "5" seconds
    And I check the checkbox in modal with field value "I Agree"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Risk Assessment | Name                     |
      | Step 1          | {SavedValue:PM Username} |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Award  | Name                     |
      | Step 1 | {SavedValue:PM Username} |
    When I get the "EGMS ID"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see value "Submitted" for title "Status" against the value "{SavedValue:FO Username}" inside table "---subAwardStandAlone:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Reviewed"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Accepted"
    Examples:
      | Award Name                                   | Grant Name                                   |
      | {SavedValue:Automation Runtime Direct Award} | {SavedValue:Automation Runtime Direct Award} |



  @389008  @sprint-2-US-386939 @Pooja @GlobalSearch
  Scenario Outline: Verify that Non-Owner user doesn't have an edit option in any stage of award and will get error message on page.
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Created"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
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
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I pause execution for "5" seconds
    And I check the checkbox in modal with field value "I Agree"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Risk Assessment | Name                     |
      | Step 1          | {SavedValue:PM Username} |
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Award  | Name                     |
      | Step 1 | {SavedValue:PM Username} |
    When I get the "EGMS ID"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Submitted for Review"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    Then I softly see field "Status" as "Submitted for Review"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see value "Submitted" for title "Status" against the value "{SavedValue:FO Username}" inside table "---subAwardStandAlone:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Reviewed"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Accepted"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
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
    And I pause execution for "2" seconds
    And I refresh the page
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see that "Subaward" is in "Activated" status
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    Examples:
      | Award Name                                   | Grant Name                                   |
      | {SavedValue:Automation Runtime Direct Award} | {SavedValue:Automation Runtime Direct Award} |

@389011 @sprint-2-US-386939 @Pooja @GlobalSearch
  Scenario: Verify that user is not able to change the owner in any state of Award and will get the error message and non-owner user is not able to see the change owner option
  When I login to "As a Grantor" app as "dynamicUser" user
  And I navigate to "Grants" tab
  When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
  And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
  And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
  And I click modal button "Continue"
  And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
  When I click modal button "Save and Continue"
  And I navigate to "Subawards" sub tab
  And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
  And I save the field labeled "EGMS ID" as "AwardEGMSID"
  And I wait for "2" seconds
  And I navigate to "Grants" tab
  And I wait for "3" seconds
  When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
  And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
  Then I softly can see row level action button "Change Owner" against "{SavedValue:AnnEGMSID}" in global search with id "Subawards"
  And I click on row level action button "Change Owner" against "{SavedValue:AnnEGMSID}" in global search with id "Subawards"
  Then I softly see "Change Owner" opens in overLay window
  When I click modal button "Cancel"
  When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
  And I navigate to "Grants" tab
  And I wait for "3" seconds
  When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
  And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
  Then I softly cannot see row level action button "Change Owner" against "{SavedValue:AnnEGMSID}" in global search with id "Subawards"

@389017 @sprint-2-US-386939 @Pooja @GlobalSearch
  Scenario:Verify that PM user as Reviewer have edit access for record only when edit access setting is yes for peer reviewer when award is a submit for review state.
  When I login to "As a Grantor" app as "dynamicUser" user
  And I navigate to "Grants" tab
  When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
  And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
  And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
  And I click modal button "Continue"
  And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
  When I click modal button "Save and Continue"
  And I navigate to "Subawards" sub tab
  And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
  And I save the field labeled "EGMS ID" as "AwardEGMSID"
  And I wait for "2" seconds
  And I click on "Edit" in the page details
  When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
  And I click on "Save" in the page details
  When I navigate to "Budget" sub tab
  When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
  And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
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
  And I navigate to "Management" sub tab
  When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
  And I pause execution for "5" seconds
  And I check the checkbox in modal with field value "I Agree"
  And I click modal button "Save and Continue"
  And I pause execution for "3" seconds
  And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
  When I click on "Save" in the page details
  When I get the "EGMS ID"
  When I navigate to "Responsibilities" sub tab
  When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
    | Risk Assessment | Name                     |
    | Step 1          | {SavedValue:PM Username} |
  And I click on "Submit for Approval" in the page details
  When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
  And I navigate to "Monitoring" tab
  When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
  And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
  When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
  And I "Approve" in the approval decision
  And I navigate to "Grants" tab
  When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
  And I click toggle button to select "Grants - All"
  When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
  And I click on "View" icon for "<Grant Name>" inside table
  When I navigate to "Subawards" sub tab
  And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
  When I navigate to "Overview" sub tab
  And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
    | Name                       | Project Role             | Is Key Personnel |
    | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
  When I navigate to "Responsibilities" sub tab
  When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
    | Award  | Name                     |
    | Step 1 | {SavedValue:PM Username} |
  When I get the "EGMS ID"
  And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
    | Reviewer Name            | Role            | Description                 | Due Date | Allow Record Editing |
    | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | Yes                  |
  And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
  And I wait for "3" seconds
  Then I softly see field "Status" as "Submitted for Review"
  When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
  And I wait for "3" seconds
  And I navigate to "Grants" tab
  And I wait for "3" seconds
  When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
  And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
  And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
  Then I softly see field "Status" as "Submitted for Review"
  Then I can see top right button "Save" in page detail
  Then I can see top right button "Cancel" in page detail
#  And I navigate to "Grants" tab
#  When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#  When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
#  When I click on "Start" icon for "Record Id" inside table
#  When I navigate to "Responsibilities" sub tab
#  When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
#  And I enter a review as "Passed"
#  When I click modal button "Save"
#  And I click on submit review
#  Then I softly see value "Submitted" for title "Status" against the value "{SavedValue:FO Username}" inside table "---subAwardStandAlone:-:peerReviewersTableId---"


  @389017 @sprint-2-US-386939 @Pooja @GlobalSearch
  Scenario:Verify that PM user as Reviewer have edit access for record only when edit access setting is yes for peer reviewer when award is a submit for review state.
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
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
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I pause execution for "5" seconds
    And I check the checkbox in modal with field value "I Agree"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Risk Assessment | Name                     |
      | Step 1          | {SavedValue:PM Username} |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Award  | Name                     |
      | Step 1 | {SavedValue:PM Username} |
    When I get the "EGMS ID"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | Yes                  |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Submitted for Review"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
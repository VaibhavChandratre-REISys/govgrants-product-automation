@globalSearch @grantor-regression @grantor-parallel-regression @regression
Feature: Validate all scenarios for the global search

  @389003  @sprint-2-US-386939 @Pooja @GlobalSearch @RerunGlobal
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
    And I click on "Save" in the page details
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

  @389008  @sprint-2-US-386939 @Pooja @GlobalSearch @RerunGlobal
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
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
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
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    Examples:
      | Award Name                                   | Grant Name                                   |
      | {SavedValue:Automation Runtime Direct Award} | {SavedValue:Automation Runtime Direct Award} |

  @389011 @sprint-2-US-386939 @Pooja @GlobalSearch @bug-451578
  Scenario: Verify that user is not able to change the owner in any state of Award and will get the error message and non-owner user is not able to see the change owner option
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    And I perform quick search inside global search "{SavedValue:GrantEGMSID}"
    Then I softly can see row level action button "Change Owner" against "{SavedValue:GrantEGMSID}" in global search with id "Grants"
    And I click on row level action button "Change Owner" against "{SavedValue:GrantEGMSID}" in global search with id "Grants"
    Then I softly see "Change Owner" opens in overLay window
    When I click modal button "Cancel"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    Then I softly cannot see row level action button "Change Owner" against "{SavedValue:AnnEGMSID}" in global search with id "Subawards"

  @389017 @sprint-2-US-386939 @Pooja @GlobalSearch
  Scenario Outline: Verify that PM user as Reviewer have edit access for record only when edit access setting is yes for peer reviewer when award is a submit for review state.
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
    Examples:
      | Award Name                                   | Grant Name                                   |
      | {SavedValue:Automation Runtime Direct Award} | {SavedValue:Automation Runtime Direct Award} |

  @389023 @sprint-2-US-386939 @Pooja @GlobalSearch @RerunGlobal
  Scenario Outline: Verify that if PM user does not have edit access for peer review then PM user will get error message for award when award is in the submit for review state or in Reviewed states
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
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | No                   |
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
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    Examples:
      | Award Name                                   | Grant Name                                   |
      | {SavedValue:Automation Runtime Direct Award} | {SavedValue:Automation Runtime Direct Award} |

  @389027 @sprint-2-US-386939 @Pooja @GlobalSearch
  Scenario: Verify that user is able to see the 5 most recently used records in the dropdown list when user clicks on search input box for awardbox for announcement
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    And I select "Grants" from dropdown for Global search
    And I click on global search box
    Then I softly see recent "5" records in global search box

  @389031 @sprint-2-US-386939 @Pooja @GlobalSearch
  Scenario: Verify that user is able to see the all the list of modules after clicking on 'suggested for you section' for award.
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    Then I softly see dropdown option "All" under the "Suggested For You" section
    Then I softly see dropdown option "Amendment Requests" under the "Suggested For You" section
    Then I softly see dropdown option "Announcements" under the "Suggested For You" section
    Then I softly see dropdown option "Applications" under the "Suggested For You" section
    Then I softly see dropdown option "Chatter" under the "Suggested For You" section
    Then I softly see dropdown option "Closeouts" under the "Suggested For You" section
    Then I softly see dropdown option "Contacts" under the "Suggested For You" section
    Then I softly see dropdown option "Events" under the "Suggested For You" section
    Then I softly see dropdown option "Focus Areas" under the "Suggested For You" section
    Then I softly see dropdown option "Funding Decision Memos (FDM)s" under the "Suggested For You" section
    Then I softly see dropdown option "Grants" under the "Suggested For You" section
    Then I softly see dropdown option "Key Performance Indicators (KPI)s" under the "Suggested For You" section
    Then I softly see dropdown option "Organizations" under the "Suggested For You" section
    Then I softly see dropdown option "Payment Requests" under the "Suggested For You" section
    Then I softly see dropdown option "Programs" under the "Suggested For You" section
    Then I softly see dropdown option "Progress Report" under the "Suggested For You" section
    Then I softly see dropdown option "Reports" under the "Suggested For You" section
    Then I softly see dropdown option "Reviews" under the "Suggested For You" section
    Then I softly see dropdown option "Risk Assessment" under the "Suggested For You" section
    Then I softly see dropdown option "Site Visits" under the "Suggested For You" section
    Then I softly see dropdown option "Strategic Plans" under the "Suggested For You" section
    Then I softly see dropdown option "Subawards" under the "Suggested For You" section
    Then I softly see dropdown option "Tasks" under the "Suggested For You" section

  @389048 @sprint-2-US-386939 @Pooja @GlobalSearch
  Scenario: Verify that PO user is able to see the table for extra objects which are present in the search result for subaward module
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    And I select "Grants" from dropdown for Global search
    And I perform quick search inside global search "Grants"
    And I click on "Expand List" button on left navigation for global search
    And I click on "Show more" button on left navigation for global search
    Then I softly see the text "Chatter" on left navigation for global search
    Then I softly see the text "Email Messages" on left navigation for global search
    Then I softly see the text "Notes" on left navigation for global search
    Then I softly see the text "Tasks" on left navigation for global search
    Then I softly see the text "Folders" on left navigation for global search

  @389053 @389043  @sprint-2-US-386939 @Pooja @GlobalSearch @RerunGlobal
  Scenario: Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID) on objects after global search the any record for announcement.
    When I login to "As a Grantor" app as "PM" user
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
    And I select "Subawards" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I wait for "2" seconds
    #389043
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Announcement EGMS ID" inside refine by filter
    Then I softly see "Subaward Title" inside refine by filter
    Then I softly see "External  Organization" inside refine by filter
    Then I softly see the text "Cumulative Obligation" on left navigation for global search
    Then I softly see "Min" inside refine by filter
    Then I softly see "Max" inside refine by filter
    Then I softly see "Status" inside refine by filter
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Announcements" on left navigation for global search
    Then I softly see the text "Closeouts" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search
    And I click on hyperlink for global search containing value "{SavedValue:AwardEGMSID}"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Created"

  @389060 @sprint-2-US-386939 @Pooja @GlobalSearch
  Scenario: Verify that user can sort any objects after global search any record (Eg: EGMS ID, Relevance, Program)
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I select "Subawards" from dropdown for Global search
    And I perform quick search inside global search "awards"
    Then I softly see options "Relevance" inside "Relevance" dropdown
    Then I softly see options "EGMS ID" inside "Relevance" dropdown
    Then I softly see options "Announcement EGMS ID" inside "Relevance" dropdown
    Then I softly see options "Subaward Title" inside "Relevance" dropdown
    Then I softly see options "External Organization" inside "Relevance" dropdown
    Then I softly see options "New Obligation" inside "Relevance" dropdown
    Then I softly see options "Cumulative Obligation" inside "Relevance" dropdown
    Then I softly see options "Status" inside "Relevance" dropdown

  @389314  @sprint-2-US-386939 @Pooja @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Grant is in the Created state
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I select "Grants" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:GrantEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:GrantEGMSID}" in global search with id "Grants"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail

  @389322 @sprint-2-US-386939 @Pooja @GlobalSearch
  Scenario:Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID , Internal Organization, Owner First Name, Owner Last Name ) on objects after global search the any record for Grant.
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I select "Grants" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:GrantEGMSID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "{SavedValue:GrantEGMSID}"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Created"
    And I navigate to "Grants" tab
    And I select "Grants" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:GrantEGMSID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "Automation"
    Then I softly see the text containing "{SavedValue:EXE Username}"

  @389323 @sprint-2-US-386939 @Pooja @GlobalSearch
  Scenario:Verify that user can sort any objects after global search any record by (Relevance, EGMS ID, Grant Title, Internal organization, External organization,  Project period) Status.
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I select "Grants" from dropdown for Global search
    And I perform quick search inside global search "Grants"
    Then I softly see options "Relevance" inside "Relevance" dropdown
    Then I softly see options "EGMS ID" inside "Relevance" dropdown
    Then I softly see options "Grant Title" inside "Relevance" dropdown
    Then I softly see options "External Organization" inside "Relevance" dropdown
    Then I softly see options "Project Period" inside "Relevance" dropdown
    Then I softly see options "Number of Awards" inside "Relevance" dropdown
    Then I softly see options "Cumulative Obligation" inside "Relevance" dropdown
    Then I softly see options "Owner First Name" inside "Relevance" dropdown
    Then I softly see options "Owner Last Name" inside "Relevance" dropdown
    Then I softly see options "Status" inside "Relevance" dropdown

  @389324 @sprint-2-US-386939 @Pooja @GlobalSearch
  Scenario: Verify that user is able to expand the result by Grant module and Filter/Refine the the result by configured Columns for an Grant.
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I select "Grants" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:GrantEGMSID}"
    Then I softly see value "{SavedValue:GrantEGMSID}" for title "EGMS ID" inside table "Grants"
    And I perform quick search inside global search "Grants"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Grant Title" inside refine by filter
    Then I softly see "External Organization" inside refine by filter
    Then I softly see "Project Period" inside refine by filter
    Then I softly see the text "Number of Awards" on left navigation for global search
    Then I softly see "Min" inside refine by filter
    Then I softly see "Max" inside refine by filter
    Then I softly see "Owner First Name" inside refine by filter
    Then I softly see "Owner Last Name" inside refine by filter
    And I filter field record by "EXE" by label "Owner Last Name" in left panel for global search
    Then I softly see value "EXE" for title "Owner Last Name" inside table "Grants"
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Subawards" on left navigation for global search
    Then I softly see the text "Site Visits" on left navigation for global search
    Then I softly see the text "Grants" on left navigation for global search

  @389327 @389335 @389342 @sprint-2-US-386939 @Pooja @GlobalSearch
  Scenario:Verify that the record owner is able to edit the access for record when Focus Area is in the Created state
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FocusEGMSID"
    And I navigate to "Planning" tab
    And I select "Focus Areas" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FocusEGMSID}"
    Then I softly can see row level action button "Change Owner" against "{SavedValue:FocusEGMSID}" in global search with id "Focus Areas"
    And I click on row level action button "Edit" against "{SavedValue:FocusEGMSID}" in global search with id "Focus Areas"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I navigate to "Planning" tab
    And I select "Focus Areas" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FocusEGMSID}"
      #389335
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Title" inside refine by filter
    Then I softly see "Owner First Name" inside refine by filter
    Then I softly see "Owner Last Name" inside refine by filter
    Then I softly see the text "Status" on left navigation for global search
    And I filter field record by "EXE" by label "Owner Last Name" in left panel for global search
    Then I softly see value "EXE" for title "Owner Last Name" inside table "Focus Areas"
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "External Registration" on left navigation for global search
    Then I softly see the text "Chatter" on left navigation for global search
    Then I softly see the text "Announcements" on left navigation for global search
      #389342
    And I click on hyperlink for global search containing value "{SavedValue:FocusEGMSID}"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Draft"

  @389343 @sprint-2-US-386939 @Pooja @GlobalSearch
  Scenario:Verify that Non-Owner user doesn't have an edit option in any stage of Focus Area and will get error message on page.
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FocusEGMSID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Focus Areas" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FocusEGMSID}"
    Then I softly can see row level action button "Change Owner" against "{SavedValue:FocusEGMSID}" in global search with id "Focus Areas"
    And I click on row level action button "Edit" against "{SavedValue:FocusEGMSID}" in global search with id "Focus Areas"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "---focusarea:-:focusAreaTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    When I click on "Activate" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Focus Areas" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FocusEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:FocusEGMSID}" in global search with id "Focus Areas"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - All"
    When I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "---focusarea:-:focusAreaTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I click on "Deactivate" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Focus Areas" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FocusEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:FocusEGMSID}" in global search with id "Focus Areas"
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @389459 @389460 @389461 @389462 @sprint-2-US-386939 @Pooja @GlobalSearch @bug-451518
  Scenario Outline: Verify that the record owner is able to edit the access for record when funding decision memo(FDM) is in the Created state
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    And I wait for "3" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "1" seconds
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    And I wait for "2" seconds
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    When I click on "Funding Decision Memo" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "FDMEGMSID"
    And I navigate to "Applications" tab
    And I select "Funding Decision Memos (FDM)s" from dropdown for Global search
    And I perform quick search inside global search "AN-"
    #389459
    And I click on row level action button "Edit" against "{SavedValue:FDMEGMSID}" in global search with id "Funding Decision Memos (FDM)s"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I navigate to "Applications" tab
    And I select "Funding Decision Memos (FDM)s" from dropdown for Global search
    And I perform quick search inside global search "AN-"
    And I click on hyperlink for global search containing value "Funding Decision Memo"
    And I wait for "3" seconds
    #389461
    Then I softly see field "Status" as "Created"
    And I navigate to "Applications" tab
    And I select "Funding Decision Memos (FDM)s" from dropdown for Global search
    And I perform quick search inside global search "AN-"
    #389462
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Name" inside refine by filter
    Then I softly see "Announcement Name" inside refine by filter
    Then I softly see "Status" inside refine by filter
    Then I softly see the text "# of Applications Available for Review" on left navigation for global search
    Then I softly see "Min" inside refine by filter
    Then I softly see "Max" inside refine by filter
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Announcements" on left navigation for global search
    Then I softly see the text "Closeouts" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I select "Funding Decision Memos (FDM)s" from dropdown for Global search
    And I perform quick search inside global search "AN-"
    And I click on row level action button "Edit" against "{SavedValue:FDMEGMSID}" in global search with id "Funding Decision Memos (FDM)s"
   #389460
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    #check for submit for approval and Approved status hold due to bug
    Examples:
      | Announcement Name                                               | Application Name                                                |
      | {SavedValue:Automation Runtime Announcement Application Review} | {SavedValue:Automation Runtime Announcement Application Review} |

  @389463 @389464 @sprint-2-US-386939 @Pooja @GlobalSearch
  Scenario:Verify that the record owner is able to edit the access for record when KPI is in the Created state
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    When I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "KPIEGMSID"
    And I navigate to "Planning" tab
    And I select "Key Performance Indicators (KPI)s" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:KPIEGMSID}"
    Then I softly can see row level action button "Change Owner" against "{SavedValue:KPIEGMSID}" in global search with id "Key Performance Indicators (KPI)s"
    And I click on row level action button "Edit" against "{SavedValue:KPIEGMSID}" in global search with id "Key Performance Indicators (KPI)s"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Key Performance Indicators (KPI)s" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:KPIEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:KPIEGMSID}" in global search with id "Key Performance Indicators (KPI)s"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    #389464
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - All"
    When I perform quick search for "{SavedValue:KPIEGMSID}" in "---keyperformanceindicator:-:kpiTableId---" panel
    And I click on "View" icon for "{SavedValue:KPIEGMSID}" inside table
    When I click on "Activate" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Key Performance Indicators (KPI)s" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:KPIEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:KPIEGMSID}" in global search with id "Key Performance Indicators (KPI)s"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - All"
    When I perform quick search for "{SavedValue:KPIEGMSID}" in "---keyperformanceindicator:-:kpiTableId---" panel
    And I click on "View" icon for "{SavedValue:KPIEGMSID}" inside table
    And I click on "Deactivate" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Key Performance Indicators (KPI)s" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:KPIEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:KPIEGMSID}" in global search with id "Key Performance Indicators (KPI)s"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"


  @389465 @389466 @sprint-2-US-386939 @Pooja @GlobalSearch
  Scenario: Verify that user is able to expand the result by KPI module and Filter/Refine the the result by configured Columns for an KPI.
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    When I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "KPIEGMSID"
    And I navigate to "Planning" tab
    And I select "Key Performance Indicators (KPI)s" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:KPIEGMSID}"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Domain" inside refine by filter
    Then I softly see "Title" inside refine by filter
    Then I softly see "Created By" inside refine by filter
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Announcements" on left navigation for global search
    Then I softly see the text "Closeouts" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search
    And I click on hyperlink for global search containing value "{SavedValue:KPIEGMSID}"
    And I wait for "3" seconds
    #389466
    Then I softly see field "Status" as "Created"

    @389475 @389483  @389486 @389479 @sprint-2-US-386939 @Pooja @GlobalSearch
      Scenario: Verify that the record owner is able to edit the access for record when Strategic plan is in the Created state
      When I login to "As a Grantor" app as "dynamicUser" user
      And I navigate to "Planning" tab
      When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
      And I click toggle button to select "Strategic Plans - Draft"
      And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
      And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
      And I click modal button "Save and Continue"
      When I enter value "Automation Test Description" into field "StrategyDescription__c"
      And I click on "Save" in the page details
      Then I softly see that "Status" is in "Draft" status
      And I save the field labeled "EGMS ID" as "StrategicEGMSID"
      And I navigate to "Planning" tab
      And I select "Strategic Plans" from dropdown for Global search
      And I perform quick search inside global search "{SavedValue:StrategicEGMSID}"
      Then I softly can see row level action button "Change Owner" against "{SavedValue:StrategicEGMSID}" in global search with id "Strategic Plans"
      And I click on row level action button "Edit" against "{SavedValue:StrategicEGMSID}" in global search with id "Strategic Plans"
      Then I can see top right button "Save" in page detail
      Then I can see top right button "Cancel" in page detail
      And I navigate to "Planning" tab
      And I select "Strategic Plans" from dropdown for Global search
      And I perform quick search inside global search "{SavedValue:StrategicEGMSID}"
      #389483
      Then I softly see "EGMS ID" inside refine by filter
      Then I softly see "Title" inside refine by filter
      Then I softly see "Created By" inside refine by filter
      Then I softly see the text "Status" on left navigation for global search
      Then I softly see the text "Refine By" on left navigation for global search
      And I click on "Expand List" button on left navigation for global search
      Then I softly see the text "Announcements" on left navigation for global search
      Then I softly see the text "Closeouts" on left navigation for global search
      Then I softly see the text "Amendment Requests" on left navigation for global search
      And I click on hyperlink for global search containing value "{SavedValue:StrategicEGMSID}"
      And I wait for "3" seconds
     #389486
      Then I softly see field "Status" as "Draft"
      When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
      And I navigate to "Planning" tab
      And I select "Strategic Plans" from dropdown for Global search
      And I perform quick search inside global search "{SavedValue:StrategicEGMSID}"
      And I click on row level action button "Edit" against "{SavedValue:StrategicEGMSID}" in global search with id "Strategic Plans"
      Then I cannot see top right button "Save" in page detail
      Then I cannot see top right button "Cancel" in page detail
      #389479
      Then I softly see the text containing "You dont have sufficient access to edit this record"
      Then I softly see that "Status" is in "Draft" status

      @389495 @389502 @389505 @sprint-2-US-386939 @Pooja @GlobalSearch @bug-451476
      Scenario: Verify that the Admin is able to edit the access for terms and condition when terms and condition is in the New and active state state
      When I login to "As a Grantor" app as "ADMIN" user
        When I navigate to "Planning" tab
        And I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
        When I click on top right button "New" in flex table with id "---home:-:termsAndConditionsTableId---"
        And I enter "Creation" values from "TermsandConditions_Field_Values.xlsx"
        When I click modal button "Save"
        When I save the field labeled "EGMS ID" as "EGMSID"
        And I click modal button "Close"
        And I pause execution for "3" seconds
        And I navigate to "Planning" tab
        And I select "Terms and Conditions" from dropdown for Global search
        And I perform quick search inside global search "{SavedValue:EGMSID}"
        Then I softly can see row level action button "Change Owner" against "{SavedValue:EGMSID}" in global search with id "Terms and Conditions"
        And I click on row level action button "Edit" against "{SavedValue:EGMSID}" in global search with id "Terms and Conditions"
        Then I see textarea field "Description__c" is editable
        And I navigate to "Planning" tab
        And I select "Terms and Conditions" from dropdown for Global search
        And I perform quick search inside global search "{SavedValue:EGMSID}"
        #389502
        Then I softly see "EGMS ID" inside refine by filter
        Then I softly see "Title" inside refine by filter
        Then I softly see "Source" inside refine by filter
        Then I softly see "Effective From" inside refine by filter
        Then I softly see "Mandatory?" inside refine by filter
        Then I softly see "Source" inside refine by filter
        Then I softly see "Status" inside refine by filter
        Then I softly see the text "Refine By" on left navigation for global search
        And I click on "Expand List" button on left navigation for global search
        Then I softly see the text "Announcements" on left navigation for global search
        Then I softly see the text "Programs" on left navigation for global search
        Then I softly see the text "Amendment Requests" on left navigation for global search
        And I click on hyperlink for global search containing value "{SavedValue:EGMSID}"
        And I wait for "3" seconds
       #389505
        Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
        When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
        And I navigate to "Planning" tab
        And I select "Terms and Conditions" from dropdown for Global search
        And I perform quick search inside global search "{SavedValue:EGMSID}"
        #389497 #hold due to bug
        And I click on row level action button "Edit" against "{SavedValue:EGMSID}" in global search with id "Terms and Conditions"
        Then I softly see the text containing "You dont have sufficient access to edit this record"











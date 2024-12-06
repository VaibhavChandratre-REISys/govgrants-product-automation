@GranteeSanityBusinessFlow
Feature: Sanity scenarios

  @474704 @CFVerifyGranteePOuserReviewerNocanabletosubmitReviewonCFAR
  Scenario:CF - Verify Grantee PO user (Reviewer= No)can able to submit Review on CF AR
    When I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name       | Project Role    | Is Key Contact |
      | Victor EXE | Project Officer | Checked        |
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click "Associate" after selection of "Open Data Framework" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title               | Is Primary Program |
      | Open Data Framework | Checked            |
    And I navigate to "Projections" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    Then I softly see the following messages in the page details contains:
      | KPIs added succesfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Interim Award Document" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_PRenewal_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_PeriodicRenewal_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PRAMENDID"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID1"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I wait for "5" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_CF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_CF_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "CFAMENDID"
    And I wait for "3" seconds
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:carryForwardBudgetTableId---" by clicking "Edit" :
      | Category Name | Carry Forward |
      | Construction  | 0             |
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms2" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms2" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "1" for column name "EGMS ID" as "AmendTermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate2 | 15             | 30              | 10                             | Final                   |
    And I save the value from row "1" for column name "Title" as "TitleIndirectRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective from" as "Effectivefrom" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective until" as "Effectiveuntil" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Approved Indirect Cost Rate(%)" as "ApprovedIndirectCostRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    #bug id 483935
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"

  @474703 @CFVerifyAmeliaFOuserReviewerYescanabletosubmitReview&ReviewcompletebyAROwneronclickofCompeleteReviewbuttononCFAR
  Scenario:CF - Verify Amelia FO user (Reviewer= Yes)can able to submit Review & Review complete by AR Owner on click of Compelete Review button on CF  AR
    When I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name       | Project Role    | Is Key Contact |
      | Victor EXE | Project Officer | Checked        |
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click "Associate" after selection of "Open Data Framework" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title               | Is Primary Program |
      | Open Data Framework | Checked            |
    And I navigate to "Projections" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    Then I softly see the following messages in the page details contains:
      | KPIs added succesfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Interim Award Document" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_PRenewal_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_PeriodicRenewal_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PRAMENDID"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID1"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "CFAMENDID"
    And I wait for "5" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_CF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_CF_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I wait for "3" seconds
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:carryForwardBudgetTableId---" by clicking "Edit" :
      | Category Name | Carry Forward |
      | Construction  | 0             |
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms2" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms2" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "1" for column name "Title" as "AmendTermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate2 | 15             | 30              | 10                             | Final                   |
    And I save the value from row "1" for column name "Title" as "TitleIndirectRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective from" as "Effectivefrom" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective until" as "Effectiveuntil" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Approved Indirect Cost Rate(%)" as "ApprovedIndirectCostRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I can see top right button "Edit" in page detail
    Then I softly can see row level action button "Edit" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I click on parallel lines menu bar with data target value "Peer Reviewers"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Rating is required to save.   |
      | Comments is required to save. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see that "Submitted" has been added in flextable with Id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I can see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Resend for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see value "Sent for Review" for title "Status" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see that "Submitted" has been added in flextable with Id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    #bug id 483935
   # Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentPeerReviewerTableId---"

  @482865 @CFamdVerifythatAuditoruserhavingonlyviewaccessonPRamendmentrequestonGrantlayout
  Scenario:CF amd >>Verify that Auditor user having only view access on PR amendment request on Grant layout
    When I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name       | Project Role    | Is Key Contact |
      | Victor EXE | Project Officer | Checked        |
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click "Associate" after selection of "Open Data Framework" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title               | Is Primary Program |
      | Open Data Framework | Checked            |
    And I navigate to "Projections" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    Then I softly see the following messages in the page details contains:
      | KPIs added succesfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Interim Award Document" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_PRenewal_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_PeriodicRenewal_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PRAMENDID"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID1"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "CFAMENDID"
    And I wait for "5" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_CF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_CF_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I wait for "3" seconds
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:carryForwardBudgetTableId---" by clicking "Edit" :
      | Category Name | Carry Forward |
      | Construction  | 0             |
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms2" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms2" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "1" for column name "Title" as "AmendTermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate2 | 15             | 30              | 10                             | Final                   |
    And I save the value from row "1" for column name "Title" as "TitleIndirectRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective from" as "Effectivefrom" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective until" as "Effectiveuntil" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Approved Indirect Cost Rate(%)" as "ApprovedIndirectCostRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Delete" in page detail
    Then I softly see that "GeneralConditionChanged__c" rendered in view mode only
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentObjectiveTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentKPITableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms2" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly cannot see row level action button "Edit" against "Terms2" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly cannot see row level action button "Delete" against "Terms2" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I navigate to "Files" sub tab
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"

  @474697 @CFVerifyPOuseAROwnercanabletoSubmitARforApproval&Approvedfromassigned4stepapprover&candoSendtoOwner/Forward/Approveactions&seeSubmittoGrantorbuttononceApprovedtheBPCARRecord
  Scenario:CF - Verify PO user (AR Owner) can able to Submit AR for Approval & Approved from assigned 4 step approver & can do Send to Owner/ Forward/ Approve actions & see 'Submit to Grantor' button once Approved the BPC AR Record
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name       | Project Role    | Is Key Contact |
      | Victor EXE | Project Officer | Checked        |
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click "Associate" after selection of "Open Data Framework" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title               | Is Primary Program |
      | Open Data Framework | Checked            |
    And I navigate to "Projections" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    Then I softly see the following messages in the page details contains:
      | KPIs added succesfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Interim Award Document" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_PRenewal_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_PeriodicRenewal_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PRAMENDID"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID1"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "CFAMENDID"
    And I wait for "5" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_CF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_CF_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I wait for "3" seconds
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:carryForwardBudgetTableId---" by clicking "Edit" :
      | Category Name | Carry Forward |
      | Construction  | 0             |
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms2" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms2" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "1" for column name "EGMS ID" as "AmendTermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate2 | 15             | 30              | 10                             | Final                   |
    And I save the value from row "1" for column name "Title" as "TitleIndirectRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective from" as "Effectivefrom" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective until" as "Effectiveuntil" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Approved Indirect Cost Rate(%)" as "ApprovedIndirectCostRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | NA                |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Amendment Request |
      | Step 3            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | NA                |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | NA                |
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Responsibilities - At least one approver is required. |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 2            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Grantee PO | Step 3            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 4            |
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Name     | Amendment Request |
      | Sarah PM | Step 4            |
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Name     | Amendment Request |
      | Sarah PM | Step 4            |
    Then I softly see the following messages in the page details contains:
      | You cannot specify the same step for multiple users for Amendment Request |
    And I refresh the page
    And I wait for "5" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "GRANTEE PO" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see the following messages in the page details contains:
      | Successfully Re-Assigned |
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details without processing
    Then I softly see confirmation box with body "Are you sure, you want to submit this request for approval?" is displayed
    And I click "Cancel" on modal confirmation box
    Then I softly see field "Status" as "Created"
    And I click on "Submit for Approval" in the page details without processing
    Then I softly see confirmation box with body "Are you sure, you want to submit this request for approval?" is displayed
    And I click "OK" on modal confirmation box
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Approved"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Approved" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    Then I cannot see top right button "Edit" in page detail
    Then I can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Submitted to Grantor On is required to save. |
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    And I navigate to "Overview" sub tab
    And I save the field labeled "Submitted to Grantor On" as "SubmittedtoGrantorOn"
    Then I softly see field "Submitted to Grantor On" as "{SavedValue:SubmittedtoGrantorOn}"

  @474674 @CFVerifyPOuserAROwnercanabletotakeNotAcceptedDecisionfromGrantorRecordDecisionmodalonCFAR
  Scenario:CF - Verify PO user (AR Owner)can able to take Not Accepted Decision from Grantor Record Decision modal on CF AR
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name       | Project Role    | Is Key Contact |
      | Victor EXE | Project Officer | Checked        |
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click "Associate" after selection of "Open Data Framework" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title               | Is Primary Program |
      | Open Data Framework | Checked            |
    And I navigate to "Projections" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    Then I softly see the following messages in the page details contains:
      | KPIs added succesfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Interim Award Document" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_PRenewal_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_PeriodicRenewal_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PRAMENDID"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID1"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "CFAMENDID"
    And I wait for "5" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_CF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_CF_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I wait for "3" seconds
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:carryForwardBudgetTableId---" by clicking "Edit" :
      | Category Name | Carry Forward |
      | Construction  | 0             |
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms2" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms2" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "1" for column name "EGMS ID" as "AmendTermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate2 | 15             | 30              | 10                             | Final                   |
    And I save the value from row "1" for column name "Title" as "TitleIndirectRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective from" as "Effectivefrom" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective until" as "Effectiveuntil" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Approved Indirect Cost Rate(%)" as "ApprovedIndirectCostRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    Then I softly see fields "Comments__c" is in edit mode
    When I enter values into fields
      | Value        | Field       |
      | Not Accepted | Decision__c |
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Additional Details is required to save. |
    When I enter values into fields
      | Value | Field       |
      | Test  | Comments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Not Accepted"
    Then I see status in Progress-bar is "Not Accepted" and is "Red"
    Then I softly cannot see top right button "Edit" in page detail
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Not Accepted" for title "New Value" inside field history table
    Then I softly see value "Submitted to Grantor" for title "Original Value" inside field history table

  @474673 @CFVerifyAdminuserAwardOwnercanabletoRevisetheCarryForwardAmendmentRequestonclickofReviseAmendmentbuttonwhenARisinSubmittoGrantorstate&abletoseestatus&StepProgressbarafterrevisetheAR
  Scenario:CF - Verify Admin user  (Award Owner) can able to Revise the Carry Forward Amendment Request on click of Revise Amendment button when AR is in Submit to Grantor state & able to see status & Step Progress bar after revise the AR
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name       | Project Role    | Is Key Contact |
      | Victor EXE | Project Officer | Checked        |
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click "Associate" after selection of "Open Data Framework" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title               | Is Primary Program |
      | Open Data Framework | Checked            |
    And I navigate to "Projections" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    Then I softly see the following messages in the page details contains:
      | KPIs added succesfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Interim Award Document" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_PRenewal_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_PeriodicRenewal_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PRAMENDID"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID1"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "AwardId1"
    And I wait for "5" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_CF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_CF_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "CFAMENDMENT"
    And I wait for "3" seconds
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:carryForwardBudgetTableId---" by clicking "Edit" :
      | Category Name | Carry Forward |
      | Construction  | 0             |
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms2" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms2" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "2" for column name "Title" as "AmendTermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate2 | 15             | 30              | 10                             | Final                   |
    And I save the value from row "1" for column name "Title" as "TitleIndirectRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    And I click on "Revise Amendment" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to revise the amendment request? The amendment request will require an approval again after being revised." is displayed
    And I click "Cancel" on modal confirmation box
    Then I softly see field "Status" as "Submitted to Grantor"
    And I click on "Revise Amendment" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to revise the amendment request? The amendment request will require an approval again after being revised." is displayed
    And I click "OK" on modal confirmation box
    Then I softly see field "Status" as "Revision in Progress"
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Edit" in page detail
    When I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Revision in Progress" for title "New Value" inside field history table
    Then I softly see value "Submitted to Grantor" for title "Original Value" inside field history table
    And I click on back arrow
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"

  @474678 @474672 @CFVerifyPMuserARrecordownercanabletoseeAmendAwardbuttonwhenARgetAccepted&abletocreatenewAward&checkstatusofoldAward&checkimpactofnewlycreatedAwardonGrant&Award
  Scenario:CF - Verify PM user (AR record owner) can able to see Amend Award button when AR get Accepted & able to create new Award & check status of old Award & check impact of newly created Award on Grant & Award
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name       | Project Role    | Is Key Contact |
      | Victor EXE | Project Officer | Checked        |
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click "Associate" after selection of "Open Data Framework" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title               | Is Primary Program |
      | Open Data Framework | Checked            |
    And I navigate to "Projections" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    Then I softly see the following messages in the page details contains:
      | KPIs added succesfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Interim Award Document" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_PRenewal_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_PeriodicRenewal_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PRAMENDID"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID1"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I wait for "5" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_CF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_CF_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "CFAMENDID"
    And I wait for "3" seconds
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:carryForwardBudgetTableId---" by clicking "Edit" :
      | Category Name | Carry Forward |
      | Construction  | 0             |
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "CFTermsCondition" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "CFTermsCondition" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "2" for column name "Title" as "CFTermsCondition" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate2 | 15             | 30              | 10                             | Final                   |
    And I save the value from row "1" for column name "Title" as "TitleIndirectRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective from" as "Effectivefrom" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective until" as "Effectiveuntil" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Approved Indirect Cost Rate(%)" as "ApprovedIndirectCostRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    Then I can see top right button "Amend Award" in page detail
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Accepted" for title "New Value" inside field history table
    And I softly see value "Submitted to Grantor" for title "Original Value" inside field history table
    And I click on back arrow
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Activate Award" in page detail
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardEGMSID}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:AwardEGMSID1}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardEGMSID2}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I click on "View" icon for "{SavedValue:AwardEGMSID2}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Projections" sub tab
    Then I softly see value "{SavedValue:TitleIndirectRate}" for title "Title" inside table "---grantee_tableId:-:awardIndirectRateTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see value "{SavedValue:CFTermsCondition}" for title "Title" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:CFAMENDID}" for title "EGMS ID" inside table "---grantee_tableId:-:GrantsAmendmentRequestsTableId---"
    Then I softly see value "{SavedValue:PRAMENDID}" for title "EGMS ID" inside table "---grantee_tableId:-:GrantsAmendmentRequestsTableId---"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:AwardEGMSID1}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Amended"
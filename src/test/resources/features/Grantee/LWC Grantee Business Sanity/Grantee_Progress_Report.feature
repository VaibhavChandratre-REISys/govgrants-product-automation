@GranteeProgressReport
Feature: Validate all scenarios for Grantee Progress Report

  @495998 @ValidateFromAppScheduleProgressReportAdminuserPRownercanabletoSubmitProgressReportwithsingleApprover
  Scenario: Validate From App - Schedule Progress Report Admin user PR owner can able to Submit Progress Report with single Approver
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime award" and opportunity number "CAS-HHS0000660610" with properties "default-Product Admin user"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime award}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime award}" with properties "default-Product Admin user"
    And I updated award from application for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Projections" sub tab
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    When I enter in modal "Grantee_Progress_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Progress Report"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Report Creation Date |
      | {SavedValue:EGMS ID1} | 0                    |
    And I wait for "200" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "progressEGMSID" from flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "Scheduled" for title "Report Type" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - Draft"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    And I save the field labeled "EGMS ID" as "progressEGMSID"
    When I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 10             | 1                    |
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                          | Field                 |
      | Automation Key Accomplishments | KeyAccomplishments__c |
      | Automation Obstacles           | Obstacles__c          |
      | Automation Plans               | Plans__c              |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name       | Progress Report |
      | Victor EXE | Step 1          |
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Report has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside table
    Then I softly can see top right button "Mark as Submitted" in page detail
    And I click on "Mark as Submitted" in the page details
    And I wait for "2" seconds
    And I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Submitted to Grantor On is required. |
    And I enter in modal "Grantee_Submit Details" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "2" seconds
    When I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Submitted By" as "SubmittedBy"
    Then I softly see field "Submitted By" as "{SavedValue:SubmittedBy}"
    And I save the field labeled "Submitted On" as "SubmittedOn"
    Then I softly see field "Submitted On" as "{SavedValue:SubmittedOn}"
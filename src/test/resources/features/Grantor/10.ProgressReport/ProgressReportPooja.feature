@grantor-regression @grantor-parallel-regression @progressReport @progressReportNB @regression @ProgressReportPooja
Feature: Validate scenarios in Progress Report without background

  @59832 @59571 @validateSRUserCannotEditPreviousDateField @mahadev @buglogged150448 @ReRunProgress
  Scenario: Validate SR user is not able to edit the Previous Actual field on KPI table under Performance tab at Progress report
  Validate Supporting checklist Table is empty if Supporting document checklist data is not added at Grant at SR user end. | Validate SR user is not able to edit the Previous Actual field on KPI table under Performance tab at Progress report
    Given I activated standalone subaward "Automation Runtime Award" with properties "AWARD_NO_SUPPORTINGDOC_PROGRAM" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I get the "EGMS ID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see "No Records Found" inside flex table with id "---progressreport:-:progressReportChecklistsTableId---"
    And I navigate to "Performance" sub tab
    When I click on "Edit" icon for "Automation Permanent KPI" inside flex table with id "---progressReport:-:kpiTableId---"
    Then I see field "PreviousDate__c" is not editable
    Then I see field "PreviousActual__c" is not editable

  @37184 @ValidateScheduleFrequencyQuarterlyScheduleBaseAsCalendar @mahadev
  Scenario Outline: Verify on Active award User is allowed to select Frequency as Quarterly when schedule base is Calendar
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Award Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ScheduleQuartelyCalendar" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---subAwardStandAlone:-:progressReportScheduleTableId---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @37228 @34932 @34938 @34945 @34946 @45732 @58534 @validateScheduleFrequencyAnnuallyScheduleBaseAsCalendar @mahadev @ReRunProgress
  Scenario Outline: Verify on Active award User is allowed to select Frequency as  Annually when schedule base is Calendar | Validate User is allowed to change frequency as Annually, schedule base as calendar on progress report schedule when the award is active
  Verify on Active award User is allowed to select Frequency as Semi-Annually  when schedule base is Calendar | Verify on Active award User is allowed to select Frequency as Bi-Monthly when schedule base is Calendar
  Verify Sub-recipient user are not allowed to Edit the Progress Report Schedule table on active subaward | Validate User is allowed to change frequency as Annually, schedule base as calendar on active award and progress report should be created
  Validate User is not allowed to select schedule dates less than 60 days when frequency is Bi-Monthly
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Award Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ScheduleAnnuallyCalendar" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "View" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
#    And I switch to iframe with id "---progressReport:-:ProgressReportModalIframeId---"
    Then I softly see field "Frequency" as "Annually"
    And I refresh the page
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---subAwardStandAlone:-:progressReportScheduleId---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ScheduleSemiAnnually" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I refresh the page
    And I save the total records from the flex table id "---subAwardStandAlone:-:progressReportScheduleId---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ScheduleBiMonthly" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---subAwardStandAlone:-:progressReportScheduleId---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "BI-MonthlyError" values from "Errors.xlsx"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | The time between Schedule Start Date and Schedule End Date must be greater than or equal to 60 days if Bi-Monthly frequency is selected. |
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Award Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    Then I softly cannot see row level action button "Edit" against "<Award Name>" in flex table with id "---progressreport:-:progressReportsScheduleId---"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @34936 @validateUserIsNotAllowedToSelectReportingPeriodStartDateBeforeProjectPeriodStartDateOnActiveAward @mahadev
  Scenario Outline: Validate User is not allowed to save reporting Period Start date less than Project Period Start Date on active award
    Given I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "Progress Report StartDate Error" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    Then I see the following messages in the page details contains:
      | Schedule Start date cannot be before Budget Period Start Date |
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @55312 @taskCreationForSubrecipientProgressReportAtGranteePortal @mahadev
  Scenario: Validate  task is created for Sub-recipient user when batch is executed on active award
    Given I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"

  @45733 @37232 @45744 @45738 @SelectDesiredFrequencyAsMonthlywithScheduleBaseAsReportingPeriod @jitendra @ReRunProgress
  Scenario Outline: Verify Reporting Period End Date is same as the Schedule End Date (Active award) | Validate User is not allowed to select schedule dates less than 120 days when frequency is Semi-Annually
  Verify if Schedule Start date field is not selected then it should not allow to create the schedule | Verify Reporting Period Start Date is same as the Schedule Start Date (Active)
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ProgressReportQuartelyReporting" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "View" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I save the field labeled "Reporting Period End Date" as "ReportingPeriodEndDate"
    When I close "Progress Report Schedule" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "Progress Report"
    And I navigate to last page in flex table "---subAwardStandAlone:-:progressReportScheduleId---"
    And I get the value from row "last row" for column name "Reporting Period End Date" in flex table "---progressreport:-:progressReportsTaskScheduleId---"
    Then I softly see value "{SavedValue:lastValueFromTableForCol}" is "Equals to" the value "{SavedValue:ReportingPeriodEndDate}"
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "SemiAnnuallyError" values from "Errors.xlsx"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | The time between Schedule Start Date and Schedule End Date must be greater than or equal to 120 days if Semi-Annually frequency is selected. |
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I refresh the page
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ProgressReportQuartelyReporting" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "View" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    When I close "Progress Report Schedule" modal by clicking the top right x button
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I refresh the page
#    And I expand nested table containing column value "Progress Report"
    And I get the value from row "1" for column name "Reporting Period Start Date" in flex table "---progressreport:-:progressReportsTaskScheduleId---"
    Then I softly see value "{SavedValue:lastValueFromTableForCol}" is "Equals to" the value "{SavedValue:ReportingPeriodStartDate}"
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "NoScheduleStartDateError" values from "Errors.xlsx"
    And I enter value "" into field "CalReportingStartDate__c"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Reporting Period Start Date is required to save. |
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @55314 @34934 @updateOfSemiAnnualFrequencyOnModalBeforeClose @jitendra
  Scenario Outline: Validate User is allowed to change frequency Not applicable to Semi-Annually , schedule base as calendar on progress report schedule when the award is active
  Verify User is allowed to change frequency as Monthly, on progress report schedule when Progress report is approved on active award
    Given I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c,false"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "Progress Report Semi-Annually" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Terms" sub tab
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c,false"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ScheduledEndDateAfterStartDate" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Schedule End date cannot be after Budget Period End Date. |
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @58532 @58665 @58737 @verifyUserIsAllowedToChangeFrequencyAsMonthlyOnProgressReportSchedule  @mahadev @ReRunProgress
  Scenario Outline: Verify User is allowed to change frequency as Monthly, on progress report schedule when Progress report is approved on active award
  Verify User is allowed to change frequency as Quarterly,on active award when Progress report is approved by Program approver
  Verify Subaward is getting updated with Progress report schedules at Sub-recipient end on active award
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Send Back to Subrecipient" in the page details
    And I refresh the page
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Actual | Reported Date |
      | Automation Permanent KPI | 95     | 7             |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                     | Progress Report |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                     | Progress Report |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Monthly" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "View" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    Then I softly see field "Frequency" as "Monthly"
    And I refresh the page
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Quarterly" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    Then I softly see value "Quarterly" for title "Frequency" inside table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @34944 @validateInternalUserIsAbleToSeeSchedulesGeneratedUnderScheduledActivitiesOnActiveAward  @mahadev @ReRunProgress
  Scenario Outline: Validate Internal User is able to see the Schedules generated under Scheduled Activities on active award
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    And I expand nested table containing column value "Progress Report"
    And I wait for "3" seconds
    When I save the value from row "1" for column name "EGMS ID" as "EGMSID" from flex table "---progressreport:-:progressReportsTaskScheduleId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Monitoring Schedules" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Scheduled Activities - All"
    And I wait for "5" seconds
    When I perform quick search for "{SavedValue:EGMSID}" in "---progressreport:-:monitoringScheduleGrantorTableId---" panel
    Then I see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---progressReport:-:monitoringScheduleGrantorTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @65419 @checkSheduleCreatedAfternegotiationAccepted @jitendra @ReRunProgress
  Scenario Outline: Verify once batch is run and User edit the Frequency then the Schedule should be generated accordingly
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
    And I enter value "Automation Runtime Award" into field "ProjectTitle__c"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
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
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Monthly" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    Then I see value "Monthly" for title "Frequency" inside table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @55397 @VerifyOnceBatchIsRunAndUserEditFrequencyThenSchedulesShouldBeGeneratedAccordingly  @mahadev @ProgressRerunPooja
  Scenario Outline: Verify Once Batch is run and User edit the Frequency then the Schedule should be generated accordingly
    Given I activated standalone subaward "Automation Runtime Award" with properties "PROGRESS_REPORT_QUARTERLY" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressreport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressreport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressreport:-:GrantsSubAwardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    Then I softly see value "Quarterly" for title "Frequency" inside table "---progressreport:-:RecipientprogressReportScheduleTableId---"
    And I navigate to "Terms" sub tab
    When I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    When I expand nested table containing column value "Progress Report"
    And I save the value from row "1" for column name "EGMS ID" as "EGMSID1" from flex table "---progressreport:-:progressReportsTaskScheduleId---"
    When I collapse nested table containing column value "Progress Report"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---progressreport:-:progressReportsScheduleId---" without waiting for record
    When I enter in modal "Progress Report Quarterly" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    When I expand nested table containing column value "Progress Report"
    And I save the value from row "1" for column name "EGMS ID" as "EGMSID2" from flex table "---progressreport:-:progressReportsTaskScheduleId---"
    And I save the total records from the flex table id "---progressreport:-:progressReportsTaskScheduleId---" as "totalRecords"
    Then I softly see progress report table is getting updated with count "{SavedValue:totalRecords}" inside flextable with Id "---progressreport:-:progressReportsTaskScheduleId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @34935 @58751 @ValidateOnActiveAwardProgressReportIsCreatedAtSubRecipientEndWhenBatchIsExecuted @mahadev
  Scenario Outline: : Validate sub-recipient user can see progress report under Performance tab at Sub-award View when Batch is executed | Validate on active award Progress report is created at Sub-recipient end when batch is executed
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:recipientGrantProgressReportTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" against the value "Created" inside table "---progressReport:-:recipientAwardProgressReportTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @55307 @58664 @updateOfSemiAnnualFrequencyOnModalBeforeClose @jitendra @ReRunProgress
  Scenario Outline: Validate User is allowed to change frequency as Annually, schedule base as calendar on progress report schedule when Progress report is submitted to Grantor
  Validate SPA user is not allowed to change the Progress report Schedule on Active subaward when status of Progress Report is  created
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPA" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientsRelatedSubAwardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    Then I softly cannot see row level action button "Edit" against "Progress Report" in flex table with id "---progressreport:-:progressReportsScheduleId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Annually" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    Then I softly see value "Annually" for title "Frequency" inside table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @58885 @34937 @verifySubrecipientUserAbleToSeeDraftProgressReportAtMonitoringTab @mahadev @ReRunProgress
  Scenario: Verify that sub-recipient user will be able to see Draft Progress Report at Progress Reports - Draft table on active award by using List View | Validate draft progress report at under monitoring tab is not present at Internal User end using List view
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
#    Then I softly cannot see toggle option "Progress Reports - Draft" inside flex table id "---progressReport:-:internalProgressReportFlexTableId---"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "Record Id" in "---progressReport:-:progressReportFlexTableId---" panel
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" against the value "Created" inside table "---progressReport:-:progressReportFlexTableId---"

  @58967 @validateUserNotifiedColumnIsUpdatedWithACheckedMarkForMultipleProgressReportsScheduleWhenGeneratedForSRUser @mahadev
  Scenario Outline: Validate user notified column is updated with a tick mark for multiple Progress reports Schedule when task is generated for SR user
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c,false"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c,false"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    And I expand nested table containing column value "Progress Report"
    Then I can see "2" record value is checked for field name "TaskCreated__c"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @59132 @validateSRUserNotAllowedToSubmitPRToGrantorWhenAcknowledgemetNotChecked @mahadev @ReRunProgress
  Scenario: Validate Sub-recipient user is not allowed to submit progress report to grantor when Acknowledgement box is not checked at Overview tab
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "ErrorForAck" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    When I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details contains:
      | Overview Tab - Certify the Progress Report by checking the Acknowledgment Box before submitting to Grantor. |

  @59133 @validateSRUserNotAllowedToSubmitPRToGrantorWhenKeyAccomplishmentNotEntered @mahadev @ProgressRerunPooja
  Scenario: Validate sub-recipient user is not allowed to submit progress report to grantor when Key Accomplishments  not entered
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
#    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "KeyAccError" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    When I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details contains:
      | Performance Tab - Provide a value for Key Accomplishment for Progress Report before submitting to Grantor. |

  @59134 @validateSRUserNotAllowedToSubmitPRToGrantorWhenObstacleNotEntered @mahadev @ProgressRerunPooja
  Scenario: Validate Sub-recipient user is not allowed to submit progress report to grantor when Obstacle is not entered at Performance tab
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
#    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "ObstacleError" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    When I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details contains:
      | Performance Tab - Provide a value for Obstacles for Progress Report before submitting to Grantor. |

  @59135 @validateSRUserNotAllowedToSubmitPRToGrantorWhenPlanNotEntered @mahadev @ProgressRerunPooja
  Scenario: Validate Sub-recipient user is not allowed to submit progress report to grantor when Plan is not entered at Performance tab
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
#    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "PlanError" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    When I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details contains:
      | Performance Tab - Provide a value for Plans for Progress Report before submitting to Grantor. |

  @59137 @58524 @NoPRSubmitToGrantorIfSupportDocIsMissing @jitendra @ProgressRerunPooja @ReRunProgress
  Scenario Outline: Validate Sub-recipient user is not allowed to submit progress report to grantor when Supporting document is missing under Forms and Attachments Tab.
  Validate User is allowed to change frequency as Quarterly, on progress report schedule when progress report status is Submitted to Approval on active award
    Given I activated standalone subaward "Automation Runtime Award" with properties "PROGRESS_REPORT_QUARTERLY" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    When I get the "EGMS ID"
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    And I wait for "3" seconds
    Given I click on "Submit to Grantor" in the page details
#    Then I softly see the following messages in the page details contains:
#      | Forms and Attachments Tab - Supporting Documents are missing. |
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                     | Progress Report |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                     | Progress Report |
      | {SavedValue:FO Username} | Step 2          |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "Progress Report Quarterly" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "View" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    Then I softly see field "Frequency" as "Quarterly"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @59199 @59200 @NotModifySupportDocListAfterSubmitToGrantor @jitendra @buglogged150945 @ReRunProgress
  Scenario Outline: Validate SR User is not able to modify Supporting Documents Checklist table when Progress report is Submitted to Grantor | Validate SR User is able to modify Supporting Documents Checklist table when Progress report status is sent back to sub-recipient
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Award Name>" in "---progressreport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    Then I softly cannot see row level action button "Attach" against "Automation" in flex table with id "---progressReport:-:progressReportChecklistsTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Send Back to Subrecipient" in the page details
    And I wait for "4" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    When I perform quick search for "Record Id" in "---progressReport:-:progressReportFlexTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Attach" against "Automation" in flex table with id "---progressReport:-:progressReportChecklistsTableId---"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @59189 @validateSubmitProgressReportWithoutUploadingSupportingDocument @mahadev @ReRunProgress
  Scenario Outline: Validate SR is allowed to submit Progress report to grantor without uploading Supporting document When Supporting document checklist is selected Optional at Grant
    Given I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    When I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "Green"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @59190 @validateSubrecipientDocumentLinkFieldValueIsNotApplicable @mahadev
  Scenario Outline: Validate by default Subrecipient document link field value is Not Applicable at SR user end when Supporting document checklist is selected Mandatory at Grant
    Given I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT" of type "Competitive"
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressreport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---progressreport:-:grantChecklistsTableId---" by clicking "Add" :
      | Description | Required  | Applies To      | Status |
      | Automation  | Mandatory | Progress Report | Active |
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
#    And I am on "SUBPORTAL" portal
#    And I login to "Grants Portal" app as "SPI3" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressreport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---progressreport:-:recipientGrantProgressReportTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I see value "Not Applicable" for title "Subrecipient Document Link" against the value "Active" inside table "---progressreport:-:progressReportChecklistsTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @59193 @validateDocumentLinkFieldValueChangeToViewHyperlink @mahadev @ReRunProgress
  Scenario Outline: Validate once document is uploaded by SR user than Document Link field value change to view hyperlink on created Progress report
    Given I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Award Name>" in "---progressreport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---progressreport:-:grantChecklistsTableId---" by clicking "Add" :
      | Description | Required  | Applies To      | Status |
      | Automation  | Mandatory | Progress Report | Active |
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
#    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    Then I see value "View" for title "Subrecipient Document Link" against the value "Active" inside table "flexGridProgressReportChecklists"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @59283 @validateSubrecipientDocumentLinkFieldValueIsNotApplicableWhenOptional @mahadev
  Scenario Outline: Validate by default Template Link field value is Not Applicable at Progress report if template is not uploaded by award owner at Grant
    Given I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Award Name>" in "---progressreport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---progressreport:-:grantChecklistsTableId---" by clicking "Add" :
      | Description | Required  | Applies To      | Status |
      | Automation  | Mandatory | Progress Report | Active |
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressreport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---progressreport:-:recipientGrantProgressReportTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I see value "Not Applicable" for title "Subrecipient Document Link" against the value "Active" inside table "---progressreport:-:progressReportChecklistsTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @59284 @validateSubrecipientDocumentLinkFieldValueIsNotApplicableWhenOptional1 @jitendra
  Scenario Outline: Validate at SR User side Template Link field value is View Hyperlink at Progress report if template is uploaded by award owner at Grant.
    Given I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Award Name>" in "---progressreport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---progressreport:-:grantChecklistsTableId---" by clicking "Add" :
      | Description | Required  | Applies To      | Status |
      | Automation  | Mandatory | Progress Report | Active |
    And I click on "Upload Template" icon for "Automation" inside flex table with id "---progressreport:-:grantChecklistsTableId---" with wait for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
#    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
#    When I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
#    When I choose the file "sample.pdf" to upload for "Checklist" of type "---progressReport:-:progressReportChecklistsTableId---"
#    When I close "Upload Document" modal by clicking the top right x button
    Then I see value "View" for title "Template Link" against the value "Active" inside table "---progressreport:-:ProgressReportChecklistTableId---"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @59289 @TemplateLinkOptional @jitendra
  Scenario Outline: Validate  Supporting Checklist Table at Progress Report is generated with the latest updated data by award owner at SR User End
    Given I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Award Name>" in "---progressreport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---progressreport:-:grantChecklistsTableId---" by clicking "Add" :
      | Description | Required | Applies To      | Status |
      | Automation  | Optional | Progress Report | Active |
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    And I edit the following rows inline in flex table with id "---progressreport:-:grantChecklistsTableId---" by clicking "Edit" :
      | Description | Required |
      | Automation  | Optional |
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressreport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---progressreport:-:recipientGrantProgressReportTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I see value "Optional" for title "Required" against the value "Automation" inside table "---progressreport:-:progressReportChecklistsTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @59140 @attachementSavedSuccessfully @jitendra
  Scenario Outline: Validate SR user is able to attach the document from Upload file from computer option when Supporting document checklist is selected Mandatory at Grant
    Given I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Award Name>" in "---progressreport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---progressreport:-:grantChecklistsTableId---" by clicking "Add" :
      | Description | Required  | Applies To      | Status |
      | Automation  | Mandatory | Progress Report | Active |
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I wait for "3" seconds
    Then I see the following messages in the page details contains:
      | Attachment saved successfully |
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

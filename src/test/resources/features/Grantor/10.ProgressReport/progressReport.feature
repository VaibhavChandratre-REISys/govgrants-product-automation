@progressReport @grantor-regression @grantor-parallel-regression @progressReportWithBackground @regression
Feature: Validate all scenarios in Progress Report

  Background: To create a progress report
    Given I activated standalone subaward "Automation Runtime award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime award}" having object api name as "ProgressReports__c"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    When I get the "EGMS ID"

  @51097 @51098 @51099 @51100 @51102 @51124 @51101 @51103 @51105 @51106 @51107 @51108 @51109 @59048 @51113 @51111 @51114 @51115 @51116 @51117 @51120 @editKPIProgressReportformFilling @FieldHistoryExclude @NewProgressFinal
  Scenario: To edit KPI in Progress Report | To fill and complete the form in Progress Report | To validate KPI for progress report are not editable post submission of prog report to grantor.
  To submit Progress Report to Grantor | To validate Submitted Progress Report Table is updated post report is submitted to Grantor.
    Then I softly see field "Status" as "Created"
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Certify the Progress Report by checking the Acknowledgment Box before submitting to Grantor. |
      | Performance Tab - Provide a value for Key Accomplishment for Progress Report before submitting to Grantor.  |
      | Performance Tab - Provide a value for Obstacles for Progress Report before submitting to Grantor.           |
      | Performance Tab - Provide a value for Plans for Progress Report before submitting to Grantor.               |
      | Performance tab - Please add some value in the Actual of the KPI table                                      |
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    Then I softly see that "7" has been added in flextable with Id "---progressReport:-:kpiTableId---"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I wait for "8" seconds
#    Then I softly see value "100%" for title "Percentage" inside table "---progressReport:-:formTableId---"
#    Then I softly see that "100%" has been added in flextable with Id "---progressReport:-:formTableId---"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I navigate to "Performance" sub tab
    Then I softly cannot see row level action button "Edit" against "Automation Permanent KPI" in flex table with id "---progressReport:-:kpiTableId---"
    When I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - Submitted"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:progressReportFlexTableId---" panel
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:progressReportFlexTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                     | Progress Report |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                     | Progress Report |
      | {SavedValue:FO Username} | Step 2          |
    Then I softly see that "{SavedValue:PM Username}" has been added in flextable with Id "---progressReport:-:approversTableId---"
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent Back to Subrecipient" and is "dark blue"
#    When I navigate to "History" sub tab
#    Then I softly see value "Sent Back to Subrecipient" for title "New Value" inside table "History"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 25     |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    Given I click on "Submit for Approval" in the page details
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---progressReport:-:peerReviewersTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I "Send to Owner" in the approval decision
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
#    When I navigate to "History" sub tab
#    Then I softly see value "Submitted to Grantor" for title "New Value" inside table "History"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - Submitted"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:internalProgressReportFlexTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---progressReport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---progressreport:-:GrantsSubAwardsTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    Then I softly see value "25" for title "Actual" against the value "Automation Permanent KPI" inside table "---progressReport:-:awardKPITableId---"

  @51104 @58535 @spaUserBlockedfromSubmisionOfProgressReport
  Scenario: To validate SPA user is not allowed to Submit Progress Report | Verify Sub-recipient user is not allowed to Edit the Schedules created on active award when Progress report is generated.
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Actual | Reported Date |
      | Automation Permanent KPI | 7      | 7             |
    Then I softly cannot see top right button "Submit to Grantor" in page detail
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---progressreport:-:recipientActiveGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---progressReport:-:recipientsRelatedSubAwardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    Then I softly cannot see row level action button "Edit" against "Progress Report" in flex table with id "---progressreport:-:progressReportsScheduleId---"

  @51118 @51119 @51121 @59678 @51122 @51123 @51125 @58887 @sendBacktoOwnerOfProgressReportbyFiscalApprover @smoke @FieldHistoryExclude
  Scenario: To validate Progress Report send back to owner functionality by Fiscal approver. |  To validate progress report are not editable post submission of progress report to grantor.
  To validate  field history update post Progress Report is send back to owner by Fiscal approver.
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
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    And I wait for "5" seconds
    Then I softly cannot see top right button "Edit" in page detail
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Record Id}" inside table
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Record Id}" inside table
    When I "Send to Owner" in the approval decision
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
#    When I navigate to "History" sub tab
#    Then I softly see value "Submitted to Grantor" for title "New Value" inside table "History"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - Submitted"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:internalProgressReportFlexTableId---" without waiting for record
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - Approved"
    Then I softly see all values "Approved" under column "Status" inside flextable with id "---progressReport:-:internalProgressReportFlexTableId---"

  @55313 @55316 @verifyDraftProgressReportNotDisplayedOnGrantAtInternal @mahadev
  Scenario Outline: Verify generated progress report should not displayed at management tab of grant | Verify Progress Report table is getting updated at Sub-recipient user end on award
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Management" sub tab
    Then I softly do not see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:grantorGrantProgressReportTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressreport:-:RecipientSubAwardTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:recipientAwardProgressReportTableId---"
    Examples:
      | Grant Name                            |
      | {SavedValue:Automation Runtime award} |

  @57646 @57690 @verifyProgressReportTablUpdatedWithStatusSubmittedForApprovalAtSubPortal @mahadev @NewProgressFinal @TBExecution
  Scenario Outline: Verify Progress report table get updated with status Submitted for Approval at grantee portal | To edit Progress Report
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Performance" sub tab
    Then I softly see field "Key Accomplishments" as "Key accomplishments for this reporting period"
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
    And I wait for "3" seconds
    When I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
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
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressreport:-:RecipientSubAwardTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:recipientAwardProgressReportTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    Examples:
      | Grant Name                            |
      | {SavedValue:Automation Runtime award} |

  @34931 @submitProgressReportToGrantorInternalUser @jitendra
  Scenario Outline: Verify that all internal users can view submitted Progress Reports
    And I click on "Edit" in the page details
    When I enter "Edition" values from "<progressReportSheet>"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "<kpiTableId>" by clicking "Edit" :
      | Title                    | Actual | Reported Date |
      | Automation Permanent KPI | 7      | 7             |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - Submitted"
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---progressreport:-:internalProgressReportFlexTableId---" without waiting for record
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    Examples:
      | progressReportSheet              | kpiTableId                        | formTableId                        |
      | ProgressReport_Field_Values.xlsx | ---progressReport:-:kpiTableId--- | ---progressReport:-:formTableId--- |

  @55310 @editProgressReportSchedule @jitendra
  Scenario Outline: To edit Progress Report
    And I click on "Edit" in the page details
    When I enter "Edition" values from "<progressReportSheet>"
    And I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "<activeGrantsTableId>" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "<subawardsTableId>" without waiting for record
    And I navigate to "Terms" sub tab
    When I click on "Edit" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "<progressReportsScheduleId>" without waiting for record
    And I enter value "Annually" into field "Frequency__c"
    And I click modal button "Save"
    And I wait for "4" seconds
    Then I see value "Annually" for title "Frequency" inside table "<progressReportsScheduleId>"
    Examples:
      | progressReportsScheduleId                        | progressReportSheet              | subawardsTableId                            | activeGrantsTableId                        |
      | ---progressReport:-:progressReportsScheduleId--- | ProgressReport_Field_Values.xlsx | ---subAwardStandalone:-:subawardsTableId--- | ---progressReport:-:activeGrantsTableId--- |

  @59679 @58763 @45730 @ProgramApproverSenBackPRToOwner @jitendra @NewProgressFinal
  Scenario: Validate  Progress Report send back to owner functionality by program approver. | Validate Performance Tab under Subaward view at Sub-recipient user is getting updated when Progress report status is Submitted to Grantor on active subaward
  Validate Submit for Approval button disappear from Progress report once Award owner click on it.
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
    And I wait for "3" seconds
    When I get the "EGMS ID"
    Given I click on "Submit to Grantor" in the page details
    And I save the field labeled "Subaward ID" as "SubawardID"
    And I click "{SavedValue:SubawardID}" lookup link
    When I navigate to "Performance" sub tab
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" against the value "Submitted to Grantor" inside table "---progressReport:-:recipientAwardProgressReportTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    And I wait for "3" seconds
    Then I softly cannot see top right button "Submit for Approval" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    And I wait for "5" seconds
    And I refresh the page
    Then I softly see status in Progress-bar is "Created" and is "dark blue"

  @59680 @58742 @validateInternalUserIsNotAllowedToEditProgressReportWhoseStatusIsSendBackToSubRecipient @mahadev
  Scenario: Validate Internal User is not allowed to Edit the Progress report generated whose status is Send back to sub-recipient on active award
  Validate Internal user is not able to see Send Back to Subrecipient button once Progress report is send back to subrecipient.
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
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Send Back to Subrecipient" in the page details
    And I wait for "4" seconds
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail
    When I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Record Id}" in flex table with id "---progressreport:-:internalProgressReportFlexTableId---"

  @58774 @validateManagementSubtabOnGrantviewProgressReportTableIsUpdatedWhenProgressReportStatusIsSubmittedForApproval  @mahadev @NewProgressFinal
  Scenario Outline: Validate management sub tab on grant view  progress report table is getting updated when Progress report status is Submitted for Approval on active subaward
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
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                     | Progress Report |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                     | Progress Report |
      | {SavedValue:FO Username} | Step 2          |
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Management" sub tab
    Then I see value "{SavedValue:Record Id}" for title "EGMS ID" against the value "Submitted for Approval" inside table "---progressReport:-:recipientGrantProgressReportTableId---"
    Examples:
      | Grant Name                            |
      | {SavedValue:Automation Runtime award} |

  @58662 @NotEditButtonInPRScheduleForSPI @jitendra @NewProgressFinal
  Scenario: Validate SPI user is not allowed to change the Progress report Schedule on Active subaward when status of Progress Report is submitted to Grantor.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Actual | Reported Date |
      | Automation Permanent KPI | 7      | 7             |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---progressreport:-:recipientActiveGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---progressreport:-:recipientActiveGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---progressReport:-:recipientsRelatedSubAwardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    Then I cannot see row level action button "Edit" against "Progress Report" in flex table with id "---progressreport:-:progressReportsScheduleId---"

  @58896 @mahadev @NewProgressFinal
  Scenario Outline: Validate Internal User with another profile but same organization can view the Progress report whose status is Submitted to Grantor at Management Tab
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 8/29/2024     | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressreport:-:recipientActiveGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressreport:-:recipientActiveGrantTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "Record Id"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    Then I see value "{SavedValue:Record Id}" for title "EGMS ID" against the value "Submitted to Grantor" inside table "---progressReport:-:grantorGrantProgressReportTableId---"
    Examples:
      | Grant Name                            |
      | {SavedValue:Automation Runtime award} |

  @59039 @59042 @validateInternalUserIsAllowedToAddProgramApproverOnProgressReport  @mahadev 
  Scenario: Validate Internal user is allowed to add Program Approver when Progress report status is Submitted to Grantor | Validate SPI user 'does not' have edit access to Performance Narrative Table under Progress report when Progress report state is Submitted to Grantor State.
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
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    And I navigate to "Performance" sub tab
#    Then I see field "KeyAccomplishments__c" is not editable
#    Then I see field "Obstacles__c" is not editable
#    Then I see field "Obstacles__c" is not editable
#    Then I see field "Plans__c" is not editable
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                     | Progress Report |
      | {SavedValue:PM Username} | Step 1          |
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---progressReport:-:approversTableId---"

  @58893 @validateMultipleProgressReports  @mahadev
  Scenario Outline: Validate initially generated progress report remains the same at progress reports table when another Progress report is generated on active award
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
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c,false"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---progressReport:-:recipientAwardProgressReportTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "ProgressReport2"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I softly see value "Submitted to Grantor" for title "Status" against the value "{SavedValue:Record Id}" inside table "---progressReport:-:recipientAwardProgressReportTableId---"
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:ProgressReport2}" inside table "---progressReport:-:recipientAwardProgressReportTableId---"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime award} |

  @58753 @PMNoPRshown @jitendra
  Scenario: Validate Internal user should not see progress report under Sub-award performance tab when Progress report is in Draft status.
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    Then I do not see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:progressReportFlexTableId---"

  @58756 @PerformanceTabUpdate @jitendra
  Scenario: Validate Performance Tab under Subaward View at Internal user is getting updated when Progress report status is  Submitted to Grantor on active subaward.
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
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    Then I see value "Submitted to Grantor" for title "Status" against the value "{SavedValue:Record Id}" inside table "---progressReport:-:grantorProgressReportsTableId---"

  @58881 @58882 @ListViewSPISeeAprrovedPR @jitendra
  Scenario: Verify that Sub-recipient User will be able to see Approved Progress Report on active award by using List View. | Verify that Sub-recipient User will be able to see Submitted Progress Report on active award by using List View.
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
    And I wait for "3" seconds
    Given I click on "Submit to Grantor" in the page details
    When I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - Submitted"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:progressReportFlexTableId---" panel
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:progressReportFlexTableId---"
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
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - Approved"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:progressReportFlexTableId---" panel
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:progressReportFlexTableId---"

  @59044 @58883 @SeeApprovedPROnActiveAwardByInternalUser @jitendra @NewProgressFinal
  Scenario: Verify that Internal User will be able to see Approved Progress Report on active award by using List View. |Validate SPI user is not able to edit forms table under forms and attachments view when Progress report state is Submitted for Approval.
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
    And I wait for "3" seconds
    Given I click on "Submit to Grantor" in the page details
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
    Given I click on "Submit for Approval" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---progressreport:-:recipientActiveGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---progressreport:-:recipientActiveGrantTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "Submitted for Approval" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I cannot see row level action button "Edit" against "Community Initiative Progress Report" in flex table with id "---progressReport:-:formTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - Approved"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    Then I see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:internalProgressReportFlexTableId---"

  @58884 @SeeSendBackToSubrecipientPROnActiveAwardByInternalUser @jitendra
  Scenario: Verify that Internal User will be able to see Send back to Sub-recipient Progress Report record on active award by using List View .
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Actual | Reported Date |
      | Automation Permanent KPI | 7      | 7             |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I wait for "3" seconds
    Given I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    Given I click on "Send Back to Subrecipient" in the page details
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - Submitted"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    Then I see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:internalProgressReportFlexTableId---"

  @58959 @NoViewAccessToOtherOrganisationuSERPR @jitendra @TBExecution
  Scenario: Validate Internal User with different organization should not be able to view the Progress report with submitted to Grantor state.
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
    And I wait for "3" seconds
    When I get the "EGMS ID"
    Given I click on "Submit to Grantor" in the page details
    Given I re-login to "As a Grantor" app as "SARAH PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    Then I do not see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:internalProgressReportFlexTableId---"

  @59278 @59136 @CanNotSubmitPRWithNotFillingReqData @jitendra
  Scenario: Validate Sub-recipient user is not allowed to submit progress report to grantor when required data is not filled under Forms and Attachments Tab.
  Validate if SR user keep the Actual field under performance tab as empty validate message is display on Progress report when KPI is selected as Yes on Grant
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
#    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
#      | Title                    | Actual |
#      | Automation Permanent KPI |        |
    And I wait for "3" seconds
    Then I softly see value "0" for title "Actual" inside table "---progressReport:-:kpiTableId---"
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Actual | Reported Date |
      | Automation Permanent KPI | 7      | 7             |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "ErrorForm" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I wait for "3" seconds
    When I get the "EGMS ID"
    Given I click on "Submit to Grantor" in the page details
    And I wait for "5" seconds
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    
  @59567 @58773 @NoEditAccessForFormsSPI @jitendra
  Scenario: Validate Management Tab under Grant view at Internal user is getting updated when Progress report status is Submitted for Approval on active subaward.
  Validate Submitted By field at Certification table should get updated on Progress report at SR user end when Progress report status is Submitted to Grantor
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
    And I wait for "3" seconds
    When I get the "EGMS ID"
    Given I click on "Submit to Grantor" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Submitted By:" as "{SavedValue:SPI3 Username}"
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
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    When I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:grantorGrantProgressReportTableId---"

  @59568 @59280 @validateSRUserIsAbleToViewSnapshot @mahadev @skipOnJenkins
  Scenario: Validate SR user is able to view the Snapshot after Progress report is Submitted to Grantor status | Validate Submitted On field at Certification table should get updated on Progress report at SR user end when Progress report status is Submitted to Grantor
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
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Submitted On:" is getting updated with todays date
    And I click on "Menu" in the page details
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Progress Report Snapshot"
    When I download the file
    Then I softly see "Submitted to Grantor" on page "1" of "govgrants" pdf file

  @59675 @59674 @validateSendBackToSRUser @mahadev
  Scenario: Validate Pending Task is created for SR user when Award owner Sent Back the Progress report | Validate Pending Task is created for Award Owner when Progress report status is submitted to Grantor
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
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Send Back to Subrecipient" in the page details
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"


  @59677 @59676 @allowsEditAfterSentBackToSR @jitendra
  Scenario: Validate SR is able to Edit the Progress report when Award owner Sent Back the Progress report | Validate History Field is getting Updated at Award owner End when Progress report status is Submitted to Grantor.
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
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
#    When I navigate to "History" sub tab
#    Then I softly see value "Submitted to Grantor" for title "New Value" inside table "History"
    And I click on "Send Back to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---progressReport:-:progressNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Sent Back to Subrecipient" and is "dark blue"

  @59773 @59774 @59776 @59777 @validateSRUserEntersKPIActualValue @mahadev
  Scenario: Validate SR user is able to enter Actual field value at KPI under performance tab at Progress report | Validate SR user is able to select Reported Date field at KPI under performance tab at Progress report
  Validate SR user is able to enter Actual field value at KPI under performance tab more than the Target Value at Progress report | Validate SR user is able to enter Actual field value at KPI under performance tab less than the Target Value at Progress repor
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 10     |
    Then I softly see value "10" for title "Actual" against the value "Automation Permanent KPI" inside table "---progressReport:-:kpiTableId---"
    And I softly see the following messages in the page details contains:
      | Saved successfully! |
    And I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Actual | Reported Date |
      | Automation Permanent KPI | 7      | 0             |
    When I save the value from row "1" for column name "Reported Date" as "ReportedDate" from flex table "---progressReport:-:kpiTableId---"
    And I pause execution for "7" seconds
    Then I softly see the Reported Date field contains todays date
    And I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Actual | Reported Date |
      | Automation Permanent KPI | 100    | 7             |
    Then I softly see value "100" for title "Actual" against the value "Automation Permanent KPI" inside table "---progressReport:-:kpiTableId---"
    Then I softly see the following messages in the page details contains:
      | Saved successfully! |
    And I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Actual | Reported Date |
      | Automation Permanent KPI | 2      | 7             |
    Then I softly see value "2" for title "Actual" against the value "Automation Permanent KPI" inside table "---progressReport:-:kpiTableId---"

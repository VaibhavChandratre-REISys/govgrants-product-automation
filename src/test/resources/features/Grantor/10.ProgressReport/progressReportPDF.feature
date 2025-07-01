@progressReport @grantor-regression @grantor-parallel-regression @progressReportWithBackground @regression @progressReportPDF @PDF @skipOnJenkins
Feature: Validate all scenarios in Progress Report for PDF


  @59898 @validateSRUserIsAbleToViewSnapshotHistory @skipOnJenkins @snapExecution
  Scenario: Validate SR user is able to view the Snapshot after Progress report is Submitted to Grantor status
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
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Others" from computer
    And I click modal button "Close"
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
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Progress Report Snapshot"
    And I click on "Download" button for snapshot view
    And I wait for "3" seconds
    When I download the file for snapshot
    And I wait for "3" seconds
    Then I see "Submitted to Grantor" on page "1" of "govgrants" pdf file


  @61095 @61094 @validateDownloadOfObjectivesInCSV  @skipOnJenkins
  Scenario: Validate SR User can Download the Objectives associated at award on progress report in CSV format | Validate SR User can Download the Objectives associated at award on progress report in PDF format
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
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Others" from computer
    And I click modal button "Close"
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
#    When I click on parallel menu button in flex table title "Key Performance Indicators (KPIs)"
#    And I select "Download as CSV" from parallel lines dropdown of "Objectives"
#    And I download the file
#    Then I softly verify that "xls" file is downloaded
    When I click on parallel menu button in flex table title "Objectives"
    And I select "Download as PDF" from parallel lines dropdown of "Objectives"
    When I download the file
    Then I softly see "Test Automation Organization" on page "1" of "govgrants" pdf file


  @59565 @validateSupportingDocumentUploadedIsReflectingUnderAttachmentsTable
  Scenario Outline: Validate document uploaded at supporting  document checklist table is getting reflected at Attachments table also in progress report
    Given I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT" of type "Competitive"
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
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on hyperlink containing value "View"
    And I wait for "2" seconds
    When I download the file
    Then I see "A Simple PDF File" on page "1" of "govgrants" pdf file
    #Then I see "Program_Field_Values.xlsx" has been added in "Attachments" flex table
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |



  @59188_2 @dowloadSupportingDocumentChecklistBehaviour
  Scenario Outline: : Validate SR User is able to download the uploaded document from attachment table on Progress report | Validate SR user is able to download the document from Subrecipient Document Link field when document is uploaded.
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
    And I upload attachment without random number "sample.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on hyperlink containing value "View"
    When I download the file
    And I wait for "3" seconds
    Then I see "A Simple PDF File" on page "1" of "govgrants" pdf file
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |
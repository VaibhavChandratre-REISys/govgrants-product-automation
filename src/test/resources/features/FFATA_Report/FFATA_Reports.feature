@FFATAReports
Feature: Validate all scenarios for FFATA Reports

  @546353 @ValidateInternalusersAdminPMPOEXEcanabletocreateFFATAReportCreationwithValidDatasuccessfully
  Scenario: Validate Internal users Admin PM PO EXE can able to create FFATA Report Creation with Valid Data successfully
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "FFATA Reporting" tab
    When I enter the following values into flex table with id "---home:-:executionCompensationTableId---" by clicking "New" :
      | Full Name      | Salary ($) |
      | Michael Carter | 10000      |
      | Emily Johnson  | 50000      |
      | Daniel Smith   | 70000      |
      | Jessica Brown  | 20000      |
      | Andrew Miller  | 40000      |
      | Sarah Davis    | 80000      |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I re-login to "Grantor" app as "SARAH PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I wait for "2" seconds
    And I enter "GrantsFFATA" values from "Award_Field_Values.xlsx"
    And I enter in modal value "Automation Runtime FFATA Report" into field "ProjectTitle__c"
    And I click modal button "Continue"
    And I enter "Grant_Edition_FFATA" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_FFATA" values from "Award_Field_Values.xlsx"
    And I enter value "50000" into field "NewObligation__c"
    And I enter value "50000" into field "TotalCommitment__c"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fataSingleExternalFA}" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                   | Encumbrance |
      | {SavedValue:fataSingleExternalFA} | 50000       |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount |
      | Construction    | 50000        |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    Then I refresh the page
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name         | Project Role             | Is Key Personnel |
      | Daniel Jacks | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I wait for "3" seconds
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I pause execution for "3" seconds
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "SARAH PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I see that "Subaward" is in "Activated" status
    And I navigate to "Grants" tab
    When I navigate to "FFATA Reports" content inside "Reports" subheader on left panel
    Then I softly see top right button "New" inside flex table "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly see top right button "View Eligible Subawards" inside flex table "---subAwardStandAlone:-:ffataReportTableId---"
    And I click on top right button "View Eligible Subawards" in flex table with id "---subAwardStandAlone:-:ffataReportTableId---"
    Then I see the header is "Report: Bulk request Details" in the page details
    Then I see the header is "FFATA Eligible Subawards Report" in the page details
    And I navigate to "Grants" tab
    When I navigate to "FFATA Reports" content inside "Reports" subheader on left panel
    Then I softly see "EGMS ID" in flex table header "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly see "Report Name" in flex table header "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly see "Type" in flex table header "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly see "Report Status" in flex table header "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly see "Created By" in flex table header "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly see "Created Date" in flex table header "---subAwardStandAlone:-:ffataReportTableId---"
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:ffataReportTableId---"
    Then I softly see "Create FFATA Report" opens in overLay window
    Then I softly see field on modal "Report Name" inside page block
    Then I softly see asterisk mark on "Report Name"
    Then I softly see field on modal "Report Type" inside page block
    Then I softly see that "Type__c" rendered in view mode only
    Then I softly see field on modal "Award Activation From" inside page block
    Then I softly see asterisk mark on "Award Activation From"
    Then I softly see field on modal "Award Activation To" inside page block
    Then I softly see asterisk mark on "Award Activation To"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Report Name is required.           |
      | To Save, Award Activation From is required. |
      | To Save, Award Activation To is required.   |
    When I enter in modal value "Automation Runtime FFATA Report" into field "ReportName__c"
    When I enter in modal value "0" into field "AwardActivationFrom__c"
    When I enter in modal value "3650" into field "AwardActivationTo__c"
    Then I softly see "Save and Continue" modal button
    Then I softly see "Close" modal button
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    Then I softly see field "Report Status" as "Created"
    And I click on "Save" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Export" in page detail
    Then I softly see field "EGMS ID" inside page block
    Then I softly see field "Report Status" inside page block
    Then I softly see field "Type" inside page block
    Then I softly see field "Report Status" as "Created"
    Then I softly see field "Award Activation From" inside page block
    Then I softly see field "Award Activation To" inside page block
    And I save the field labeled "EGMS ID" as "FFATAEGMSID"
    And I save the field labeled "Award Activation From" as "AwardActivationFrom"
    And I save the field labeled "Award Activation To" as "AwardActivationTo"
    Then I softly see field "EGMS ID" as "{SavedValue:FFATAEGMSID}"
    Then I softly see field "Report Status" as "Created"
    Then I softly see field "Type" as "FFATA Report"
    Then I softly see field "Report Status" as "Created"
    Then I softly see field "Award Activation From" as "{SavedValue:AwardActivationFrom}"
    Then I softly see field "Award Activation To" as "{SavedValue:AwardActivationTo}"
    Then I softly can see "FFATA Report" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly see "FFATA Report Information" page block displayed
    And I click on "Edit" in the page details
    Then I softly see fields "ReportName__c" is in edit mode
    When I enter value "Automation Runtime FFATA Report Updated" into field "ReportName__c"
    And I click on "Save" in the page details
    Then I softly see field "Report Name" as "{SavedValue:Automation Runtime FFATA Report Updated}"
    Then I softly see "Subawards - All" page block displayed
    Then I softly see toggle option "Subawards - Not Submitted" inside flex table id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see toggle option "Subawards - Published" inside flex table id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see toggle option "Subawards - All" inside flex table id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see toggle option "Subawards - Failed" inside flex table id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see the text containing "“Only records with FFATA Report Status of Draft,"
    Then I softly see top right button "Associate" inside flex table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see top right button "Submit to SAM.gov" inside flex table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see top right button "Remove" inside flex table "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "Actions" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "FAIN" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "EGMS ID" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "Award Amount" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "Award Issue Date" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "FFATA Report Number" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "FFATA Report Version" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "FFATA Report Status" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "Processing Status" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "Last Modified Date" in flex table header "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:ffataEligibleAwardstableId---"
    Then I softly see "External Funding Sources" opens in overLay window
    Then I softly see "External Funding Sources" page block displayed
    Then I softly see button "Advance Filter" inside flextable "---subAwardStandAlone:-:AssociateFFATAEligibleSubawardsTableId---"
    When I click on parallel lines menu bar with data target value "External Funding Sources"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "FAIN" in flex table header "---subAwardStandAlone:-:AssociateFFATAEligibleSubawardsTableId---"
    Then I softly see "EGMS ID" in flex table header "---subAwardStandAlone:-:AssociateFFATAEligibleSubawardsTableId---"
    Then I softly see "Title" in flex table header "---subAwardStandAlone:-:AssociateFFATAEligibleSubawardsTableId---"
    Then I softly see "Created Date" in flex table header "---subAwardStandAlone:-:AssociateFFATAEligibleSubawardsTableId---"
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:AssociateFFATAEligibleSubawardsTableId---"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Please select at least one record to associate. |




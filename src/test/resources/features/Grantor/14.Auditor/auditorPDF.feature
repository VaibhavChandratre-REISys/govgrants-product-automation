@auditor @parallel-regression @regression @auditorPDF @PDF @auditormailandPdf  @skipOnJenkins
Feature: Validate all scenarios for Auditor Profile for PDF


  @69304 @auditorCandownloadasPDF
  Scenario: Validate Verify User with Auditor profile has ability to download PDF files of record.
    Given I activated standalone subaward "Automation Runtime award" with properties "default" of type "Competitive"
    Given I login to "As a Grantor" app as "AUDITOR" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I click on "Download as PDF" in the page details
    And I wait for "7" seconds
    And I download the file
    Then I see "Active" on page "1" of "govgrants" pdf file
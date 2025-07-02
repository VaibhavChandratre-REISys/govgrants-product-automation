@riskAssessment @orgAwardLevelRiskAssessment @regression @orgRiskAssessment @riskAssessmentPDF @PDF  @riskassesmentemailandPdf @skipOnJenkins
Feature: Validate all scenarios in the Organizational Risk Assessment for PDF


  @62315 @snapHistoryOfOrgRA  @skiponjenkins @OrgRiskSet1 @snapExecution
  Scenario: Validate whether Snapshot is captured/(taken) automatically  by the system in the table Snapshot History when Risk Assessment is Activated
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    And I wait for "3" seconds
    And I click on "Take Snapshot" in the page details
    And I wait for "5" seconds
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Risk Assessment Snapshot.pdf"
    And I click on "Download" button for snapshot view
    And I wait for "3" seconds
    When I download the file for snapshot
    And I wait for "3" seconds
    Then I softly see "{SavedValue:EGMSID}" on page "1" of "govgrants" pdf file
    Then I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"
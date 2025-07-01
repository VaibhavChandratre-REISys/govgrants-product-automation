@riskAssessment @orgAwardLevelRiskAssessment @regression @orgRiskAssessmentEmailNotification @EmailNotification  @skipOnJenkins
Feature: Validate all scenarios in the Organizational Risk Assessment for Email Notification

  @62520 @77260 @taskCreationWhenGrantorProvideAccess
  Scenario: Validate task is created for Subrecipient User when Grantor provides access to Revise Risk Assessment | Validate when the external user request for new assessment, the internal user recives an email notification to Revise Risk Assessment for Subrecipient Organization
    Given I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"
#    When I create a risk assessment record for organization "Automation Permanent Organization for Risk Assessment"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SA" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    And I wait for "10" seconds
    And I refresh the page
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
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
    When I click on "Submit" in the page details
    And I wait for "3" seconds
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Revise Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    Then I softly see values "Automation Permanent Organization for Risk Assessment" and "Revise Risk Assessment" inside table
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "40" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
    """
      Sandbox: Provide or Decline Permission to Revise Risk Assessmentfor Subrecipient Organization Automation Permanent Organization for RiskAssessment
      """
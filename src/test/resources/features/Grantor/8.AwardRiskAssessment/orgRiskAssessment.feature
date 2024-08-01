@riskAssessment @orgAwardLevelRiskAssessment @regression @orgRiskAssessment @orgRiskAssessmentWithBackground
Feature: Validate all scenarios in the Organizational Risk Assessment

  Background: To create a Organizational Risk Assessment
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

  @61970 @61971 @61976 @61975 @61977 @61982 @61978 @orgRiskAssessmentCreationAndTaskcreatedForSPI  @OrgRiskSet1
  Scenario: Verify Task is generated for Signing Authority to Create Risk Assessment for an Organization and once the pending is created, the user can create the org risk asssesment
    Then I softly see that "Automation Permanent Organization for Risk Assessment" has been added in flextable with Id "---orgRiskAssessment:-:pendingTaskTableId---"
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    # @61976 @61975
    When I click on "Submit" in the page details
    And I wait for "3" seconds
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I softly can see top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I softly see that "Active" has been added in flextable with Id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    # @61977
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
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues3" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I softly see "Risk Level" image as "ylw.png"
    # @61982 @61978
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:OrganizationRiskAssesmentFilesTableId---"
    Then I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"

  @61983 @61973 @completedTaskOnceOrgRAIsCreated  @OrgRiskSet1
  Scenario: Validate whether SPI user is able to view the Completed task once Org Risk Assessment is Created
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I refresh the page
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    # @61973
    And I wait for "3" seconds
    Then I softly can see top right button "Submit" in page detail
    # @61983
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:completedTaskTableId---" panel
    Then I softly see value "Automation Permanent Organization for Risk Assessment" for title "EGMS ID" inside table "---orgRiskAssessment:-:completedTaskTableId---"
    Then I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"

  @61980 @addingAnAttachmentToOrgRA  @buglogged112066 @OrgRiskSet1
  Scenario: Validate whether SPI user can Add an attachment to Risk Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I refresh the page
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentFileTableId---"
    And I upload attachment "Attachment.pdf" of type "OTHER" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I refresh the page
    And I wait for "5" seconds
    Then I softly see "OTHER" has been added in "Organization Risk Assessment Files" flex table
    Then I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"

  @62197 @62198 @62513 @62515 @62516 @pendingTaskCreatedForGrantor  @OrgRiskSet1
  Scenario: Validate whether pending task is created for grantor when Authorized Signatory requested for Revision
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "4" seconds
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
    # @62513
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    Then I softly see value "Automation Permanent Organization for Risk Assessment" for title "Name" inside table "---orgRiskAssessment:-:activeOrgTableID---"
    # @62198 @62515
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I softly can see top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    # @62516
    Then I can see top right button "Decline" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I pause execution for "10" seconds
    Then I softly cannot see top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "Grants Portal" app as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "10" seconds
    And I refresh the page
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    Then I softly see field "Status" as "Created"
    Then I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"

  @62312 @62314 @62514 @64608 @deleteIconfCreatedRiskAssessment  @OrgRiskSet1
  Scenario: Validate whether Authorized Signatory can view the delete button across the created Risk Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "10" seconds
    And I refresh the page
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    # @62514 @64608
    Then I can softly see modal button "Save and Continue"
    # @62312 @62314
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I get the "EGMS ID"
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    # @62314
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Then I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"

  @62313 @deleteMessageDisplayed  @wip @LWCRemoved
  Scenario: Validate whether Authorized Signatory has capable to delete the created Risk Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on "Delete" icon for "Record Id" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see "No Records Found" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62315 @snapHistoryOfOrgRA  @skiponjenkins @OrgRiskSet1
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
    And I wait for "2" seconds
    When I download the file
    Then I softly see "{SavedValue:EGMSID}" on page "1" of "govgrants" pdf file
    Then I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"

  @62316 @historyOfRiskAssessment  @wip
  Scenario: To Validate field history update post Risk Assessment is clicked on Submit and is Active
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    When I navigate to "History" sub tab
    Then I see value "Active" for title "New Value" inside table "History"

  @62317 @messageInfoToAuthorizedSignatory  @bug-82240 @wip
  Scenario: Validate when Request New Assessment button is clicked a message is displayed to Authrozed Signatory
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
    Then I see the following messages in the page details contains:
      | A request to create new assessment has been sent to the Grantor.  Once the request has been approved, you will receive an email and can proceed with an assessment revision. |

  @62525 @UserCanviewCompletedTaskAfterProvideRevisionAccess @keerti 
  Scenario: Validate whether user is able to view the Completed task once Risk Assessment is Active after provide Revision Access
    Given I delete the record "Automation Desk Review Org level" from the object "Desk Review"
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
    And I wait for "3" seconds
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "CompletedTasks" panel
    Then I see values "Automation Permanent Organization for Risk Assessment" and "Completed" inside table

  @62523 @ReviseRAButtonIsNotpresentedForSPAUsers @keerti
  Scenario: Validate the Revise Risk Assessment Button should not be present for SPA users that are not the SA.
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
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I cannot see top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62629 @62945 @RevisedRiskAssessmentShouldMarkFirstAsExpired @keerti
  Scenario: Validate the Revised Risk Assessment should mark the Initial Risk Assessment as Expired.
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    And I wait for "3" seconds
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I wait for "4" seconds
    #62945
    Then I cannot see top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
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
    And I wait for "3" seconds
    When I save the field labeled "EGMS ID" as "EGMSID1"
    When I click on "Submit" in the page details
    And I wait for "3" seconds
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    And I perform quick search for "Expired" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see value "Expired" for title "Status" against the value "{SavedValue:EGMSID}" inside table "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

    
  @62946 @62947 @62948 @acknowledgeOrgRiskAssessment  @smoke
  Scenario: Validate whether user can proceed without checkin 'Acknowledment' field for Org Level Risk Assessment
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
    When I click on "Save and Continue" in the page details
    #62946
    Then I see the following messages in the page details contains:
      | Acknowledgement is required to save. |
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I get the "EGMS ID"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    #62948
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    #62947
    Then I see value "Record Id" for title "EGMS ID" inside table "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    
  @62949 @assessmentValuesareEditable
  Scenario: Validate whether user is able to edit the assessment form once Grantor Provided Access for Revision
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
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
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
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Created" and is "dark blue"

  @62950 @AScanEditAssessment
  Scenario: Validate whether AS have edit access for the assessment form
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
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit" in page detail

  @62951 @RAinCreatedStatusImpactOnAward
  Scenario Outline: Validate if SA has requested for revision of initial Risk Assessment  and it is being revised and present in Created sttaus does not make an impact on Award Activation system will always refer the active Risk Assessment.
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
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation4" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account1" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Encumbrance |
      | {SavedValue:fundingAccount1} | 1000        |
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
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SA" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
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
    When I pause execution for "10" seconds
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I see that "Subaward" is in "Activated" status
    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Execution Award} | {SavedValue:Automation Runtime Execution Award} |

  @62952 @orRiskAssessmentIsNotDisplayedForINDUser  @issuewithINDUser
  Scenario:  Validate Data related to organization risk assessment should not be displayed on the Individual Profile view .
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
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Individual Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I softly do not see "Organization Risk Assessments" page block displayed

  @62804 @verifyFieldHistoryUpdatedPostSecondRiskAssessmentIsInActiveStatus @keerti @FieldHistoryExclude
  Scenario: To Validate field history update post second Risk Assessment is in Active Status
    Given I delete the record "Automation Desk Review Org level" from the object "Desk Review"
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
    When I perform quick search for "Revise Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Revise Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
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
    When I navigate to "History" sub tab
    Then I see value "Effective Date" for title "Changed Field" inside table "History"

  @62802 @createdDateOfRADisplayedOnOverviewTab @keerti
  Scenario: Validate the Created Date of Risk Assessment display on Overview Tab - Organizational Level Risk Assessment
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
    When I navigate to "Overview" sub tab
    Then I see field "Created Date" is not editable

  @62801 @UserCannotEditExpiredRA @keerti
  Scenario: Validate the User Cannot Edit the Expired Risk Assessmnet
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
    When I click on "Start" icon for "Revise Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
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
    And I perform quick search for "Expired" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    When I click on "View" icon for "Expired" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail

  @63072 @VerifyErrorMessageForAssessmentForm @keerti
  Scenario: Validate whether the system throws an error message to the user and cannot proceed further without completing the assessment form.
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
#    And I navigate to "Assessment" sub tab
#    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    Then I see the following messages in the page details contains:
      | Assessment Tab - Complete all of the questions on the Risk Assessment form. |

  @63075 @VerifyEffectiveDateAndExpirationDate @keerti
  Scenario: Validate whether the Active Org Risk Assessment for Organization is updated for one year under Effective Date and Expiration Date fields inside flextable
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
    And I navigate to "Overview" sub tab
    Then I see field "Effective Date" is getting updated with todays date
    And I save the field labeled "Effective Date" as "EffectiveDate"
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I wait for "3" seconds
    Then I softly see value "{SavedValue:EffectiveDate}" for title "Effective From" inside table "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @63077 @VerifyTaskForNoPopUpWhenClickedOnRequestNewAssessment @keerti
  Scenario: Validate task is not created for Grantor when the SA user clicks as 'No' on pop up when clicked on Request New Assessment
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
    When I click table top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I click "Cancel" on modal confirmation box
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---riskassessment:-:homePendingTaskTableId---" panel
    Then I do not see values "Automation Permanent Organization for Risk Assessment" and "Provide or Decline Risk Assessment Access" inside table

  @63232 @VerifyDraftRAIsActivated @keerti
  Scenario: Verify task is marked completfed if the user chooses to activate the risk assesment using the draft risk assessment instead of using the task
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    And I click toggle button to select "Organization Risk Assessments-All"
    When I perform quick search for "{SavedValue:EGMSID}" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on "Edit" icon for "{SavedValue:EGMSID}" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Active" and is "dark blue"
    Then I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"

  @63229 @VerifyDraftORAIsPresentOnOrganizationalProfilePage @keerti
  Scenario: Verify Draft Organization Risk Assessment is present on Organizational Profile Page for a Signing Authority of the Organization
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I see that "{SavedValue:EGMSID}" has been added in flextable with Id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @63233 @verifyRiskAssessmemtException  @smoke
  Scenario Outline: Validate system generates generates an exception at award activation if Organizational Risk Assessment is Created and not Active
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter in modal "Grant_Creation4" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter in modal "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    When I click on "View" icon for "{SavedValue:Automation Runtime Execution Award}" inside flex table with id "---subAwardStandalone:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
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
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    Then I see the following messages in the page details contains:
      | Your Organization does not have an active Risk Assessment. Create and activate a Risk Assessment as the Subaward cannot be accepted without an active Risk Assessment. |
    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Execution Award} | {SavedValue:Automation Runtime Execution Award} |

  @63979 @grantorCanViewOverallRisk
  Scenario: Validate Internal User can also View the OverallRisk field on Risk Assessment Tab
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
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    Then I see field "Overall Risk" as "27.00%"

  @63980 @validateRiskAssesmentActiveInPDF  @skipOnJenkins
  Scenario: Verify that user can check PDF files with validation for Org Risk Assessment
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
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    And I click on parallel menu button in flex table title "Organization Risk Assessments-All"
    And I select "Download as PDF" from dropdown
    And I wait for "3" seconds
    And I download the file
    And I wait for "5" seconds
    Then I softly see following details in "govgrants" pdf file:
      | Detail | Page Number |
      | Active | 1           |

  @63981 @totalRecordsofOrgRiskAssesment   @runOrgRisk
  Scenario: Validate whether user is able is see total record when first risk assessment is expired and second is active
    Given I delete the record "Automation Desk Review Org level" from the object "Desk Review"
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    And I wait for "3" seconds
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
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
    And I save the total records from the flex table id "---orgRiskAssessment:-:orgRiskAssessmentTableId---" as "totalRecords"
    Then I see total records count "{SavedValue:totalRecords}" in flex table "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @63982 @effectiveDatesOnOrgRiskAssessmentIsBlackDraftOnCreated  @runOrgRisk
  Scenario: Verify that Effective and Expiration dates are blank when Org risk assessment is in created state
    Given I delete the record "Automation Desk Review Org level" from the object "Desk Review"
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see field name "StartDate__c" is blank in flex table with Id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Then I see field name "EndDate__c" is blank in flex table with Id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @63983 @acknowledgementOfRiskAssessment  @LWCRemoved @wip
  Scenario:  Validate that no records has been added to the Org Risk Assessment table when record is cancelled
    WWhen I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I click on "Cancel" in the page details
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see "No Records Found" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @64128 @grantorViewOrgRA  @runOrgRisk
  Scenario: Validate Risk Assessment data/status should be displayed to internal user irrespective of the state of Risk Assessment.
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
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---" without waiting for record
    Then I see status in Progress-bar is "Created" and is "dark blue"

  @64127 @cretedStateOrgRiskAssessment  @runOrgRisk
  Scenario: Validate Risk Assessment should remain in created State if the 'AS' Edit the Risk Assessment and fill in the questionnaire and click Save
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
    And I wait for "3" seconds
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    And I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see that "Created" has been added in flextable with Id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @64126 @editdeleteButtonsOndraftORAPresentOnOrgProfilePage  @runOrgRisk
  Scenario: Verify on Draft Organization Risk Assessment user should have the basic Edit Delete view Privileges for the SA of the Organization
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
    When I perform quick search for "Revise Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Revise Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I softly can see row level action button "Edit" against "Created" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @64125 @taskMarkedCompletedUsingDraftRA
  Scenario: Verify task is marked completed if the user chooses to activate the risk assesment using the draft risk assessment instead of using the task
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
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:completedTaskTableId---" panel
    Then I see that "Automation Permanent Organization for Risk Assessment" has been added in flextable with Id "---orgRiskAssessment:-:completedTaskTableId---"

  @64512 @orRiskAssessmentDisplayedToInternal
  Scenario: Validate Risk Assessment data/status should be displayed to internal user irrespective of the state of Risk Assessment for Active SR Organizations --> Organization Profile View
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    Then I can see "Risk Assessment" sub tab at view detail page

  @64513 @indRiskAssessmentDisplayedToInternal
  Scenario: Validate Risk Assessment data/status should be displayed to internal user irrespective of the state of Risk Assessment for Active SR Organizations --> Individual Profile View
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "{user:OldfullName}" in "---home:-:indActiveAccountId---" panel
    And I click on "View" icon for "{user:OldfullName}" inside flex table with id "---home:-:indActiveAccountId---" without waiting for record
    Then I can see "Risk Assessment" sub tab at view detail page

  @64514 @overallRiSKScoreWhenAssessmentSelectedDiffTypeQuestions
  Scenario: Validate the High level Risk Score, that shows the Overall Score as per the provided Assessment once Risk Assessment is Active
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
    And I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I save the field labeled "Overall Score" as "OverallScore"
    Then I softly see field "Overall Score" as "{SavedValue:OverallScore}"

  @64515 @overallRiSKScoreWhenAssessmentSelectedDiffQuestions
  Scenario: Validate the Moderate Risk Score of Risk Assessment, that shows the Overall Score as per the provided Assessment once Risk Assessment is Active
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
    And I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly see field "Overall Score" as "27.0%"

  @64516 @overallRiSKScoreWhenAssessmentSelectedDiffSetQuestions
  Scenario: Validate the Risk level of Risk Assessment, that shows the Overall Score as per the provided Assessment once Risk Assessment is Active
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
    And I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I see "Risk Level" image as "grn.png"
    Then I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"

  @64602 @taskIScreatedforSAOnceInternalUserProvideAccess
  Scenario: Validate the Revise Risk Assessment Button should not be present for SPI users that are not the SA.
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
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I cannot see top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @64603 @taskIsNotCreatedForSPI
  Scenario: Verify Task is not generated for SPI to Create Risk Assessment for an Organization
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I create a risk assessment record for organization "Automation Permanent Organization for Risk Assessment"
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    Then I do not see values "EGMS ID" and "Automation Permanent Organization for Risk Assessment" inside table
    When I re-login to "Grants Portal" app as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    Then I click modal button "Save and Continue"

  @64605 @reviseAssessmentTaskAddedtoTheTable
  Scenario: Validate when internal user provide access for Risk assessmnet then task should be created for SA of Sub Recipient Organization.
    Given I delete the record "Automation Desk Review Org level" from the object "Desk Review"
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
    When I perform quick search for "Revise Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    Then I see that "Revise Risk Assessment" has been added in flextable with Id "---orgRiskAssessment:-:pendingTaskTableId---"

  @64606 @reviseAssessmentTaskNotddedtoTheTable
  Scenario: Validate when internal user provide access for Risk assessmnet then task shouldn't be created for SPI of Sub Recipient Organization.
    Given I delete the record "Automation Desk Review Org level" from the object "Desk Review"
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Overview" sub tab
    #65549
    Then I see field "Effective Date" is not editable
    Then I see field "Expiration Date" is not editable
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    #64613
    Then I cannot see top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    #64611
    Then I softly see value "Active" for title "Status" inside table "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "Grants Portal" app as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    #65386
    Then I can see top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
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
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Revise Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    Then I do not see values "EGMS ID" and "Automation Permanent Organization for Risk Assessment" inside table
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Revise Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Revise Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    And I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    #64612
    Then I softly see "Total Records: 1" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    And I perform quick search for "{SavedValue:EGMSID}" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    #64607
    Then I see that "Active" has been added in flextable with Id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Then I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"

  @64610 @spiCannotViewOrgRiskAssessmentInCreatedStatus @OrgRiskSet4
  Scenario: Validate whether the org Risk Assessment that is in created state is visible to SPI user that are not SA
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see "No Records Found" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Then I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"

  @64733 @downloadOrgRaInPDF @skipOnJenkins @OrgRiskSet4
  Scenario: Validate whether user can Download the Active Org Risk assessment in PDF format.
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    And I wait for "3" seconds
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    And I click on parallel menu button in flex table title "Organization Risk Assessments-All"
    And I select "Download as PDF" from dropdown
    And I wait for "3" seconds
    And I download the file
    And I wait for "3" seconds
    Then I softly see that file name contains ".pdf" is downloaded
    Then I delete file contains name ".pdf"

  @64734 @downloadOrgRAInXLS  @wip @LWCRemoved
  Scenario: Validate whether user can Download the Active Org Risk Assessment in XLS format
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    And I wait for "3" seconds
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right parallel lines bar for "Organization Risk Assessments"
    And I select "Download as XLS" from parallel lines dropdown of "Organization Risk Assessments"
    Then I verify that "xls" file is downloaded

  @65387 @verifyAllInternalUsersCanViewActiveOrgRA @deepika @OrgRiskSet4
  Scenario Outline: Validate whether internal user can see view the Active Risk Assessment from Internal Subrecipient Profile View Page
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see that "{SavedValue:EGMSID}" has been added in flextable with Id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Then I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"
    Examples:
      | User |
      | PM   |
      | EXE  |
      | FO   |

  @65388 @65389 @validateInternalUserCannotViewCreatedStateRA @OrgRiskSet4
  Scenario: Validate whether Internal Users Can view the Org Risk Assessment that is in Created Status from Internal Subrecipient Profile View page
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see that "{SavedValue:EGMSID}" has been added in flextable with Id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    #65389
    Then I see value "NA" for title "Risk Level" against the value "{SavedValue:EGMSID}" inside table "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Then I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"


@organizationRegistrationPage @userRegistration @parallel-regression @regression @grantor-regression @regression
Feature: Validate all User registration related scenarios

  @223510 @224224 @AdminUserverifiesMessageOnTaskReassignmentPage @komal @sprint-10-US-223893 @komal @reassignment
  Scenario:Verify Admin user is able to see the message on task re-assignment page
    Given I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    Then I softly see the text containing :
      | Pre-Application and Applications Tasks which are assigned to the internal user will not be visible in the Task Reassignment page. These tasks are associated with Announcement Owner. To reassign these tasks, go to the Ownership Reassignment page and transfer the ownership of desired announcement. Queue based tasks(Related to User registration and Organizational Risk assessment) which are assigned to this user will not be shown here. Please check the Pending Tasks table for such tasks. |

  @223048 @PMUserverifiesMessageOnTaskReassignmentPage @komal @sprint-10-US-223893 @komal @reassignment
  Scenario:Verify PM user is able to see the message on task re-assignment page
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    Then I softly see the text containing :
      | Pre-Application and Applications Tasks which are assigned to the internal user will not be visible in the Task Reassignment page. These tasks are associated with Announcement Owner. To reassign these tasks, go to the Ownership Reassignment page and transfer the ownership of desired announcement. Queue based tasks(Related to User registration and Organizational Risk assessment) which are assigned to this user will not be shown here. Please check the Pending Tasks table for such tasks. |

  @223512 @PMUser-VerifyTaskRelatedToOrganizationRiskAssessmentAreNotAvailableToPMUserForReassignment @komal @sprint-10-US-223893 @komal @reassignment
  Scenario: PM User- Validate Task Related to Organization Risk Assessment are not available for Reassignment for PM User in User Registration approval Queue
    Given I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"
    When I create a risk assessment record for organization "Automation Permanent Organization for Risk Assessment"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SA" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---home:-:internalHomePendingTaskTableId---" panel
    Then I softly see value "Provide or Decline Risk Assessment Access" for title "Task Type" against the value "Automation Permanent Organization for Risk Assessment" inside table "---home:-:internalHomePendingTaskTableId---"
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I perform quick search for "Provide or Decline Risk Assessment Access" in "---home:-:grantorTaskReassignTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---home:-:grantorTaskReassignTableId---"

  @223512 @AdminUser-VerifyUserApprovalQueueMemberShouldNotAbleToSeeTheReassignTaskOfIndividualRegistrationApprovalInReassignTask @komal @sprint-10-US-223893 @komal @reassignment
  Scenario: Admin User- Validate Task Related to Organization Risk Assessment are not available for Reassignment for ADMIN user
    Given I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"
    When I create a risk assessment record for organization "Automation Permanent Organization for Risk Assessment"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SA" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "---home:-:sourceUserId---"
    And I select value "Automation PM1" into field "---home:-:targetUserId---"
    When I perform quick search for "Provide or Decline Risk Assessment Access" in "---home:-:adminTaskReassignmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---home:-:adminTaskReassignmentTableId---"

  @223512 @VerifyUserApprovalQueueShouldNotAbleToSeeTheReassignTaskOfIndividualRegistrationApprovalInReassignTask @komal @sprint-12-US-226646 @komal @reassignment
  Scenario: Validate Task Related to Individual Registration Approval are not available for Reassignment for PM user
    Given I begin "Individual" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random EmailID and save as "uniqueEmailID"
    When I enter value as "{SavedValue:uniqueEmailID}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Your registration request for access to EGMS has been completed and sent for government approval.Once approved, you will be sent another email from salesforce.com (technology platform provider) with your Username and Password shortly to log into the system. |
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:uniqueEmailID}" in "{grantor_tableId:SubrecipientIndRegistration}" panel
    And I save the value from row "1" for column name "Full Name" as "UserFullName" from flex table "{grantor_tableId:SubrecipientIndRegistration}"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:UserFullName}" in "---home:-:internalHomePendingTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---home:-:internalHomePendingTaskTableId---" :
      | Task Type                           | Subject                                                                    |
      | Review Individual User Registration | Review Individual User Registration Submitted by {SavedValue:UserFullName} |
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I perform quick search for "{SavedValue:UserFullName}" in "---home:-:grantorTaskReassignTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---home:-:grantorTaskReassignTableId---"
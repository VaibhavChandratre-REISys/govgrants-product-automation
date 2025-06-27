@smeRegistration @smeReviewerRegistration @userRegistration @parallel-regression @regression
Feature: Validate all scenarios for SME Registration

#  @34872 @34840 @VerifyPageDetailsOnRegistrationStep1of1-SMEReviewerRegistration @smoke
#  Scenario: Validate all expected fields are getting populated on page of Registration Step 1 of 1 while SME reviewer registration
#    Given I login to "As a Grantor" app as "PM" user
#    And I navigate to "Home" tab
#    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
#    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
#    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
#    And I generate the random maildropEmail and save as "uniqueEmailID1"
#    And I enter in modal value "{SavedValue:uniqueEmailID1}" into field "Email"
#    And I click modal button "Save"
#    And I wait for "4" seconds
#    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
#    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
#    And I wait for "3" seconds
#    And I click "Send" button in modal
#    And I wait for "3" seconds
#    And I pause execution for "180" seconds
#    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID1}"
#    And I navigate to maildrop portal for "{SavedValue:uniqueEmailID1}" with subject "Sandbox: Notification: You have been Invited to Register in theEnterprise Grants Management System (EGMS)"
#    #34840 #monu
#    Then I see the header is "Registration" in the page details
#    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
#    When I click on "Agree" in the page details
#    Then I see the header is "Registration" in the page details
#    Then I see the sub-header is "Legal Disclaimer 2 of 2" in the page details
#    When I click on "Agree" in the page details
#    Then I see the header is "Registration" in the page details
#    Then I see the sub-header is "Step 1 of 1" in the page details
#    Then I softly see fields "ExternalReviewerPrefix__c" is in edit mode
#    Then I softly see fields "ExternalReviewerLastName__c" is in edit mode
#    Then I softly see fields "ExternalReviewerLastName__c" is in edit mode
#    Then I softly see fields "ExternalReviewerPhone__c" is in edit mode
#    Then I softly see field "Email" as "{SavedValue:uniqueEmailID1}"
#
#  @34991 @VerifySubjectMatterExpertFieldsDetails-SMEReviewerRegistration @smoke
#  Scenario: Validate filled details of subject matter expert fields on page of Registration Step 1 of 1
#    Given I login to "As a Grantor" app as "PM" user
#    And I navigate to "Home" tab
#    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
#    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
#    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
#    And I generate the random maildropEmail and save as "uniqueEmailID1"
#    And I enter in modal value "{SavedValue:uniqueEmailID1}" into field "Email"
#    And I click modal button "Save"
#    And I wait for "4" seconds
#    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
#    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
#    And I click "Send" button in modal
#    And I wait for "2" seconds
#    And I refresh the page
#    And I pause execution for "180" seconds
#    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID1}"
#    And I navigate to maildrop portal for "{SavedValue:uniqueEmailID1}" with subject "Sandbox: Notification: Invitation to be a user of EGMS"
#    Then I see the header is "Registration" in the page details
#    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
#    When I click on "Agree" in the page details
#    Then I see the header is "Registration" in the page details
#    Then I see the sub-header is "Legal Disclaimer 2 of 2" in the page details
#    When I click on "Agree" in the page details
#    And I enter "SubjectMatterExpertDetails" values from "grantorUserRegistration_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    Then I see the following messages in the page details contains:
#      | Confirmation Message                                                                                                                                                                |
#      | Your registration request for access to the EGMS has been completed.  You will be sent an email from salesforce.com (technology platform provider) with your Username and Password. |
#
#  @34834 @34836 @34831 @VerifyCreatedSMEUserDetails-SMEReviewerRegistration @smoke
#  Scenario: Validate created SME user details on modal after clicking on view row level action
#    Given I login to "As a Grantor" app as "PM" user
#    And I navigate to "Home" tab
#    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
#    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
#    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
#    And I generate the random maildropEmail and save as "uniqueEmailID1"
#    And I enter in modal value "{SavedValue:uniqueEmailID1}" into field "Email"
#    And I click modal button "Save"
#    And I wait for "4" seconds
#    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
#    Then I softly see "Full Name" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
#    Then I softly see "Email" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
#    Then I softly see "Invited By" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
#    Then I softly see "Status" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
#    Then I softly see "Sponsoring Agency" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
#    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
#    And I click "Send" button in modal
#    And I wait for "2" seconds
#    #34836 #monu
#    Then I see the text "Email Sent Successfully" in modal
#    #34831 #monu
#    And I wait for "2" seconds
#    When I click modal button "Close"
#    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
#    Then I softly see value "Invitation Sent" for title "Status" inside table "---grantor_tableId:-:PotentialReviewerContactTableId---"
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Home" tab
#    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
#    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
#    When I click on "View" icon for "{SavedValue:Automation Runtime Contact} Contact" inside table
#    Then I see field "Type" as "Reviewers" on modal
#    Then I see field "Status" as "Invitation Sent" on modal
#    Then I softly see the text containing :
#      | Overview    |
#      | Attachments |
#
#  @35013 @VerifyCreatedSMEUserAtActivePartneruser-SMEReviewerRegistration @smoke  @wip
#  Scenario: Validate created SME user should get reflected at salesforce page inside Active Partnet usersall expected fields are getting populated on page of Registration Step 1 of 1 while SME reviewer registration
#    Given I login to "As a Grantor" app as "PM" user
#    And I navigate to "Home" tab
#    When I navigate to "{grantor_sidebar:smeReviewer}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
#    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
#    And I enter "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
#    And I generate the random maildropEmail and save as "uniqueEmailID1"
#    And I enter value "{SavedValue:uniqueEmailID1}" into field "Email"
#    And I click modal button "Save"
#    And I save the contact name as "Automation Runtime Contact"
#    And I refresh the page
#    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
#    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
#    And I click modal button "Send"
#    And I refresh the page
#    And I pause execution for "62" seconds
#    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID1}"
#    Then I see the header is "Registration" in the page details
#    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
#    When I click on "Agree" in the page details
#    Then I see the header is "Registration" in the page details
#    Then I see the sub-header is "Legal Disclaimer 2 of 2" in the page details
#    When I click on "Agree" in the page details
#    Then I see the header is "Registration" in the page details
#    Then I see the sub-header is "Step 1 of 1" in the page details
#    And I enter "OrgProfileCompleteDetail" values from "UserRegistration_Field_Values.xlsx"
#
#  @33847 @VerifyInternalSubricepientAndSMEReviewerContact
#  Scenario: Validate user is able to see all expected contacts
#    Given I login to "As a Grantor" app as "PM" user
#    And I navigate to "Home" tab
#    And I navigate to "Internal" content inside "Contacts" subheader on left panel
#    When I perform quick search for "Automation PM" in "{grantor_tableId:InternalContactsTableId}" panel
#    Then I softly see value "Automation PM" for title "Name" inside table "{grantor_tableId:InternalContactsTableId}"
#    When I navigate to "{grantor_sidebar:SubrecipientsLink}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
#    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---home:-:subrecipientContactTableId---" panel
#    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Name" inside table "---home:-:subrecipientContactTableId---"
#    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
#    And I pause execution for "2" seconds
#    When I perform quick search for "Automation SME" in "ActiveAccountReviewer" panel
#    Then I softly see value "Automation SME" for title "Name" inside table "ActiveAccountReviewer"
#
#  @33837 @VerifySystemDisplayAllRelatedTasks
#  Scenario: Validate user is able to see all expected contacts
#    Given I login to "As a Grantor" app as "PM" user
#    And I navigate to "Home" tab
#    When I navigate to "{grantor_sidebar:PendingTaskLink}" content inside "{grantor_sidebar:MyTasksLinkName}" subheader on left panel
#    Then I softly see "Pending Tasks (Assigned To Me)" page block displayed
#    Then I softly see "Pending Tasks (Assigned By Me)" page block displayed
#    And I perform quick search for "In Progress" in "---grantor_tableId:-:PendingTaskAssignedToMeTableId---" panel
#    Then I softly see value "In Progress" for title "Status" inside table "---grantor_tableId:-:PendingTaskAssignedToMeTableId---"
#    And I perform quick search for "Not Started" in "---grantor_tableId:-:PendingTaskAssignedToMeTableId---" panel
#    Then I softly see value "Not Started" for title "Status" inside table "---grantor_tableId:-:PendingTaskAssignedToMeTableId---"
#    When I navigate to "{grantor_sidebar:CompletedTaskLink}" content inside "{grantor_sidebar:MyTasksLinkName}" subheader on left panel
#    Then I softly see "Completed Tasks (Assigned To Me)" page block displayed
#    Then I softly see "Completed Tasks (Assigned By Me)" page block displayed
#    Then I softly see value "Completed" for title "Status" inside table "---grantor_tableId:-:CompletedTaskAssignedToMeTableId---"
#
#  @94345 @validatingEmailNotificationForSMEReviewer
#  Scenario: To verify Email notification should be received to SME contact after sending invitation by internal  user
#    Given I login to "As a Grantor" app as "PM" user
#    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
#    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
#    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
#    And I generate the random maildropEmail and save as "uniqueEmailID1"
#    And I enter in modal value "{SavedValue:uniqueEmailID1}" into field "Email"
#    And I click modal button "Save"
#    And I wait for "4" seconds
#    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
#    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
#    And I click "Send" button in modal
#    And I wait for "2" seconds
#    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID1}"
#    And I navigate to maildrop portal for "{SavedValue:uniqueEmailID1}" with subject "Sandbox: Notification: You have been Invited to Register in the"
#    And I pause execution for "200" seconds
#    Then I refresh the page
#    And I see the maildrop subject is as follows :
#      """
#      Sandbox: Notification: You have been Invited to Register in theEnterprise Grants Management System (EGMS)
#      """
#
#  @35012 @VerifySMEReviewerDetailPage-SMEReviewerRegistration @wip @smoke   @onhold
#  Scenario: Validate all details of created Sme Reviewer
#    Given I login to "As a Grantor" app as "PM" user
#    And I navigate to "Home" tab
#    When I navigate to "{grantor_sidebar:smeReviewer}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
#    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
#    And I enter "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
#    And I generate the random maildropEmail and save as "uniqueEmailID1"
#    And I enter in modal value "{SavedValue:uniqueEmailID1}" into field "Email"
#    And I click modal button "Save"
#    And I save the contact name as "Automation Runtime Contact"
#    And I wait for "6" seconds
#    And I navigate to "Home" tab
#    When I navigate to "{grantor_sidebar:smeReviewer}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
#    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
#    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"

  @83038 @85790 @validatingApprovedStatusForIndividualRegistration
  Scenario:To verify after Approved record status changes as : Approved for Individual registration process
    Given I begin "Individual" registration as "Register As Individual"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    When I enter value as "{SavedValue:uniqueEmailID1}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    Then I softly see field "Primary Email" as "{SavedValue:uniqueEmailID1}"
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation User" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "Automation User" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    #85790
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID1}"
    And I pause execution for "1" seconds
    Then I refresh the page
    And I see the maildrop subject is as follows :
      """
      Sandbox: Your EGMS Registration has Been Approved
      """

  @83539 @validatingRegistrationLegalDisclaimer1of2
  Scenario:To verify after sending Invitation for created contact , user is able to see Registration Legal Disclaimer 1 of 2 page on click of click here link
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Organization}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID1}"
    And I pause execution for "190" seconds
    Then I refresh the page
    And I navigate to maildrop portal for "{SavedValue:uniqueEmailID1}" with subject "Sandbox: Welcome to Recipient Portal"
    And I navigate to reset password link
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I enter in modal "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
#    When I close "New Contact" modal by clicking the top right x button
#    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---home:-:userContactsTableId---" panel
    And I select value inside table "---home:-:userContactsTableId---" is "All"
    #83535 #monu
    Then I softly see value "{SavedValue:Automation Runtime Contact} Contact" for title "Full Name" inside table "---home:-:userContactsTableId---"
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---home:-:userContactsTableId---" without waiting for record
    And I wait for "5" seconds
    #83533 #monu
    And I click "Send" button in modal
    When I close "Send Invitation" modal by clicking the top right x button
    And I wait for "3" seconds
    Then I softly see value "Invitation Sent" for title "Status" inside table "---home:-:userContactsTableId---"
    And I refresh the page
    And I pause execution for "20" seconds
    And I navigate to maildrop portal for "{SavedValue:uniqueEmailID1}" with subject "Sandbox: Notification: Invitation to be a user of EGMS"
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details

  @83531 @validatingEditingOfContact
  Scenario:To verify user is able to edit phone number of newly created contact
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Organization}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID1}"
    And I pause execution for "190" seconds
    And I refresh the page
    And I navigate to maildrop portal for "{SavedValue:uniqueEmailID1}" with subject "Sandbox: Welcome to GovGrants 3.0 Recipient Portal"
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    #83528 #monu
    Then I see "{SavedValue:Automation Runtime Organization}" text enter in field "ccountId"
    And I enter in modal "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
#    When I close "New Contact" modal by clicking the top right x button
    And I select value inside table "---home:-:userContactsTableId---" is "All"
    #83532 #monu
    Then I softly see "Full Name" in flex table header "---home:-:userContactsTableId---"
    Then I softly see "Role" in flex table header "---home:-:userContactsTableId---"
    Then I softly see "Email" in flex table header "---home:-:userContactsTableId---"
    Then I softly see "Phone" in flex table header "---home:-:userContactsTableId---"
    Then I softly see "Status" in flex table header "---home:-:userContactsTableId---"
    Then I softly see "Is User" in flex table header "---home:-:userContactsTableId---"
    Then I softly see value "{SavedValue:Automation Runtime Contact} Contact" for title "Full Name" inside table "---home:-:userContactsTableId---"
    Then I softly see value "Primary" for title "Role" inside table "---home:-:userContactsTableId---"
    Then I softly see value "{SavedValue:uniqueEmailID1}" for title "Email" inside table "---home:-:userContactsTableId---"
    Then I softly see value "704-777-(7868)" for title "Status" inside table "---home:-:userContactsTableId---"
    Then I softly see value "Active" for title "Status" inside table "---home:-:userContactsTableId---"
    Then I softly can see row level action button "Send Invitation" against "{SavedValue:Automation Runtime Contact} Contact" in flex table with id "---home:-:userContactsTableId---"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---home:-:userContactsTableId---" without waiting for record
    And I enter value "704-777-(7869)" into field "Phone"
    When I click on "Save" in the page details
    #When I close "Edit" modal by clicking the top right x button
    #80530 #monu
    And I click on "View" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---home:-:userContactsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Type" as "Recipient"
    Then I softly see "Contact Information" page block displayed on modal
    Then I softly see "Address Information" page block displayed on modal
    Then I softly see "System Information" page block displayed on modal

  @84614 @validateRolesDropdownValues-Organization
  Scenario:To verify while creating new contacts for Activated users, roles picklist having all expected values
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Organization}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID1}"
    And I pause execution for "180" seconds
    And I refresh the page
    And I navigate to maildrop portal for "{SavedValue:uniqueEmailID1}" with subject "Sandbox: Welcome to Recipient Portal"
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    Then I see only the following ordered options in dropdown field "UserRole__c" :
      | --None-- | Non-User | Secondary | Primary |

  @85781 @validatePlaceOfPerformanceFieldsWRTOrganizationFields-Organization
  Scenario:Verify place of performance fields while creating organization user is getting populated to created application by same user
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Organization}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID1}"
    And I pause execution for "180" seconds
    And I refresh the page
    And I navigate to maildrop portal for "{SavedValue:uniqueEmailID1}" with subject "Sandbox: Welcome to Recipient Portal"
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    And I wait for "4" seconds
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "default"
#    When I am on "SUBPORTAL" portal
#    When I login to "Grants Portal" app as "SPI4" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Address line 1" as "Sterling"
    Then I softly see field "Zip Code" as "20171"
    Then I softly see field "State" as "VA"
    #85783 #monu
    When I click on "Edit" in the page details
    And I enter value "20172" into field "Zip4__c"
    When I click on "Save" in the page details
    And I wait for "4" seconds
    Then I softly see field "Zip Code" as "20172"

  @222890 @ValidateEXEuserfromuserregistrationapprovalqueueshouldnotabletoseethereassigntaskofOrganizationRegistrationApprovalinReassignTask
  Scenario: Validate EXE user from user registration approval queue should not able to see the reassign task of Organization Registration Approval in Reassign Task
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "EXE" user
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "Review Organization User Registration" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"

  @223042 @ValidateAdminusershouldnotabletoseethereassigntaskofOrganizationRegistrationApprovalfrommytaskAsaAdmin @sprint-12-US-226646  @reassignment
  Scenario: Validate Admin user should not able to see the reassign task of Organization Registration Approval from my task As a Admin
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-source"
    And I select value "Automation EXE1" into field "input-target"
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "---program:-:adminTaskReassignmentTableId---" panel
    Then I softly do not see value "Review Organization User Registration" for title "Task Type" inside table "---program:-:adminTaskReassignmentTableId---"

  @223512 @ValidatePMuserfromuserregistrationapprovalqueueshouldnotabletoseethereassigntaskofIndividualRegistrationApprovalinReassignTask @sprint-12-US-226646  @reassignment
  Scenario: Validate PM user from user registration approval queue should not able to see the reassign task of Individual Registration Approval in Reassign Task
    Given I begin "Individual" registration as "Register As Individual"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    When I enter value as "{SavedValue:uniqueEmailID1}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Your registration request for access to EGMS has been completed and sent for government approval.Once approved, you will be sent another email from salesforce.com (technology platform provider) with your Username and Password shortly to log into the system. |
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:uniqueEmailID1}" in "{grantor_tableId:SubrecipientIndRegistration}" panel
    And I save the value from row "1" for column name "Full Name" as "UserFullName" from flex table "{grantor_tableId:SubrecipientIndRegistration}"
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:UserFullName}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "Review Individual User Registration" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"

  @223616 @ValidateAdminusershouldnotabletoseethereassigntaskofIndividualRegistrationApprovalfromAllTasksAsaAdmin @sprint-12-US-226646  @reassignment
  Scenario: Validate Admin user should not able to see the reassign task of Individual Registration Approval from All Tasks As a Admin
    Given I begin "Individual" registration as "Register As Individual"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    When I enter value as "{SavedValue:uniqueEmailID1}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Your registration request for access to EGMS has been completed and sent for government approval.Once approved, you will be sent another email from salesforce.com (technology platform provider) with your Username and Password shortly to log into the system. |
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:uniqueEmailID1}" in "{grantor_tableId:SubrecipientIndRegistration}" panel
    And I save the value from row "1" for column name "Full Name" as "UserFullName" from flex table "{grantor_tableId:SubrecipientIndRegistration}"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-source"
    And I select value "Automation EXE1" into field "input-target"
    When I perform quick search for "{SavedValue:UserFullName}" in "---program:-:adminTaskReassignmentTableId---" panel
    Then I softly do not see value "Review Individual User Registration" for title "Task Type" inside table "---program:-:adminTaskReassignmentTableId---"

  @222975 @223047 @ValidateAdminusershouldnotabletoseethereassigntaskofParent/ChildrelationshipApprovalfromAlltasksAsaAdmin @sprint-12-US-226646  @reassignment @wip @invalidScenario
  Scenario: Validate Admin user should not able to see the reassign task of Parent/Child relationship Approval from All tasks As a Admin
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I softly see the text containing "Confirmation Message"
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Organization}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID1}"
    And I pause execution for "190" seconds
    And I refresh the page
    And I navigate to maildrop portal for "{SavedValue:uniqueEmailID1}" with subject "Sandbox: Welcome to Recipient Portal"
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I click on "Associate Parent Organization" in the page details
    And I enter "parentOrg" values from "UserRegistration_Field_Values.xlsx"
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Program Artifacts"
    When I click on "Save" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Organization}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime Organization}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "---closeout:-:homePendingTaskTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime Organization}" for title "EGMS ID" inside table "{grantee_tableId:SubrecipientOrganization}"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "---program:-:adminTaskReassignmentTableId---" panel
    Then I softly do not see value "{SavedValue:Automation Runtime Organization}" for title "EGMS ID" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly do not see value "Review Parent/Child Organization Relationship Request" for title "Task Type" inside table "---program:-:adminTaskReassignmentTableId---"

  @452446 @452447 @452448 @452449 @452450 @452451 @452452 @ValidateLoginPageabletoseeOranizationandIndividualbuttononexternalregistrationpageusingtheExternalsiteregistrationUrl @Sprint-16-US-416690 @ErrorMsgTest
  Scenario: Validate Login Page able to see Oranization and Individual button on external registration page using the External site registration Url
    When I am on "SUBPORTAL" portal
    Then I softly see button "Organization" on login page
    Then I softly see button "Individual" on login page
    And I click on button "Organization" inside login page
    #452447
    Then I softly see "Register As Organization on EGMS" opens in overLay window
    Then I softly do not see "Register As Individual on EGMS" opens in overLay window
    #452448
    And I close modal by clicking the top right x button
    And I click on button "Individual" inside login page
    Then I softly see "Register As Individual on EGMS" opens in overLay window
    #452449
    And I close modal by clicking the top right x button
    Given I begin "Individual" registration as "Register As Individual"
    And I wait for "2" seconds
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
    When I click on "Disagree" in the page details
    Then I softly see button "Organization" on login page
    Then I softly see button "Individual" on login page
    #452450
    Given I begin "Individual" registration as "Register As Individual"
    And I wait for "2" seconds
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 2 of 2" in the page details
    #452451
    When I click on "Disagree" in the page details
    Then I softly see button "Organization" on login page
    Then I softly see button "Individual" on login page
    #452452
    Given I begin "Individual" registration as "Register As Individual"
    And I wait for "2" seconds
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Step 1 of 2" in the page details
    Then I softly see field "Social Security Number (SSN)" inside page block
    Then I softly see asterisk mark on "Social Security Number (SSN)"
    Then I softly see field "Email" inside page block
    Then I softly see asterisk mark on "Email"
    Then I softly see field "Vendor ID" inside page block
    Then I softly do not see asterisk mark on "Vendor ID"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Social Security Number (SSN) is required. |
      | To Save, Email is required.                        |

  @452453 @INDRegVerifyfromorganizationpagewithvaliddataonclicksavebuttonredirecttoregistrationpage @sprint-16-US-416690
  Scenario: IND Reg : Verify from organization page with valid data   on click save button redirect  to registration page
    Given I begin "Individual" registration as "Register As Individual"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    When I enter value as "{SavedValue:uniqueEmailID1}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    Then I softly see fields "PrimaryRepFirstName__c" is visible
    Then I softly see fields "PrimaryRepLastName__c" is visible
    Then I softly see fields "PrimaryRepAddress1__c" is visible
    Then I softly see fields " PrimaryRepCity__c" is visible
    Then I softly see fields "PrimaryRepState__c" is visible
    Then I softly see fields "PrimaryRepZipCode__c" is visible
    Then I softly see fields " PrimaryRepCountry__c" is visible
    Then I softly see fields "PrimaryRepPhone__c" is visible
    Then I softly see fields "SameAsOrganizationAddress__c" is visible
    Then I softly see fields "PaymentAddressLine1__c" is visible
    Then I softly see fields "PaymentAddressCity__c" is visible
    Then I softly see fields "PaymentAddressState__c" is visible
    Then I softly see fields "PaymentAddressZipCode__c" is visible
    Then I softly see fields "PaymentAddressCounty__c" is visible
    When I "Collapse" page block contaninig value "Primary Representative Information"
    Then I softly do not see fields "PrimaryRepFirstName__c" is visible
    When I "Expanded" page block contaninig value "Primary Representative Information"
    Then I softly see fields "PrimaryRepFirstName__c" is visible
    When I "Collapse" page block contaninig value "Profile Description"
    Then I softly do not see fields "ExternalReviewerProfileDescription__c" is visible
    When I "Expanded" page block contaninig value "Profile Description"
    Then I softly see fields "ExternalReviewerProfileDescription__c" is visible
    When I "Collapse" page block contaninig value "Payment Address"
    Then I softly do not see fields "SameAsOrganizationAddress__c" is visible
    When I "Expanded" page block contaninig value "Payment Address"
    Then I softly see fields "SameAsOrganizationAddress__c" is visible

  @452454 @INDRegVerifyinpaymentaddrresssectioninSameasPrimaryRepresentativeInformationDropdownselectYesthenfieldsunabletosee @sprint-16-US-416690
  Scenario: IND Reg : Verify in payment addrress section ,in Same as Primary Representative Information?  Drop down select Yes then fields unable to see.
    Given I begin "Individual" registration as "Register As Individual"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    When I enter value as "{SavedValue:uniqueEmailID1}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    Then I softly do not see fields "PaymentAddressLine1__c" is visible
    Then I softly do not see fields "PaymentAddressCity__c" is visible
    Then I softly do not see fields "PaymentAddressState__c" is visible
    Then I softly do not see fields "PaymentAddressZipCode__c" is visible
    Then I softly do not see fields "PaymentAddressCounty__c" is visible

  @452455 @INDRegVerifyinpaymentaddrresssectioninSameasPrimaryRepresentativeInformationDropdownselectNothenfieldsunabletosee @sprint-16-US-416690
  Scenario: IND Reg : Verify in payment addrress section ,in Same as Primary Representative Information? Drop down select No then fields unable to see.
    Given I begin "Individual" registration as "Register As Individual"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    When I enter value as "{SavedValue:uniqueEmailID1}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "No" into field "SameAsOrganizationAddress__c"
    And I wait for "3" seconds
    Then I softly see fields "PaymentAddressLine1__c" is visible
    Then I softly see fields "PaymentAddressCity__c" is visible
    Then I softly see fields "PaymentAddressState__c" is visible
    Then I softly see fields "PaymentAddressZipCode__c" is visible
    Then I softly see fields "PaymentAddressCounty__c" is visible

  @452457 @INDRegVerifyonclicksavefromregistration2of2pagethenitredirecttocaptchapage @sprint-16-US-416690
  Scenario: IND Reg : Verify on click save from  registration 2 of 2 page then it redirect to captcha page.
    Given I begin "Individual" registration as "Register As Individual"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    When I enter value as "{SavedValue:uniqueEmailID1}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I can see top right button "Back" in page detail
    Then I can see top right button "Submit" in page detail

  @452464 @INDRegVerifyINDorgabletoseeinpendingIndividualsubrecipientregistration @sprint-16-US-416690
  Scenario: IND Reg : Verify IND org able  to see in pending Individual subrecipient registration.
    Given I begin "Individual" registration as "Register As Individual"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    When I enter value as "{SavedValue:uniqueEmailID1}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Your registration request for access to EGMS has been completed and sent for government approval.Once approved, you will be sent another email from salesforce.com (technology platform provider) with your Username and Password shortly to log into the system. |
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "SARAH PM" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:uniqueEmailID1}" in "{grantor_tableId:SubrecipientIndRegistration}" panel
    And I save the value from row "1" for column name "Full Name" as "UserFullName" from flex table "{grantor_tableId:SubrecipientIndRegistration}"
    And I wait for "2" seconds
    When I click on "Start" icon for "{SavedValue:UserFullName}" inside flex table with id "{grantor_tableId:SubrecipientIndRegistration}"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject |

  @453423 @verifyonceloginwithINDprofilealltabsandsection @sprint-16-US-416690
  Scenario:verify once login with IND profile all tabs and section.
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "IND" user
    And I navigate to "Home" tab
    When I navigate to "Individual Profile" content inside "Organization" subheader on left panel
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Risk Assessment" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly see "Description" page block displayed
    Then I softly see "Additional Information" page block displayed
    Then I softly see "Additional Address" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "System Information" page block displayed
    When I "Collapse" page block contaninig value "Description"
    Then I softly do not see fields "BillingCity" is visible
    When I "Expanded" page block contaninig value "Description"
    Then I softly see fields "BillingCity" is visible
    When I "Collapse" page block contaninig value "Additional Information"
    Then I softly do not see fields "PointOfContactUser__c" is visible
    When I "Expanded" page block contaninig value "Additional Information"
    Then I softly see fields "PointOfContactUser__c" is visible
    When I "Collapse" page block contaninig value "Additional Address"
    Then I softly do not see fields "Name" is visible
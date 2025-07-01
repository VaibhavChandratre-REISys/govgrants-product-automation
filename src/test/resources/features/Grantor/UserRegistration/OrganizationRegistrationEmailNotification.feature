@organizationRegistrationPage @userRegistration @parallel-regression @regression @grantor-regression @userRegistrationEmailNotification @organizationRegistrationPageEmailNotification @EmailNotification  @skipOnJenkins
Feature: Validate all registration related scenarios for Email Notification


  @82030 @verifyEmailNotificationForOrganizationRegistration-Organization  @wip
  Scenario:Verify user should be able to see email notificatio after queued email is approved
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Employer Identification Number (EIN)" on old form
    When I enter value as "987654321" into "Data Universal Number System (DUNS) Number" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID1}"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the maildrop subject is as follows :
      """
      Sandbox: Notification: Organization Registration for {SavedValue:RuntimeOrgName} has been Approved
      """
    Then I see the maildrop text is as follows :
      """
       {regconfirmationmailbody:mailbody}
      """


  @85792 @validateSAUserforUserRegistration-Organization
  Scenario:To verify SA allow to modify newly created contact in contact table  for Additional user registration process
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
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the maildrop subject is as follows :
      """
      Sandbox: Notification: Organization Registration for AUTOMATIONRUNTIME Organization has Been Approved
      """



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
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
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

  @84611 @83374 @83527 @84612 @83373 @84613 @validateSAUserforUserRegistration-Organization @debug
  Scenario:To verify SA allow to modify newly created contact in contact table  for Additional user registration process
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
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    #84613 #monu
    Then I see only the following ordered options in dropdown field "ContactType__c" :
      | --None-- | Agency Director | Fiscal Manager | Program Director | Program Fiscal Contact | Grants Manager | Legal Contact |
    And I enter in modal "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    When I click on "Save" in the page details
#    When I close "New Contact" modal by clicking the top right x button
    And I click on "Edit" icon for "Primary" inside flex table with id "---home:-:userContactsTableId---" without waiting for record
    And I enter value "(704) 777-7869" into field "Phone"
    #83374
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "Email"
    When I click on "Save" in the page details
    #When I close "Edit" modal by clicking the top right x button
    Then I softly see value "(704) 777-7869" for title "Phone" inside table "---home:-:userContactsTableId---"
    Then I softly see value "{SavedValue:uniqueEmailID1}" for title "Email" inside table "---home:-:userContactsTableId---"
    #83527
    And I click on "View" icon for "Primary" inside flex table with id "---home:-:userContactsTableId---" without waiting for record
    And I save the field labeled "Address Line 1" as "AddressLine1"
    And I save the field labeled "City" as "CityName"
    And I save the field labeled "Zip Code" as "ZipCode"
    And I save the field labeled "Country" as "CountryName"
    Then I softly see field "Address Line 1" as "{SavedValue:AddressLine1}"
    Then I softly see field "City" as "{SavedValue:CityName}"
    Then I softly see field "Zip Code" as "{SavedValue:ZipCode}"
    Then I softly see field "Country" as "{SavedValue:CountryName}"
    When I close "View" modal by clicking the top right x button
    #84612
    Then I softly can see row level action button "Edit" against "New" in flex table with id "---home:-:userContactsTableId---"
    Then I softly can see row level action button "View" against "New" in flex table with id "---home:-:userContactsTableId---"
    #83373
    Then I softly see value "Automation User" for title "Full Name" inside table "---home:-:userContactsTableId---"
    Then I softly see value "Primary" for title "Role" inside table "---home:-:userContactsTableId---"
    Then I softly see value "{SavedValue:uniqueEmailID1}" for title "Email" inside table "---home:-:userContactsTableId---"
    Then I softly see value "(704) 777-7869" for title "Phone" inside table "---home:-:userContactsTableId---"



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
    And I wait for "3" seconds
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
    And I wait for "3" seconds
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
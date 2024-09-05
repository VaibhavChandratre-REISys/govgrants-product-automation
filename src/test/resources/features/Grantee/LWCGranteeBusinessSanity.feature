@GranteeSanityBusinessFlow
Feature: Sanity scenarios

  @443880 @ValidatePMusershouldabletoCreateActivatetheKPI
  Scenario: Validate PM user should able to Create & Activate the KPI
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:KPITable---"
    And I enter "Grantee_Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "KPI Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Supporting Documents" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:KPIFilesTableId---"
    Then I softly see value "Supporting Documents" for title "Classification" inside table "---grantee_tableId:-:KPIFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "KPI Files" flex table
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    And I upload attachment without random number "Attachment1.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment1.pdf" has been added in "KPI Files" flex table
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    And I upload attachment without random number "sample.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "sample.pdf" has been added in "KPI Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:KPINotesTableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:KPINotesTableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    When I enter the following values into flex table with id "---grantee_tableId:-:KPINotesTableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    When I enter the following values into flex table with id "---grantee_tableId:-:KPINotesTableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record3 | Automation Notes3 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:KPINotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:KPINotesTableId---"
    Then I softly see value "Notes Record2" for title "Title" inside table "---grantee_tableId:-:KPINotesTableId---"
    Then I softly see value "Notes Record3" for title "Title" inside table "---grantee_tableId:-:KPINotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "sarah.pm.automation1@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "Related Log" sub tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:KPIObjectivesTableId---"
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Activate.pdf" as name

  @440386 @ValidatePMusercancreateandActivateStrategicplan
  Scenario: Validate PM user can create and Activate Strategic plan
    When I login to "As a Grantee" app as "GRANTEE EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I enter in modal "Grantee_StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Strategic Plan Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Strategic Plan" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I softly see value "Strategic Plan" for title "Classification" inside table "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Strategic Plan Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "victor.exegrantee.automation@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I enter in modal value "Automation Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Strategic GoaI Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Strategic Goal" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    Then I softly see value "Strategic Goal" for title "Classification" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Strategic GoaI Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "victor.exegrantee.automation@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---grantee_tableId:-:Objectives---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Activities" as "Automation Test Description"
    When I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    When I click "Add" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:objectivesSelectKPITableId---"
    When I click modal button "Close"
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    Then I softly see field "Status" as "Draft"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Objective Files" flex table
    And I click on "Edit" icon for "Others" inside flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Objective" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    Then I softly see value "Objective" for title "Classification" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Objective Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "victor.exegrantee.automation@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I save the field labeled "Strategic Plan" as "StrategicPlan"
    And I click on hyperlink containing value "{SavedValue:StrategicPlan}"
    When I navigate to "Related Log" sub tab
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"

  @440274 @ValidateFocusAreaWithEXEProfileAbletocreateActivateDeactivethefocusarea
  Scenario: Validate Focus Area With EXE Profile Able to create Activate Deactive the focus area
    When I login to "As a Grantee" app as "GRANTEE EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I enter in modal value "Automation Test Description" into field "Description__c"
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:focusAreaAddFilesTableId---"
    When I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    Then I see "AttachmentTesting.pdf" has been added in "Focus Area Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:focusAreaAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "supporting documents" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:focusAreaAddFilesTableId---"
    Then I softly see value "supporting documents" for title "Classification" inside table "---grantee_tableId:-:focusAreaAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:focusAreaAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Focus Area Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:focusAreaNotesTableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:focusAreaNotesTableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:focusAreaNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:focusAreaNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "victor.exegrantee.automation@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Activate.pdf" as name
    And I click on "Deactivate" in the page details
    Then I see status in Progress-bar is "Closed" and is "dark blue"
    Then I see field "Status" as "Inactive"
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Deactivate.pdf" as name

  @443756 @ValidateFederalusershouldseeallfieldsandsectiononfederalOrg
  Scenario: Validate Federal user should see all fields and section on federal Org
    When I login to "As a Grantor" app as "GRANTEE PM" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Organizations" subheader on left panel
    When I perform quick search for "Agency For International Development" in "---grantee_tableId:-:fedOrgTableId---" panel
    And I click on "View" icon for "Agency For International Development" inside flex table with id "---grantee_tableId:-:fedOrgTableId---" without waiting for record
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "Agency For International Development" in the page details
    Then I softly see field "Parent Organization" as "NA"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download As PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Address" page block displayed
    Then I softly see "Related Contacts" page block displayed
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Organization Name" as "Agency For International Development"
    Then I softly see field "Abbreviation" as "USAID"
    Then I softly see field "Address Line 1" as "1300 Pennsylvania Ave NW"
    Then I softly see field "City" as "Washington"
    Then I softly see field "State" as "DC"
    Then I softly see field "Congressional District" inside page block
    When I hovering mouse on help text icon inside page block detail "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field "Country" as "USA"
    Then I softly see field "Zip Code" as "20004"
    Then I softly see field "Website" as "www.usaid.gov"
    Then I softly see field "Address Line 2" inside page block
    Then I softly see field "4-digit Zip Code Extension" inside page block
    Then I softly see field "County" inside page block
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:FedOrgRelatedContacts---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    When I hovering mouse on help text icon inside modal "Phone"
    Then I softly see "Please enter number in this format (xxx)-xxx-xxxx" shown as help text
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly see field on modal "State" inside page block
    Then I softly see field on modal "Congressional District" inside page block
    When I hovering mouse on help text icon inside modal "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field on modal "City" inside page block
    Then I softly see field on modal "Country" inside page block
    Then I softly see field on modal "County" inside page block
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field on modal "Zip Code" inside page block
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Execution" into field "LastName"
    When I enter in modal value "8967093890" into field "Phone"
    When I enter in modal value "8967093440" into field "MobilePhone"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    When I enter in modal value "Mail Street" into field "MailingStreet"
    When I enter in modal value "Howard Lane" into field "Address2__c"
    When I enter in modal value "AK: Alaska" into field "State__c"
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "USA" into field "MailingCountry"
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "1234" into field "X4DigitZipCodeExtension__c"
    When I enter in modal value "12345" into field "MailingPostalCode"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I save the field labeled "Title" as "ContactTitle" on modal
    When I click modal button "Close"
    When I perform quick search for "{SavedValue:ContactTitle}" in "---grantee_tableId:-:FedOrgRelatedContacts---" panel
    Then I softly see value "{SavedValue:ContactTitle}" for title "Title" inside table "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "View" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Delete" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Edit" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see field "Created By" as "{SavedValue:CreatedBy}"
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedBy}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDate}"
    And I navigate to "Related Log" sub tab
    Then I softly see "Active Leads" page block displayed
    Then I softly see "Opportunities" page block displayed
    Then I softly see "Applications" page block displayed
    Then I softly see "Grants" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "# of Organizations Qualified" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Project Period" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "# of Awards" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Total Awarded budget" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Total Spent" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Remaining Balance" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    And I navigate to "Files" sub tab
    Then I softly see "Organization Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:federalFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Indirect Cost Rate Letter" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I softly see top right button "Add" inside flex table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:fedNotesTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Test" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Grantee testing" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    And I save the value from row "2" for column name "Created By" as "CreatedBy" from flex table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "{SavedValue:CreatedBy}" for title "Created By" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Delete" against "Grantee testing" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Edit" against "Grantee testing" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed

  @443850 @ValidatewithPMProfileIfindirectgrantkeepsettingYESthenInApprovedActivestateabletoseetheaccessofsection
  Scenario: Validate with PM Profile in direct grant keep setting YES then In Approved Active state able to see the access of section
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name       | Project Role    | Is Key Contact |
      | Victor EXE | Project Officer | Checked        |
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click "Associate" after selection of "Open Data Framework" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title               | Is Primary Program |
      | Open Data Framework | Checked            |
    And I navigate to "Projections" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Date From | Date To | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15        | 30      | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    And I wait for "3" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 2 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | David FO | Step 3 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Grantee PO | Step 4 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "ETE objectives 1" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    Then I softly see the following messages in the page details contains:
      | KPIs added succesfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Interim Award Document" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "sarah.pm.automation1@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The Subaward has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I can see row level action button "View" against "Open Data Framework" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I cannot see row level action button "Edit" against "Open Data Framework" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "Remove" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I navigate to "Projections" sub tab
    Then I cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I navigate to "Management" sub tab
    Then I can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I can see row level action button "Edit" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:FinancialsReportTableId---"
    And I navigate to "Monitoring" sub tab
    Then I can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I cannot see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "View" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I cannot see row level action button "View" against "ETE objectives 1" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I cannot see row level action button "Edit" against "ETE objectives 1" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly can see "Amendments" sub tab at view detail page
    When I navigate to "Responsibilities" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardApproverTableId---"
    Then I can see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:awardApproverTableId---"
    Then I can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardApproverTableId---"
    Then I can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:awardApproverTableId---"
    Then I can see row level action button "Edit" against "Grantee PO" in flex table with id "---grantee_tableId:-:awardApproverTableId---"
    And I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentsTableId---"
    And I navigate to "Files" sub tab
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly do not see top right button "Add" inside flex table "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "View" against "Interim Award Document" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Download" against "Interim Award Document" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I cannot see row level action button "Edit" against "Interim Award Document" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Activated" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "ApprovalPDF.pdf" as name
    Then I softly see snapshot with name containing "SubmitForApproval.pdf" as name
    Then I softly see snapshot with name containing "Complete Review.pdf" as name
    Then I softly can see top right button "View NOGA" in page detail
    And I click on "View NOGA" in the page details
    And I download the file
    Then I softly see "{SavedValue:GrantEGMSID}" on page "1" of "govgrants" pdf file

  @445207 @ValidateEXEuserFinancialreportOwnercanabletocreateAdhocFinancialReport&abletosubmitFinancialReporttoGrantor
  Scenario: Validate EXE user Financial report Owner can able to create Adhoc Financial Report & able to submit Financial Report to Grantor
    When I login to "As a Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name     | Project Role    | Is Key Contact |
      | Sarah PM | Project Officer | Checked        |
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click "Associate" after selection of "Open Data Framework" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title               | Is Primary Program |
      | Open Data Framework | Checked            |
    And I navigate to "Projections" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Date From | Date To | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15        | 30      | 10                             | Final                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "ETE objectives 1" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The Subaward has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:FinancialsReportTableId---"
    And I enter "Creation" values from "Financial_Report_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "financialEGMSID"
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - My Records"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:financialEGMSID}" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "Edit" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "View" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "Delete" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly do not see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly do not see value "Approved" for title "Status" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly do not see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    And I click toggle button to select "Financial Reports - Draft"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:financialEGMSID}" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "Edit" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "View" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "Delete" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Grant Award Number" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Award Title" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside table
    Then I softly see "Collapse" button for header
    Then I see the header is "Financial Report" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime award}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:financialEGMSID}"
    Then I softly see field "Status" as "Created"
    And I save the field labeled "Grant Award Number" as "GrantNumber"
    Then I softly see field "Grant Award Number" as "{SavedValue:GrantNumber}"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see "Resize" button for page
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Forms & Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly see "Report Overview" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "System Information" page block displayed
    And I save the field labeled "Award ID" as "AwardID"
    Then I softly see field "Award ID" inside page block
    Then I softly see link "{SavedValue:AwardID}" inside Page block
    Then I softly see field "Budget Period" inside page block
    Then I softly see field "Budget Period Number" inside page block
    Then I softly see field "Internal Organization" inside page block
    And I save the field labeled "Internal Organization" as "InternalOrganization"
    Then I softly see link "{SavedValue:InternalOrganization}" inside Page block
    Then I softly see field "Funding Organization" inside page block
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see link "{SavedValue:FundingOrganization}" inside Page block
    Then I softly see field "Reporting Period Start Date" inside page block
    Then I softly see field "Reporting Period End Date" inside page block
    Then I softly see field "Report Due Date" inside page block
    Then I softly see field "Final Report?" inside page block
    Then I softly see field "Submitted On" inside page block
    And I click on "Edit" in the page details
    Then I softly see fields "ReportingPeriodStartDate__c" is in edit mode
    Then I softly see fields "ReportingPeriodEndDate__c" is in edit mode
    Then I softly see fields "ReportDueDate__c" is in edit mode
    Then I softly see fields "IsFinalReport__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see "Project Role" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Name" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Is Key Contact" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Is User" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see field "Created By" inside page block
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified By" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I softly see field "Last Modified Date" inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Sarah PM      | Fiscal Reviewer | Automation Description | 5        | No                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly can see row level action button "Edit" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Delete" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I click on "Delete" icon for "Sarah PM" inside table with table id "---grantee_tableId:-:financialReportPeerReviewTableId---" without processing
    Then I softly see confirmation box with body "Do you want to delete? Once it is deleted it cannot be restored." is displayed
    When I click modal button "OK"
    And I wait for "3" seconds
    Then I softly do not see value "Sarah PM" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I click on "Send for Review" icon for "Grantee PO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "Grantee PO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Rating is required to save.   |
      | Comments is required to save. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "Grantee PO" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Enter Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - Draft"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside table
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Edit" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Delete" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Send for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportApproverTableId---" by clicking "New" :
      | Name     | Financial Report |
      | Sarah PM | Step 1           |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportApproverTableId---" by clicking "New" :
      | Name       | Financial Report |
      | Victor EXE | Step 2           |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I navigate to "Forms & Files" sub tab
    Then I softly see "Forms" page block displayed
    Then I softly see "Financial Report Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Form Name" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Mandatory" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Percentage" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified By" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified Date" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "cross" symbol against the value "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I save the value from row "1" for column name "Last Modified By" as "LastModifiedBy" from flex table "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "sarah.pm@ggp.test8.qagrnteatm"
    And I click on back arrow
    Then I softly can see row level action button "View" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Federal Financial Report (SF-425)" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I wait for "3" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I enter "FederalFinancialReport_425" values from "Financial_Report_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I enter value "Automation for Execution" into field "Remark__c"
    And I click on "Cancel" in the page details
    And I wait for "2" seconds
    Then I softly see field "Remarks" as "Automation test"
    Then I softly can see top right button "Edit" in page detail
    And I close the tab
    When I click on "View" icon for "Federal Financial Report (SF-425)" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I wait for "3" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I softly can see top right button "Edit" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download As PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly see "Financial Information" page block displayed
    Then I softly see "Recipient Information" page block displayed
    Then I softly see "10. Transactions" page block displayed
    Then I softly see "11. Indirect Expense" page block displayed
    Then I softly see "Remarks" page block displayed
    Then I softly see "Certification" page block displayed
    Then I softly see "Authorized Certifying Official" page block displayed
    Then I softly see field "1. Federal Agency and Organizational Element to Which Report is Submitted" inside page block
    Then I softly see field "2. Federal Grant or Other Identifying Number Assigned by Federal Agency" inside page block
    Then I softly see field "3. Recipient Organization (Name and complete address including Zip code):" inside page block
    Then I softly see field "4a. UEI" inside page block
    Then I softly see field "4b. EIN:" inside page block
    Then I softly see field "5. Recipient Account Number or Identifying Number:" inside page block
    Then I softly see field "6. Report Type:" inside page block
    Then I softly see field "7. Basis of Accounting:" inside page block
    Then I softly see field "8. Project/Grant Period From: (Month, Day, Year):" inside page block
    Then I softly see field "8. Project/Grant Period From: (Month, Day, Year):" inside page block
    And I close the tab
    And I navigate to "Quickview" sub tab in split screen
    When I click on "Splitview" icon for "Federal Financial Report (SF-425)" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see top right button "Edit" in the split screen page details
    Then I softly can see top right button "Download As PDF" in the split screen page details
    Then I softly can see top right button "Take Snapshot" in the split screen page details
    When I navigate to "Forms & Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:financialReportFormFilesTableId---"
    Then I see "Upload" button is disabled at modal under library
    When I upload file "AttachmentTesting.pdf" into library
    Then I do not see "Upload" button is disabled at modal under library
    When I click modal button "Close"
    And I wait for "4" seconds
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:financialReportFormFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Financial Report" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Financial Report" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "Add" :
      | Description      |
      | Automation Notes |
    Then I softly see the following messages in the page details :
      | Required Fields Missing |
    And I refresh the page
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I click on "Delete" icon for "Notes Record" inside flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see "Actions" in flex table header "CommunicationHistory"
    Then I softly see "Subject" in flex table header "CommunicationHistory"
    Then I softly see "From Address" in flex table header "CommunicationHistory"
    Then I softly see "To Address" in flex table header "CommunicationHistory"
    Then I softly see "CC Address" in flex table header "CommunicationHistory"
    Then I softly see "Attention To" in flex table header "CommunicationHistory"
    Then I softly see "Email Subject" in flex table header "CommunicationHistory"
    Then I softly see "Preview" in flex table header "CommunicationHistory"
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "sarah.pm.automation1@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Report has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - All"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:financialEGMSID}" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "View" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside table
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportApproverTableId---"
    When I navigate to "Forms & Files" sub tab
    Then I softly can see row level action button "View" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "View" against "Automation.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Automation.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly see top right button "Add" inside flex table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation.pdf" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation.pdf" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Management" sub tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - Draft"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside table
    Then I softly can see top right button "Mark as Submitted" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Name" in flex table header "---grantee_tableId:-:financialReportOwnerTableId---"
    Then I softly see "Responsibility" in flex table header "---grantee_tableId:-:financialReportOwnerTableId---"
    And I save the value from row "1" for column name "Name" as "ownerName" from flex table "---grantee_tableId:-:financialReportOwnerTableId---"
    Then I softly see link "{SavedValue:ownerName}" inside Page block
    And I click on hyperlink containing value "{SavedValue:ownerName}"
    Then I softly see the text containing "sarah.pm@ggp.test8.qagrnteatm"
    And I click on back arrow
    And I click on "Mark as Submitted" in the page details
    And I wait for "2" seconds
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Submitted to Grantor On is required to save. |
    And I enter in modal "Submit Details" values from "Financial_Report_Field_Values.xlsx"
    When I click modal button "Save"
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Submitted By" as "SubmittedBy"
    Then I softly see field "Submitted By" as "{SavedValue:SubmittedBy}"
    And I save the field labeled "Submitted On" as "SubmittedOn"
    Then I softly see field "Submitted On" as "{SavedValue:SubmittedOn}"
    When I click on "Revise" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to revise the report? The report will require an approval again after being revised." is displayed
    And I click "OK" on modal confirmation box
    When I enter in modal value "Automation Feedback" into field "ReviseComments__c"
    And I enter in modal value "0" into field "RevisedDate__c"
    When I click modal button "Save"
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"
    Then I softly see "Grantor Feedback History" page block displayed
    When I navigate to "History" sub tab
    Then I softly see field "Feedback from Grantor" as "Automation Feedback"
    And I save the field labeled "Feedback Received On Date" as "FeedbackReceivedOnDate"
    Then I softly see field "Feedback from Grantor" as "{SavedValue:FeedbackReceivedOnDate}"
    Then I softly can see top right button "Edit" in page detail
    Then I softly see "Resize" button for page
    Then I softly see "Collapse" button for page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Quickview" sub tab at view detail page
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I see "Project Details" page block displayed
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"

  @445639 @ValidateprogressreportscheduleusercaneditprogressreportscheduleonCreatedSubmittedforreviewReviewedActivatedaward
  Scenario: Validate progress report schedule user can edit progress report schedule on Created , Submitted for review, Reviewed, Activated award
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_Creation_Schedules" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edit_Schedules" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Projections" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    When I navigate to "Management" sub tab
    Then I softly see "Reports Schedule" page block displayed
    Then I softly see value "Progress Report" for title "Report Type" inside table "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see value "Financial Report" for title "Report Type" inside table "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Report Title" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "View" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    Then I softly see "Scheduled Report" page block displayed on modal
    Then I softly see field "Report Type" inside page block
    Then I softly see field "Report Title" inside page block
    Then I softly see field "Reporting Period Start Date" inside page block
    Then I softly see field "Reporting Period End Date" inside page block
    Then I softly see field "Frequency" inside page block
    Then I softly see field "Schedule Base" inside page block
    Then I softly see field "Description" inside page block
    Then I softly see field "Lead time (in days) for report task creation" inside page block
    Then I softly see field "# of days for report submission" inside page block
    Then I softly see field "Report Type" as "Progress Report"
    Then I softly see field "Report Title" as "{SavedValue:Automation Runtime award}"
    Then I softly see field "Reporting Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Reporting Period End Date" as " "
    Then I softly see field "Frequency" as "Not Applicable"
    Then I softly see field "Schedule Base" as " "
    Then I softly see field "Description" as " "
    Then I softly see field "Lead time (in days) for report task creation" as "15"
    Then I softly see field "# of days for report submission" as "15"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    Then I softly see "Scheduled Report" page block displayed on modal
    Then I softly see field "Report Type" inside page block
    Then I softly see field "Report Title" inside page block
    Then I softly see field "Reporting Period Start Date" inside page block
    Then I softly see field "Reporting Period End Date" inside page block
    Then I softly see field "Frequency" inside page block
    Then I softly see field "Schedule Base" inside page block
    Then I softly see field "Description" inside page block
    Then I softly see field "Lead time (in days) for report task creation" inside page block
    Then I softly see field "# of days for report submission" inside page block
    Then I softly see field "Report Type" as "Progress Report"
    Then I softly see fields "SubmissionTitle__c" is in edit mode
    Then I softly see fields "CalReportingStartDate__c" is in edit mode
    Then I softly see fields "CalReportingEndDate__c" is in edit mode
    Then I softly see fields "Frequency__c" is in edit mode
    Then I softly see fields "ScheduleBase__c" is in edit mode
    Then I softly see fields "Description__c" is in edit mode
    Then I softly see fields "DaysBeforeEndDate__c" is in edit mode
    Then I softly see fields "DaysAfterEndDate__c" is in edit mode
    When I enter in modal "Grantee_Progress_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---" by clicking "Edit" :
      | Reporting Period Start Date | Reporting Period End Date |
      | 17                          | 47                        |
    Then I softly see value "{Date:MM/dd/yyyy::d+17}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly see value "{Date:MM/dd/yyyy::d+47}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name       | Project Role    | Is Key Contact |
      | Victor EXE | Project Officer | Checked        |
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click "Associate" after selection of "Open Data Framework" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title               | Is Primary Program |
      | Open Data Framework | Checked            |
    And I navigate to "Projections" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Date From | Date To | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15        | 30      | 10                             | Final                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    When I enter in modal "Grantee_Progress_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---" by clicking "Edit" :
      | Reporting Period Start Date | Reporting Period End Date |
      | 20                          | 50                        |
    Then I softly see value "{Date:MM/dd/yyyy::d+20}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly see value "{Date:MM/dd/yyyy::d+50}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    When I enter in modal "Grantee_Progress_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---" by clicking "Edit" :
      | Reporting Period Start Date | Reporting Period End Date |
      | 23                          | 53                        |
    Then I softly see value "{Date:MM/dd/yyyy::d+23}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly see value "{Date:MM/dd/yyyy::d+53}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    When I enter in modal "Grantee_Progress_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "ETE objectives 1" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The Subaward has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly cannot see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    When I enter in modal "Grantee_Progress_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---" by clicking "Edit" :
      | Reporting Period Start Date | Reporting Period End Date |
      | 17                          | 47                        |
    Then I softly see value "{Date:MM/dd/yyyy::d+17}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly see value "{Date:MM/dd/yyyy::d+47}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"

  @445640 @446229 @ValidateFinancialReportScheduleusercaneditFinancialreportscheduleonCreatedSubmittedforreviewReviewedActivatedaward
  Scenario Outline: Validate Financial Report Schedule user can edit Financial report schedule on Created Submitted for review Reviewed Activated award
    When I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_Creation_Schedules" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edit_Schedules" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Projections" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    When I navigate to "Management" sub tab
    Then I softly see "Reports Schedule" page block displayed
    Then I softly see value "Progress Report" for title "Report Type" inside table "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see value "Financial Report" for title "Report Type" inside table "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Report Title" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "View" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "Edit" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "View" icon for "Financial Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    Then I softly see "Scheduled Report" page block displayed on modal
    Then I softly see field "Report Type" inside page block
    Then I softly see field "Report Title" inside page block
    Then I softly see field "Reporting Period Start Date" inside page block
    Then I softly see field "Reporting Period End Date" inside page block
    Then I softly see field "Frequency" inside page block
    Then I softly see field "Schedule Base" inside page block
    Then I softly see field "Description" inside page block
    Then I softly see field "Lead time (in days) for report task creation" inside page block
    Then I softly see field "# of days for report submission" inside page block
    Then I softly see field "Report Type" as "Financial Report"
    Then I softly see field "Report Title" as "{SavedValue:Automation Runtime award}"
    Then I softly see field "Reporting Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Reporting Period End Date" as " "
    Then I softly see field "Frequency" as "Not Applicable"
    Then I softly see field "Schedule Base" as " "
    Then I softly see field "Description" as " "
    Then I softly see field "Lead time (in days) for report task creation" as "15"
    Then I softly see field "# of days for report submission" as "15"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Financial Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    Then I softly see "Scheduled Report" page block displayed on modal
    Then I softly see field "Report Type" inside page block
    Then I softly see field "Report Title" inside page block
    Then I softly see field "Reporting Period Start Date" inside page block
    Then I softly see field "Reporting Period End Date" inside page block
    Then I softly see field "Frequency" inside page block
    Then I softly see field "Schedule Base" inside page block
    Then I softly see field "Description" inside page block
    Then I softly see field "Lead time (in days) for report task creation" inside page block
    Then I softly see field "# of days for report submission" inside page block
    Then I softly see field "Report Type" as "Financial Report"
    Then I softly see fields "SubmissionTitle__c" is in edit mode
    Then I softly see fields "CalReportingStartDate__c" is in edit mode
    Then I softly see fields "CalReportingEndDate__c" is in edit mode
    Then I softly see fields "Frequency__c" is in edit mode
    Then I softly see fields "ScheduleBase__c" is in edit mode
    Then I softly see fields "Description__c" is in edit mode
    Then I softly see fields "DaysBeforeEndDate__c" is in edit mode
    Then I softly see fields "DaysAfterEndDate__c" is in edit mode
    When I enter in modal "Grantee_Financial_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Financial Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---" by clicking "Edit" :
      | Reporting Period Start Date | Reporting Period End Date |
      | 17                          | 47                        |
    Then I softly see value "{Date:MM/dd/yyyy::d+17}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly see value "{Date:MM/dd/yyyy::d+47}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name       | Project Role    | Is Key Contact |
      | Victor EXE | Project Officer | Checked        |
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click "Associate" after selection of "Open Data Framework" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title               | Is Primary Program |
      | Open Data Framework | Checked            |
    And I navigate to "Projections" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Date From | Date To | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15        | 30      | 10                             | Final                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "Edit" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "Edit" icon for "Financial Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    When I enter in modal "Grantee_Financial_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I expand nested table containing column value "Financial Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---" by clicking "Edit" :
      | Reporting Period Start Date | Reporting Period End Date |
      | 20                          | 50                        |
    Then I softly see value "{Date:MM/dd/yyyy::d+20}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly see value "{Date:MM/dd/yyyy::d+50}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "Edit" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "Edit" icon for "Financial Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    When I enter in modal "Grantee_Financial_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I expand nested table containing column value "Financial Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---" by clicking "Edit" :
      | Reporting Period Start Date | Reporting Period End Date |
      | 23                          | 53                        |
    Then I softly see value "{Date:MM/dd/yyyy::d+23}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly see value "{Date:MM/dd/yyyy::d+53}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "Edit" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "Edit" icon for "Financial Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    When I enter in modal "Grantee_Financial_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | <userName> | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "ETE objectives 1" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The Subaward has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly cannot see row level action button "Edit" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I expand nested table containing column value "Financial Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "Edit" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "Edit" icon for "Financial Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    When I enter in modal "Grantee_Financial_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I expand nested table containing column value "Financial Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---" by clicking "Edit" :
      | Reporting Period Start Date | Reporting Period End Date |
      | 17                          | 47                        |
    Then I softly see value "{Date:MM/dd/yyyy::d+17}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly see value "{Date:MM/dd/yyyy::d+47}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Examples:
      | userType    | userName   |
      | GRANTEE PM  | Sarah PM   |
      | GRANTEE EXE | Victor EXE |

  @446149 @ValidateGPCloseoutwithPMProfileAbletocreateProjectperiodcloseoutandabletocompletethecloseout
  Scenario: Validate GP Closeout with PM Profile Able to create Project period closeout and able to complete the closeout
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_GrantCreation1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name       | Project Role    | Is Key Contact |
      | Victor EXE | Project Officer | Checked        |
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click "Associate" after selection of "Open Data Framework" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title               | Is Primary Program |
      | Open Data Framework | Checked            |
    And I navigate to "Projections" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "ETE objectives 1" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "amendmentEGMSID"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Closeout" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Closeout" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly can see row level action button "View" against "Created" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Delete" icon for "Created" inside table with table id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---" without processing
    Then I softly see confirmation box with body "Are you sure, you want to permanently delete the project period closeout?" is displayed
    When I click modal button "OK"
    And I wait for "4" seconds
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see field "Status" as "Created"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Open Items" sub tab at view detail page
    Then I softly can see "Check List" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Override" in page detail
    When I navigate to "Overview" sub tab
    Then I softly see "Grant Overview" page block displayed
    Then I softly see "Closeout Request Details" page block displayed
    Then I softly see "System Information" page block displayed
    When I navigate to "Open  Items" sub tab
    Then I softly see "Pending Amendment Requests" page block displayed
    Then I softly see "Pending Progress Reports" page block displayed
    Then I softly see "Pending Financial Reports" page block displayed
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:amendmentEGMSID}" inside table "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
    When I navigate to "Check List" sub tab
    Then I softly see "Expenses" page block displayed
    Then I softly see "Record Changes" page block displayed
    Then I softly see "Report/Finance" page block displayed
    Then I softly see "Report/Property" page block displayed
    Then I softly see "Monitoring" page block displayed
    Then I softly see "Overall" page block displayed
    Then I softly see "Link to Disclosure of Lobbying form (SF-LLL)" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:closeoutApproverTableId---"
    When I navigate to "Files" sub tab
    Then I softly see "Closeout Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly see top right button "Add" inside flex table "---grantee_tableId:-:closeoutNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    When I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Rating is required to save.   |
      | Comments is required to save. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly see status in Progress-bar is "Reviewed" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "New" :
      | Name       | Closeout |
      | Victor EXE | Step 1   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    Then I softly see status in Progress-bar is "Overridden" and is "dark blue"
    When I navigate to "Open  Items" sub tab
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:amendmentEGMSID}" inside table "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Closeout has been validated successfully. Please proceed. |
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Forward | Send to Owner |
    When I select radio button "Forward" in the approval decision
    And I select user "David FO" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "Edit" :
      | Closeout | Name       |
      | Step 1   | Victor EXE |
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    Then I softly see "Submit to Grantor" opens in overLay window
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Submitted to Grantor On is required to save. |
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I softly can see top right button "Complete Closeout" in page detail
    When I click on "Complete Closeout" in the page details
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Grantor Closeout Date is required to save. |
    When I enter values into fields
      | Value | Field                  |
      | 0     | FederalCloseoutDate__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Completed"
    Then I softly see status in Progress-bar is "Completed" and is "dark blue"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Completed" for title "New Value" inside field history table
    Then I softly see value "Submitted to Grantor" for title "Original Value" inside field history table
    And I click on back arrow
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    Then I softly see field "Status" as "Closed/Completed"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Completed"
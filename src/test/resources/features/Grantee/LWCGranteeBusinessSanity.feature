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

  @440386 @ValidatePMusercancreateandActivateStrategicplan @TBE1
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

  @440274 @ValidateFocusAreaWithEXEProfileAbletocreateActivateDeactivethefocusarea @TBE1
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
    When I click on "Menu" in the page details
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
    When I hovering mouse on help text icon inside page block detail "Phone"
    Then I softly see "Please enter number in this format (xxx)-xxx-xxxx" shown as help text
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly see field on modal "State" inside page block
    Then I softly see field on modal "Congressional District" inside page block
    When I hovering mouse on help text icon inside page block detail "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field on modal "City" inside page block
    Then I softly see field on modal "Country" inside page block
    Then I softly see field on modal "County" inside page block
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field on modal "Zip Code" inside page block
    When I enter in modal value "Automation Test" into field "Title"
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
    When I click modal button "Close"
    When I perform quick search for "Automation Test" in "---grantee_tableId:-:FedOrgRelatedContacts---" panel
    Then I softly see value "Automation Test" for title "Title" inside table "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "View" against "Automation Test" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Delete" against "Automation Test" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Edit" against "Automation Test" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see field "Created By" as "{SavedValue:CreatedBy}"
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedBy}"
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
    When I login to "As a Grantor" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
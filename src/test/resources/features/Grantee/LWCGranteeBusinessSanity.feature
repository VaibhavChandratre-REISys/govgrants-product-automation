@GranteeSanityBusinessFlow
Feature: Sanity scenarios

  @443880 @ValidatePMusershouldabletoCreateActivatetheKPI @TBE1
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
    And I wait for "2" seconds
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
    And I wait for "2" seconds
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
    And I wait for "2" seconds
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
    And I wait for "2" seconds
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
    And I wait for "2" seconds
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
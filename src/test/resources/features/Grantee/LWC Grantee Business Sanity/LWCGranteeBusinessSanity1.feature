@GranteeSanityBusinessFlow1
Feature: Sanity scenarios

  @482129 @ValidatetheAuditoruserinternalOrganizationallsectionandfields
  Scenario: the Auditor user internal Organization all section and fields
    When I login to "As a Grantor" app as "GRANTEE AUDITOR" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organizations" subheader on left panel
    And I click on "View" icon for "Test Automation Organization" inside flex table with id "---grantee_tableId:-:InternalOrganizations---" without waiting for record
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Test Automation Organization" in the page details
    Then I softly see field "Parent Organization" as "GMS Administrator"
    Then I softly see field "Organization Type" as "Agency"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Address" page block displayed
    Then I softly see "Related Contacts" page block displayed
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see "UEI Numbers" page block displayed
    Then I softly see "System Information" page block displayed
    When I save the field labeled "Organization Code" as "OrganizationCode"
    Then I softly see field "Organization Code" as "{SavedValue:OrganizationCode}"
    When I save the field labeled "Abbreviation" as "Abbreviation"
    Then I softly see field "Abbreviation" as "{SavedValue:Abbreviation}"
    When I save the field labeled "EIN" as "EIN"
    Then I softly see field "EIN" as "{SavedValue:EIN}"
    When I save the field labeled "UEI" as "UEI"
    Then I softly see field "UEI" as "{SavedValue:UEI}"
    Then I softly see "Address" page block displayed
    When I save the field labeled "Street" as "Street"
    Then I softly see field "Street" as "{SavedValue:Street}"
    When I save the field labeled "City" as "City"
    Then I softly see field "City" as "{SavedValue:City}"
    When I save the field labeled "State" as "State"
    Then I softly see field "State" as "{SavedValue:State}"
    When I save the field labeled "Country" as "Country"
    Then I softly see field "Country" as "{SavedValue:Country}"
    Then I save the field labeled "Zip Code" as "ZipCode"
    Then I softly see field "Zip Code" as "{SavedValue:ZipCode}"
    When I save the field labeled "Website" as "Website"
    Then I softly see field "Website" as "{SavedValue:Website}"
    When I save the field labeled "County" as "County"
    Then I softly see field "County" as "{SavedValue:County}"
    When I "Collapse" page block contaninig value "Address"
    Then I softly do not see fields "BillingStreet" is visible
    When I "Expanded" page block contaninig value "Address"
    Then I softly see fields "BillingStreet" is visible
    When I click on parallel lines menu bar with data target value "Related Contacts"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:RelatedContacts---"
    And I perform quick search for "Automation PM" in "---grantee_tableId:-:RelatedContacts---" panel
    Then I softly cannot see row level action button "Edit" against "Automation PM" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly can see row level action button "View" against "Automation PM" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "View" icon for "Automation PM" inside table
    Then I softly see "Contact" opens in overLay window
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly see field on modal "State" inside page block
    Then I softly see field on modal "City" inside page block
    Then I softly see field on modal "Country" inside page block
    Then I softly see field on modal "County" inside page block
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field on modal "Zip Code" inside page block
    And I save the field labeled "Title" as "Title" on modal
    And I save the field labeled "First Name" as "FirstName" on modal
    And I save the field labeled "Last Name" as "LastName" on modal
    And I save the field labeled "Phone" as "Phone" on modal
    And I save the field labeled "Mobile Phone" as "MobilePhone" on modal
    And I save the field labeled "Email" as "Email" on modal
    And I save the field labeled "Address Line 1" as "AddressLine1" on modal
    And I save the field labeled "State" as "State" on modal
    And I save the field labeled "City" as "City" on modal
    And I save the field labeled "Country" as "Country" on modal
    And I save the field labeled "Zip Code" as "ZipCode" on modal
    And I save the field labeled "Created By" as "CreatedBy" on modal
    And I save the field labeled "Created Date" as "CreatedDate" on modal
    And I save the field labeled "Last Modified By" as "LastModifiedBy" on modal
    And I save the field labeled "Last Modified Date" as "LastModifiedDate" on modal
    Then I see field "Title" as "{SavedValue:Title}" on modal
    Then I see field "First Name" as "{SavedValue:FirstName}" on modal
    Then I see field "Last Name" as "{SavedValue:LastName}" on modal
    Then I see field "Phone" as "{SavedValue:Phone}" on modal
    Then I see field "Mobile Phone" as "{SavedValue:MobilePhone}" on modal
    Then I see field "Email" as "{SavedValue:Email}" on modal
    Then I see field "Address Line 1" as "{SavedValue:AddressLine1}" on modal
    Then I see field "State" as "{SavedValue:State}" on modal
    Then I see field "City" as "{SavedValue:City}" on modal
    Then I see field "Country" as "{SavedValue:Country}" on modal
    Then I see field "Zip Code" as "{SavedValue:ZipCode}" on modal
    Then I see field "Created By" as "{SavedValue:CreatedBy}" on modal
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    Then I see field "Created Date" as "{SavedValue:CreatedDate}" on modal
    Then I see field "Last Modified By" as "{SavedValue:LastModifiedBy}" on modal
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I see field "Last Modified Date" as "{SavedValue:LastModifiedDate}" on modal
    And I wait for "2" seconds
    When I click modal button "Close"
    When I perform quick search for "Automation PM" in "---grantee_tableId:-:RelatedContacts---" panel
    Then I softly see value "Automation PM" for title "Title" inside table "---grantee_tableId:-:RelatedContacts---"
    Then I can see row level action button "View" against "Automation PM" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I cannot see row level action button "Delete" against "Automation PM" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I cannot see row level action button "Edit" against "Automation PM" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on parallel lines menu bar with data target value "Related Contacts"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    When I click on "Title" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "Full Name" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Ascending" for column "Full Name" inside table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "Full Name" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Descending" for column "Full Name" inside table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "Email" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Ascending" for column "Email" inside table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "Email" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Descending" for column "Email" inside table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "Phone" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Ascending" for column "Phone" inside table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "Phone" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Descending" for column "Phone" inside table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "Is User" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Ascending" for column "Is User" inside table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "Is User" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Descending" for column "Is User" inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:RelatedContacts---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:RelatedContacts---"
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Organization Level" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Agency Abbreviation" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Effective from" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Effective Until" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Approved Indirect Cost Rate(%)" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Indirect Cost Rate Type" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Budget Categories" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see top right button "Advance Filter" inside flex table "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:indirectRateTableId---"
    When I click on parallel lines menu bar with data target value "Indirect Rates"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on "Title" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective from" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Effective from" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective from" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Effective from" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective Until" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Effective Until" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective Until" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Effective Until" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Approved Indirect Cost Rate(%)" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Approved Indirect Cost Rate(%)" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Approved Indirect Cost Rate(%)" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Approved Indirect Cost Rate(%)" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Indirect Cost Rate Type" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Indirect Cost Rate Type" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Indirect Cost Rate Type" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Indirect Cost Rate Type" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Budget Categories" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Budget Categories" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Budget Categories" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Budget Categories" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "UEI Numbers" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "UEI Number" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "Registered Entity Name" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "Location" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "Child Organizations" page block displayed
    Then I softly see link "Created By" inside Page block
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see field "Created By" as "{SavedValue:CreatedBy}"
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    Then I softly see link "Last Modified By" inside Page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedBy}"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDate}"
    And I navigate to "Related Log" sub tab
    Then I softly see "Qualified Leads" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Qualifying Organization" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    And I navigate to "Files" sub tab
    Then I softly see "Organization Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I see "Attachment.pdf" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see value "Others" for title "Classification" inside table "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    When I click on parallel lines menu bar with data target value "Organization Files"
    Then I see option "Refresh" present in parallel dropdown
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see value "Notes Record for PM" for title "Title" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see link "Created By" inside Page block
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record for PM" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record for PM" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    Then I see option "Refresh" present in parallel dropdown
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page

  @482136 @ValidateAuditorusershouldhaveonlyviewaccess
  Scenario Outline: Validate Auditor user should have only view access
    When I login to "As a Grantor" app as "GRANTEE PM" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    And I click toggle button to select "All Contacts"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:InternalContacts---"
    When I enter in modal value "Department of Product" into field "AccountId"
    When I enter in modal value "Automation Runtime" into field "FirstName"
    And I enter in modal value "Contact" into field "LastName"
    And I enter in modal value "8967894567" into field "Phone"
    And I enter in modal value "9580378904" into field "MobilePhone"
    And I enter in modal value "VA Street" into field "MailingStreet"
    And I enter in modal value "Jordan Road" into field "Address2__c"
    And I enter in modal value "AK: Alaska" into field "State__c"
    And I enter in modal value "123" into field "CongressionalDistrict__c"
    And I enter in modal value "Calif" into field "MailingCity"
    And I enter in modal value "USA" into field "MailingCountry"
    And I enter in modal value "California" into field "County__c"
    And I enter in modal value "1234" into field "X4DigitZipCodeExtension__c"
    And I enter in modal value "12345" into field "MailingPostalCode"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    And I save the field labeled "Organization" as "Organization" on modal
    And I save the field labeled "Type" as "Type" on modal
    And I save the field labeled "Title" as "Title" on modal
    And I save the field labeled "First Name" as "FirstName" on modal
    And I save the field labeled "Last Name" as "LastName" on modal
    And I save the field labeled "Phone" as "Phone" on modal
    And I save the field labeled "Mobile Phone" as "MobilePhone" on modal
    And I save the field labeled "Email" as "Email" on modal
    And I save the field labeled "Address Line 1" as "AddressLine1" on modal
    And I save the field labeled "Address Line 2" as "AddressLine2" on modal
    And I save the field labeled "State" as "State" on modal
    And I save the field labeled "Congressional District" as "CongressionalDistrict" on modal
    And I save the field labeled "City" as "City" on modal
    And I save the field labeled "Country" as "Country" on modal
    And I save the field labeled "County" as "County" on modal
    And I save the field labeled "4-Digit Zip Code Extension" as "4DigitZipCodeExtension" on modal
    And I save the field labeled "Zip Code" as "ZipCode" on modal
    When I close "Create Contact" modal by clicking the top right x button
    And I perform quick search for "{SavedValue:Automation Runtime} Contact" in "---grantee_tableId:-:InternalContacts---" panel
    Then I softly see value "{SavedValue:Automation Runtime} Contact" for title "Full Name" inside table "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    And I re-login to "As a Grantee" app as "<userAuditor>" user on "INTERNAL" portal
    When I navigate to "Home" tab
    Then I see "External" inside "Contacts" is displayed
    Then I see "Internal" inside "Contacts" is displayed
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    And I click toggle button to select "All Contacts"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Full Name" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Phone" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Is User" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see toggle option "All Contacts" inside flex table id "---grantee_tableId:-:InternalContacts---"
    Then I softly see toggle option "My Organization’s Contact" inside flex table id "---grantee_tableId:-:InternalContacts---"
    When I click on parallel lines menu bar with data target value "All Contacts"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I click on page navigation arrow "---grantee_tableId:-:InternalContacts---" for table id "Next"
    Then I see table "---grantee_tableId:-:InternalContacts---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:InternalContacts---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:InternalContacts---"
    And I click on advance filter of table id "---grantee_tableId:-:InternalContacts---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:InternalContacts---" for LWC
      | Full Name | contains | Grantee PO |
    Then I softly see value "Grantee PO" for title "Full Name" inside table "---grantee_tableId:-:InternalContacts---"
    And I click on top right button "Clear" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:InternalContacts---"
    And I perform quick search for "{SavedValue:Automation Runtime} Contact" in "---grantee_tableId:-:InternalContacts---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime} Contact" inside table
    Then I softly see "Contact View" opens in overLay window
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly see "Contact Information" page block displayed
    Then I softly see "Address Information" page block displayed
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly see field on modal "State" inside page block
    Then I softly see field on modal "Congressional District" inside page block
    Then I softly see field on modal "City" inside page block
    Then I softly see field on modal "Country" inside page block
    Then I softly see field on modal "County" inside page block
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field on modal "Zip Code" inside page block
    Then I softly see field on modal "Organization" inside page block
    Then I softly see link "{SavedValue:Organization}" inside Page block
    Then I see field "Organization" as "{SavedValue:Organization}" on modal
    And I click on hyperlink for modal containing value "{SavedValue:Organization}"
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "{SavedValue:Organization}" in the page details
    And I click on back arrow
    Then I softly see field on modal "Type" inside page block
    Then I see field "Type" as "{SavedValue:Type}" on modal
    Then I see field "Title" as "{SavedValue:Title}" on modal
    Then I see field "First Name" as "{SavedValue:FirstName}" on modal
    Then I see field "Last Name" as "{SavedValue:LastName}" on modal
    Then I see field "Phone" as "{SavedValue:Phone}" on modal
    Then I see field "Mobile Phone" as "{SavedValue:MobilePhone}" on modal
    Then I see field "Email" as "{SavedValue:Email}" on modal
    Then I see field "Address Line 1" as "{SavedValue:AddressLine1}" on modal
    Then I see field "Address Line 2" as "{SavedValue:AddressLine2}" on modal
    Then I see field "State" as "{SavedValue:State}" on modal
    Then I see field "Congressional District" as "{SavedValue:CongressionalDistrict}" on modal
    Then I see field "City" as "{SavedValue:City}" on modal
    Then I see field "Country" as "{SavedValue:Country}" on modal
    Then I see field "County" as "{SavedValue:County}" on modal
    Then I see field "4-Digit Zip Code Extension" as "{SavedValue:4DigitZipCodeExtension}" on modal
    Then I see field "Zip Code" as "{SavedValue:ZipCode}" on modal
    And I save the field labeled "Created By" as "CreatedBy" on modal
    And I save the field labeled "Created Date" as "CreatedDate" on modal
    And I save the field labeled "Last Modified By" as "LastModifiedBy" on modal
    And I save the field labeled "Last Modified Date" as "LastModifiedDate" on modal
    Then I see field "Created By" as "{SavedValue:CreatedBy}" on modal
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    Then I see field "Created Date" as "{SavedValue:CreatedDate}" on modal
    Then I see field "Last Modified By" as "{SavedValue:LastModifiedBy}" on modal
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I see field "Last Modified Date" as "{SavedValue:LastModifiedDate}" on modal
    Then I cannot see top right button "Edit" in page detail
    When I close "Contact View" modal by clicking the top right x button
    And I perform quick search for "{SavedValue:Automation Runtime} Contact" in "---grantee_tableId:-:InternalContacts---" panel
    Then I softly see value "{SavedValue:Automation Runtime} Contact" for title "Full Name" inside table "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"

    Examples:
      | userAuditor     |
      | GRANTEE AUDITOR |

  @463417 @ValidatePreAppwithPMprofileifinopportunitiespreapplicationrequiredselectNOthenonlyunabletocreatepreapplication
  Scenario: Validate PreApp with PM profile if in opportunities pre application required select NO then only unable to create pre application
    When I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{grantee_testData:AutomationPreApplicationSelectedNo}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{grantee_testData:AutomationPreApplicationSelectedNo}" inside table
    Then I softly cannot see top right button "Create Pre-Application" in page detail
    Then I softly can see top right button "Create Application" in page detail
    Then I softly see field "Pre-Application Required?" as "No"

  @463439 @463457 @ValidatePreAppwithPMProfilAlltabsandsectionformanuallead
  Scenario: Validate PreApp with PM Profile All tabs and section for manual lead
    When I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Application - All"
    And I perform quick search for "{grantee_testData:AutomationPreApplicationCreatedState}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{grantee_testData:AutomationPreApplicationCreatedState}" inside table
    Then I see the header is "Pre-Application" in the page details
    Then I see the sub-header is "{grantee_testData:AutomationPreApplicationCreatedState}" in the page details
    And I save the field labeled "EGMS ID" as "PreAppEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:PreAppEGMSID}"
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download As PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see link "{SavedValue:FundingOrganization}" inside Page block
    And I click on hyperlink containing value "{SavedValue:FundingOrganization}"
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "{SavedValue:FundingOrganization}" in the page details
    And I click on back arrow
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Setup" sub tab at view detail page
    Then I softly can see "Budget" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly see "Pre-Application Overview" page block displayed
    Then I softly see "Opportunity Overview" page block displayed
    Then I softly see "External Programs" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "Project Abstract" page block displayed
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly see "Program Number" in flex table header "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly see "Type" in flex table header "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly see "Is Primary Program" in flex table header "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I can see row level action button "Edit" against "Pratiksha Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I can see row level action button "View" against "Pratiksha Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I can see row level action button "Remove" against "Pratiksha Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    When I click on parallel lines menu bar with data target value "External Programs"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly see "Project Role" in flex table header "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly see "Name" in flex table header "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly see "Is Key Contact" in flex table header "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly see "Is User" in flex table header "---grantee_tableId:-:preApplicationContactTableId---"
    When I click on parallel lines menu bar with data target value "Contacts"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I navigate to "Setup" sub tab
    Then I softly see "Project Period" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I softly can see top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    Then I softly can see top right button "Create New Budget Period" in flex table with id "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    Then I softly see "Budget Period #" in flex table header "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    Then I softly see "Start Date" in flex table header "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    Then I softly see "End Date" in flex table header "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    When I click on parallel lines menu bar with data target value "Budget Period Details"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Overview" page block displayed
    Then I softly see "Budget Level Information" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I softly see "Budget Period #" in flex table header "---grantee_tableId:-:BudgetPeriodDetailsFromBudgetTab---"
    Then I softly see "Start Date" in flex table header "---grantee_tableId:-:BudgetPeriodDetailsFromBudgetTab---"
    Then I softly see "End Date" in flex table header "---grantee_tableId:-:BudgetPeriodDetailsFromBudgetTab---"
    When I click on parallel lines menu bar with data target value "Budget Period Details"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly see "Reviewer Name" in flex table header "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly see "Responsibility" in flex table header "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly see "Allow Record Editing" in flex table header "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:PreApplicationPeerReviewers---"
    When I click on parallel lines menu bar with data target value "Peer Reviewers"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:preResponsibiltiesTableId---"
    Then I softly see "Name" in flex table header "---grantee_tableId:-:preResponsibiltiesTableId---"
    Then I softly see "PreApplication" in flex table header "---grantee_tableId:-:preResponsibiltiesTableId---"
    When I click on parallel lines menu bar with data target value "Approvers"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Name" in flex table header "---grantee_tableId:-:preApplicationOwnerTableId---"
    Then I softly see "Responsibility" in flex table header "---grantee_tableId:-:preApplicationOwnerTableId---"
    When I click on parallel lines menu bar with data target value "Owner"
    Then I see option "Refresh" present in parallel dropdown
    When I navigate to "Files" sub tab
    Then I softly see "Pre-Application Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:preApplicationAddFilesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:preApplicationAddFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:preApplicationAddFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:preApplicationAddFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:preApplicationAddFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:preApplicationAddFilesTableId---"
    When I click on parallel lines menu bar with data target value "Pre-Application Files"
    Then I see option "Refresh" present in parallel dropdown
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationNotesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:preApplicationNotesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:preApplicationNotesTableId---"
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:preApplicationNotesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:preApplicationNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    When I click on parallel lines menu bar with data target value "Messages"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Quickview" sub tab at view detail page
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    #463457
    And I navigate to "Budget" sub tab
    Then I softly see field "Maintenance of Effort Required?" as "No"
    Then I softly cannot see field "Cost Sharing or Matching Requirement" inside page block
    Then I softly cannot see field "Required Match(%)" inside page block
    Then I softly cannot see field "Maximum Indirect Cost Rate" inside page block
    Then I softly cannot see field "Program Income Treatment Type" inside page block
    Then I softly see field "Are Indirect Costs Allowed?" as "No"
    Then I softly do not see "Program Income" page block displayed
    Then I softly do not see "Indirect Rates" page block displayed
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{grantee_testData:AutomationOpportunityEGMSID}"
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly see field "Is Match Required?" as "No"
    Then I softly cannot see field "Cost Sharing or Matching Requirement" inside page block
    Then I softly cannot see field "Required Match(%)" inside page block
    Then I softly cannot see field "Match Source" inside page block
    Then I softly cannot see field "Program Income Treatment Type" inside page block
    Then I softly cannot see field "Maximum Indirect Cost Rate" inside page block
    Then I softly cannot see field "Rate for Organization Use" inside page block
    Then I softly see field "Is Program Income Allowed?" as "No"
    Then I softly see field "Are Indirect Costs Allowed?" as "No"
    Then I softly see field "Is Leverage Allowed?" as "No"

  @463418 @463456 @ValidatePreAppwithPOprofileifinopportunitiespreapplicationrequiredselectYesthenonlyabletocreatepreapplication
  Scenario: Validate PreApp with PO profile if in opportunities pre application required select Yes then only able to create pre application
    When I login to "As a Grantee" app as "GRANTEE PO" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{grantee_testData:AutomationPreApplicationAllSettingYes}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{grantee_testData:AutomationPreApplicationAllSettingYes}" inside table
    Then I softly can see top right button "Create Pre-Application" in page detail
    Then I softly see field "Pre-Application Required?" as "Yes"
    And I click on "Create Pre-Application" in the page details
    Then I softly see fields "Title__c" is in edit mode
    #463456
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Application - All"
    And I perform quick search for "{grantee_testData:AutomationPreApplicationPoUserAllSettingYes}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{grantee_testData:AutomationPreApplicationPoUserAllSettingYes}" inside table
    And I navigate to "Budget" sub tab
    Then I softly see field "Cost Sharing or Match Requirement?" as "Cash and Non-Cash Match"
    Then I softly see field "Required Match (%)" as "10.00%"
    Then I softly see field "Maintenance of Effort Required?" as "Yes"
    Then I softly see field "Are Indirect Costs Allowed?" as "Yes"
    Then I softly see field "Maximum Indirect Cost Rate" as "10.00%"
    Then I softly see field "Program Income Treatment Type" as "Additive"
    Then I softly see "Program Income" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{grantee_testData:AutomationOpportunityPOUserEGMSID}"
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly see field "Is Match Required?" as "Yes"
    Then I softly see field "Cost Sharing or Matching Requirement" as "Cash and Non-Cash Match"
    Then I softly see field "Required Match(%)" as "10.00%"
    Then I softly see field "Match Source" as "External Source"
    Then I softly see field "Is Program Income Allowed?" as "Yes"
    Then I softly see field "Program Income Treatment Type" as "Additive"
    Then I softly see field "Maximum Indirect Cost Rate" as "10.00%"
    Then I softly see field "Rate for Organization Use" as "Federally approved indirect rate"
    Then I softly see field "Are Indirect Costs Allowed?" as "Yes"
    Then I softly see field "Is Leverage Allowed?" as "Yes"

  @462721 @470406 @482113 @482114 @ValidatetheflowofasPMuserisabletocreateandqualifythemanuallead
  Scenario Outline: Validate the flow of as PM/PO user is able to create and qualify the manual lead
    Given I login to "As a Grantee" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see "Create New Lead" opens in overLay window
    Then I softly see "General Information" page block displayed on modal
    Then I softly see field on modal "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field on modal "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside modal "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field on modal "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field on modal "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see "Eligibility" page block displayed on modal
    Then I softly see field on modal "Eligible Applicants" inside page block
    Then I softly see asterisk mark on "Eligible Applicants"
    Then I softly see "Additional Information" page block displayed on modal
    Then I softly see field on modal "Lead Description" inside page block
    Then I softly see asterisk mark on "Lead Description"
    Then I softly see "Financial Details" page block displayed on modal
    Then I softly see field on modal "Cost Sharing or Matching Requirement" inside page block
    Then I softly see asterisk mark on "Cost Sharing or Matching Requirement"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Opportunity Title is required to save.                    |
      | Opportunity Number is required to save.                   |
      | Application Due Date is required to save.                 |
      | Funding Organization is required to save.                 |
      | Eligible Applicants is required to save.                  |
      | Lead Description is required to save.                     |
      | Cost Sharing or Matching Requirement is required to save. |
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the header is "Lead" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Leads}" in the page details
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I navigate to "Overview" sub tab
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Leads}"
    Then I softly see field "Opportunity Number" as "{SavedValue:Automation Runtime Opp No}"
    Then I softly see field "Application Due Date" as "{Date:M/dd/yyyy::d+100}"
    Then I softly see field "Funding Organization" as "Department of Education"
    Then I softly see value "Individuals" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see value "For profit organizations other than small businesses" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see field "Lead Description" as "Automation Test"
    And I navigate to "Financials" sub tab
    Then I softly see field "Cost Sharing or Matching Requirement" as "Yes"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "General Information" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see asterisk mark on "Opportunity Category"
    Then I softly see field "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see asterisk mark on "Funding Instrument Type"
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see asterisk mark on "Category Of Funding Activity"
    Then I softly see field "Archive Date" inside page block
    Then I softly see asterisk mark on "Archive Date"
    Then I softly see field "Expected Number of Awards" inside page block
    Then I softly see field "Source" inside page block
    Then I softly see field "Version" inside page block
    Then I softly see "Related Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Eligibility Information" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Lead Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see "Qualified Agencies" page block displayed
    Then I softly see "System Information" page block displayed
    Then I can see top right button "Activate" in page detail
    Then I can see top right button "Edit" in page detail
    And I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    And I navigate to "Files" sub tab
    Then I softly see "Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Lead Files" flex table
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I navigate to "History" sub tab
    And I click on "Take Snapshot" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "2" seconds
    Then I see snapshot with name containing "SnapShot on" as name
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedLeadEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:QualifiedLeadEGMSID}"
    #470406
    And I click on "Edit" in the page details
    And I enter "Grantee_Qualifiedleads_Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I can see top right button "Convert to Opportunity" in page detail
    When I click on "Convert to Opportunity" in the page details
    Then I softly see field "Status" as "Draft"
    And I save the field labeled "EGMS ID" as "OpportunityEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:OpportunityEGMSID}"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see "Lead Information" page block displayed
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see "Additional Information" page block displayed
    Then I softly see "Financial Details" page block displayed
    Then I softly see "System Information" page block displayed
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see "Financial Overview" page block displayed
    Then I softly see "Certifications and Other" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    Examples:
      | User        |
      | GRANTEE PM  |
      | GRANTEE PO  |
      | GRANTEE EXE |

  @477695 @477697 @477702 @ValidatethedependentfieldforPMuserforsectionEvaluationunderevaluationtabonopportunity
  Scenario: Validate the dependent field for PM user for section "Evaluation" under evaluation tab on opportunity
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedLeadEGMSID"
    And I click on "Edit" in the page details
    And I enter "Grantee_Qualifiedleads_Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Convert to Opportunity" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Evaluation" sub tab
    And I enter value "Yes" into field "HaveWeReceivedAwardFromProgram__c"
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    And I enter value "No" into field "HaveWeReceivedAwardFromProgram__c"
    Then I softly see field "1b. If no, provide a brief description of the Proposal (i.e. the purpose of the program, funds needed to accomplish the objectives of the program, what will be the projected achievements according to the funds needed)." inside page block
    #477697
    And I enter value "No" into field "LeadAgencyAgreedUpon__c"
    Then I softly see field "8b. If no, what steps have been taken to determine the lead organization?" inside page block
    And I enter value "Yes" into field "LeadAgencyAgreedUpon__c"
    Then I softly cannot see field "8b. If no, what steps have been taken to determine the lead organization?" inside page block
    And I enter value "Yes" into field "CollaborationandWorkShare__c"
    Then I softly see field "9a. Please explain." inside page block
    And I enter value "No" into field "CollaborationandWorkShare__c"
    Then I softly cannot see field "9a. Please explain." inside page block
    #477702
    And I enter value "Yes" into field "MaintenanceEffortRequire__c"
    Then I softly see field "13a. If yes, describe the statutory maintenance of effort requirement." inside page block
    And I enter value "No" into field "MaintenanceEffortRequire__c"
    Then I softly cannot see field "13a. If yes, describe the statutory maintenance of effort requirement." inside page block
    And I enter value "Yes" into field "RequiredPassThroughToSubrecipients__c"
    Then I softly see field "14a. If yes, what is the percent of funding required to pass through to subrecipients." inside page block
    And I enter value "No" into field "RequiredPassThroughToSubrecipients__c"
    Then I softly cannot see field "14a. If yes, what is the percent of funding required to pass through to subrecipients." inside page block
    And I enter value "Yes" into field "LimitOnAdministrativeRate__c"
    Then I softly see field "16a. If yes, what percent is the administrative cost limit?" inside page block
    And I enter value "No" into field "LimitOnAdministrativeRate__c"
    Then I softly cannot see field "16a. If yes, what percent is the administrative cost limit?" inside page block

  @482115 @482116 @482117 @482118 @482331 @482332 @482334 @ValidateFOusershouldhaveviewaccessonlyonthequalifiedlead
  Scenario Outline: Validate FO user should have view access only on the qualified lead
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see "Create New Lead" opens in overLay window
    Then I softly see "General Information" page block displayed on modal
    Then I softly see field on modal "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field on modal "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside modal "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field on modal "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field on modal "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see "Eligibility" page block displayed on modal
    Then I softly see field on modal "Eligible Applicants" inside page block
    Then I softly see asterisk mark on "Eligible Applicants"
    Then I softly see "Additional Information" page block displayed on modal
    Then I softly see field on modal "Lead Description" inside page block
    Then I softly see asterisk mark on "Lead Description"
    Then I softly see "Financial Details" page block displayed on modal
    Then I softly see field on modal "Cost Sharing or Matching Requirement" inside page block
    Then I softly see asterisk mark on "Cost Sharing or Matching Requirement"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Opportunity Title is required to save.                    |
      | Opportunity Number is required to save.                   |
      | Application Due Date is required to save.                 |
      | Funding Organization is required to save.                 |
      | Eligible Applicants is required to save.                  |
      | Lead Description is required to save.                     |
      | Cost Sharing or Matching Requirement is required to save. |
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the header is "Lead" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Leads}" in the page details
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I navigate to "Overview" sub tab
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Leads}"
    Then I softly see field "Opportunity Number" as "{SavedValue:Automation Runtime Opp No}"
    Then I softly see field "Application Due Date" as "{Date:M/dd/yyyy::d+100}"
    Then I softly see field "Application Due Date" as "{Date:M/dd/yyyy::d+100}"
    Then I softly see field "Funding Organization" as "Department of Education"
    Then I softly see value "Individuals" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see value "For profit organizations other than small businesses" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see field "Lead Description" as "Automation Test"
    And I navigate to "Financials" sub tab
    Then I softly see field "Cost Sharing or Matching Requirement" as "Yes"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "General Information" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see asterisk mark on "Opportunity Category"
    Then I softly see field "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see asterisk mark on "Funding Instrument Type"
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see asterisk mark on "Category Of Funding Activity"
    Then I softly see field "Archive Date" inside page block
    Then I softly see asterisk mark on "Archive Date"
    Then I softly see field "Expected Number of Awards" inside page block
    Then I softly see field "Source" inside page block
    Then I softly see field "Version" inside page block
    Then I softly see "Related Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Eligibility Information" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Lead Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see "Qualified Agencies" page block displayed
    Then I softly see "System Information" page block displayed
    Then I can see top right button "Activate" in page detail
    Then I can see top right button "Edit" in page detail
    And I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    And I navigate to "Files" sub tab
    Then I softly see "Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Lead Files" flex table
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I navigate to "History" sub tab
    And I click on "Take Snapshot" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "2" seconds
    Then I see snapshot with name containing "SnapShot on" as name
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    #482331,482332,482334
    And I re-login to "As a Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    When I click on "View" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see field "State" as "Posted"
    Then I cannot see top right button "Qualify Lead" in page detail
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    When I click on "View" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see field "State" as "Posted"
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedEGMSID"
    And I re-login to "As a Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "<Toggles>"
    When I perform quick search for "{SavedValue:QualifiedEGMSID}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:QualifiedEGMSID}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    Then I cannot see top right button "Convert to Opportunity" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly see "Lead Information" page block displayed
    Then I softly see "Qualification Details" page block displayed
    Then I softly see "All Qualifications" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Qualifying Organization" inside page block
    Then I softly see field "Relevance" inside page block
    Then I softly see field "Impact" inside page block
    Then I softly see field "Justification" inside page block
    When I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    And I navigate to "Files" sub tab
    Then I softly see "Qualified Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:qualifiedLeadsAddFileTableId---"
    Then I <Validation> top right button "New" in flex table with id "---grantee_tableId:-:qualifiedLeadsNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed

    Examples:
      | User            | Validation        | Toggles                |
      | GRANTEE FO      | softly can see    | Qualified Leads - All  |
      | GRANTEE FD      | softly can see    | Qualified Leads - All  |
      | GRANTEE ADMIN   | softly can see    | Qualified Leads - Open |
      | GRANTEE AUDITOR | softly cannot see | Qualified Leads - All  |

  @483166 @483167 @483181 @ValidatePMusertheflowofNotyetqualifiedlead
  Scenario Outline: Validate PM user the flow of Not yet qualified lead
    Given I login to "As a Grantee" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see "Create New Lead" opens in overLay window
    Then I softly see "General Information" page block displayed on modal
    Then I softly see field on modal "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field on modal "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside modal "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field on modal "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field on modal "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see "Eligibility" page block displayed on modal
    Then I softly see field on modal "Eligible Applicants" inside page block
    Then I softly see asterisk mark on "Eligible Applicants"
    Then I softly see "Additional Information" page block displayed on modal
    Then I softly see field on modal "Lead Description" inside page block
    Then I softly see asterisk mark on "Lead Description"
    Then I softly see "Financial Details" page block displayed on modal
    Then I softly see field on modal "Cost Sharing or Matching Requirement" inside page block
    Then I softly see asterisk mark on "Cost Sharing or Matching Requirement"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Opportunity Title is required to save.                    |
      | Opportunity Number is required to save.                   |
      | Application Due Date is required to save.                 |
      | Funding Organization is required to save.                 |
      | Eligible Applicants is required to save.                  |
      | Lead Description is required to save.                     |
      | Cost Sharing or Matching Requirement is required to save. |
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the header is "Lead" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Leads}" in the page details
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I navigate to "Overview" sub tab
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Leads}"
    Then I softly see field "Opportunity Number" as "{SavedValue:Automation Runtime Opp No}"
    Then I softly see field "Application Due Date" as "{Date:M/dd/yyyy::d+100}"
    Then I softly see field "Funding Organization" as "Department of Education"
    Then I softly see value "Individuals" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see value "For profit organizations other than small businesses" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see field "Lead Description" as "Automation Test"
    And I navigate to "Financials" sub tab
    Then I softly see field "Cost Sharing or Matching Requirement" as "Yes"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "General Information" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see asterisk mark on "Opportunity Category"
    Then I softly see field "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see asterisk mark on "Funding Instrument Type"
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see asterisk mark on "Category Of Funding Activity"
    Then I softly see field "Archive Date" inside page block
    Then I softly see asterisk mark on "Archive Date"
    Then I softly see field "Expected Number of Awards" inside page block
    Then I softly see field "Source" inside page block
    Then I softly see field "Version" inside page block
    Then I softly see "Related Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Eligibility Information" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Lead Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see "Qualified Agencies" page block displayed
    Then I softly see "System Information" page block displayed
    Then I can see top right button "Activate" in page detail
    Then I can see top right button "Edit" in page detail
    And I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    And I navigate to "Files" sub tab
    Then I softly see "Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Lead Files" flex table
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I navigate to "History" sub tab
    And I click on "Take Snapshot" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "2" seconds
    Then I see snapshot with name containing "SnapShot on" as name
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    Examples:
      | User        |
      | GRANTEE PM  |
      | GRANTEE EXE |
      | GRANTEE PO  |

  @473231 @463455 @ValidateNotYetConvertedOpportunityManualPMusercancreatePreApplicationfromOpportunityifPreApplicationRequiredisselectedasYesonOpportunityrecord
  Scenario: Validate Not Yet Converted Opportunity Manual PM user can create Pre-Application from Opportunity if Pre-Application Required? is selected as Yes on Opportunity record
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedLeadEGMSID"
    And I click on "Edit" in the page details
    And I enter "Grantee_Qualifiedleads_Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Convert to Opportunity" in the page details
    And I click on "Edit" in the page details
    And I refresh the page
    And I wait for "3" seconds
    And I enter "Grantee_Opportunity_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I refresh the page
    And I click on "Edit" in the page details
    And I enter value "Yes" into field "MaintenanceEffortRequire__c"
    And I enter value "Automation Test" into field "StatutoryMaintenanceOfEffort__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:opportunityExternalProgramTableId---"
    When I click "Associate" after selection of "Automation Permanent NGO Program" in the table "---grantee_tableId:-:opportunityExternalProgramModalTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:opportunityApproverTableId---" by clicking "New" :
      | Name       | Opportunity |
      | Victor EXE | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | The Funding Opportunity has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Pre-Application" in page detail
    When I navigate to "Overview" sub tab
    Then I softly see field "Pre-Application Required?" as "Yes"
    And I click on "Create Pre-Application" in the page details
    Then I softly see fields "Title__c" is in edit mode
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I see the header is "Pre-Application" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Leads}" in the page details
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    #463455
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Application - All"
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:PreappEGMSID}" in flex table with id "---grantee_tableId:-:PreApplication---"
    Then I softly can see row level action button "View" against "{SavedValue:PreappEGMSID}" in flex table with id "---grantee_tableId:-:PreApplication---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:PreappEGMSID}" in flex table with id "---grantee_tableId:-:PreApplication---"
    When I click on "View" icon for "{SavedValue:PreappEGMSID}" inside table
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Submit For Approval" in page detail
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I cannot see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I cannot see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    And I navigate to "Setup" sub tab
    Then I softly cannot see top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    Then I softly cannot see top right button "Create New Budget Period" in flex table with id "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:preResponsibiltiesTableId---"
    When I navigate to "Files" sub tab
    Then I softly see "Pre-Application Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:preApplicationAddFilesTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed

  @473233 @ValidateNotYetConvertedOpportunityManualEXEusercannotcreateApplicationfromOpportunityifPreApplicationRequiredisselectedasNoonOpportunityrecord
  Scenario: Validate Not Yet Converted Opportunity (Manual) EXE user cannot create Application from Opportunity if Pre-Application Required? is selected as No on Opportunity record
    Given I login to "As a Grantee" app as "GRANTEE EXE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedLeadEGMSID"
    And I click on "Edit" in the page details
    And I enter "Grantee_Qualifiedleads_Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Convert to Opportunity" in the page details
    And I click on "Edit" in the page details
    And I refresh the page
    And I wait for "3" seconds
    And I enter "Grantee_Opp_PreAppNo_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I refresh the page
    And I click on "Edit" in the page details
    And I enter value "Yes" into field "MaintenanceEffortRequire__c"
    And I enter value "Automation Test" into field "StatutoryMaintenanceOfEffort__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:opportunityExternalProgramTableId---"
    When I click "Associate" after selection of "Automation Permanent NGO Program" in the table "---grantee_tableId:-:opportunityExternalProgramModalTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:opportunityApproverTableId---" by clicking "New" :
      | Name     | Opportunity |
      | Sarah PM | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | The Funding Opportunity has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Application" in page detail
    When I navigate to "Overview" sub tab
    Then I softly see field "Pre-Application Required?" as "No"

  @463442 @ValidatePreAppwithPMprofileabletoRejectwithmultipleapproverableReject
  Scenario: Validate PreApp with PM profile ,Able to Reject with multiple approver able Reject
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedLeadEGMSID"
    And I click on "Edit" in the page details
    And I enter "Grantee_Qualifiedleads_Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Convert to Opportunity" in the page details
    And I click on "Edit" in the page details
    And I refresh the page
    And I wait for "3" seconds
    And I enter "Grantee_Opp_PreApp_NonContruct" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I refresh the page
    And I click on "Edit" in the page details
    And I enter value "Yes" into field "MaintenanceEffortRequire__c"
    And I enter value "Automation Test" into field "StatutoryMaintenanceOfEffort__c"
    And I enter value "No" into field "LimitOnAdministrativeRate__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:opportunityExternalProgramTableId---"
    When I click "Associate" after selection of "Automation Permanent NGO Program" in the table "---grantee_tableId:-:opportunityExternalProgramModalTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:opportunityApproverTableId---" by clicking "New" :
      | Name       | Opportunity |
      | Victor EXE | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | The Funding Opportunity has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Pre-Application" in page detail
    When I navigate to "Overview" sub tab
    Then I softly see field "Pre-Application Required?" as "Yes"
    And I click on "Create Pre-Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:preAppAssociateContactTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:preApplicationContactTableId---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role                                   |
      | Sarah PM | Checked        | Project Director/Principal Investigator(PI/PD) |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:PreApplicationAssociateBP---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:PreApplicationAssociateFocusArea---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---" by clicking "Edit" :
      | Category Name | Award Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000         | 500        | 500            | 500            |
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description | Due Date | Allow Record Editing |
      | David FO      | Program Reviewer | Test        | 5        | No                   |
    When I enter the following values into flex table with id "---grantee_tableId:-:preResponsibiltiesTableId---" by clicking "New" :
      | Name     | PreApplication |
      | David FO | Step 1         |
    When I enter the following values into flex table with id "---grantee_tableId:-:preResponsibiltiesTableId---" by clicking "New" :
      | Name       | PreApplication |
      | Victor EXE | Step 2         |
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:preApplicationAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Letter of Intent" from computer
    When I click modal button "Close"
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Pre-Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Reject" in the approval decision
    Then I softly see status in Progress-bar is "Rejected" and is "Red"

  @463441 @ValidatePreAppwithPMprofileabletoaproverwithsingleapprover
  Scenario: Validate PreApp with PM profile ,Able to aprover with single approver
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_Creation_Cost_No" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedLeadEGMSID"
    And I click on "Edit" in the page details
    And I enter "Grantee_Qualifiedleads_Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Convert to Opportunity" in the page details
    And I click on "Edit" in the page details
    And I refresh the page
    And I wait for "3" seconds
    And I enter "GranteePreAppNonContructSettNo" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I refresh the page
    And I click on "Edit" in the page details
    And I enter value "Yes" into field "MaintenanceEffortRequire__c"
    And I enter value "Automation Test" into field "StatutoryMaintenanceOfEffort__c"
    And I enter value "No" into field "LimitOnAdministrativeRate__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:opportunityExternalProgramTableId---"
    When I click "Associate" after selection of "Automation Permanent NGO Program" in the table "---grantee_tableId:-:opportunityExternalProgramModalTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:opportunityApproverTableId---" by clicking "New" :
      | Name       | Opportunity |
      | Victor EXE | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | The Funding Opportunity has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Pre-Application" in page detail
    When I navigate to "Overview" sub tab
    Then I softly see field "Pre-Application Required?" as "Yes"
    And I click on "Create Pre-Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:preAppAssociateContactTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:preApplicationContactTableId---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role                                   |
      | Sarah PM | Checked        | Project Director/Principal Investigator(PI/PD) |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:PreApplicationAssociateBP---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:PreApplicationAssociateFocusArea---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---" by clicking "Edit" :
      | Category Name | Award Budget |
      | Construction  | 5000         |
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:preResponsibiltiesTableId---" by clicking "New" :
      | Name     | PreApplication |
      | David FO | Step 1         |
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:preApplicationAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Letter of Intent" from computer
    When I click modal button "Close"
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Pre-Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "Victor EXE" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I "Send to Owner" in the approval decision
    And I wait for "5" seconds
    Then I softly see field "Status" as "Created"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Application - All"
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:PreappEGMSID}" inside table
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"

  @463559 @ValidateOpportunitiesNotconvertedmanualDavidFOuserReviewerNocanabletosubmitReview
  Scenario: Validate Opportunities Not converted manual David FO user Reviewer No can able to submit Review
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedLeadEGMSID"
    And I click on "Edit" in the page details
    And I enter "Grantee_Qualifiedleads_Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Convert to Opportunity" in the page details
    And I click on "Edit" in the page details
    And I refresh the page
    And I wait for "3" seconds
    And I enter "Grantee_Opportunity_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I refresh the page
    And I click on "Edit" in the page details
    And I enter value "Yes" into field "MaintenanceEffortRequire__c"
    And I enter value "Automation Test" into field "StatutoryMaintenanceOfEffort__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" by clicking "New" :
      | Reviewer Name      | Role             | Description | Due Date | Allow Record Editing |
      | Danielle FD Garcia | Program Reviewer | Test        | 5        | Yes                  |
    When I enter the following values into flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" by clicking "New" :
      | Reviewer Name | Role            | Description | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Test        | 5        | No                   |
    When I enter the following values into flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" by clicking "New" :
      | Reviewer Name | Role            | Description | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Test        | 5        | No                   |
    Then I softly can see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly can see row level action button "Send for Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly can see row level action button "Delete" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly can see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly can see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly can see row level action button "Edit" against "Grantee PO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly can see row level action button "Send for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly can see row level action button "Delete" against "Grantee PO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I click on "Delete" icon for "Grantee PO" inside table with table id "---grantee_tableId:-:OpportunityPeerReviewers---" without processing
    Then I softly see confirmation box with body "Are you sure you want to delete?" is displayed
    When I click modal button "OK"
    And I wait for "3" seconds
    Then I softly do not see value "Grantee PO" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I click on "Send for Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I pause execution for "3" seconds
    Then I softly see value "Sent for Review" for title "Status" against the value "Danielle FD Garcia" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly see value "Sent for Review" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:opportunityEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Rating is required to save.   |
      | Comments is required to save. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"

  @463432 @ValidatePreAppWithPMprofileabletoaddpeerreviewerwithAllowrecordEditingNO
  Scenario: Validate PreApp With PM profile Able to add peer reviewer with Allow record Editing NO
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_Creation_Cost_No" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedLeadEGMSID"
    And I click on "Edit" in the page details
    And I enter "Grantee_Qualifiedleads_Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Convert to Opportunity" in the page details
    And I click on "Edit" in the page details
    And I refresh the page
    And I wait for "3" seconds
    And I enter "GranteePreAppNonContructSettNo" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I refresh the page
    And I click on "Edit" in the page details
    And I enter value "Yes" into field "MaintenanceEffortRequire__c"
    And I enter value "Automation Test" into field "StatutoryMaintenanceOfEffort__c"
    And I enter value "No" into field "LimitOnAdministrativeRate__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:opportunityExternalProgramTableId---"
    When I click "Associate" after selection of "Automation Permanent NGO Program" in the table "---grantee_tableId:-:opportunityExternalProgramModalTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:opportunityApproverTableId---" by clicking "New" :
      | Name       | Opportunity |
      | Victor EXE | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | The Funding Opportunity has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Pre-Application" in page detail
    When I navigate to "Overview" sub tab
    Then I softly see field "Pre-Application Required?" as "Yes"
    And I click on "Create Pre-Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---" by clicking "New" :
      | Reviewer Name      | Responsibility   | Description | Due Date | Allow Record Editing |
      | Danielle FD Garcia | Program Reviewer | Test        | 5        | No                   |
    Then I softly can see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly can see row level action button "Send for Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly can see row level action button "Delete" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly do not see value "{SavedValue:PreappEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Application - All"
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:PreappEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---" without waiting for record
    And I pause execution for "3" seconds
    Then I softly see value "Sent for Review" for title "Status" against the value "Danielle FD Garcia" inside table "---grantee_tableId:-:PreApplicationPeerReviewers---"
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:PreappEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly can see row level action button "Enter Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    When I click on "Enter Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Rating is required to save.   |
      | Comments is required to save. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    Then I can softly see modal button "Submit Review"
    Then I can softly see modal button "Edit"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "Danielle FD Garcia" inside table "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Application - All"
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:PreappEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:PreApplicationPeerReviewers---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly see status in Progress-bar is "Reviewed" and is "dark blue"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly cannot see row level action button "Delete" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly cannot see row level action button "Send for Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    And I delete the file in download folder
    When I click on parallel lines menu bar with data target value "Peer Reviewers"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on parallel lines menu bar with data target value "Peer Reviewers"
    And I select "Refresh" from parallel lines dropdown of "Peer Reviewers"
    Then I see table is refreshing
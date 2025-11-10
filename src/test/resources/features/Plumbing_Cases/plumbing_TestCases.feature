@plumbingCases @grantor-regression
Feature: Validate all scenarios for Plumbing Cases

  @545520 @ValidateEXEusercreationofanewFundingSourcefromFinancialtabonceusernavigatetoactiveGranteegrants @debug
  Scenario: Validate EXE user creation of a new Funding Source from Financial tab once user navigate to active Grantee grants
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-Victor EXE user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    And I navigate to "Financials" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    And I enter in modal value "Automation Runtime External Source" into field "Title__c"
    Then I softly see value "External" selected as default for the dropdown field "Type__c"
    When I hovering mouse on help text icon inside modal "Funding Source Type"
    Then I softly see with quotes "Select "External" only if Grantee is providing funds to Grantor to carry out grants." shown as help text
    Then I softly see value "{SavedValue:GrantEGMSID}" for the edit mode field "Grant__c"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I can see top right button "Edit" in page detail
    And I save the field labeled "EGMS ID" as "fundingSourceID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I navigate to "Financials" sub tab
    Then I softly see value "{SavedValue:fundingSourceID}" for title "EGMS ID" inside table "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "External Funding Sources - Draft"
    When I perform quick search for "{SavedValue:fundingSourceID}" in "---grantee_tableId:-:fundingSourceGrantExternalTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:fundingSourceGrantExternalTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:fundingSourceGrantExternalTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:fundingSourceGrantExternalTableId---"
    And I click on "View" icon for "{SavedValue:fundingSourceID}" inside flex table with id "---grantee_tableId:-:fundingSourceGrantExternalTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter in modal value "{SavedValue:PPST}" into field "StartDate__c"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click on hyperlink containing value "{SavedValue:fundingSourceID}"
    And I wait for "2" seconds
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I navigate to "Financials" sub tab
    Then I softly see value "{SavedValue:fundingSourceID}" for title "EGMS ID" inside table "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"

  @545526 @ValidateAdminuserbelowvalidationonclickofsavebuttonwhenusereditappropriationamountnotfollowtheappropriateconditionwhenFundingAccountisincreatedstate
  Scenario: Validate Admin user below validation on click of save button when user edit appropriation amount & not follow the appropriate condition when Funding Account is in created state
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-DEMO ADMIN user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Financials" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    And I enter in modal value "Automation Runtime External Source" into field "Title__c"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "fundingSourceID"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter in modal value "9000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Total of appropriation amount cannot be less than the Award Amount to Date on Grant. |
@plumbingCases @grantor-regression
Feature: Validate all scenarios for Plumbing Cases

  @545520 @ValidateEXEusercreationofanewFundingSourcefromFinancialtabonceusernavigatetoactiveGranteegrants @Plumbing_P1
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
    When I enter value "{SavedValue:PPST}" into field "StartDate__c"
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

  @545526 @ValidateAdminuserbelowvalidationonclickofsavebuttonwhenusereditappropriationamountnotfollowtheappropriateconditionwhenFundingAccountisincreatedstate @Plumbing_P1
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
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "fundingSourceID"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter in modal value "4000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Total of appropriation amount cannot be less than the Award Amount to Date on Grant. |

  @545529 @ValidateEXEusercanabletocreateactivateFundingSourceFundingAccountFromactivegrantlayout @Plumbing_P1
  Scenario: Validate EXE user can able to create & activate Funding Source & Funding Account From active grant layout
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
    Then I softly see value "{SavedValue:GrantEGMSID}" for the edit mode field "Grant__c"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "fundingSourceID"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter in modal value "60000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "{SavedValue:PPST}" into field "StartDate__c"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click on hyperlink containing value "{SavedValue:fundingSourceID}"
    And I wait for "2" seconds
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I navigate to "Financials" sub tab
    Then I softly see value "{SavedValue:fundingSourceID}" for title "EGMS ID" inside table "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly see value "$60,000.00" for title "Appropriation Amount" against the value "{SavedValue:fundingSourceID}" inside table "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly see value "Active" for title "Status" against the value "{SavedValue:fundingSourceID}" inside table "---grantee_tableId:-:grantExternalSourceTableId---"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I wait for "2" seconds
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "External Funding Sources - All"
    When I perform quick search for "{SavedValue:fundingSourceID}" in "---grantee_tableId:-:fundingSourceGrantExternalTableId---" panel
    Then I softly see value "$60,000.00" for title "Appropriation Amount" against the value "{SavedValue:fundingSourceID}" inside table "---grantee_tableId:-:fundingSourceGrantExternalTableId---"
    Then I softly see value "Active" for title "Status" against the value "{SavedValue:fundingSourceID}" inside table "---grantee_tableId:-:fundingSourceGrantExternalTableId---"

  @545532 @ValidatePOusercanabletoseebelowvalidationonupdatedAwardAmounttoDatefieldongranteeGrants @Plumbing_P1
  Scenario: Validate PO user can able to see below validation on updated Award Amount to Date field on grantee Grants
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-Grantee PO user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I wait for "2" seconds
    And I "Approved" of type "Funding Change" amendment request for title "{SavedValue:Automation Runtime Award}" with properties "FUNDING_CHANGE_PO_OWNER-Grantee PO user"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I navigate to "Financials" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    And I enter in modal value "Automation Runtime External Source" into field "Title__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "fundingSourceID"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter in modal value "6000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Total of appropriation amount cannot be less than the Award Amount to Date on Grant. |

  @545539 @ValidatePMusercanabletocreateFundingSourceFundingAccountonclickofFundingSourcelinkfromplanningphase
  Scenario: Validate PM user can able to create Funding Source & Funding Account on click of Funding Source link from planning phase
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Start Date" as "SDATE"
    And I save the field labeled "End Date" as "EDATE"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter in modal value "10000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    When I enter value "{SavedValue:SDATE}" into field "StartDate__c"
    When I enter value "{SavedValue:EDATE}" into field "EndDate__c"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I navigate to "Overview" sub tab
    Then I softly can see row level action button "View" against "Active" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    Then I softly can see row level action button "Edit" against "Active" in flex table with id "---fundingsource:-:fundingAccountTableId---"

  @545533 @ValidatePMusercanabletocreateAwardongrantorsidebyusingFundingSourceFundingAccountcreatedatgranteesidecreateReimpaymentrequestonsameawardcheckdollarvaluesonbelowfieldsavailableonFundingAccount
  Scenario: Validate PM user can able to create Award on grantor side by using Funding Source Funding Account created at grantee side  & create Reim payment request on same award & check dollar values on below fields available on Funding Account
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE PM" user
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
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "fundingSourceID"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter in modal value "5000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "{SavedValue:PPST}" into field "StartDate__c"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I re-login to "Grantor" app as "GRANTEE PM" user on "INTERNAL" portal
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "PLUMBING_CASE"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PLUMBING_CASE"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}" for Plumbing Cases
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" for plumbing cases
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
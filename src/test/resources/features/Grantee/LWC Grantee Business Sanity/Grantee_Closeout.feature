@GranteeCloseout
Feature: Validate all scenarios for closeout

  @456081 @ValidateCloseoutAdminPOFDFOListViewFunctionalitythelistviewfunctionalityverifythesession @GRegression2 @P4_Grantee @ADMIN_Grantee
  Scenario: Validate Closeout Admin PO FD FO List View Functionality the list view functionality & verify the session
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    And I navigate to "Closeout" tab
    And I wait for "2" seconds
    Then I softly see default toggle as "Project Period Closeout - My Records" for table "---grantee_tableId:-:phaseCloseoutTableId---"
    And I click toggle button to select "Project Period Closeout - Draft"
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I navigate to "Closeout" tab
    Then I softly see default toggle as "Project Period Closeout - Draft" for table "---grantee_tableId:-:phaseCloseoutTableId---"

  @456081_1 @ValidateCloseoutAdminPOFDFOListViewFunctionalitythelistviewfunctionalityverifythesession @GRegression2 @P4_Grantee @PO_Grantee
  Scenario: Validate Closeout Admin PO FD FO List View Functionality the list view functionality & verify the session
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Closeout" tab
    And I wait for "2" seconds
    Then I softly see default toggle as "Project Period Closeout - My Records" for table "---grantee_tableId:-:phaseCloseoutTableId---"
    And I click toggle button to select "Project Period Closeout - Draft"
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I navigate to "Closeout" tab
    Then I softly see default toggle as "Project Period Closeout - Draft" for table "---grantee_tableId:-:phaseCloseoutTableId---"

  @456081_2 @ValidateCloseoutAdminPOFDFOListViewFunctionalitythelistviewfunctionalityverifythesession @GRegression2 @P4_Grantee @FD_Grantee
  Scenario: Validate Closeout Admin PO FD FO List View Functionality the list view functionality & verify the session
    Given I login to "As a Grantee" app as "GRANTEE FD" user
    And I navigate to "Closeout" tab
    And I wait for "2" seconds
    Then I softly see default toggle as "Project Period Closeout - My Records" for table "---grantee_tableId:-:phaseCloseoutTableId---"
    And I click toggle button to select "Project Period Closeout - Draft"
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I navigate to "Closeout" tab
    Then I softly see default toggle as "Project Period Closeout - Draft" for table "---grantee_tableId:-:phaseCloseoutTableId---"

  @456081_3 @ValidateCloseoutAdminPOFDFOListViewFunctionalitythelistviewfunctionalityverifythesession @GRegression2 @P4_Grantee @FO_Grantee
  Scenario: Validate Closeout Admin PO FD FO List View Functionality the list view functionality & verify the session
    Given I login to "As a Grantee" app as "GRANTEE FD" user
    And I navigate to "Closeout" tab
    Then I softly see default toggle as "Project Period Closeout - My Records" for table "---grantee_tableId:-:phaseCloseoutTableId---"
    And I click toggle button to select "Project Period Closeout - Draft"
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I navigate to "Closeout" tab
    Then I softly see default toggle as "Project Period Closeout - Draft" for table "---grantee_tableId:-:phaseCloseoutTableId---"

  @484052 @ValidateFromAppGPCloseoutwithPOProfileIfCloseoutisinCreatedstatetheabletoseetheaccessofsection
  Scenario: Validate From App GP Closeout with PO Profile If Closeout is in Created state then able to see the access of section
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default-Grantee PO user"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Closeout" sub tab
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
    When I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly can see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Override" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    When I click on parallel lines menu bar with data target value "Peer Reviewers"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    And I navigate to "Files" sub tab
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:closeoutAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Supporting Documents" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "View" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes |
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Override" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    When I click on parallel lines menu bar with data target value "Peer Reviewers"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    And I navigate to "Files" sub tab
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "View" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record1" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record1" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
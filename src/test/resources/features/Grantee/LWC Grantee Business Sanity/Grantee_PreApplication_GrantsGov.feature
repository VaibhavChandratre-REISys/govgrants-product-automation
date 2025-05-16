@GranteePreApplicationsGrantsGov
Feature: Validate all scenarios for Pre-Applications Grants Gov

  @463419 @ValidatePreAppwithPOprofilePreapplicationpagelayoutofgrantsgovlead @GRegression3
  Scenario: Validate PreApp with PO profile Pre application page layout of grants gov lead
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberPM1User}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-Grantee PO user"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "PRE_APPLICATION_YES"
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I softly can see top right button "Create Pre-Application" in page detail
    When I navigate to "Overview" sub tab
    Then I softly see field "Pre-Application Required?" as "Yes"
    And I click on "Create Pre-Application" in the page details
    Then I softly see fields "Title__c" is in edit mode
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I save the field labeled "Pre-Application Title" as "PreApplicationTitle"
    When I click on "Edit" in the page details
    And I clear the value from field "Title__c"
    And I navigate to "Budget" sub tab
    And I enter value "--None--" into field "ProgramIncomeType__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Pre-Application Title is required in the Overview tab under the Pre-Application Overview section. |
      | To Save, Program Income Treatment Type is required in the Budget tab under the Budget Overview section.    |
    And I enter value "Additive" into field "ProgramIncomeType__c"
    And I navigate to "Overview" sub tab
    And I enter value "{SavedValue:PreApplicationTitle}" into field "Title__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Responsibilities - At least one approver is required.                       |
      | Overview Tab - Associate at least one Contact with Pre-Application.         |
      | Overview Tab - Provide a value for Project Abstract.                        |
      | Overview Tab - Provide a value for UEI.                                     |
      | Overview Tab - Provide a value for Project Director/Principal Investigator. |
    When I click on "Edit" in the page details
    And I enter "Grantee_Edition_DetailLineItems" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly see "Collapse" button for header
    Then I softly see "Collapse" button for page
    Then I softly see "Resize" button for page
    And I navigate to "Applications" tab
    When I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:preAppEGMSID}" inside table
    Then I softly see "Navigator" button display on footer
    And I click on bottom button "Navigator" in page detail
    Then I see "Pending Tasks" inside "My Tasks" is displayed
    Then I see "Completed Tasks" inside "My Tasks" is displayed
    Then I see "Pre-Applications" inside "Applications" is displayed
    Then I see "Applications" inside "Applications" is displayed
    And I click on bottom button "Navigator" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Setup" sub tab at view detail page
    Then I softly can see "Budget" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:PreApplicationAssociateBP---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:PreApplicationAssociateFocusArea---"
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    And I wait for "5" seconds
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I close "Budget Category Line Item" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:preApplicationProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Details |
      | Automation Permanent Focus Area | 1000                         | Automation Test        |
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationIndirectRateTableId---" by clicking "New" :
      | Title | Date From | Date To | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15        | 30      | 10                             | Final                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | Victor EXE    | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "Victor EXE" inside flex table with id "---grantee_tableId:-:preApplicationPeerReviewTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:preAppEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:preAppEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "Victor EXE" inside flex table with id "---grantee_tableId:-:preApplicationPeerReviewTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "Victor EXE" inside table "---grantee_tableId:-:preApplicationPeerReviewTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:preAppEGMSID}" inside table
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:preAppAssociateContactTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:preApplicationContactTableId---" by clicking "Edit" :
      | Name       | Is Key Contact | Project Role                                   |
      | Victor EXE | Checked        | Project Director/Principal Investigator(PI/PD) |
    When I navigate to "Responsibilities" sub tab
    And I refresh the page
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:preResponsibiltiesTableId---" by clicking "New" :
      | Name     | Pre-Application |
      | David FO | Step 1          |
    When I enter the following values into flex table with id "---grantee_tableId:-:preResponsibiltiesTableId---" by clicking "New" :
      | Name       | Pre-Application |
      | Victor EXE | Step 2          |
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
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:PreappEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field          |
      | 0     | SubmittedOn__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value    | Field       |
      | Accepted | Decision__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    Then I softly can see top right button "Create Application" in page detail
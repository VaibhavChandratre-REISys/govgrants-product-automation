@GranteeSanityBusinessFlowNew
Feature: Sanity scenarios New

  @463446 @ValidatePreAppwithPOprofileusingtherecorddecisionabletoaccept
  Scenario: Validate PreApp with PO profile ,using the record decision able to accept
    Given I login to "As a Grantee" app as "GRANTEE PO" user
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
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
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
    And I enter "Grantee_Edition_DetailLineItems" values from "PreApplication_Field_Values.xlsx"
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
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I close "Budget Category Line Item" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
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
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Application - All"
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

  @463447 @ValidatePreAppwithPOprofileusingtherecorddecisionabletoselectnotaccept
  Scenario: Validate PreApp with PO profile using the record decision able to select not accept
    Given I login to "As a Grantee" app as "GRANTEE PO" user
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
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
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
    And I enter "Grantee_Edition_DetailLineItems" values from "PreApplication_Field_Values.xlsx"
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
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I close "Budget Category Line Item" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
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
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Application - All"
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
      | Value        | Field       |
      | Not Accepted | Decision__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Not Accepted"
    Then I see status in Progress-bar is "Not Accepted" and is "Red"
    Then I softly cannot see top right button "Create Application" in page detail
    When I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityConvertedToApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Pre-Application" in page detail

  @482343 @482351 @482352 @482356 @482359 @482361 @482363 @482368 @482400 @ValidatePMUsertheoverviewtabofaward
  Scenario: Validate PM User the overview tab of award
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
    And I enter "Grantee_Opp_PreAppNo_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
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
    Then I softly can see top right button "Create Application" in page detail
    And I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values - backup.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:ContactModalTableIdApplication---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ContactTableIdApplication---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role                                   |
      | Sarah PM | Checked        | Project Director/Principal Investigator(PI/PD) |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:ApplicationBudgetPeriodModalTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:ApplicationSelectFocusAreaModalTableId---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I close "Add Line Item Details" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grantor" in page detail
    When I click on "Submit To Grantor" in the page details
    When I enter values into fields
      | Value | Field          |
      | 0     | SubmittedOn__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value           | Field                |
      | Awarded         | Decision__c          |
      | Automation Test | RejectionComments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Awarded"
    Then I can see top right button "Create Award" in page detail
    When I click on "Create Award" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I see the header is "Award" in the page details
    Then I softly see field "Award Title" inside page block
    Then I softly see asterisk mark on "Award Title"
    Then I softly see field "Grant EGMS ID" inside page block
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    Then I softly see link "{SavedValue:GrantEGMSID}" inside Page block
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    Then I see the header is "Grant" in the page details
    And I click on back arrow
    Then I softly see field "Amendment Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Amendment Number"
    Then I softly see "Amendment number provided in NOA Document. Field should allow only numbers upto 4 digits" shown as help text
    When I click on "Edit" in the page details
    And I enter value "10" into field "AwardIssueDate__c"
    And I enter value "Test" into field "PaymentSystem__c"
    And I enter value "123" into field "CongressionalDistrictName__c"
    And I enter value "12345" into field "VersionNumber__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Amendment Number: value outside of valid range on numeric field |
    Then I softly see field "Award Issue Date" inside page block
    Then I softly see asterisk mark on "Award Issue Date"
    Then I softly see field "Award Type" inside page block
    Then I softly see field "Award Type" as "Initial"
    Then I softly see field "Version Number" inside page block
    Then I softly see field "Version Number" as "1"
    When I hovering mouse on help text icon inside page block detail "Version Number"
    Then I softly see "System generated number used to track changes to the award" shown as help text
    Then I softly see field " Funding Organization " inside page block
    And I save the field labeled " Funding Organization " as "FundingOrganization "
    Then I softly see link "{SavedValue:FundingOrganization}" inside Page block
    And I click on hyperlink containing value "{SavedValue:FundingOrganization}"
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "{SavedValue:FundingOrganization}" in the page details
    And I click on back arrow
    Then I softly see field " Internal Organization " inside page block
    And I save the field labeled " Internal Organization " as "InternalOrganization"
    Then I softly see link "{SavedValue:InternalOrganization}" inside Page block
    And I click on hyperlink containing value "{SavedValue:InternalOrganization}"
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "{SavedValue:InternalOrganization}" in the page details
    And I click on back arrow
    Then I softly see field "Maintenance Of Effort Amount" inside page block
    Then I softly see field "Maintenance of Effort Statutory Reference" inside page block
    When I hovering mouse on help text icon inside page block detail "Maintenance of Effort Statutory Reference"
    Then I softly see "URL of MOE" shown as help text
    Then I softly see field "Terms and Conditions Link" inside page block
    When I hovering mouse on help text icon inside page block detail "Terms and Conditions Link"
    Then I softly see "Enter link to award terms and conditions as provided in award letter" shown as help text
    Then I softly see field "Separate Attachment for Terms and Conditions?" inside page block
    When I hovering mouse on help text icon inside page block detail "Separate Attachment for Terms and Conditions?"
    Then I softly see "Terms & Conditions must be uploaded in the Files section." shown as help text
    Then I softly see field "Funder Payment System" inside page block
    When I hovering mouse on help text icon inside page block detail "Funder Payment System"
    Then I softly see "The federal payment system providing the funds for the award." shown as help text
    Then I softly see field "Funder Payment System Sub-Account Number" inside page block
    And I enter value "1234" into field "VersionNumber__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #482351
    Then I softly see "External Programs" page block displayed
    Then I softly see value "Automation Permanent NGO Program" for title "Title" inside table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see "Program Number" in flex table header "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see "Type" in flex table header "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see "Is Primary Program" in flex table header "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click on "Remove" icon for "Automation Permanent NGO Program" inside table with table id "---grantee_tableId:-:awardExternalProgranTableId---" without processing
    Then I softly see confirmation box with body "Are you sure, you want to remove the associated program?" is displayed
    When I click modal button "OK"
    Then I softly see the following messages in the page details :
      | Record removed successfully. |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    Then I softly see the following messages in the page details :
      | No records are selected. |
    When I click "Associate" after selection of "Automation Permanent NGO Program" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Programs associated successfully. |
    When I click modal button "Close"
    And I wait for "3" seconds
    When I click on parallel lines menu bar with data target value "External Programs"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "External Programs"
    Then I see table is refreshing
    When I click on "Program Number" column header inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see sort order "Descending" for column "Program Number" inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click on "Program Number" column header inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see sort order "Ascending" for column "Program Number" inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click on "Type" column header inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see sort order "Ascending" for column "Type" inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click on "Type" column header inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see sort order "Descending" for column "Type" inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click on "Is Primary Program" column header inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see sort order "Ascending" for column "Is Primary Program" inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click on "Is Primary Program" column header inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see sort order "Descending" for column "Is Primary Program" inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    #482352
    Then I softly see "Contacts" page block displayed
    Then I softly see value "Sarah PM" for title "Name" inside table "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Project Role" in flex table header "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Name" in flex table header "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Is Key Contact" in flex table header "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Is User" in flex table header "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "View" against "Sarah PM" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name     | Is Key Contact |
      | Sarah PM | UnChecked      |
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    Then I see the header is "Grant" in the page details
    And I save the field labeled "Application Number" as "ApplicationNumber"
    And I click on hyperlink containing value "{SavedValue:ApplicationNumber}"
    When I navigate to "Overview" sub tab
    Then I softly see "Check" symbol against the value "Sarah PM" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    And I click on back arrow
    And I wait for "3" seconds
    And I click on back arrow
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Select at least one record. |
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Contacts added successfully. |
    When I click modal button "Close"
    And I wait for "3" seconds
    Then I softly see value "Victor EXE" for title "Name" inside table "---grantee_tableId:-:awardContactTableId---"
    When I click on parallel lines menu bar with data target value "Contacts"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Contacts"
    Then I see table is refreshing
    When I click on "Project Role" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Ascending" for column "Project Role" inside table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on "Project Role" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Descending" for column "Project Role" inside table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on "Name" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Ascending" for column "Name" inside table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on "Name" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Descending" for column "Name" inside table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on "Email" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Ascending" for column "Email" inside table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on "Email" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Descending" for column "Email" inside table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on "Is Key Contact" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Ascending" for column "Is Key Contact" inside table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on "Is Key Contact" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Descending" for column "Is Key Contact" inside table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on "Is User" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Ascending" for column "Is User" inside table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on "Is User" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Descending" for column "Is User" inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardContactTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    #482356
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    When I hovering mouse on help text icon inside modal "Phone"
    Then I softly see "Please enter number in this format (xxx)-xxx-xxxx" shown as help text
    Then I softly see field on modal "Mobile Phone" inside page block
    When I hovering mouse on help text icon inside modal "Mobile Phone"
    Then I softly see "Please enter number in this format (xxx)-xxx-xxxx" shown as help text
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
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | First Name is required to save.     |
      | Last Name is required to save.      |
      | Phone is required to save.          |
      | Email is required to save.          |
      | Address Line 1 is required to save. |
      | State is required to save.          |
      | City is required to save.           |
      | Country is required to save.        |
      | Zip Code is required to save.       |
    When I enter in modal value "Automation Runtime Title" into field "Title"
    When I enter in modal value "Automation Runtime" into field "FirstName"
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
    Then I softly see value "{SavedValue:Automation Runtime} Execution" for title "Name" inside table "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "View" against "{SavedValue:Automation Runtime} Execution" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "Remove" against "{SavedValue:Automation Runtime} Execution" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "Edit" against "{SavedValue:Automation Runtime} Execution" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name                                      | Is Key Contact | Project Role                                   |
      | {SavedValue:Automation Runtime} Execution | Checked        | Project Director/Principal Investigator(PI/PD) |
    Then I softly see value "Project Director/Principal Investigator(PI/PD)" for title "Project Role" against the value "{SavedValue:Automation Runtime} Execution" inside table "---grantee_tableId:-:awardContactTableId---"
    #482359
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    Then I see the header is "Grant" in the page details
    And I save the field labeled "Application Number" as "ApplicationNumber"
    And I click on hyperlink containing value "{SavedValue:ApplicationNumber}"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Address line 1" as "Addressline1"
    And I save the field labeled "Address line 2" as "Addressline2"
    And I save the field labeled "City" as "City"
    And I save the field labeled "County" as "County"
    And I save the field labeled "State" as "State"
    And I save the field labeled "Congressional District" as "CongressionalDistrict"
    And I save the field labeled "Country" as "Country"
    And I save the field labeled "Zip Code" as "ZipCode"
    When I navigate to "Setup" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    And I navigate to "Budget" sub tab
    And I save the field labeled "Program Income Treatment Type" as "ProgramIncomeTreatmentType"
    And I save the field labeled "Required Match(%)" as "RequiredMatch"
    And I save the field labeled "Maximum Indirect Cost Rate" as "MaximumIndirectCostRate"
    And I save the field labeled "Total Budget Requested" as "TotalBudgetRequested"
    And I click on back arrow
    And I wait for "3" seconds
    And I click on back arrow
    And I wait for "3" seconds
    Then I softly see "Primary Place of Performance" page block displayed
    Then I softly see field "Address line 1" as "{SavedValue:Addressline1}"
    Then I softly see field "Address line 2" as "{SavedValue:Addressline2}"
    Then I softly see field "City" as "{SavedValue:City}"
    Then I softly see field "County" as "{SavedValue:County}"
    Then I softly see field "State" as "{SavedValue:State}"
    #Need to discuss below field with QA for Application field & award field
#    Then I softly see field "Congressional District" as "{SavedValue:CongressionalDistrict}"
    Then I softly see field "Country" as "{SavedValue:Country}"
    Then I softly see field "Zip Code" as "{SavedValue:ZipCode}"
    When I click on "Edit" in the page details
    And I clear the value from field "Addressline1__c"
    And I clear the value from field "Addressline2__c"
    And I clear the value from field "City__c"
    And I clear the value from field "County__c"
    And I clear the value from field "County__c"
    And I enter value "--None--" into field "State__c"
    And I clear the value from field "CongressionalDistrictName__c"
    And I clear the value from field "Zip4__c"
    And I clear the value from field "Country__c"
    And I clear the value from field "ZipCode4Extension__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Address Line 1 is required to save under Overview.         |
      | City is required to save under Overview.                   |
      | State is required to save under Overview.                  |
      | Congressional District is required to save under Overview. |
      | Zip Code is required to save under Overview.               |
      | Country is required to save under Overview.                |
    And I enter value "Alen" into field "Addressline1__c"
    And I enter value "Dow" into field "Addressline2__c"
    And I enter value "VA" into field "City__c"
    And I enter value "Cargo" into field "County__c"
    And I enter value "AK" into field "State__c"
    And I enter value "123" into field "CongressionalDistrictName__c"
    And I enter value "12345" into field "Zip4__c"
    And I enter value "USA" into field "Country__c"
    And I enter value "1234" into field "ZipCode4Extension__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Address line 1" as "Alen"
    Then I softly see field "Address line 2" as "Dow"
    Then I softly see field "City" as "VA"
    Then I softly see field "County" as "Cargo"
    Then I softly see field "State" as "AK"
    Then I softly see field "Congressional District" as "123"
    Then I softly see field "Zip Code" as "12345"
    Then I softly see field "Country" as "USA"
    Then I softly see field "4-digit Zip Code Extension" as "1234"
    Then I softly see "System Information" page block displayed
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see field "Created by" inside page block
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    And I save the field labeled "Last Modified by" as "LastModifiedby"
    Then I softly see field "Last Modified by" inside page block
    Then I softly see link "{SavedValue:LastModifiedby}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedby}"
    Then I softly see the text containing "sarah.pm@ggp.test8.qagrnteatm"
    And I click on back arrow
    And I click on hyperlink containing value "{SavedValue:Createdby}"
    Then I softly see the text containing "sarah.pm@ggp.test8.qagrnteatm"
    And I click on back arrow
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDate}"
    #482361, 482363
    And I navigate to "Projections" sub tab
    Then I softly see field "Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Then I softly see field "Budget Redirection Threshold (%)" as "{SavedValue:RequiredMatch}"
    Then I softly see field "Award Amount to Date" as "{SavedValue:TotalBudgetRequested}"
    Then I softly see field "Program Income Treatment Type" as "{SavedValue:ProgramIncomeTreatmentType}"
    Then I softly see field "Maximum Indirect Cost Rate" as "{SavedValue:MaximumIndirectCostRate}"
    Then I softly see field "Budget Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I clear the value from field "AwardIssueDate__c"
    And I clear the value from field "PaymentSystem__c"
    And I navigate to "Projections" sub tab
    And I enter value "--None--" into field "ProgramIncomeType__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Program Income Treatment Type is required to save under Projections. |
      | Award Issue Date is required to save under Overview.                 |
      | Funder Payment System is required to save under Overview.            |
    When I navigate to "Overview" sub tab
    And I enter value "10" into field "AwardIssueDate__c"
    And I enter value "Test" into field "PaymentSystem__c"
    And I navigate to "Projections" sub tab
    And I enter value "Additive" into field "ProgramIncomeType__c"
    And I enter value "10" into field "BudgetRedirectionThreshhold__c"
    And I enter value "800" into field "BudgetPeriodEndDate__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see "Project Period Details" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I softly see field "Budget Redirection Threshold (%)" as "10.00%"
    Then I softly see field "Budget Period End Date" as "{Date:M/d/yyyy::d+800}"
    Then I softly see field "Carry-Forward this Action" as "$0.00"
    When I hovering mouse on help text icon inside page block detail "Carry-Forward this Action"
    Then I softly see "This amount does not add to total awarded amount as it was awarded in a prior budget period" shown as help text
    Then I softly see field "Award Amount This Action" as "{SavedValue:TotalBudgetRequested}"
    When I hovering mouse on help text icon inside page block detail "Award Amount This Action"
    Then I softly see "Award Budget Amount in this award" shown as help text
    #482368
    When I navigate to "Overview" sub tab
    And I save the field labeled "Application" as "ApplicationNumber"
    And I click on hyperlink containing value "{SavedValue:ApplicationNumber}"
    Then I see the header is "Application" in the page details
    And I navigate to "Setup" sub tab
    Given I expand nested table containing column value "BP01"
    And I save the value from row "1" for column name "Focus Area Title" as "FocusArea" from flex table "---grantee_tableId:-:ChildBudgetPeriodDetailsFromBudgetOfSetUp---"
    And I click on back arrow
    And I navigate to "Projections" sub tab
    Then I softly see "Focus Area" page block displayed
    Then I softly see value "{SavedValue:FocusArea}" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Start Date" in flex table header "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "End Date" in flex table header "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Remove" against "{SavedValue:FocusArea}" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Edit" against "{SavedValue:FocusArea}" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Focus Area2" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see value "" for title "Start Date" against the value "Automation Permanent Focus Area2" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see value "" for title "End Date" against the value "Automation Permanent Focus Area2" inside table "---grantee_tableId:-:ProjectTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                  | Start Date | End Date |
      | {SavedValue:FocusArea} | 110        | 900      |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date |
      | Automation Permanent Focus Area2 | 110        | 900      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Projections Tab - Focus Area Start Date and Focus Area End Date should be between budget period.                                           |
      | Projections Tab - Focus Area Start Date and Focus Area End Date should be between budget period.                                           |
      | Projections Tab - At least one focus area must be in place at all times during the budget period. Adjust the focus area dates accordingly. |
    When I click on parallel lines menu bar with data target value "Focus Area"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Focus Area"
    Then I see table is refreshing
    When I click on "Title" column header inside table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:ProjectTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    #482400
    And I navigate to "Projections" sub tab
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I navigate to "Monitoring" sub tab
    Then I softly see "Special Conditions" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see "Date Effective From" in flex table header "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see "Date Effective To" in flex table header "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:SpecialConditionTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see "Create Special Condition" opens in overLay window
    Then I see the text " Required to Save | " in modal
    Then I see the text " Required to Submit" in modal
    Then I softly see "Information" page block displayed
    Then I softly see "Effective Dates" page block displayed
    When I "Collapse" page block contaninig value "Information"
    Then I softly do not see fields "Title__c" is visible
    When I "Expanded" page block contaninig value "Information"
    Then I softly see fields "Title__c" is visible
    When I "Collapse" page block contaninig value "Effective Dates"
    Then I softly do not see fields "EffectiveFrom__c" is visible
    When I "Expanded" page block contaninig value "Effective Dates"
    Then I softly see fields "EffectiveFrom__c" is visible
    Then I softly see field on modal "Title" inside page block
    Then I softly see asterisk mark on "Title"
    Then I softly see field on modal "Description" inside page block
    Then I softly see asterisk mark on "Description"
    When I hovering mouse on help text icon inside modal "Description"
    Then I softly see "Enter special condition as it's presented in award letter." shown as help text
    Then I softly see field on modal "Sequence" inside page block
    Then I softly see asterisk mark on "Sequence"
    When I hovering mouse on help text icon inside modal "Sequence"
    Then I softly see "Provide the required sequence for terms and conditions. This allow up to 18 digits." shown as help text
    Then I softly see field on modal "Mandatory" inside page block
    When I hovering mouse on help text icon inside modal "Mandatory"
    Then I softly see "Check the box to make Terms and Conditions mandatory." shown as help text
    Then I softly see field on modal "Effective From Date" inside page block
    Then I softly see asterisk mark on "Effective From Date"
    Then I softly see field on modal "Effective To Date" inside page block
    Then I softly see asterisk mark on "Effective To Date"
    And I clear in modal the value from field "Sequence__c"
    And I clear in modal the value from field "EffectiveFrom__c"
    And I clear in modal the value from field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Title is required to save.               |
      | Description is required to save.         |
      | Sequence is required to save.            |
      | Effective From Date is required to save. |
      | Effective To Date is required to save.   |
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "{SavedValue:BudgetPeriodStartDate}" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Effective To Date cannot be before Effective From Date |
    When I enter in modal value "{SavedValue:BudgetPeriodEndDate}" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I can see row level action button "View" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I can see row level action button "Delete" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I can see row level action button "Edit" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    And I click on "View" icon for "{SavedValue:TermsId}" inside flex table with id "---grantee_tableId:-:SpecialConditionTableId---" without waiting for record
    Then I softly see "Special Condition" opens in overLay window
    Then I see field "EGMS ID" as "{SavedValue:TermsId}" on modal
    Then I see field "Title" as "Terms" on modal
    Then I see field "Description" as "Terms Description" on modal
    Then I see field "Sequence" as "1" on modal
    Then I see field "Effective From Date" as "{SavedValue:BudgetPeriodStartDate}" on modal
    Then I see field "Effective To Date" as "{SavedValue:BudgetPeriodEndDate}" on modal
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "EGMS ID" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Ascending" for column "EGMS ID" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "EGMS ID" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Descending" for column "EGMS ID" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Descending" for column "Description" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Date Effective From" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Ascending" for column "Date Effective From" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Date Effective From" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Descending" for column "Date Effective From" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Date Effective To" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Ascending" for column "Date Effective To" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Date Effective To" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Descending" for column "Date Effective To" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Special Conditions"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Special Conditions"
    Then I see table is refreshing

  @484076 @ValidateFromAppGPCloseoutwhileoverrideifthereisnoopenitemstillabletodooverrideandcontinuetheflow
  Scenario: Validate From App GP Closeout while override if there is no open item still able to do override and continue the flow
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
    And I enter "Grantee_Opp_PreAppNo_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
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
    Then I softly can see top right button "Create Application" in page detail
    And I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values - backup.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:ContactModalTableIdApplication---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ContactTableIdApplication---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role                                   |
      | Sarah PM | Checked        | Project Director/Principal Investigator(PI/PD) |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:ApplicationBudgetPeriodModalTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:ApplicationSelectFocusAreaModalTableId---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I close "Add Line Item Details" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grantor" in page detail
    When I click on "Submit To Grantor" in the page details
    When I enter values into fields
      | Value | Field          |
      | 0     | SubmittedOn__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value           | Field                |
      | Awarded         | Decision__c          |
      | Automation Test | RejectionComments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Awarded"
    Then I can see top right button "Create Award" in page detail
    When I click on "Create Award" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I see the header is "Award" in the page details
    And I click on "Edit" in the page details
    When I enter "Grantee_AppToAward_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
    And I navigate to "Projections" sub tab
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
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
    When I navigate to "Overview" sub tab
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see field "Status" as "Draft"
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I enter value "12345" into field "GrantNumber__c"
    And I enter value "Project Grant" into field "GrantType__c"
    When I click on "Save" in the page details
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "New" :
      | Name       | Closeout |
      | Victor EXE | Step 1   |
    When I navigate to "Open  Items" sub tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingProgressReprt---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingFinancialReport---"
    Then I softly can see top right button "Override" in page detail
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I clear the value from field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Override" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide Justification for overriding open items to closure and proceed with the closeout. |
    And I click on "Edit" in the page details
    And I enter value "Automation Justification" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    Then I softly see status in Progress-bar is "Overridden" and is "dark blue"
    When I navigate to "Open  Items" sub tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingProgressReprt---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingFinancialReport---"

  @484028 @484070 @ValidateFromAppGPCloseoutwithPMProfileunabletoseebudgetperiodcloseout
  Scenario: Validate From App GP Closeout with PM Profile unable to see budget period closeout
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
    And I enter "Grantee_Opp_PreAppNo_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
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
    Then I softly can see top right button "Create Application" in page detail
    And I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values - backup.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:ContactModalTableIdApplication---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ContactTableIdApplication---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role                                   |
      | Sarah PM | Checked        | Project Director/Principal Investigator(PI/PD) |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:ApplicationBudgetPeriodModalTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:ApplicationSelectFocusAreaModalTableId---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I close "Add Line Item Details" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grantor" in page detail
    When I click on "Submit To Grantor" in the page details
    When I enter values into fields
      | Value | Field          |
      | 0     | SubmittedOn__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value           | Field                |
      | Awarded         | Decision__c          |
      | Automation Test | RejectionComments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Awarded"
    Then I can see top right button "Create Award" in page detail
    When I click on "Create Award" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I see the header is "Award" in the page details
    And I click on "Edit" in the page details
    When I enter "Grantee_AppToAward_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
    And I navigate to "Projections" sub tab
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
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
    When I navigate to "Overview" sub tab
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I enter value "12345" into field "GrantNumber__c"
    And I enter value "Project Grant" into field "GrantType__c"
    When I click on "Save" in the page details
    #484028
    Then I softly see field "Status" as "Draft"
    When I navigate to "Closeout" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly cannot see "Budget Period Closeouts" sub tab at view detail page
    And I navigate to "Closeout" tab
    Then I do not see "Budget Period Closeouts" inside "Closeouts" is displayed

  @484063 @ValidateFromAppGPCloseoutwithPMProfileabletocreateProjectperiodcloseoutandabletocompletethecloseout
  Scenario: Validate From App GP Closeout with PM Profile Able to create Project period closeout and able to complete the closeout
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
    And I enter "Grantee_Opp_PreAppNo_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
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
    Then I softly can see top right button "Create Application" in page detail
    And I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values - backup.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:ContactModalTableIdApplication---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ContactTableIdApplication---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role                                   |
      | Sarah PM | Checked        | Project Director/Principal Investigator(PI/PD) |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:ApplicationBudgetPeriodModalTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:ApplicationSelectFocusAreaModalTableId---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I close "Add Line Item Details" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grantor" in page detail
    When I click on "Submit To Grantor" in the page details
    When I enter values into fields
      | Value | Field          |
      | 0     | SubmittedOn__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value           | Field                |
      | Awarded         | Decision__c          |
      | Automation Test | RejectionComments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Awarded"
    Then I can see top right button "Create Award" in page detail
    When I click on "Create Award" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I see the header is "Award" in the page details
    And I click on "Edit" in the page details
    When I enter "Grantee_AppToAward_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
    And I navigate to "Projections" sub tab
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
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
    When I navigate to "Overview" sub tab
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I enter value "12345" into field "GrantNumber__c"
    And I enter value "Project Grant" into field "GrantType__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
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
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
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
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingProgressReprt---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingFinancialReport---"
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
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:closeoutNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    When I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
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
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:pendingAmendmentCloseoutTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingProgressReprt---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingFinancialReport---"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Closeout has been validated successfully. Please proceed. |
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Forward | Send to Owner |
    When I select radio button "Forward" in the approval decision
    And I select user "David FO" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:HomePendingTask---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---grantee_tableId:-:HomePendingTask---"
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
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
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    Then I softly see "Submit to Grantor" opens in overLay window
    And I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Submitted to Grantor On is required to save. |
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    Then I softly can see top right button "Complete Closeout" in page detail
    When I click on "Complete Closeout" in the page details
    And I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Grantor Closeout Date is required to save. |
    When I enter values into fields
      | Value | Field                  |
      | 0     | FederalCloseoutDate__c |
    And I click modal button "Save"
    And I wait for "2" seconds
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
    Then I softly see field "Status" as "Closed"

  @484057 @ValidateFromAppGPCloseoutwithPMProfileIfCloseoutisinApprovedstatethenabletoseetheaccessofsection
  Scenario: Validate From AppGP Closeout with PM Profile If Closeout is in Approved state then able to see the access of section
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
    And I enter "Grantee_Opp_PreAppNo_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
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
    Then I softly can see top right button "Create Application" in page detail
    And I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values - backup.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:ContactModalTableIdApplication---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ContactTableIdApplication---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role                                   |
      | Sarah PM | Checked        | Project Director/Principal Investigator(PI/PD) |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:ApplicationBudgetPeriodModalTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:ApplicationSelectFocusAreaModalTableId---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I close "Add Line Item Details" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grantor" in page detail
    When I click on "Submit To Grantor" in the page details
    When I enter values into fields
      | Value | Field          |
      | 0     | SubmittedOn__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value           | Field                |
      | Awarded         | Decision__c          |
      | Automation Test | RejectionComments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Awarded"
    Then I can see top right button "Create Award" in page detail
    When I click on "Create Award" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I see the header is "Award" in the page details
    And I click on "Edit" in the page details
    When I enter "Grantee_AppToAward_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
    And I navigate to "Projections" sub tab
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
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
    When I navigate to "Overview" sub tab
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I enter value "12345" into field "GrantNumber__c"
    And I enter value "Project Grant" into field "GrantType__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "New" :
      | Name       | Closeout |
      | Victor EXE | Step 1   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Override" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I navigate to "Overview" sub tab
    Then I softly see "Grant Overview" page block displayed
    Then I softly see "Closeout Request Details" page block displayed
    Then I softly see "System Information" page block displayed
    When I navigate to "Open  Items" sub tab
    Then I softly see "Pending Amendment Requests" page block displayed
    Then I softly see "Pending Progress Reports" page block displayed
    Then I softly see "Pending Financial Reports" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly can see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:closeoutApproverTableId---"
    Then I softly can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:closeoutApproverTableId---"
    When I navigate to "Files" sub tab
    Then I softly see "Closeout Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:closeoutNotesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Supporting Documents" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "View" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Supporting Documents" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    When I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    Then I softly see status in Progress-bar is "Overridden" and is "dark blue"
    When I navigate to "Files" sub tab
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:closeoutAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Funder Closeout Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Closeout has been validated successfully. Please proceed. |
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:phaseCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:phaseCloseoutTableId---"
    Then I softly see field "Status" as "Approved"
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit to Grantor" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download As PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:closeoutPeerReviewTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutApproverTableId---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:closeoutApproverTableId---"
    When I navigate to "Files" sub tab
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:closeoutAddFilesTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:closeoutNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:closeoutNotesTableId---" by clicking "Edit" :
      | Created By | Title               | Description      |
      | Sarah PM   | Notes Record Edited | Automation Notes |
    Then I softly see value "Notes Record Edited" for title "Title" inside table "---grantee_tableId:-:closeoutNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Approved"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "sarah.pm.23@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"

  @482389 @ValidatePMUsertheAwardbudgetfromprojectiontabverifythevalidation
  Scenario: Validate PM User the Award budget from projection tab & verify the validation
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
    And I enter "Grantee_Opp_PreAppNo_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
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
    Then I softly can see top right button "Create Application" in page detail
    And I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values - backup.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:ContactModalTableIdApplication---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ContactTableIdApplication---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role                                   |
      | Sarah PM | Checked        | Project Director/Principal Investigator(PI/PD) |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:ApplicationBudgetPeriodModalTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:ApplicationSelectFocusAreaModalTableId---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I close "Add Line Item Details" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grantor" in page detail
    When I click on "Submit To Grantor" in the page details
    When I enter values into fields
      | Value | Field          |
      | 0     | SubmittedOn__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value           | Field                |
      | Awarded         | Decision__c          |
      | Automation Test | RejectionComments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Awarded"
    Then I can see top right button "Create Award" in page detail
    When I click on "Create Award" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Projections" sub tab
    Then I softly see "Award Budget" page block displayed
    Then I softly see total records count "Total Records: 12" in flex table "---grantee_tableId:-:AwardBudgetTableId---"
    And I click on "Remove" icon for "Automation Permanent Focus Area" inside flex table with id "---grantee_tableId:-:ProjectTableId---"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see total records count "Total Records: 12" in flex table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I can see row level action button "Add Line Items" against "Administrative and legal expenses" in flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Administrative and legal expenses" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see "Add Line Items" opens in overLay window
    Then I softly see "Line Items" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Narrative" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Total Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Award Budget | Cash Match | Non-Cash Match |
      | Construction | 5000         | 500        | 500            |
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Provide the narrative for all build-up items. |
    When I click on parallel lines menu bar with data target value "Line Items"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Line Items"
    Then I see table is refreshing
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    Then I see the text "Showing 1 to 1 of 1 records" in modal
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
      | Cash Match | equals to | 100 |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on top right button "Clear" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on "Delete" icon for "Construction" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I wait for "3" seconds
    Then I can see row level action button "Add Line Items" against "Architectural and engineering fees" in flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Architectural and engineering fees" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see "Add Line Items" opens in overLay window
    Then I softly see "Line Items" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Narrative" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Total Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Award Budget | Cash Match | Non-Cash Match |
      | Construction | 5000         | 500        | 500            |
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Provide the narrative for all build-up items. |
    When I click on parallel lines menu bar with data target value "Line Items"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Line Items"
    Then I see table is refreshing
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    Then I see the text "Showing 1 to 1 of 1 records" in modal
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
      | Cash Match | equals to | 100 |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on top right button "Clear" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    When I click on parallel lines menu bar with data target value "Line Items"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Line Items"
    Then I see table is refreshing
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on "Delete" icon for "Construction" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I wait for "3" seconds
    Then I can see row level action button "Add Line Items" against "Construction" in flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see "Add Line Items" opens in overLay window
    Then I softly see "Line Items" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Narrative" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Total Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Award Budget | Cash Match | Non-Cash Match |
      | Construction | 5000         | 500        | 500            |
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Provide the narrative for all build-up items. |
    When I click on parallel lines menu bar with data target value "Line Items"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Line Items"
    Then I see table is refreshing
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    Then I see the text "Showing 1 to 1 of 1 records" in modal
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
      | Cash Match | equals to | 100 |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on top right button "Clear" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on "Delete" icon for "Construction" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I wait for "3" seconds
    Then I can see row level action button "Add Line Items" against "Contingencies" in flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Contingencies" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see "Add Line Items" opens in overLay window
    Then I softly see "Line Items" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Narrative" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Total Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Award Budget | Cash Match | Non-Cash Match |
      | Construction | 5000         | 500        | 500            |
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Provide the narrative for all build-up items. |
    When I click on parallel lines menu bar with data target value "Line Items"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Line Items"
    Then I see table is refreshing
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    Then I see the text "Showing 1 to 1 of 1 records" in modal
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
      | Cash Match | equals to | 100 |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on top right button "Clear" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on "Delete" icon for "Construction" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I wait for "3" seconds
    Then I can see row level action button "Add Line Items" against "Equipment" in flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Equipment" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see "Add Line Items" opens in overLay window
    Then I softly see "Line Items" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Narrative" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Total Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Award Budget | Cash Match | Non-Cash Match |
      | Construction | 5000         | 500        | 500            |
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Provide the narrative for all build-up items. |
    When I click on parallel lines menu bar with data target value "Line Items"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Line Items"
    Then I see table is refreshing
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    Then I see the text "Showing 1 to 1 of 1 records" in modal
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
      | Cash Match | equals to | 100 |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on top right button "Clear" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on "Delete" icon for "Construction" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I wait for "3" seconds
    Then I can see row level action button "Add Line Items" against "Indirect costs" in flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Indirect costs" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see "Add Line Items" opens in overLay window
    Then I softly see "Line Items" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Narrative" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Total Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Award Budget | Cash Match | Non-Cash Match |
      | Construction | 5000         | 500        | 500            |
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Provide the narrative for all build-up items. |
    When I click on parallel lines menu bar with data target value "Line Items"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Line Items"
    Then I see table is refreshing
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 100        | 100            |
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    Then I see the text "Showing 1 to 1 of 1 records" in modal
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
      | Cash Match | equals to | 500 |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on top right button "Clear" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Projections Tab - The Match cannot be less than the given %. |
    Then I softly see "Budget Category" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:AwardBudgetTableId---"
    And I click on advance filter of table id "---grantee_tableId:-:AwardBudgetTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:AwardBudgetTableId---" for LWC
      | Budget Category | contains | Construction |
    Then I softly see value "Construction" for title "Budget Category" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    And I click on top right button "Clear" in flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    And I click on advance filter of table id "---grantee_tableId:-:AwardBudgetTableId---" for LWC
    And I select value inside table "---grantee_tableId:-:AwardBudgetTableId---" is "All"
    Then I softly see the text containing "Showing 1 to 12 of 12 records"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Award Budget"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Budget"
    Then I see table is refreshing

  @482392 @ValidatePMUsertheActualTabWhenAwardisinactive
  Scenario: Validate PM User the Actual Tab When Award is in active
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
    And I enter "Grantee_Opp_PreAppNo_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
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
    Then I softly can see top right button "Create Application" in page detail
    And I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values - backup.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:ContactModalTableIdApplication---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ContactTableIdApplication---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role                                   |
      | Sarah PM | Checked        | Project Director/Principal Investigator(PI/PD) |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:ApplicationBudgetPeriodModalTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:ApplicationSelectFocusAreaModalTableId---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I close "Add Line Item Details" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grantor" in page detail
    When I click on "Submit To Grantor" in the page details
    When I enter values into fields
      | Value | Field          |
      | 0     | SubmittedOn__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value           | Field                |
      | Awarded         | Decision__c          |
      | Automation Test | RejectionComments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Awarded"
    Then I can see top right button "Create Award" in page detail
    When I click on "Create Award" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I see the header is "Award" in the page details
    And I click on "Edit" in the page details
    When I enter "Grantee_AppToAward_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
    And I navigate to "Projections" sub tab
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
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
    When I navigate to "Overview" sub tab
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I enter value "12345" into field "GrantNumber__c"
    And I enter value "Project Grant" into field "GrantType__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    Then I softly can see "Actuals" sub tab at view detail page
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I click on "Add Line Items" icon for "Equipment" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title     | Narrative     | Awarded Budget | Cash Match | Other Leverage |
      | Equipment | The narrative | 2000           | 200        | 200            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
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
    And I wait for "2" seconds
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly can see "Actuals" sub tab at view detail page
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
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
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:closeoutApproverTableId---" by clicking "New" :
      | Name       | Closeout |
      | Victor EXE | Step 1   |
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Pending Closeout"
    Then I softly can see "Actuals" sub tab at view detail page
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:closeoutTableId---" panel
    When I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:closeoutTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "Complete Closeout" in the page details
    When I enter values into fields
      | Value | Field                  |
      | 0     | FederalCloseoutDate__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Completed"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Closed"
    Then I softly can see "Actuals" sub tab at view detail page

  @482401 @ValidatePOUserthecloseouttab
  Scenario: Validate PO User the closeout tab
    Given I login to "As a Grantee" app as "GRANTEE PO" user
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
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
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
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Application" in page detail
    And I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values - backup.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:ContactModalTableIdApplication---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ContactTableIdApplication---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role                                   |
      | Sarah PM | Checked        | Project Director/Principal Investigator(PI/PD) |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:ApplicationBudgetPeriodModalTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:ApplicationSelectFocusAreaModalTableId---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I close "Add Line Item Details" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grantor" in page detail
    When I click on "Submit To Grantor" in the page details
    When I enter values into fields
      | Value | Field          |
      | 0     | SubmittedOn__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value           | Field                |
      | Awarded         | Decision__c          |
      | Automation Test | RejectionComments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Awarded"
    Then I can see top right button "Create Award" in page detail
    When I click on "Create Award" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I see the header is "Award" in the page details
    And I click on "Edit" in the page details
    When I enter "Grantee_AppToAward_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
    And I navigate to "Projections" sub tab
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Grantee PO | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
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
    When I navigate to "Overview" sub tab
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I enter value "12345" into field "GrantNumber__c"
    And I enter value "Project Grant" into field "GrantType__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
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
    Then I softly see field "Status" as "Pending Closeout"
    When I navigate to "Closeout" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see "Project Period Closeout Requests" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see "Type" in flex table header "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see "Project Period" in flex table header "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see "Closeout Due Date" in flex table header "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "EGMS ID" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Ascending" for column "EGMS ID" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "EGMS ID" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Descending" for column "EGMS ID" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Type" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Ascending" for column "Type" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Type" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Descending" for column "Type" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Project Period" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Ascending" for column "Project Period" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Project Period" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Descending" for column "Project Period" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Closeout Due Date" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Ascending" for column "Closeout Due Date" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Closeout Due Date" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Descending" for column "Closeout Due Date" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Status" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Ascending" for column "Status" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Status" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Descending" for column "Status" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Project Period Closeout Requests"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Project Period Closeout Requests"
    Then I see table is refreshing

  @482393 @ValidatePMUsertheexpendituredetailssection @GranteeTBE
  Scenario: Validate PM User the expenditure details section
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
    And I enter "Grantee_Opp_PreAppNo_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
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
    Then I softly can see top right button "Create Application" in page detail
    And I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values - backup.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:ContactModalTableIdApplication---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ContactTableIdApplication---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role                                   |
      | Sarah PM | Checked        | Project Director/Principal Investigator(PI/PD) |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:ApplicationBudgetPeriodModalTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:ApplicationSelectFocusAreaModalTableId---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I close "Add Line Item Details" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grantor" in page detail
    When I click on "Submit To Grantor" in the page details
    When I enter values into fields
      | Value | Field          |
      | 0     | SubmittedOn__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value           | Field                |
      | Awarded         | Decision__c          |
      | Automation Test | RejectionComments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Awarded"
    Then I can see top right button "Create Award" in page detail
    When I click on "Create Award" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I see the header is "Award" in the page details
    And I click on "Edit" in the page details
    When I enter "Grantee_AppToAward_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
    And I navigate to "Projections" sub tab
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
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
    When I navigate to "Overview" sub tab
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I enter value "12345" into field "GrantNumber__c"
    And I enter value "Project Grant" into field "GrantType__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    When I navigate to "Actuals" sub tab
    Then I softly see "Expenditure Detail" page block displayed
    Then I softly see the text containing "* Records are sorted by Focus Area ascending order, Row Number ascending order"
    And I select value inside table "---grantee_tableId:-:ExpenditureDetailsTableId---" is "All"
    Then I softly see value "Administrative and legal expenses" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Land, structures, rights-of-way, appraisals, etc." for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Relocation expenses and payments" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Architectural and engineering fees" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Other architectural and engineering fees" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Project inspection fees" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Site work" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Construction" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Indirect costs" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Equipment" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Miscellaneous" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Contingencies" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly can see row level action button "Show Financial Transactions" against "Construction" in flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly can see row level action button "Report Non-Cash Match Line Item" against "Construction" in flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    And I click on "Show Financial Transactions" icon for "Construction" inside flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see "Financial Transactions" opens in overLay window
    Then I softly see "Expenditure Details" page block displayed on modal
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    When I "Collapse" page block contaninig value "Expenditure Details"
    Then I softly do not see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    When I "Expanded" page block contaninig value "Expenditure Details"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    When I click on parallel lines menu bar with data target value "Expenditure Details"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Expenditure Details"
    Then I see table is refreshing
    When I click on parallel lines menu bar with data target value "Expenditure Details"
    And I select "Download as PDF" from parallel lines dropdown of "Expenditure Details"
    And I wait for "2" seconds
    And I download the file
    And I wait for "5" seconds
    Then I softly see "Expenditure Details" on page "1" of "govgrants" pdf file
    And I close the tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    When I "Collapse" page block contaninig value "Cash Match Details"
    Then I softly do not see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    When I "Expanded" page block contaninig value "Cash Match Details"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    When I click on parallel lines menu bar with data target value "Cash Match Details"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Cash Match Details"
    Then I see table is refreshing
    When I click on parallel lines menu bar with data target value "Cash Match Details"
    And I select "Download as PDF" from parallel lines dropdown of "Cash Match Details"
    And I download the file
    And I wait for "6" seconds
    Then I softly see "Cash Match Details" on page "1" of "govgrants" pdf file
    And I close the tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    When I "Collapse" page block contaninig value "Program Income Expenses"
    Then I softly do not see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    When I "Expanded" page block contaninig value "Program Income Expenses"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    When I click on parallel lines menu bar with data target value "Cash Match Details"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Program Income Expenses"
    Then I see table is refreshing
    When I click on parallel lines menu bar with data target value "Program Income Expenses"
    And I select "Download as PDF" from parallel lines dropdown of "Program Income Expenses"
    And I download the file
    And I wait for "6" seconds
    Then I softly see "Program Income Expenses" on page "1" of "govgrants" pdf file
    And I close the tab
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Report Non-Cash Match Line Item" icon for "Construction" inside flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see "Add Non-Cash Match" opens in overLay window
    Then I softly see "Report Non Cash Match" page block displayed on modal
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsMoalNonCashMatchTableId---"
    When I "Collapse" page block contaninig value "Report Non Cash Match"
    Then I softly do not see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsMoalNonCashMatchTableId---"
    When I "Expanded" page block contaninig value "Report Non Cash Match"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsMoalNonCashMatchTableId---"
    When I click on parallel lines menu bar with data target value "Report Non Cash Match"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Report Non Cash Match"
    Then I see table is refreshing
    When I click on parallel lines menu bar with data target value "Report Non Cash Match"
    And I select "Download as PDF" from parallel lines dropdown of "Report Non Cash Match"
    And I download the file
    And I wait for "6" seconds
    Then I softly see "Report Non Cash Match" on page "1" of "govgrants" pdf file

  @482402 @ValidatePOUserthefilessectionofaward @GranteeTBE
  Scenario: Validate PO User the files section of award
    Given I login to "As a Grantee" app as "GRANTEE PO" user
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
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
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
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Application" in page detail
    And I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values - backup.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:ContactModalTableIdApplication---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ContactTableIdApplication---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role                                   |
      | Sarah PM | Checked        | Project Director/Principal Investigator(PI/PD) |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:ApplicationBudgetPeriodModalTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:ApplicationSelectFocusAreaModalTableId---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I close "Add Line Item Details" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grantor" in page detail
    When I click on "Submit To Grantor" in the page details
    When I enter values into fields
      | Value | Field          |
      | 0     | SubmittedOn__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value           | Field                |
      | Awarded         | Decision__c          |
      | Automation Test | RejectionComments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Awarded"
    Then I can see top right button "Create Award" in page detail
    When I click on "Create Award" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I see the header is "Award" in the page details
    And I click on "Edit" in the page details
    When I enter "Grantee_AppToAward_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
    And I navigate to "Projections" sub tab
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Grantee PO | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
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
    Then I softly see "Award Files" page block displayed
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Add File" opens in overLay window
    Then I softly see the text containing "Classification"
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification | Interim Award Document | Notice of Award | Terms and Conditions | Other |
    Then I softly see the text containing "Upload File"
    Then I softly see the text containing "Description"
    Then I see "Upload" button is disabled at modal under library
    When I upload file "Attachment.pdf" into library
    Then I do not see "Upload" button is disabled at modal under library
    Then I see the text "Attachment.pdf" in modal
    When I click modal button "Cancel"
    Then I do not see the text "Attachment.pdf" in modal
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" with description "Automation Test" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I see "Attachment.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    When I click on parallel lines menu bar with data target value "Award Files"
    And I select "Download as PDF" from parallel lines dropdown of "Award Files"
    And I download the file
    And I wait for "6" seconds
    Then I softly see "Award Files" on page "1" of "govgrants" pdf file
    And I close the tab
    And I click on "Delete" icon for "Attachment.pdf" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---" without waiting for record
    Then I see the following messages in the page details :
      | File Attachment.pdf deleted successfully. |
    Then I softly do not see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I enter value "12345" into field "GrantNumber__c"
    And I enter value "Project Grant" into field "GrantType__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I navigate to "Files" sub tab
    Then I softly see "Award Files" page block displayed
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Add File" opens in overLay window
    Then I softly see the text containing "Classification"
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification | Interim Award Document | Notice of Award | Terms and Conditions | Other |
    Then I softly see the text containing "Upload File"
    Then I softly see the text containing "Description"
    Then I see "Upload" button is disabled at modal under library
    When I upload file "Attachment.pdf" into library
    Then I do not see "Upload" button is disabled at modal under library
    Then I see the text "Attachment.pdf" in modal
    When I click modal button "Cancel"
    Then I do not see the text "Attachment.pdf" in modal
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" with description "Automation Test" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I see "Attachment.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    And I click on "Delete" icon for "Attachment.pdf" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---" without waiting for record
    Then I see the following messages in the page details :
      | File Attachment.pdf deleted successfully. |
    Then I softly do not see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
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
    When I navigate to "Files" sub tab
    Then I softly see "Award Files" page block displayed
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Add File" opens in overLay window
    Then I softly see the text containing "Classification"
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification | Interim Award Document | Notice of Award | Terms and Conditions | Other |
    Then I softly see the text containing "Upload File"
    Then I softly see the text containing "Description"
    Then I see "Upload" button is disabled at modal under library
    When I upload file "Attachment.pdf" into library
    Then I do not see "Upload" button is disabled at modal under library
    Then I see the text "Attachment.pdf" in modal
    When I click modal button "Cancel"
    Then I do not see the text "Attachment.pdf" in modal
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" with description "Automation Test" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I see "Attachment.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    And I click on "Delete" icon for "Attachment.pdf" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---" without waiting for record
    Then I see the following messages in the page details :
      | File Attachment.pdf deleted successfully. |
    Then I softly do not see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Files" sub tab
    Then I softly see "Award Files" page block displayed
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Add File" opens in overLay window
    Then I softly see the text containing "Classification"
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification | Interim Award Document | Notice of Award | Terms and Conditions | Other |
    Then I softly see the text containing "Upload File"
    Then I softly see the text containing "Description"
    Then I see "Upload" button is disabled at modal under library
    When I upload file "Attachment.pdf" into library
    Then I do not see "Upload" button is disabled at modal under library
    Then I see the text "Attachment.pdf" in modal
    When I click modal button "Cancel"
    Then I do not see the text "Attachment.pdf" in modal
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" with description "Automation Test" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I see "Attachment.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Files" sub tab
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I see "Attachment.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I navigate to "Files" sub tab
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I see "Attachment.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    When I navigate to "Files" sub tab
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I see "Attachment.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
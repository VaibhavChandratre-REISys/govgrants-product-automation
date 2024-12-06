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
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
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
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Focus Area2" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see value "" for title "Start Date" against the value "Automation Permanent Focus Area2" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see value "" for title "End Date" against the value "Automation Permanent Focus Area2" inside table "---grantee_tableId:-:ProjectTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                  | Start Date | End Date |
      | {SavedValue:FocusArea} | 110        | 400      |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date |
      | Automation Permanent Focus Area2 | 110        | 400      |
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

  @482402 @ValidatePOUserthefilessectionofaward
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
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
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
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
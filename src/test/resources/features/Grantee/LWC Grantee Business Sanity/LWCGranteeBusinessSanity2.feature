@GranteeSanityBusinessFlow
Feature: Sanity scenarios

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

  @474704 @CFVerifyGranteePOuserReviewerNocanabletosubmitReviewonCFAR
  Scenario:CF - Verify Grantee PO user (Reviewer= No)can able to submit Review on CF AR
    When I login to "As a Grantee" app as "GRANTEE PO" user
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
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_PRenewal_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_PeriodicRenewal_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PRAMENDID"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID1"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
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
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I wait for "5" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_CF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_CF_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "CFAMENDID"
    And I wait for "3" seconds
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:carryForwardBudgetTableId---" by clicking "Edit" :
      | Category Name | Carry Forward |
      | Construction  | 0             |
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms2" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms2" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "1" for column name "EGMS ID" as "AmendTermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate2 | 15             | 30              | 10                             | Final                   |
    And I save the value from row "1" for column name "Title" as "TitleIndirectRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective from" as "Effectivefrom" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective until" as "Effectiveuntil" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Approved Indirect Cost Rate(%)" as "ApprovedIndirectCostRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    #bug id 483935
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"

  @474703 @CFVerifyAmeliaFOuserReviewerYescanabletosubmitReview&ReviewcompletebyAROwneronclickofCompeleteReviewbuttononCFAR
  Scenario:CF - Verify Amelia FO user (Reviewer= Yes)can able to submit Review & Review complete by AR Owner on click of Compelete Review button on CF  AR
    When I login to "As a Grantee" app as "GRANTEE PO" user
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
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_PRenewal_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_PeriodicRenewal_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PRAMENDID"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID1"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
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
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "CFAMENDID"
    And I wait for "5" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_CF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_CF_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I wait for "3" seconds
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:carryForwardBudgetTableId---" by clicking "Edit" :
      | Category Name | Carry Forward |
      | Construction  | 0             |
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms2" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms2" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "1" for column name "Title" as "AmendTermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate2 | 15             | 30              | 10                             | Final                   |
    And I save the value from row "1" for column name "Title" as "TitleIndirectRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective from" as "Effectivefrom" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective until" as "Effectiveuntil" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Approved Indirect Cost Rate(%)" as "ApprovedIndirectCostRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I can see top right button "Edit" in page detail
    Then I softly can see row level action button "Edit" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I click on parallel lines menu bar with data target value "Peer Reviewers"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Rating is required to save.   |
      | Comments is required to save. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see that "Submitted" has been added in flextable with Id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I can see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Resend for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see value "Sent for Review" for title "Status" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see that "Submitted" has been added in flextable with Id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    #bug id 483935
   # Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentPeerReviewerTableId---"

  @482865 @CFamdVerifythatAuditoruserhavingonlyviewaccessonPRamendmentrequestonGrantlayout
  Scenario:CF amd >>Verify that Auditor user having only view access on PR amendment request on Grant layout
    When I login to "As a Grantee" app as "GRANTEE PO" user
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
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_PRenewal_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_PeriodicRenewal_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PRAMENDID"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID1"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
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
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "CFAMENDID"
    And I wait for "5" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_CF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_CF_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I wait for "3" seconds
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:carryForwardBudgetTableId---" by clicking "Edit" :
      | Category Name | Carry Forward |
      | Construction  | 0             |
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms2" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms2" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "1" for column name "Title" as "AmendTermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate2 | 15             | 30              | 10                             | Final                   |
    And I save the value from row "1" for column name "Title" as "TitleIndirectRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective from" as "Effectivefrom" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective until" as "Effectiveuntil" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Approved Indirect Cost Rate(%)" as "ApprovedIndirectCostRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Delete" in page detail
    Then I softly see that "GeneralConditionChanged__c" rendered in view mode only
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentObjectiveTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentKPITableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms2" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly cannot see row level action button "Edit" against "Terms2" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly cannot see row level action button "Delete" against "Terms2" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I navigate to "Files" sub tab
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"

  @474697 @CFVerifyPOuseAROwnercanabletoSubmitARforApproval&Approvedfromassigned4stepapprover&candoSendtoOwner/Forward/Approveactions&seeSubmittoGrantorbuttononceApprovedtheBPCARRecord
  Scenario:CF - Verify PO user (AR Owner) can able to Submit AR for Approval & Approved from assigned 4 step approver & can do Send to Owner/ Forward/ Approve actions & see 'Submit to Grantor' button once Approved the BPC AR Record
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
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
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
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_PRenewal_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_PeriodicRenewal_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PRAMENDID"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID1"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
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
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "CFAMENDID"
    And I wait for "5" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_CF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_CF_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I wait for "3" seconds
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:carryForwardBudgetTableId---" by clicking "Edit" :
      | Category Name | Carry Forward |
      | Construction  | 0             |
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms2" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms2" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "1" for column name "EGMS ID" as "AmendTermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate2 | 15             | 30              | 10                             | Final                   |
    And I save the value from row "1" for column name "Title" as "TitleIndirectRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective from" as "Effectivefrom" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective until" as "Effectiveuntil" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Approved Indirect Cost Rate(%)" as "ApprovedIndirectCostRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | NA                |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Amendment Request |
      | Step 3            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | NA                |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | NA                |
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Responsibilities - At least one approver is required. |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 2            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Grantee PO | Step 3            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 4            |
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Name     | Amendment Request |
      | Sarah PM | Step 4            |
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Name     | Amendment Request |
      | Sarah PM | Step 4            |
    Then I softly see the following messages in the page details contains:
      | You cannot specify the same step for multiple users for Amendment Request |
    And I refresh the page
    And I wait for "5" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
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
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "GRANTEE PO" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see the following messages in the page details contains:
      | Successfully Re-Assigned |
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details without processing
    Then I softly see confirmation box with body "Are you sure, you want to submit this request for approval?" is displayed
    And I click "Cancel" on modal confirmation box
    Then I softly see field "Status" as "Created"
    And I click on "Submit for Approval" in the page details without processing
    Then I softly see confirmation box with body "Are you sure, you want to submit this request for approval?" is displayed
    And I click "OK" on modal confirmation box
    Then I softly see field "Status" as "Submitted for Approval"
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
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Approved"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Approved" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    Then I cannot see top right button "Edit" in page detail
    Then I can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Submitted to Grantor On is required to save. |
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    And I navigate to "Overview" sub tab
    And I save the field labeled "Submitted to Grantor On" as "SubmittedtoGrantorOn"
    Then I softly see field "Submitted to Grantor On" as "{SavedValue:SubmittedtoGrantorOn}"

  @474674 @CFVerifyPOuserAROwnercanabletotakeNotAcceptedDecisionfromGrantorRecordDecisionmodalonCFAR
  Scenario:CF - Verify PO user (AR Owner)can able to take Not Accepted Decision from Grantor Record Decision modal on CF AR
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
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
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
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_PRenewal_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_PeriodicRenewal_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PRAMENDID"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID1"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
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
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "CFAMENDID"
    And I wait for "5" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_CF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_CF_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I wait for "3" seconds
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:carryForwardBudgetTableId---" by clicking "Edit" :
      | Category Name | Carry Forward |
      | Construction  | 0             |
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms2" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms2" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "1" for column name "EGMS ID" as "AmendTermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate2 | 15             | 30              | 10                             | Final                   |
    And I save the value from row "1" for column name "Title" as "TitleIndirectRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective from" as "Effectivefrom" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective until" as "Effectiveuntil" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Approved Indirect Cost Rate(%)" as "ApprovedIndirectCostRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
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
    Then I softly see fields "Comments__c" is in edit mode
    When I enter values into fields
      | Value        | Field       |
      | Not Accepted | Decision__c |
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Additional Details is required to save. |
    When I enter values into fields
      | Value | Field       |
      | Test  | Comments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Not Accepted"
    Then I see status in Progress-bar is "Not Accepted" and is "Red"
    Then I softly cannot see top right button "Edit" in page detail
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Not Accepted" for title "New Value" inside field history table
    Then I softly see value "Submitted to Grantor" for title "Original Value" inside field history table

  @474673 @CFVerifyAdminuserAwardOwnercanabletoRevisetheCarryForwardAmendmentRequestonclickofReviseAmendmentbuttonwhenARisinSubmittoGrantorstate&abletoseestatus&StepProgressbarafterrevisetheAR
  Scenario:CF - Verify Admin user  (Award Owner) can able to Revise the Carry Forward Amendment Request on click of Revise Amendment button when AR is in Submit to Grantor state & able to see status & Step Progress bar after revise the AR
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
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
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
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_PRenewal_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_PeriodicRenewal_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PRAMENDID"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID1"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
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
    Then I softly see field "Status" as "Activated"
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "AwardId1"
    And I wait for "5" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_CF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_CF_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "CFAMENDMENT"
    And I wait for "3" seconds
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:carryForwardBudgetTableId---" by clicking "Edit" :
      | Category Name | Carry Forward |
      | Construction  | 0             |
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms2" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms2" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "2" for column name "Title" as "AmendTermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate2 | 15             | 30              | 10                             | Final                   |
    And I save the value from row "1" for column name "Title" as "TitleIndirectRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
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
    And I click on "Revise Amendment" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to revise the amendment request? The amendment request will require an approval again after being revised." is displayed
    And I click "Cancel" on modal confirmation box
    Then I softly see field "Status" as "Submitted to Grantor"
    And I click on "Revise Amendment" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to revise the amendment request? The amendment request will require an approval again after being revised." is displayed
    And I click "OK" on modal confirmation box
    Then I softly see field "Status" as "Revision in Progress"
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Edit" in page detail
    When I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Revision in Progress" for title "New Value" inside field history table
    Then I softly see value "Submitted to Grantor" for title "Original Value" inside field history table
    And I click on back arrow
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
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

  @474678 @474672 @CFVerifyPMuserARrecordownercanabletoseeAmendAwardbuttonwhenARgetAccepted&abletocreatenewAward&checkstatusofoldAward&checkimpactofnewlycreatedAwardonGrant&Award
  Scenario:CF - Verify PM user (AR record owner) can able to see Amend Award button when AR get Accepted & able to create new Award & check status of old Award & check impact of newly created Award on Grant & Award
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
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
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
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_PRenewal_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_PeriodicRenewal_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PRAMENDID"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID1"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
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
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I wait for "5" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_CF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_CF_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "CFAMENDID"
    And I wait for "3" seconds
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:carryForwardBudgetTableId---" by clicking "Edit" :
      | Category Name | Carry Forward |
      | Construction  | 0             |
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "CFTermsCondition" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "CFTermsCondition" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "2" for column name "Title" as "CFTermsCondition" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate2 | 15             | 30              | 10                             | Final                   |
    And I save the value from row "1" for column name "Title" as "TitleIndirectRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective from" as "Effectivefrom" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective until" as "Effectiveuntil" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Approved Indirect Cost Rate(%)" as "ApprovedIndirectCostRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
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
    Then I can see top right button "Amend Award" in page detail
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Accepted" for title "New Value" inside field history table
    And I softly see value "Submitted to Grantor" for title "Original Value" inside field history table
    And I click on back arrow
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Activate Award" in page detail
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardEGMSID}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:AwardEGMSID1}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardEGMSID2}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I click on "View" icon for "{SavedValue:AwardEGMSID2}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Projections" sub tab
    Then I softly see value "{SavedValue:TitleIndirectRate}" for title "Title" inside table "---grantee_tableId:-:awardIndirectRateTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see value "{SavedValue:CFTermsCondition}" for title "Title" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:CFAMENDID}" for title "EGMS ID" inside table "---grantee_tableId:-:GrantsAmendmentRequestsTableId---"
    Then I softly see value "{SavedValue:PRAMENDID}" for title "EGMS ID" inside table "---grantee_tableId:-:GrantsAmendmentRequestsTableId---"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:AwardEGMSID1}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Amended"

  @482861 @VerifyEXEuserAROwnercanabletoRejecttheCarryForwardAmendmentRequestfromApprovalProcess
  Scenario:Verify EXE user (AR Owner) can able to Reject the Carry Forward Amendment Request from Approval Process
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
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    Then I softly see the following messages in the page details contains:
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
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
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_PRenewal_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_PeriodicRenewal_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PRAMENDID"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID1"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
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
    And I wait for "5" seconds
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "CFAMENDID"
    And I wait for "5" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_CF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_CF_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I wait for "3" seconds
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:carryForwardBudgetTableId---" by clicking "Edit" :
      | Category Name | Carry Forward |
      | Construction  | 0             |
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms2" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms2" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "1" for column name "EGMS ID" as "AmendTermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate2 | 15             | 30              | 10                             | Final                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    And I wait for "5" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I wait for "2" seconds
    And I "Reject" in the approval decision
    Then I see status in Progress-bar is "Rejected" and is "Red"
    And I wait for "3" seconds
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:HomeCompletedTask---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:HomeCompletedTask---"

  @463595 @OpportunitiesconvertedtoApplicationManualVerifyEXEusercannavigatetoOpportunitydetailspageafterclickingonviewactionfortheOppprotunitywhichisconvertedtoPre-application
  Scenario Outline: OpportunitiesconvertedtoApplicationManualVerifyEXEusercannavigatetoOpportunitydetailspageafterclickingonviewactionfortheOppprotunitywhichisconvertedtoPre-application
    When I login to "As a Grantee" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Opportunities - All"
    When I perform quick search for "{AUTOEnvData:AutomationPermanentApplicationStaticRecord}" in "---grantee_tableId:-:opportunitysGranteeTableId---" panel
    And I click on "View" icon for "{AUTOEnvData:AutomationPermanentApplicationStaticRecord}" inside flex table with id "---grantee_tableId:-:opportunitysGranteeTableId---" without waiting for record
    Then I softly see field "Status" as "Converted to Application"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "Automation Permanent Application Static Record" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    Then I softly see field "Status" as "Converted to Application"
    Then I softly see field "Funding Organization" as "Department of Education"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download As PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    When I hovering mouse on help text icon inside page block detail "Expected Number of Awards"
    Then I softly see "The maximum number excepted is 999." shown as help text
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    Then I softly see field "Required Match(%)" inside page block
    Then I softly see field "Match Source" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail "Program Income Treatment Type"
    Then I softly see "•    Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. •    Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based.  •    Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Maximum Indirect Cost Rate" inside page block
    Then I softly see field "Rate for Organization Use" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "product.qa@ggp.test8.qagrnteatm"
    And I click on back arrow
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see field "1. Have we previously received an award from this sponsoring agency?" inside page block
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    Then I softly see field "2. What is the estimated probability of receiving a grant award?" inside page block
    Then I softly see field "2a. Briefly explain." inside page block
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see field "3. Do we have the business and technical domain knowledge?" inside page block
    Then I softly see field "3a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "3a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "4. Do we have the required resources and skill sets to perform the work?" inside page block
    Then I softly see field "4a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "4a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "5. Do we have the necessary systems and financial tools?" inside page block
    Then I softly see field "5a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "5a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "6. Provide the estimated number of hours required to develop the application. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "6. Provide the estimated number of hours required to develop the application. Provide an explanation."
    Then I softly see "add Text and number both are allowed. Must not exceed 650 characters" shown as help text
    Then I softly see field "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation."
    Then I softly see "Text and number both are allowed. Must not exceed 650 characters" shown as help text
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see field "8. Have other internal organizations within the Department qualified this lead?" inside page block
    Then I softly see field "8a. If yes, has an agreement been reached to which organization will be the lead?" inside page block
    Then I softly see field "9. Does this grant require a collaboration with other internal organizations within the Department?" inside page block
    Then I softly see field "9a. Please explain." inside page block
    Then I softly see "Financial Overview" page block displayed
    Then I softly see field "10. What is the expected funding request amount?" inside page block
    When I hovering mouse on help text icon inside page block detail "10. What is the expected funding request amount?"
    Then I softly see "Estimated Total Program Funding amount provided in the Financial Details." shown as help text
    Then I softly see field "10a. What is the stated award ceiling (if known)?" inside page block
    When I hovering mouse on help text icon inside page block detail "10a. What is the stated award ceiling (if known)?"
    Then I softly see "Maximum spending amount anticipated over the life of the project as provided in the Financial Details." shown as help text
    Then I softly see field "11. Is match required for this grant?" inside page block
    When I hovering mouse on help text icon inside page block detail "11. Is match required for this grant?"
    Then I softly see "Match Requirement setting as shown in the Financial Details" shown as help text
    Then I softly see field "11a. What is the match type." inside page block
    When I hovering mouse on help text icon inside page block detail "11a. What is the match type."
    Then I softly see "Cost Sharing or Matching Requirement selected in the Financial Details." shown as help text
    Then I softly see field "11b. If yes, identify the match sources." inside page block
    When I hovering mouse on help text icon inside page block detail "11b. If yes, identify the match sources."
    Then I softly see "Match Source as selected in the Financial Details." shown as help text
    Then I softly see field "11c. Required Match(%)" inside page block
    When I hovering mouse on help text icon inside page block detail "11c. Required Match(%)"
    Then I softly see "Required Match(%) as provided in the Financial Details." shown as help text
    Then I softly see field "12. Is program income anticipated?" inside page block
    When I hovering mouse on help text icon inside page block detail "12. Is program income anticipated?"
    Then I softly see "Is Program Income Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "12a. If yes, what is the program income treatment type?" inside page block
    When I hovering mouse on help text icon inside page block detail "12a. If yes, what is the program income treatment type?"
    Then I softly see "Program Income Treatment Type as selected in the Financial Details." shown as help text
    Then I softly see field "13. Is there a maintenance of effort required?" inside page block
    Then I softly see field "13a. If yes, describe the statutory maintenance of effort requirement." inside page block
    Then I softly see field "14. Does the grant require pass through funding to subrecipients?" inside page block
    Then I softly see field "14a. If yes, what is the percent of funding required to pass through to subrecipients." inside page block
    Then I softly see field "15. Does the grant allow indirect costs?" inside page block
    When I hovering mouse on help text icon inside page block detail "15. Does the grant allow indirect costs?"
    Then I softly see "Are Indirect Costs Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "15a. If yes, what rate will the organization use?" inside page block
    When I hovering mouse on help text icon inside page block detail "15a. If yes, what rate will the organization use?"
    Then I softly see "Rate for Organization Use as selected in the Financial Details." shown as help text
    Then I softly see field "15b. If Yes, Maximum Indirect Cost Rate." inside page block
    When I hovering mouse on help text icon inside page block detail "15b. If Yes, Maximum Indirect Cost Rate."
    Then I softly see "Maximum Indirect Cost Rate as provided in the Financial Details." shown as help text
    Then I softly see field "16. Is there an administrative cost limit?" inside page block
    Then I softly see field "16a. If yes, what percent is the administrative cost limit?" inside page block
    Then I softly see field "17. How will the program be sustained, should funding end?" inside page block
    Then I softly see "Certifications and Other" page block displayed
    Then I softly see field "18. Describe any additional legal requirements or policy impact from receiving an award." inside page block
    Then I softly see field "19. Describe any additional organizational certifications required or compliance requirements created as a result of an award." inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"

    Examples:
      | User       |
      | GRANTEE PM |

  @482415 @POuserVerifyUsershouldabletoapprovetheAwardwith4stepapprover
  Scenario:PO user ->Verify User should able to approve the Award with 4 step approver
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
    And I navigate to "Overview" sub tab
    When I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
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
    And I click on "Edit" in the page details
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    And I enter value "{SavedValue:ProjectPeriodEndDate}" into field "BudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 2 |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | David FO | Step 3 |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Grantee PO | Step 4 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "5" seconds
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I enter value "12345" into field "GrantNumber__c"
    And I enter value "Project Grant" into field "GrantType__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "{SavedValue:AwardEGMSID}" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "{SavedValue:AwardEGMSID}" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    When I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Approved"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Approved" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"

  @463440 @PreAppVerifywithPOprofilewithmultipleapproverabletoapprove.
  Scenario:PreApp - Verify with PO profile ,with multiple approver able to approve.
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
    And I enter "Grantee_Opp_PreAppYes_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    When I save the field labeled "Application Due Date" as "ApplicationDueDate"
    And I click on "Edit" in the page details
    And I enter value "No" into field "LetterOfIntentRequired__c"
    And I enter value "{SavedValue:ApplicationDueDate}" into field "PreApplicationDueDate__c"
    And I navigate to "Evaluation" sub tab
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
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_PreApp_Edition" values from "Application_Field_Values - backup.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:preAppAssociateContactTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:preApplicationContactTableId---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role                                   |
      | Sarah PM | Checked        | Project Director/Principal Investigator(PI/PD) |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:preAppAssociateBudgetTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:preAppAssociateFocusAreaTableId---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---" with wait for record
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:preAppllicationLineItemsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:preAppllicationLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationApprovalTableId---" by clicking "New" :
      | Name     | PreApplication |
      | David FO | NA             |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationApprovalTableId---" by clicking "New" :
      | PreApplication |
      | Step 3         |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Responsibilities - At least one approver is required |
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationApprovalTableId---" by clicking "New" :
      | Name     | PreApplication |
      | David FO | Step 1         |
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationApprovalTableId---" by clicking "New" :
      | Name       | PreApplication |
      | Victor EXE | Step 2         |
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationApprovalTableId---" by clicking "New" :
      | Name       | PreApplication |
      | Grantee PO | Step 3         |
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationApprovalTableId---" by clicking "New" :
      | Name     | PreApplication |
      | Sarah PM | Step 4         |
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:preApplicationApprovalTableId---" by clicking "Edit" :
      | Name     | PreApplication |
      | Sarah PM | Step 4         |
    Then I softly see the following messages in the page details contains:
      | You cannot specify the same user for multiple steps for PreApplication |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Pre-Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @463431 @PreAppVerifyWithPOprofileAbletoaddpeerreviewerwithAllowrecordEditingYes
  Scenario:PreApp - Verify With PO profile , Able to add peer reviewer with Allow record Editing - Yes.
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
    And I enter "Grantee_Opp_PreAppYes_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    When I save the field labeled "Application Due Date" as "ApplicationDueDate"
    And I click on "Edit" in the page details
    And I enter value "{SavedValue:ApplicationDueDate}" into field "PreApplicationDueDate__c"
    And I navigate to "Evaluation" sub tab
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
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_PreApp_Edition" values from "Application_Field_Values - backup.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "preAppEGMSID"
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
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:preAppAssociateBudgetTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:preAppAssociateFocusAreaTableId---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---" with wait for record
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:preAppllicationLineItemsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:preAppllicationLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:preApplicationPeerReviewTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:preAppEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:preAppEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:preApplicationPeerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Rating is required to save.   |
      | Comments is required to save. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:preApplicationPeerReviewTableId---"
    Then I softly cannot see row level action button "Enter Review" against "David FO" in flex table with id "---grantee_tableId:-:preApplicationPeerReviewTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Pre-Application - All"
    And I perform quick search for "{SavedValue:preAppEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:preAppEGMSID}" inside table
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:preApplicationPeerReviewTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:preApplicationPeerReviewTableId---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"

  @482394 @PMUserVerifythepeerreviewfunctionalityforaward
  Scenario:PM User-Verify the peer review functionality for award
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
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
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
    And I click on "Edit" in the page details
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    And I enter value "{SavedValue:ProjectPeriodEndDate}" into field "BudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    When I enter the following values into flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    Then I softly see that "Review Type" rendered in view mode only
    Then I softly see fields "Rating__c" is in edit mode
    Then I see textarea field "ReviewComments__c" is editable
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Rating is required to save.   |
      | Comments is required to save. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    Then I softly see "Edit" modal button
    Then I softly see "Submit Review" modal button
    And I click on submit review
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    When I click on "Resend for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    Then I softly see value "Sent for Review" for title "Status" inside table "---grantee_tableId:-:awardPeerReviewerTableId---"
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
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"

  @473992 @VerifytheallvalidationsofSF424formGrantsgovApplication
  Scenario:Verify the all fields of SF-424[V4.0] form Grants.gov Application
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0000660610" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I refresh the page
    And I wait for "3" seconds
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
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I wait for "10" seconds
    And I click on "Edit" in the page details
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | a. Legal Name is required to save.                                                                                                                              |
      | c. UEI is required to save.                                                                                                                                     |
      | Street1 is required to save.                                                                                                                                    |
      | City is required to save.                                                                                                                                       |
      | Zip / Postal Code is required to save.                                                                                                                          |
      | First Name is required to save.                                                                                                                                 |
      | Last Name is required to save.                                                                                                                                  |
      | Telephone Number is required to save.                                                                                                                           |
      | Email is required to save.                                                                                                                                      |
      | Other (specify) is required to save.                                                                                                                            |
      | 10. Name of Federal Agency is required to save.                                                                                                                 |
      | 11. Assistance Listing Number (Catalog of Federal Domestic Assistance Number) is required to save.                                                              |
      | Assistance Listing Number (CFDA) Title is required to save.                                                                                                     |
      | Title is required to save.                                                                                                                                      |
      | 15. Descriptive Title of Applicant's Project is required to save.                                                                                               |
      | a. Applicant is required to save.                                                                                                                               |
      | b. Program/Project is required to save.                                                                                                                         |
      | a. Start Date is required to save.                                                                                                                              |
      | b. End Date is required to save.                                                                                                                                |
      | a. Federal is required to save.                                                                                                                                 |
      | b. Applicant is required to save.                                                                                                                               |
      | c. State is required to save.                                                                                                                                   |
      | d. Local is required to save.                                                                                                                                   |
      | e. Other is required to save.                                                                                                                                   |
      | f. Program Income is required to save.                                                                                                                          |
      | 19. Is Application Subject to Review By State Under Executive Order 12372 Process? is required to save.                                                         |
      | 20. Is the Applicant Delinquent On Any Federal Debt? (If "Yes," provide explanation in attachments. Add attachment from the Files section) is required to save. |
      | I AGREE is required to save.                                                                                                                                    |
      | First Name is required to save.                                                                                                                                 |
      | Last Name is required to save.                                                                                                                                  |
      | Title is required to save.                                                                                                                                      |
      | Telephone Number is required to save.                                                                                                                           |
      | Email is required to save.                                                                                                                                      |
      | Signature of Authorized Representative is required to save.                                                                                                     |
      | Date Signed is required to save.                                                                                                                                |
    And I wait for "3" seconds
    When I click on "Cancel" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    When I click modal button "OK"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    Then I softly see value "100.00%" for title "Percentage" against the value "Application for Federal Assistance (SF-424)" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"

  @485527 @485530 @485532 @485534 @485300 @FCAmdVerifythatPOuserseeIndirectRatesection&theirFieldsunderOverviewTabinFundingChangeAmendmentRequestlayout
  Scenario: FC Amd-->Verify that PO  user see Indirect Rate section & their Fields under Overview Tab in Funding Change Amendment Request layout
    When I login to "As a Grantee" app as "GRANTEE PO" user
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
    And I wait for "2" seconds
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Grantee PO | Step 1 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 2 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
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
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:Title}" for title "Title" inside table "---grantee_tableId:-:SpecialConditionTableId---"
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
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
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
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
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I wait for "3" seconds
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    #485527
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Effective from" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Effective until" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Approved Indirect Cost Rate(%)" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Indirect Cost Rate Type" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see value "{SavedValue:Title}" for title "Title" inside table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Approved Indirect Cost Rate(%)" as "ApprovedIndirectCostRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see value "{SavedValue:ApprovedIndirectCostRate}" for title "Approved Indirect Cost Rate(%)" inside table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Indirect Cost Rate Type" as "IndirectCostRateType" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see value "{SavedValue:IndirectCostRateType}" for title "Indirect Cost Rate Type" inside table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly can see row level action button "Edit" against "Rate" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly can see row level action button "Delete" against "Rate" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see that "GeneralConditionChanged__c" rendered in view mode only
    And I click on "Edit" in the page details
    Then I softly see field "Required Match(%)" inside page block
    Then I softly see field "Required Match(%)" as "10.00%"
    Then I softly see that "Required Match(%)" rendered in view mode only
    Then I softly see fields "GeneralConditionChanged__c" is in edit mode
    And I enter value "Checked" into field "GeneralConditionChanged__c"
    And I enter value "Checked" into field "AreTCspartofNGAAttachments__c"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    Then I softly see "Amendment Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Terms and Conditions" has been added in "Amendment Files" flex table
    And I navigate to "Overview" sub tab
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:Title}" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Date Effective From" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Date Effective To" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "From Previous Award" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Delete" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Details" page block displayed
    Then I softly see "General Condition" page block displayed
    Then I softly see "Special Conditions" page block displayed
    Then I softly see that "GeneralConditionChanged__c" rendered in view mode only
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "Terms" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly cannot see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly cannot see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I navigate to "Files" sub tab
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"

  @485536 @485539 @485540 @485544 @485545 @485586 @485587 @485589 @485591 @BPCAmdVerifythatFOuserseeDetailssection&theirFieldsunderOverviewTabinBudgetPeriodChangeAmendmentRequestlayout
  Scenario Outline:BPC Amd-->Verify that FO user see Details section & their Fields under Overview Tab in Budget Period Change Amendment Request layout
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
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
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:Title}" for title "Title" inside table "---grantee_tableId:-:SpecialConditionTableId---"
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_BPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_BPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    #@485544
    And I navigate to "Overview" sub tab
    Then I softly see "Details" page block displayed
    Then I softly see field "Grant EGMS ID" inside page block
    Then I softly see link "{SavedValue:GrantEGMSID}" inside Page block
    Then I softly see field "Grant Number" inside page block
    Then I softly see field "Grant Number" as "{SavedValue:GrantNumber}"
    Then I softly see field "Grant Award Number" inside page block
    Then I softly see field "Grant Award Number" as "{SavedValue:GrantAwardNumber}"
    Then I softly see field "Award EGMS ID" inside page block
    Then I softly see field "Award EGMS ID" as "{SavedValue:AwardEGMSID}"
    Then I softly see field "Impact" inside page block
    Then I softly see field "Justification" inside page block
     #@485539 #@485545
    Then I softly see "Budget Period Change" page block displayed
    Then I softly see field "Budget Period" inside page block
    Then I softly see field "New Budget Period End Date" inside page block
    And I click on "Edit" in the page details
    Then I softly see fields "Award__r.BudgetStartEndDate__c" is in edit mode
    Then I softly see that "New Budget Period End Date" rendered in view mode only
    And I click on "Save" in the page details
    #485540
    Then I softly see "Focus Areas" page block displayed
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see "Start Date" in flex table header "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see "End Date" in flex table header "---grantee_tableId:-:amendmentFocusAreaTableId---"
    #@485586
    Then I softly see that "GeneralConditionChanged__c" rendered in view mode only
    Then I softly do not see fields "AreTCspartofNGAAttachments__c" is visible
    Then I softly do not see fields "FederalTCLink__c" is visible
    And I click on "Edit" in the page details
    Then I softly see fields "GeneralConditionChanged__c" is in edit mode
    And I enter value "Checked" into field "GeneralConditionChanged__c"
    And I enter value "Checked" into field "AreTCspartofNGAAttachments__c"
    And I click on "Save" in the page details
    #@485587
    Then I softly see value "{SavedValue:Title}" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Date Effective From" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Date Effective To" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "From Previous Award" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    #@485589
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Effective from" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Effective until" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Approved Indirect Cost Rate(%)" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Indirect Cost Rate Type" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    # @485591
    And I navigate to "Files" sub tab
    Then I softly see "Amendment Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Terms and Conditions" has been added in "Amendment Files" flex table
    Examples:
      | User       |
      | GRANTEE FO |
      | GRANTEE PO |

  @473994 @Verifyusershouldabletoseethecolumnsonformssection
  Scenario:Verify user should able to see the columns on forms section
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "AP--536" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "AP--536" inside table
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see link "grants.gov" inside Page block
    Then I softly see "Form Name" in flex table header "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see "Mandatory" in flex table header "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see "Percentage" in flex table header "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see "Last Modified By Name" in flex table header "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see "Validated" in flex table header "---grantee_tableId:-:applicationBusinessFormTableId---"

  @482632 @482633 @VerifyAdminuserNonownercanviewawarddetailspagebutcannotseeeditactiononaward
  Scenario Outline:Verify Admin  user(Non owner) can view award details page but cannot see edit action on award
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{grantee_testData:grantgovtAwardCreateState}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{grantee_testData:grantgovtAwardCreateState}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download As PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardContactTableId---"
    And I navigate to "Projections" sub tab
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:ProjectTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardApproverTableId---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardsNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"

    Examples:
      | User            |
      | GRANTEE ADMIN   |
      | GRANTEE AUDITOR |

  @485867 @BPCARVerifyPOuserNonrecordownercanonlyviewBPCofamendmentrequestandcannotseeeditbuttontoedittheamendment
  Scenario: BPC AR  -Verify PO user (Non record owner) can only view BPC of amendment request and cannot see edit button to edit the amendment
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
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_BPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_BPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "BPCAMENDID"
    And I save the field labeled "New Budget Period End Date" as "NewBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | End Date                            |
      | Automation Permanent Focus Area | {SavedValue:NewBudgetPeriodEndDate} |
    And I wait for "3" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms1" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I save the value from row "1" for column name "Title" as "Terms1" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:Terms1}" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate1 | 15             | 30              | 10                             | Final                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Terms and Conditions" has been added in "Amendment Files" flex table
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Delete" in page detail
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Title" as "Rate1" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see value "{SavedValue:Rate1}" for title "Title" inside table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly cannot see row level action button "view" against "{SavedValue:Rate1}" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Rate1}" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:Rate1}" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Terms1}" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Terms1}" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:Terms1}" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see that "GeneralConditionChanged__c" rendered in view mode only
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly cannot see row level action button "view" against "Victor EXE" in flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly cannot see row level action button "Delete" against "Victor EXE" in flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "view" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I navigate to "Files" sub tab
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Amendments" sub tab
    Then I softly cannot see row level action button "Edit" against "{SavedValue:BPCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:BPCAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"

  @485452 @485379 @VerifyFOuserAROwnercannotabletoseeActivatebuttonfornewlyawardfromFundingChangeamendment
  Scenario Outline: Verify FO user (AR Owner)cannot able to see Activate button for newly award from Funding Change amendment
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
    And I wait for "2" seconds
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
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
    When I re-login to "As a Grantee" app as "<User>" user on "INTERNAL" portal
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
    When I re-login to "As a Grantee" app as "<User>" user on "INTERNAL" portal
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
    Then I cannot see top right button "Activate Award" in page detail

    Examples:
      | User       |
      | GRANTEE FO |
      | GRANTEE FD |

  @482627 @482628 @482629 @482630 @482631 @VerifyPOuserNonownercanviewawarddetailspagebutcannotseeeditactiononaward
  Scenario Outline:Verify PO user(Non owner) can view award details page but cannot see edit action on award
    Given I login to "As a Grantee" app as "<OwnerType>" user
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
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
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
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
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
    And I navigate to "Overview" sub tab
    When I save the field labeled "EGMS ID" as "awardEGMSID"
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
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
    And I click on "Edit" in the page details
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    And I enter value "{SavedValue:ProjectPeriodEndDate}" into field "BudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 2 |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | David FO | Step 3 |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Grantee PO | Step 4 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "5" seconds
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I enter value "12345" into field "GrantNumber__c"
    And I enter value "Project Grant" into field "GrantType__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "{SavedValue:awardEGMSID}" in "---grantee_tableId:-:awardTableId---" panel
    Then I cannot see row level action button "Edit" against "{SavedValue:awardEGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:awardEGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    And I click on "View" icon for "{SavedValue:awardEGMSID}" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download As PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly can see row level action button "View" against "Open Data Framework" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see row level action button "Edit" against "Open Data Framework" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see row level action button "Remove" against "Open Data Framework" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly cannot see row level action button "Remove" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I navigate to "Projections" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardApproverTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "View" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I save the value from row "1" for column name "Title" as "TitleFiles" from flex table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "{SavedValue:TitleFiles}" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Download" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    And I save the value from row "1" for column name "Title" as "TitleNotes" from flex table "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly see value "{SavedValue:TitleNotes}" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly cannot see row level action button "View" against "{SavedValue:TitleNotes}" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TitleNotes}" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:TitleNotes}" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Examples:
      | UserType    | OwnerType  |
      | GRANTEE PO  | GRANTEE PM |
      | GRANTEE EXE | GRANTEE PM |
      | GRANTEE FO  | GRANTEE PM |
      | GRANTEE FD  | GRANTEE PM |
      | GRANTEE PM  | GRANTEE PO |

  @471004 @BudgetPeriodchangeTypeARVerifytheNotificationforBudgetPeriodchangetypeofAmendmentRequets
  Scenario:Budget Period change Type AR-Verify the Notification for Budget Period change type of Amendment Requets
    When I login to "As a Grantee" app as "GRANTEE PO" user
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_BPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_BPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID"
    And I save the field labeled "New Budget Period End Date" as "NewBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | End Date                            |
      | Automation Permanent Focus Area | {SavedValue:NewBudgetPeriodEndDate} |
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | David FO      | Program Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I click on notification icon
    Then I softly see notification "Grantee PO assigned you a task" contains "Automation Runtime Direct"
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:AmendEGMSID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "{SavedValue:AmendEGMSID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 2            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "Danielle FD Garcia" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see the following messages in the page details contains:
      | Successfully Re-Assigned |
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I click on notification icon
    Then I softly see notification "Sarah PM assigned you a task" contains "{SavedValue:Automation Runtime Direct}"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
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
    Then I softly do not see notification "Grantee PO assigned you a task" contains "{SavedValue:Automation Runtime Direct}"

  @471004_1 @BudgetPeriodchangeTypeARVerifytheNotificationforBudgetPeriodchangetypeofAmendmentRequets
  Scenario:Budget Period change Type AR-Verify the Notification for Budget Period change type of Amendment Requets
    When I login to "As a Grantee" app as "GRANTEE PO" user
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_BPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_BPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID"
    And I save the field labeled "New Budget Period End Date" as "NewBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | End Date                            |
      | Automation Permanent Focus Area | {SavedValue:NewBudgetPeriodEndDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 2            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I "Reject" in the approval decision
    And I refresh the page
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Rejected" and is "Red"
    When I click on notification icon
    And I wait for "2" seconds
    Then I softly do not see notification "Sarah PM assigned you a task" contains "{SavedValue:Automation Runtime Direct}"

  @485478 @FundingChangeTypeARVerifytheNotificationforFundingchangetypeofAmendmentRequets
  Scenario:Funding Change Type AR-Verify the Notification for Funding change type of Amendment Requets
    When I login to "As a Grantee" app as "GRANTEE PO" user
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
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
    When I click on "Add Line Items" icon for "Equipment" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title     | Narrative     | Awarded Budget | Cash Match | Other Leverage |
      | Equipment | The narrative | 2000           | 200        | 200            |
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | David FO      | Program Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I click on notification icon
    Then I softly see notification "Grantee PO assigned you a task" contains "Automation Runtime Direct"
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 2            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "Danielle FD Garcia" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see the following messages in the page details contains:
      | Successfully Re-Assigned |
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I click on notification icon
    Then I softly see notification "Sarah PM assigned you a task" contains "Automation Runtime Direct"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
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
    Then I softly do not see notification "Grantee PO assigned you a task" contains "{SavedValue:Automation Runtime Direct}"

  @485478_1 @FundingChangeTypeARVerifytheNotificationforFundingchangetypeofAmendmentRequets
  Scenario:Funding Change Type AR-Verify the Notification for Funding change type of Amendment Requets
    When I login to "As a Grantee" app as "GRANTEE PO" user
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
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
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID"
    And I save the field labeled "New Budget Period End Date" as "NewBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | End Date                            |
      | Automation Permanent Focus Area | {SavedValue:NewBudgetPeriodEndDate} |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 2            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I "Reject" in the approval decision
    And I refresh the page
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Rejected" and is "Red"
    When I click on notification icon
    Then I softly do not see notification "Sarah PM assigned you a task" contains "{SavedValue:Automation Runtime Direct}"

  @487040 @487061 @487062 @487063 @487064 @CombinationofamendmentVerifyPOuserAROwnercanabletoForwardAmendmentRequestfromApprovalProcess
  Scenario Outline: Combination of amendment - Verify PO user (AR Owner) can able to Forward Amendment Request from Approval Process
    When I login to "As a Grantee" app as "GRANTEE PO" user
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
    And I save the value from row "1" for column name "Name" as "ContactName" from flex table "---grantee_tableId:-:awardContactTableId---"
    And I save the value from row "1" for column name "Project Role" as "ProjectRole" from flex table "---grantee_tableId:-:awardContactTableId---"
    And I save the value from row "1" for column name "Is Key Contact" as "IsKeyContact" from flex table "---grantee_tableId:-:awardContactTableId---"
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_Combination_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_Combination_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "New Budget Period End Date" as "NewBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | End Date                            |
      | Automation Permanent Focus Area | {SavedValue:NewBudgetPeriodEndDate} |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Narrative     | Awarded Budget | Cash Match |
      | Construction | The narrative | 4500           | 450        |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Indirect costs" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title          | Narrative     | Awarded Budget | Cash Match |
      | Indirect costs | The narrative | 500            | 50         |
    When I close "Add Line Items" modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    Then I softly see "Details" page block displayed
    Then I softly see "Key Personnel Change" page block displayed
    Then I softly see "Award Description" page block displayed
    Then I softly see "Place of Performance" page block displayed
    Then I softly see "Other Changes" page block displayed
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "Budget Period Change" page block displayed
    Then I softly see "Focus Areas" page block displayed
    Then I softly see "Budget Change" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see "General Condition" page block displayed
    Then I softly see "Special Conditions" page block displayed
    Then I softly see "System Information" page block displayed
    When I save the field labeled "Description of Other Changes" as "Description1"
    When I save the field labeled "Justification for Purpose and Summary" as "Description2"
    When I save the field labeled "If Other amendment type, explain" as "Description3"
    Then I softly see value "{SavedValue:ContactName}" for title "Proposed Name" inside table "---grantee_tableId:-:amendmentContactTableId---"
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentContactTableId---"
    When I click "Associate" after selection of "David FO" in the table "---grantee_tableId:-:amendmentAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentContactTableId---" by clicking "Edit" :
      | Proposed Name | Project Role    | Is Key Contact |
      | David FO      | Project Officer | Checked        |
    And I save the value from row "1" for column name "Proposed Name" as "ProposedName" from flex table "---grantee_tableId:-:amendmentContactTableId---"
    Then I softly see value "{SavedValue:ProposedName}" for title "Proposed Name" inside table "---grantee_tableId:-:amendmentContactTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentObjectiveTableId---"
    When I click "Associate" after selection of "MI_Objective" in the table "---grantee_tableId:-:amendmentAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Objectives were associated successfully. |
    And I click modal button "Close"
    And I save the value from row "1" for column name "Title" as "ObjectiveTitle" from flex table "---grantee_tableId:-:amendmentObjectiveTableId---"
    Then I softly see value "{SavedValue:ObjectiveTitle}" for title "Title" inside table "---grantee_tableId:-:amendmentObjectiveTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentKPITableId---"
    When I click "Associate" after selection of "KPI Grantee ETE" in the table "---grantee_tableId:-:selectAmendmentKPITableId---"
    And I click modal button "Close"
    And I save the value from row "1" for column name "Title" as "KPITitle" from flex table "---grantee_tableId:-:amendmentKPITableId---"
    Then I softly see value "{SavedValue:KPITitle}" for title "Title" inside table "---grantee_tableId:-:amendmentKPITableId---"
    And I click on "Edit" in the page details
    Then I softly see fields "GeneralConditionChanged__c" is in edit mode
    And I enter value "Checked" into field "GeneralConditionChanged__c"
    And I enter value "Checked" into field "AreTCspartofNGAAttachments__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms1" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I save the value from row "1" for column name "Title" as "Terms1" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:Terms1}" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate1 | 15             | 30              | 10                             | Final                   |
    And I save the value from row "1" for column name "Title" as "TitleIndirectRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective from" as "Effectivefrom" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Effective until" as "Effectiveuntil" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Approved Indirect Cost Rate(%)" as "ApprovedIndirectCostRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I wait for "3" seconds
    And I save the field labeled "New Budget Period End Date" as "NewBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | End Date                            |
      | Automation Permanent Focus Area | {SavedValue:NewBudgetPeriodEndDate} |
    And I wait for "3" seconds
    And I save the value from row "1" for column name "Title" as "FocusArea1" from flex table "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see value "{SavedValue:FocusArea1}" for title "Title" inside table "---grantee_tableId:-:amendmentFocusAreaTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 1            |
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Terms and Conditions" has been added in "Amendment Files" flex table
    And I save the value from row "1" for column name "Classification" as "Classification" from flex table "---grantee_tableId:-:amendmentRequestAddFile---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "{SavedValue:Title}" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "{SavedValue:Classification}" for title "Classification" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Victor EXE    | Fiscal Reviewer | Automation Description | 5        | No                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I click on "Send for Review" icon for "Victor EXE" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Victor EXE" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:AmendEGMSID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:AmendEGMSID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    And I wait for "3" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
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
    And I navigate to "Overview" sub tab
    Then I softly see value "Open Data Framework" for title "Title" inside table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see value "{SavedValue:ProposedName}" for title "Name" inside table "---grantee_tableId:-:awardContactTableId---"
    Then I softly see field "Description of Other Changes" as "{SavedValue:Description1}"
    Then I softly see field "Justification for Purpose and Summary" as "{SavedValue:Description2}"
    Then I softly see field "If Other amendment type, explain" as "{SavedValue:Description3}"
    And I navigate to "Projections" sub tab
    And I wait for "3" seconds
    When I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    Then I softly see field "Budget Period Start Date" as "{SavedValue:BudgetPeriodStartDate}"
    When I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    Then I softly see field "Budget Period End Date" as "{SavedValue:BudgetPeriodEndDate}"
    Then I softly see value "{SavedValue:FocusArea1}" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see value "$500.00" for title "Award  Budget" against the value "Indirect costs" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$50.00" for title "Cash Match" against the value "Indirect costs" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$0.00" for title "Other Leverage" against the value "Indirect costs" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$550.00" for title "Total Project Cost" against the value "Indirect costs" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "{SavedValue:FocusArea1}" for title "Title" inside table "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see value "{SavedValue:TitleIndirectRate}" for title "Title" inside table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see value "{SavedValue:Effectivefrom}" for title "Effective from" inside table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see value "{SavedValue:Effectiveuntil}" for title "Effective until" inside table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see value "{SavedValue:ApprovedIndirectCostRate}" for title "Approved Indirect Cost Rate(%)" inside table "---grantee_tableId:-:awardIndirectRateTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see value "{SavedValue:ObjectiveTitle}" for title "Title" inside table "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see value "{SavedValue:KPITitle}" for title "Title" inside table "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see value "{SavedValue:Terms1}" for title "Title" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    And I navigate to "Files" sub tab
    Then I softly see value "{SavedValue:Classification}" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "{SavedValue:Title}" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I click on "Activate Award" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    When I re-login to "As a Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    And I navigate to "Overview" sub tab
    Then I softly see value "Open Data Framework" for title "Title" inside table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see value "{SavedValue:ProposedName}" for title "Name" inside table "---grantee_tableId:-:awardContactTableId---"
    Then I softly see field "Description of Other Changes" as "{SavedValue:Description1}"
    Then I softly see field "Justification for Purpose and Summary" as "{SavedValue:Description2}"
    Then I softly see field "If Other amendment type, explain" as "{SavedValue:Description3}"
    And I navigate to "Projections" sub tab
    And I wait for "3" seconds
    When I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    Then I softly see field "Budget Period Start Date" as "{SavedValue:BudgetPeriodStartDate}"
    When I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    Then I softly see field "Budget Period End Date" as "{SavedValue:BudgetPeriodEndDate}"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see value "$500.00" for title "Award  Budget" against the value "Indirect costs" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$50.00" for title "Cash Match" against the value "Indirect costs" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$0.00" for title "Other Leverage" against the value "Indirect costs" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$550.00" for title "Total Project Cost" against the value "Indirect costs" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "{SavedValue:FocusArea1}" for title "Title" inside table "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see value "{SavedValue:TitleIndirectRate}" for title "Title" inside table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see value "{SavedValue:Effectivefrom}" for title "Effective from" inside table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see value "{SavedValue:Effectiveuntil}" for title "Effective until" inside table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see value "{SavedValue:ApprovedIndirectCostRate}" for title "Approved Indirect Cost Rate(%)" inside table "---grantee_tableId:-:awardIndirectRateTableId---"
    When I navigate to "Actuals" sub tab
    When I save the field labeled "Grant Amount" as "GrantAmount"
    Then I softly see field "Grant Amount" as "{SavedValue:GrantAmount}"
    When I save the field labeled "Total Awarded Budget" as "TotalAwardedBudget"
    Then I softly see field "Total Awarded Budget" as "{SavedValue:TotalAwardedBudget}"
    When I save the field labeled "Drawn to Date" as "DrawntoDate"
    Then I softly see field "Drawn to Date" as "{SavedValue:DrawntoDate}"
    When I save the field labeled "Spent to Date" as "SpenttoDate"
    Then I softly see field "Spent to Date" as "{SavedValue:SpenttoDate}"
    When I save the field labeled "Remaining Balance" as "RemainingBalance"
    Then I softly see field "Remaining Balance" as "{SavedValue:RemainingBalance}"
    When I save the field labeled "Total Match Expenditures to Date this Budget Period" as "TotalMatchExpenditurestoDatethisBudgetPeriod"
    Then I softly see field "Total Match Expenditures to Date this Budget Period" as "{SavedValue:TotalMatchExpenditurestoDatethisBudgetPeriod}"
    When I save the field labeled "Total Program Income Revenue this Budget Period" as "TotalProgramIncomeRevenuethisBudgetPeriod"
    Then I softly see field "Total Program Income Revenue this Budget Period" as "{SavedValue:TotalProgramIncomeRevenuethisBudgetPeriod}"
    When I save the field labeled "Total Leverage" as "TotalLeverage"
    Then I softly see field "Total Leverage" as "{SavedValue:TotalLeverage}"
    Then I softly see value "$500.00" for title "Award Budget" against the value "Indirect costs" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Expenditures to Date" against the value "Indirect costs" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Carry-Forward" against the value "Indirect costs" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$500.00" for title "Remaining Budget" against the value "Indirect costs" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Cash Match" against the value "Indirect costs" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Program Income Expenditures" against the value "Indirect costs" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I see value "$0.00" for title "Original Program Income Earned" against the value "Automation Permanent Focus Area" inside table "---grantee_tableId:-:awardProgramRevenueTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see value "{SavedValue:ObjectiveTitle}" for title "Title" inside table "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see value "{SavedValue:KPITitle}" for title "Title" inside table "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see value "{SavedValue:Terms1}" for title "Title" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    And I navigate to "Files" sub tab
    Then I softly see value "{SavedValue:Classification}" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "{SavedValue:Title}" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see value "Open Data Framework" for title "Title" inside table "---grantee_tableId:-:grantExternalProgramTableId---"
    Then I softly do not see value "{SavedValue:ProposedName}" for title "Name" inside table "---grantee_tableId:-:GranteeGrantContact---"
    Then I softly see value "{SavedValue:FocusArea1}" for title "Title" inside table "---grantee_tableId:-:grantFocusAreaTableId---"
    And I navigate to "Financials" sub tab
    When I save the field labeled "Total Anticipated Amount" as "TotalAnticipatedAmount"
    Then I softly see field "Total Anticipated Amount" as "{SavedValue:TotalAnticipatedAmount}"
    When I save the field labeled "Award Amount to Date" as "AwardAmounttoDate"
    Then I softly see field "Award Amount to Date" as "{SavedValue:AwardAmounttoDate}"
    When I save the field labeled "Expenditures to Date" as "ExpenditurestoDate"
    Then I softly see field "Expenditures to Date" as "{SavedValue:ExpenditurestoDate}"
    When I save the field labeled "Remaining Budget" as "RemainingBudget"
    Then I softly see field "Remaining Budget" as "{SavedValue:RemainingBudget}"
    When I save the field labeled "Budgeted Cash Match" as "BudgetedCashMatch"
    Then I softly see field "Budgeted Cash Match" as "{SavedValue:BudgetedCashMatch}"
    When I save the field labeled "Budgeted Match" as "BudgetedMatch"
    Then I softly see field "Budgeted Match" as "{SavedValue:BudgetedMatch}"
    When I save the field labeled "Remaining Match" as "RemainingMatch"
    Then I softly see field "Remaining Match" as "{SavedValue:RemainingMatch}"
    When I save the field labeled "Budgeted Leverage" as "BudgetedLeverage"
    Then I softly see field "Budgeted Leverage" as "{SavedValue:BudgetedLeverage}"
    When I save the field labeled "Total Anticipated Program Income" as "TotalAnticipatedProgramIncome"
    Then I softly see field "Total Anticipated Program Income" as "{SavedValue:TotalAnticipatedProgramIncome}"
    When I save the field labeled "Total Program Income Expenditure" as "TotalProgramIncomeExpenditure"
    Then I softly see field "Total Program Income Expenditure" as "{SavedValue:TotalProgramIncomeExpenditure}"
    When I save the field labeled "Total Project Cost" as "TotalProjectCost"
    Then I softly see field "Total Project Cost" as "{SavedValue:TotalProjectCost}"
    Given I expand nested table containing column value "BP01"
    Then I softly see value "$500.00" for title "Awarded Budget" against the value "Indirect costs" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$50.00" for title "Cash Match" against the value "Indirect costs" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$0.00" for title "Other Leverage" against the value "Indirect costs" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$550.00" for title "Total Project Cost" against the value "Indirect costs" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see value "{SavedValue:ObjectiveTitle}" for title "Title" inside table "---grantee_tableId:-:grantGoalsTableId---"
    Then I softly see value "{SavedValue:KPITitle}" for title "Title" inside table "---grantee_tableId:-:grantKPITableId---"
    And I navigate to "Management" sub tab
    Then I softly see "Change Requests" page block displayed
    Then I softly see value "Accepted" for title "Status" against the value "{SavedValue:AmendEGMSID}" inside table "---grantee_tableId:-:GrantsAmendmentRequestsTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "{SavedValue:AwardEGMSID2}" for title "New Value" inside field history table
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "Original Value" inside field history table
    Examples:
      | User           |
      | GRANTEE EXE    |
      | GRANTEE PM     |
      | GRANTEE PO     |
      | GRANTEE ADMIN1 |
      | GRANTEE FO     |

  @487067 @487073 @CombinationofamendmentVerifyPOuserAROwnercanabletoForwardAmendmentRequestfromApprovalProcess
  Scenario: Combination of amendment - Verify PO user (AR Owner) can able to Forward Amendment Request from Approval Process
    When I login to "As a Grantee" app as "GRANTEE PO" user
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
    And I save the value from row "1" for column name "Name" as "ContactName" from flex table "---grantee_tableId:-:awardContactTableId---"
    And I save the value from row "1" for column name "Project Role" as "ProjectRole" from flex table "---grantee_tableId:-:awardContactTableId---"
    And I save the value from row "1" for column name "Is Key Contact" as "IsKeyContact" from flex table "---grantee_tableId:-:awardContactTableId---"
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    #@487067
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_Combination_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_Combination_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "New Budget Period End Date" as "NewBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | End Date                            |
      | Automation Permanent Focus Area | {SavedValue:NewBudgetPeriodEndDate} |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Narrative     | Awarded Budget | Cash Match |
      | Construction | The narrative | 4500           | 450        |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Indirect costs" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title          | Narrative     | Awarded Budget | Cash Match |
      | Indirect costs | The narrative | 500            | 50         |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentContactTableId---"
    When I click "Associate" after selection of "David FO" in the table "---grantee_tableId:-:amendmentAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentContactTableId---" by clicking "Edit" :
      | Proposed Name | Project Role    | Is Key Contact |
      | David FO      | Project Officer | Checked        |
    And I save the value from row "1" for column name "Proposed Name" as "ProposedName" from flex table "---grantee_tableId:-:amendmentContactTableId---"
    Then I softly see value "{SavedValue:ProposedName}" for title "Proposed Name" inside table "---grantee_tableId:-:amendmentContactTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentObjectiveTableId---"
    When I click "Associate" after selection of "MI_Objective" in the table "---grantee_tableId:-:amendmentAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Objectives were associated successfully. |
    And I click modal button "Close"
    And I save the value from row "1" for column name "Title" as "ObjectiveTitle" from flex table "---grantee_tableId:-:amendmentObjectiveTableId---"
    Then I softly see value "{SavedValue:ObjectiveTitle}" for title "Title" inside table "---grantee_tableId:-:amendmentObjectiveTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentKPITableId---"
    When I click "Associate" after selection of "KPI Grantee ETE" in the table "---grantee_tableId:-:selectAmendmentKPITableId---"
    And I click modal button "Close"
    And I save the value from row "1" for column name "Title" as "KPITitle" from flex table "---grantee_tableId:-:amendmentKPITableId---"
    Then I softly see value "{SavedValue:KPITitle}" for title "Title" inside table "---grantee_tableId:-:amendmentKPITableId---"
    And I wait for "3" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms1" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I save the value from row "1" for column name "Title" as "Terms1" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:Terms1}" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate1 | 15             | 30              | 10                             | Final                   |
    And I save the value from row "1" for column name "Title" as "TitleIndirectRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I wait for "3" seconds
    And I save the field labeled "New Budget Period End Date" as "NewBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | End Date                            |
      | Automation Permanent Focus Area | {SavedValue:NewBudgetPeriodEndDate} |
    And I wait for "3" seconds
    And I save the value from row "1" for column name "Title" as "FocusArea1" from flex table "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see value "{SavedValue:FocusArea1}" for title "Title" inside table "---grantee_tableId:-:amendmentFocusAreaTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 1            |
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Terms and Conditions" has been added in "Amendment Files" flex table
    And I save the value from row "1" for column name "Classification" as "Classification" from flex table "---grantee_tableId:-:amendmentRequestAddFile---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "{SavedValue:Title}" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "{SavedValue:Classification}" for title "Classification" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Victor EXE    | Fiscal Reviewer | Automation Description | 5        | No                   |
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:AmendEGMSID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "{SavedValue:AmendEGMSID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    And I navigate to "Overview" sub tab
    Then I softly see value "David FO" for title "Proposed Name" inside table "---grantee_tableId:-:amendmentContactTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentContactTableId---"
    Then I cannot see row level action button "View" against "David FO" in flex table with id "---grantee_tableId:-:amendmentContactTableId---"
    Then I cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentContactTableId---"
    Then I cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:amendmentContactTableId---"
    Then I softly see value "{SavedValue:ObjectiveTitle}" for title "Title" inside table "---grantee_tableId:-:amendmentObjectiveTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentObjectiveTableId---"
    Then I cannot see row level action button "View" against "{SavedValue:ObjectiveTitle}" in flex table with id "---grantee_tableId:-:amendmentObjectiveTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:ObjectiveTitle}" in flex table with id "---grantee_tableId:-:amendmentObjectiveTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:ObjectiveTitle}" in flex table with id "---grantee_tableId:-:amendmentObjectiveTableId---"
    Then I softly see value "{SavedValue:KPITitle}" for title "Title" inside table "---grantee_tableId:-:amendmentKPITableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentKPITableId---"
    Then I cannot see row level action button "View" against "{SavedValue:KPITitle}" in flex table with id "---grantee_tableId:-:amendmentKPITableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:KPITitle}" in flex table with id "---grantee_tableId:-:amendmentKPITableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:KPITitle}" in flex table with id "---grantee_tableId:-:amendmentKPITableId---"
    Then I softly see value "{SavedValue:TitleIndirectRate}" for title "Title" inside table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I cannot see row level action button "View" against "{SavedValue:TitleIndirectRate}" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:TitleIndirectRate}" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:TitleIndirectRate}" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see value "{SavedValue:Terms1}" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I can see row level action button "View" against "{SavedValue:Terms1}" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Terms1}" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Terms1}" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:FocusArea1}" for title "Title" inside table "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I cannot see row level action button "View" against "{SavedValue:FocusArea1}" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:FocusArea1}" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:FocusArea1}" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see value "Victor EXE" for title "Title" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I cannot see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I cannot see row level action button "Delete" against "Victor EXE" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly see value "Sarah PM" for title "Title" inside table "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I cannot see row level action button "View" against "Sarah PM" in flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I cannot see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I cannot see row level action button "Delete" against "Sarah PM" in flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "{SavedValue:Title}" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "{SavedValue:Classification}" for title "Classification" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "Download" against "{SavedValue:Classification}" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "View" against "{SavedValue:Classification}" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Classification}" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Classification}" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I save the value from row "1" for column name "Description" as "Description" from flex table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly see value "{SavedValue:Description}" for title "Description" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I cannot see row level action button "Download" against "{SavedValue:Description}" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I cannot see row level action button "View" against "{SavedValue:Description}" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Description}" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Description}" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"

  @471672 @CombinationofamendmentVerifythatPOuserabletoDeleteamendmentrequestinCreated&RevisioninProgressstateonARlayout
  Scenario:Combination of amendment - Verify that PO user able to Delete amendment request in Created & Revision in Progress state on AR layout
    When I login to "As a Grantee" app as "GRANTEE PO" user
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_Combination_Creation2" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_Combination_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentContactTableId---"
    When I click "Associate" after selection of "David FO" in the table "---grantee_tableId:-:amendmentAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentContactTableId---" by clicking "Edit" :
      | Proposed Name | Project Role    | Is Key Contact |
      | David FO      | Project Officer | Checked        |
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentObjectiveTableId---"
    When I click "Associate" after selection of "MI_Objective" in the table "---grantee_tableId:-:amendmentAssociateObjectiveTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentKPITableId---"
    When I click "Associate" after selection of "KPI Grantee ETE" in the table "---grantee_tableId:-:selectAmendmentKPITableId---"
    And I click modal button "Close"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms1" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate1 | 15             | 30              | 10                             | Final                   |
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I click on "Add Line Items" icon for "Indirect costs" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title          | Narrative     | Awarded Budget | Cash Match | Other Leverage |
      | Indirect costs | The narrative | 2000           | 200        | 200            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I save the field labeled "New Budget Period End Date" as "NewBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | End Date                            |
      | Automation Permanent Focus Area | {SavedValue:NewBudgetPeriodEndDate} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 1            |
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    And I click on "Revise Amendment" in the page details
    Then I softly see field "Status" as "Revision in Progress"
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Edit" in page detail
    And I click on "Delete" in the page details
    And I wait for "3" seconds
    When I navigate to "Amendments" sub tab
    Then I do not see value "Record Id" for title "{SavedValue:AmendEGMSID}" inside table "---grantee_tableId:-:AmendmentRequestTableId---"

  @486579 @486584 @486585 @486586 @486592 @486593 @487329 @487330 @BudgetRedirectionAREXEusershouldabletoactivatenewawardthroughBRAR
  Scenario Outline: Budget Redirection AR- EXE user should able to activate new award through BR AR
    When I login to "As a Grantee" app as "<OwnerType>" user
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
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
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
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                            | Start Date                         | End Date                         |
      | Automation Permanent Focus Area2 | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on page navigation arrow "---grantee_tableId:-:AwardBudgetTableId---" for table id "Next"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
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
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    Then I softly can see "Actuals" sub tab at view detail page
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I see textarea field "Impact__c" is editable
    Then I see textarea field "PurposeRTA__c" is editable
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Please select Amendment Request Type is required to save. |
    Then I softly see the following messages in the page details contains:
      | Initiated By is required to save. |
    Then I softly see the following messages in the page details contains:
      | Justification is required to save. |
    And I enter "Grantee_Budget_Redirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "BDRAMENDID"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:AwardEGMSID1}"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I see value "Record Id" for title "{SavedValue:BDRAMENDID}" inside table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:BDRAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:BDRAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:BDRAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:BDRAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Created" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly do not see value "Approved" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly do not see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly do not see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BDRAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:BDRAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:BDRAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:BDRAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - Draft"
    When I perform quick search for "{SavedValue:BDRAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:BDRAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:BDRAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:BDRAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "{SavedValue:BDRAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I see the header is "Amendment Request" in the page details
    Then I softly see "Collapse" button for header
    Then I softly see field "EGMS ID" as "{SavedValue:BDRAMENDID}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Initiated By" as "Grantor"
    Then I softly see field "Amendment Type" as "Budget Redirection"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:BDRAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    And I click on "Edit" icon for "{SavedValue:BDRAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I wait for "3" seconds
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "Details" page block displayed
    Then I softly see "Focus Areas" page block displayed
    Then I softly see "Budget Change" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see "General Condition" page block displayed
    Then I softly see "Special Conditions" page block displayed
    Then I softly see "System Information" page block displayed
    Then I see field "Grant EGMS ID" is not editable
    Then I see field "Grant Number" is not editable
    Then I see field "Grant Award Number" is not editable
    Then I see field "Award EGMS ID" is not editable
    Then I see textarea field "Impact__c" is editable
    Then I see textarea field "PurposeRTA__c" is editable
    Then I softly see fields "ApprovedIndirectCostRate__c" is in edit mode
    Then I softly see field "Grant EGMS ID" as "{SavedValue:GrantEGMSID}"
    Then I softly see field "Grant Number" as "{SavedValue:GrantNumber}"
    Then I softly see field "Grant Award Number" as "{SavedValue:GrantAwardNumber}"
    Then I softly see field "Award EGMS ID" as "{SavedValue:AwardEGMSID1}"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see "Start Date" in flex table header "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly see "End Date" in flex table header "---grantee_tableId:-:amendmentFocusAreaTableId---"
    When I click on parallel lines menu bar with data target value "Focus Areas"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Budget Category" in flex table header "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see "Spent" in flex table header "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see "Remaining Budget" in flex table header "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see "Revised Award Budget" in flex table header "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see "Difference" in flex table header "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Effective from" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Effective until" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Approved Indirect Cost Rate(%)" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Indirect Cost Rate Type" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see value "{SavedValue:Title}" for title "Title" inside table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Approved Indirect Cost Rate(%)" as "ApprovedIndirectCostRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see value "{SavedValue:ApprovedIndirectCostRate}" for title "Approved Indirect Cost Rate(%)" inside table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Indirect Cost Rate Type" as "IndirectCostRateType" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see value "{SavedValue:IndirectCostRateType}" for title "Indirect Cost Rate Type" inside table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly can see row level action button "Edit" against "Rate" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly can see row level action button "Delete" against "Rate" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see fields "GeneralConditionChanged__c" is in edit mode
    And I enter value "Checked" into field "GeneralConditionChanged__c"
    And I enter value "Checked" into field "AreTCspartofNGAAttachments__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms1" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms1" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see field "Created By" as "{SavedValue:CreatedBy}"
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedBy}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDate}"
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see "Reviewer Name" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Role" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Allow Record Editing" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see value "David FO" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see the following messages in the page details contains:
      | Responsibilities Tab - A person with the same role cannot be added again. |
    And I refresh the page
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name      | Role             | Description            | Due Date | Allow Record Editing |
      | Danielle FD Garcia | Program Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see that "Sent for Review" has been added in flextable with Id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I get the "EGMS ID"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Complete Review" in page detail
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Name" in flex table header "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly see "Amendment Request" in flex table header "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 2            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 3            |
    Then I softly see link "Victor EXE" inside Page block
    Then I softly see link "David FO" inside Page block
    Then I softly see link "Sarah PM" inside Page block
    And I click on hyperlink containing value "Victor EXE"
    Then I softly see the text containing "victor.exe@ggp.test8.qagrnteatm"
    And I click on back arrow
    And I navigate to "Files" sub tab
    Then I softly see "Amendment Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Amendment Files" flex table
    Then I can see row level action button "Download" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "Delete" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "View" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---" by clicking "Edit" :
      | Title          | Title          | Classification  |
      | Attachment.pdf | Automation.pdf | Notice of Award |
    And I refresh the page
    Then I softly see "Notice of Award" has been added in "Amendment Files" flex table
    And I click on "Delete" icon for "Notice of Award" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---" without waiting for record
    Then I softly do not see value "Notice of Award" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Terms and Conditions" has been added in "Amendment Files" flex table
    When I click on parallel lines menu bar with data target value "Amendment Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "Edit" :
      | Created By  | Title         | Description       |
      | <CreatedBy> | Notes Record1 | Automation Notes1 |
    And I wait for "2" seconds
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Recor1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see "Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "From Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "To Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "CC Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Email Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Preview" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    And I navigate to "Overview" sub tab
    Then I softly see value "$5,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Narrative     | Awarded Budget | Cash Match |
      | Construction | The narrative | 4500           | 450        |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title     | Narrative     | Awarded Budget | Cash Match |
      | Site work | The narrative | 500            | 50         |
    When I close "Add Line Items" modal by clicking the top right x button
    Then I softly see value "$4,500.00" for title "Revised Award Budget" against the value "Construction" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see value "$500.00" for title "Revised Award Budget" against the value "Site work" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    And I click on page navigation arrow "---grantee_tableId:-:AmendmentBudgetTableId---" for table id "Next"
    Then I softly see value "$5,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Narrative     | Awarded Budget | Cash Match |
      | Construction | The narrative | 4500           | 450        |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title     | Narrative     | Awarded Budget | Cash Match |
      | Site work | The narrative | 500            | 50         |
    When I close "Add Line Items" modal by clicking the top right x button
    Then I softly see value "$4,500.00" for title "Revised Award Budget" against the value "Construction" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see value "$500.00" for title "Revised Award Budget" against the value "Site work" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Submitted for Approval" for title "New Value" inside field history table
    Then I softly see value "Reviewed" for title "Original Value" inside field history table
    And I click on back arrow
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Submit for Approval.pdf" as name
    Then I softly see snapshot with name containing "Complete Review.pdf" as name
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Approved"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Approved" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see "Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "From Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "To Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "CC Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Email Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Attention To" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Preview" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To          | Subject            | Body            |
      | <emailIdTo> | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "sarah.pm.23@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "<emailIdTo>" for title "To Address" inside table "CommunicationHistory"
    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
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
    Then I softly cannot see top right button "Edit" in page detail
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I navigate to "Amendments" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Delete" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
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
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Activate Award" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID2}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see "Details" page block displayed
    Then I softly see "Description" page block displayed
    Then I softly see "External Programs" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "Primary Place of Performance" page block displayed
    Then I softly see "System Information" page block displayed
    And I navigate to "Projections" sub tab
    And I wait for "3" seconds
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$4,500.00" for title "Award  Budget" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$450.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$200.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$5,150.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    And I click on page navigation arrow "---grantee_tableId:-:AwardBudgetTableId---" for table id "Next"
    Then I softly see value "$500.00" for title "Award  Budget" against the value "Site work" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$50.00" for title "Cash Match" against the value "Site work" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$0.00" for title "Other Leverage" against the value "Site work" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$550.00" for title "Total Project Cost" against the value "Site work" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see value "$500.00" for title "Award Budget" against the value "Site work" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Expenditures to Date" against the value "Site work" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Carry-Forward" against the value "Site work" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$500.00" for title "Remaining Budget" against the value "Site work" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Cash Match" against the value "Site work" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Program Income Expenditures" against the value "Site work" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$4,500.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Expenditures to Date" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Carry-Forward" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$4,500.00" for title "Remaining Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Program Income Expenditures" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see value "Terms1" for title "Title" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Activated" for title "New Value" inside field history table
    Then I softly see value "Pending Activation" for title "Original Value" inside field history table
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Financials" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see value "$500.00" for title "Awarded Budget" against the value "Site work" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$50.00" for title "Cash Match" against the value "Site work" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$0.00" for title "Other Leverage" against the value "Site work" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$550.00" for title "Total Project Cost" against the value "Site work" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$4,500.00" for title "Awarded Budget" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$450.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$200.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$5,150.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    When I navigate to "Awards" sub tab
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:AwardEGMSID1}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardEGMSID2}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "{SavedValue:AwardEGMSID2}" for title "New Value" inside field history table
    Then I softly see value "{SavedValue:AwardEGMSID1}" for title "Original Value" inside field history table

    Examples:
      | OwnerType      | UserType       | emailIdTo                         | CreatedBy         |
#      | GRANTEE PM     | GRANTEE PM     | victor.exeqagrantee@yopmail.com   | Sarah PM          |
#      | GRANTEE PO     | GRANTEE PO     | grantee.po@yopmail.com.qagrnteatm | Grantee PO        |
#      | GRANTEE EXE    | GRANTEE EXE    | victor.exeqagrantee@yopmail.com   | Victor EXE        |
      | GRANTEE ADMIN1 | GRANTEE ADMIN1 | productadmin@yopmail.com          | Product Admin     |
#      | GRANTEE EXE    | GRANTEE FO     | victor.exeqagrantee@yopmail.com   | David FO          |
#      | GRANTEE EXE    | GRANTEE FD     | victor.exeqagrantee@yopmail.com   | Danielle FD Garcia|
#      | GRANTEE EXE    | GRANTEE ADMIN1 | victor.exeqagrantee@yopmail.com   | Product Admin     |

  @487261 @487281 @FCAmdVerifythatFOuserseeFundingChangesection&theirFieldsunderOverviewTabinFundingChangeAmendmentRequestlayout
  Scenario: FC Amd-->Verify that FO user see Funding Change section & their Fields under Overview Tab in Funding Change Amendment Request layout
    When I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_GrantCreationNonCash" values from "Award_Field_Values.xlsx"
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
    And I navigate to "Projections" sub tab
    And I enter value "10" into field "ApprovedIndirectCostRate__c"
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
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 500            | 200            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    And I navigate to "Responsibilities" sub tab
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
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
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
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
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
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    #487261
    Then I softly see "Funding Change" page block displayed
    Then I softly see field "Requested Change in Award Budget" inside page block
    Then I softly see field "Required Match(%)" inside page block
    And I click on "Edit" in the page details
    Then I softly see fields "RequestedChangeInBudget__c" is in edit mode
    Then I softly see that "Required Match(%)" rendered in view mode only
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Requested Change in Award Budget" as "$2,000.00"
    Then I softly see field "Required Match(%)" as "10.00%"
    #487281
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Effective from" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Effective until" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Approved Indirect Cost Rate(%)" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see "Indirect Cost Rate Type" in flex table header "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see value "{SavedValue:Title}" for title "Title" inside table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Approved Indirect Cost Rate(%)" as "ApprovedIndirectCostRate" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see value "{SavedValue:ApprovedIndirectCostRate}" for title "Approved Indirect Cost Rate(%)" inside table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    And I save the value from row "1" for column name "Indirect Cost Rate Type" as "IndirectCostRateType" from flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see value "{SavedValue:IndirectCostRateType}" for title "Indirect Cost Rate Type" inside table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly can see row level action button "Edit" against "Rate" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly can see row level action button "Delete" against "Rate" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"

  @486596 @486597 @BudgetRedirectARPmusershouldabletoseethevalidation
  Scenario Outline: Budget Redirect AR-Pm user should able to see the validation
    When I login to "As a Grantee" app as "<User>" user
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
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
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
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                            | Start Date                         | End Date                         |
      | Automation Permanent Focus Area2 | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on page navigation arrow "---grantee_tableId:-:AwardBudgetTableId---" for table id "Next"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
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
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    Then I softly can see "Actuals" sub tab at view detail page
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_Budget_Redirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I clear the value from field "PurposeRTA__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Justification is required to save under Overview. |
    When I enter value "Automation Test" into field "PurposeRTA__c"
    And I enter value "120" into field "ApprovedIndirectCostRate__c"
    And I enter value "Checked" into field "GeneralConditionChanged__c"
    And I enter value "Checked" into field "AreTCspartofNGAAttachments__c"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see value "$5,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Narrative     | Awarded Budget | Cash Match |
      | Construction | The narrative | 4500           | 450        |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget | Cash Match |
      | Extra Salary | The narrative | 600            | 60         |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
    | Overview Tab - The Budgeted Amount cannot be increased or decreased during a Budget Redirection.                                                                        |
    | Overview Tab - Original Awarded budget and Revised budget difference for each focus area must be zero.                                                                  |
    | Overview Tab - The budget redirection threshold for each focus area cannot exceed the budget redirection threshold 10.00%                                               |
    | Overview Tab - Maximum Indirect Cost Rate cannot be greater than 100%.                                                                                                  |
    | Files Tab- Provide attachment in Files section with classification "Terms and Conditions" if 'Separate Attachment for Terms and Conditions' in Overview tab is selected.|
    | Responsibilities - At least one approver is required.                                                                                                                   |
    Examples:
      | User       |
      | GRANTEE PM |
      | GRANTEE PO |

  @485543 @BPCVerifyFOuserasAROwnercanabletocreateBPCAR&decreasetheBudgetPerioddateonactiveAward&abletoseeimpactonGrant&AwardafterreducingtheBudgetPeriod
  Scenario:BPC -->Verify FO user as (AR Owner)can able to create BPC AR & decrease the Budget Period date on active Award & able to see impact on Grant & Award after reducing the Budget Period
    When I login to "As a Grantee" app as "GRANTEE PO" user
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
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_BPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_BPC_Edition3" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "New Budget Period End Date" as "NewBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | End Date                            |
      | Automation Permanent Focus Area | {SavedValue:NewBudgetPeriodEndDate} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Activate Award" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Financials" sub tab
    When I save the field labeled "Total Anticipated Amount" as "TotalAnticipatedAmount"
    Then I softly see field "Total Anticipated Amount" as "{SavedValue:TotalAnticipatedAmount}"
    When I save the field labeled "Award Amount to Date" as "AwardAmounttoDate"
    Then I softly see field "Award Amount to Date" as "{SavedValue:AwardAmounttoDate}"
    When I save the field labeled "Expenditures to Date" as "ExpenditurestoDate"
    Then I softly see field "Expenditures to Date" as "{SavedValue:ExpenditurestoDate}"
    When I save the field labeled "Remaining Budget" as "RemainingBudget"
    Then I softly see field "Remaining Budget" as "{SavedValue:RemainingBudget}"
    When I save the field labeled "Budgeted Cash Match" as "BudgetedCashMatch"
    Then I softly see field "Budgeted Cash Match" as "{SavedValue:BudgetedCashMatch}"
    When I save the field labeled "Budgeted Match" as "BudgetedMatch"
    Then I softly see field "Budgeted Match" as "{SavedValue:BudgetedMatch}"
    When I save the field labeled "Remaining Match" as "RemainingMatch"
    Then I softly see field "Remaining Match" as "{SavedValue:RemainingMatch}"
    When I save the field labeled "Budgeted Leverage" as "BudgetedLeverage"
    Then I softly see field "Budgeted Leverage" as "{SavedValue:BudgetedLeverage}"
    When I save the field labeled "Total Anticipated Program Income" as "TotalAnticipatedProgramIncome"
    Then I softly see field "Total Anticipated Program Income" as "{SavedValue:TotalAnticipatedProgramIncome}"
    When I save the field labeled "Total Program Income Expenditure" as "TotalProgramIncomeExpenditure"
    Then I softly see field "Total Program Income Expenditure" as "{SavedValue:TotalProgramIncomeExpenditure}"
    When I save the field labeled "Total Project Cost" as "TotalProjectCost"
    Then I softly see field "Total Project Cost" as "{SavedValue:TotalProjectCost}"
    Given I expand nested table containing column value "BP01"
    Then I softly see value "{Date:MM/dd/yyyy::d+100}" for title "End Date" against the value "BP01" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$5,000.00" for title "Awarded Budget" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$500.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$200.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$5,700.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    When I navigate to "Awards" sub tab
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardEGMSID2}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "Management" sub tab
    Then I softly see value "Accepted" for title "Status" against the value "{SavedValue:AwardEGMSID}" inside table "---grantee_tableId:-:GrantsAmendmentRequestsTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "{SavedValue:AwardEGMSID2}" for title "New Value" inside field history table
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "Original Value" inside field history table
    And I click on back arrow
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "History" sub tab
    Then I softly see field "Source Change Request" as "{SavedValue:AmendEGMSID}"
    Then I softly see field "Request Type" as "Change Request"
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Amended" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "History" sub tab
    Then I softly do not see "Change Request History" page block displayed

  @485301 @VerifythatAuditoruserhavingonlyviewaccessonBudgetperiodChangeamendmentrequestonBPARlayout
  Scenario:Verify that Auditor user having only view access on Budget period Change amendment request on BP AR layout
    When I login to "As a Grantor" app as "GRANTEE AUDITOR" user
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{grantee_testData:AutomationBudgetRedirectionAmendmentEGMSID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "{grantee_testData:AutomationBudgetRedirectionAmendmentEGMSID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Delete" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Details" page block displayed
    Then I softly see "Budget Period Change" page block displayed
    Then I softly see "Focus Areas" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see "General Condition" page block displayed
    Then I softly see "Special Conditions" page block displayed
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I cannot see row level action button "Delete" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see value "Indirect Rate" for title "Title" inside table "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I cannot see row level action button "View" against "Indirect Rate" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I cannot see row level action button "Edit" against "Indirect Rate" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I cannot see row level action button "Delete" against "Indirect Rate" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "Terms" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly cannot see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly cannot see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I navigate to "Files" sub tab
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"

  @488703 @488705 @488706 @488708 @VerifyAsFOusershouldnotseenewbuttonfornotyetqualifyleadandeditaccessonnotyetqualifyleads
  Scenario Outline: Verify As FO user should not see new button for not yet qualify lead and edit access on not yet qualify leads
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
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    And I click on "View" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---" without waiting for record
    Then I cannot see top right button "Qualify Lead" in page detail
    Then I cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:RelatedPrograms---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:AllQualificationsTable---"
    And I navigate to "Files" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Examples:
      | UserType        |
      | GRANTEE FO      |
      | GRANTEE FD      |
      | GRANTEE AUDITOR |
      | GRANTEE ADMIN1  |

  @487233 @487234 @487235 @487236 @487237 @OpportunitiesNotconvertedGrantsgovVerifyEXEusercannotseeCreateApplicationbuttononApprovedOpportunity
  Scenario Outline: Opportunities Not converted (Grants.gov) -  Verify EXE user cannot see Create Application button on Approved Opportunity
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberPMUser}"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001212745" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberPMUser}"
    And I refresh the page
    And I wait for "3" seconds
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
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Application" in page detail

    Examples:
     |  OwnerType  | UserType       |
     |  GRANTEE EXE| GRANTEE EXE    |
     |  GRANTEE PM | GRANTEE FO     |
     |  GRANTEE PM | GRANTEE FD     |
     |  GRANTEE PO | GRANTEE ADMIN1 |
     |  GRANTEE PO | GRANTEE AUDITOR|

  @475755 @475754 @OpportunitiesNotconvertedGrantsgovVerifyEXEuserReviewereditaccessasNocanabletosubmitReview
  Scenario Outline: Opportunities Not converted (Grants.gov)  - Verify EXE user (Reviewer edit access as = No)can able to submit Review
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberPMUser}"
    Given I login to "As a Grantee" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001212745" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberPMUser}"
    And I refresh the page
    And I wait for "3" seconds
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
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I wait for "2" seconds
    When I click on "Convert to Opportunity" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | NO                   |
    When I enter the following values into flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" by clicking "New" :
      | Reviewer Name     | Role            | Description            | Due Date | Allow Record Editing |
      | Danielle FD Garcia| Program Reviewer| Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Opportunities Not Converted to Application - My Records"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:opportunityEGMSID}" in flex table with id "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    And I wait for "5" seconds
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:opportunityEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I wait for "2" seconds
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Opportunities Not Converted to Application - My Records"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:opportunityEGMSID}" in flex table with id "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    And I wait for "5" seconds
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:opportunityEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I wait for "2" seconds
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "Danielle FD Garcia" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"

    Examples:
      | UserType    |
      | GRANTEE EXE |
      | GRANTEE PM  |

  @487232 @NotYetConvertedOpportunityGrantsgovVerifyPOusercancreateApplicationfromOpportunityifPreApplicationRequiredisselectedasNoonOpportunityrecord
  Scenario: Not Yet Converted Opportunity (Grants.gov)  - Verify PO user can create Application from Opportunity if Pre-Application Required? is selected as No on Opportunity record
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberPMUser}"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001212745" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberPMUser}"
    And I refresh the page
    And I wait for "3" seconds
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
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Application" in page detail
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values - backup.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"

  @475743 @487225 @487226 @OpportunitiesNotconvertedGrantsgovVerifyasPMuservalidationisdisplayedonSaveforrequiredforsavefieldsand*isdisplayedforrequiredfields
  Scenario Outline: Opportunities Not converted (Grants.gov ) - Verify as PM user,  validation is displayed on Save for required for save fields and * is displayed for required fields
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberPMUser}"
    Given I login to "As a Grantee" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001212745" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberPMUser}"
    And I refresh the page
    And I wait for "3" seconds
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
    And I enter "Grantee_Opp_PreAppYes_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    When I save the field labeled "Application Due Date" as "ApplicationDueDate"
    And I click on "Edit" in the page details
    And I enter value "{SavedValue:ApplicationDueDate}" into field "PreApplicationDueDate__c"
    And I navigate to "Evaluation" sub tab
    And I enter value "Yes" into field "MaintenanceEffortRequire__c"
    And I enter value "Automation Test" into field "StatutoryMaintenanceOfEffort__c"
    And I click on "Save" in the page details
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
    When I navigate to "Overview" sub tab
    Then I softly see asterisk mark on "Category Of Funding Activity"
    Then I softly see asterisk mark on "Description"
    Then I softly see asterisk mark on "Is Leverage Allowed?"
    And I click on "Edit" in the page details
    Then I see textarea field "AnnouncementDescription__c" is editable
    Then I softly see fields "LaverageAllowed__c" is in edit mode
    Then I softly see fields "AnnouncementDescription__c" is in edit mode
    Then I softly see fields "CategoryOfFundingActivity__c" is in edit mode
    And I clear the value from field "AnnouncementDescription__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Description is required to save under Overview.  |
    And I enter value "Test" into field "AnnouncementDescription__c"
    And I enter value "-30" into field "EstimatedProjectPeriodStartDate__c"
    And I enter value "150" into field "AnticipatedAwardDate__c"
    And I enter value "150" into field "LetterOfIntentDueDate__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Estimated Project Period Start Date should be after Application Due Date             |
      | Anticipated award date should be between application due date and project start date |

    Examples:
      | UserType    |
      | GRANTEE PM  |
      | GRANTEE EXE |
      | GRANTEE PO  |

  @482022 @482023 @482024 @482025 @482026 @482027 @GrantsgovlobbingformVerifyPOuserNonOwnercannotaddeditdeletedatainGrantsgovlobbingformandcanonlyviewdataenteredbyownerintheform
  Scenario Outline: Grants.gov lobbing form -  Verify PO user (Non Owner) cannot add/edit/delete data in Grants.gov lobbing form and can only view data entered by owner in the form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumber}"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001241410" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumber}"
    And I refresh the page
    And I wait for "3" seconds
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
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
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
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "Lobbying_Form" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    When I re-login to "As a Grantee" app as "<NonOwner>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    And I wait for "3" seconds
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Delete" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | OwnerType   | NonOwner      |
      | GRANTEE PM  |GRANTEE PO     |
      | GRANTEE PO  |GRANTEE ADMIN1 |
      | GRANTEE PM  |GRANTEE EXE    |
      | GRANTEE EXE |GRANTEE FO     |
      | GRANTEE EXE |GRANTEE FD     |
      | GRANTEE PM  |GRANTEE AUDITOR|

  @482030 @GrantsgovlobbingformVerifyassignedreviewerEXEwitheditaccessasNocannotseeeditbuttonforGrantsgovlobbingformandcannoteditanydataontheform
  Scenario Outline: Grants.gov lobbing form - Verify assigned reviewer(EXE)  with edit access as No cannot see edit button for Grants.gov lobbing form and cannot edit any data on the form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumber}"
    Given I login to "As a Grantee" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001241410" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumber}"
    And I refresh the page
    And I wait for "3" seconds
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
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
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
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | Victor EXE    | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Victor EXE" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I pause execution for "2" seconds
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Delete" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | UserType    |
      | GRANTEE PM  |

  @486513 @486518 @486535 @486536 @486538 @486539 @OtherTypeARVerifyPMusershouldabletoapprovedtheAR&shouldabletocreate&activatenewaward
  Scenario Outline: Other Type AR -Verify PM user should able to approved the AR & should able to create & activate new award
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0000660610" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
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
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
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
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
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
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
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
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "5" seconds
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I enter value "12345" into field "GrantNumber__c"
    And I enter value "Project Grant" into field "GrantType__c"
    When I click on "Save" in the page details
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I wait for "5" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
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
    When I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    When I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    And I click on "Edit" in the page details
    And I enter value "{SavedValue:ProjectPeriodEndDate}" into field "BudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
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
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_Other_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_Other_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "OTHAMENDID"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:AwardEGMSID}"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I see value "Record Id" for title "{SavedValue:OTHAMENDID}" inside table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Created" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly do not see value "Approved" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly do not see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly do not see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - Draft"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "{SavedValue:OTHAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I see the header is "Amendment Request" in the page details
    Then I softly see "Collapse" button for header
    Then I softly see field "EGMS ID" as "{SavedValue:OTHAMENDID}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Initiated By" as "Grantor"
    Then I softly see field "Amendment Type" as "Other"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "Details" page block displayed
    Then I softly see "Other Changes" page block displayed
    Then I softly see "General Condition" page block displayed
    Then I softly see "Special Conditions" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Grant EGMS ID" as "{SavedValue:GrantEGMSID}"
    Then I softly see link "{SavedValue:GrantEGMSID}" inside Page block
    Then I softly see field "Grant Number" as "{SavedValue:GrantNumber}"
    Then I softly see field "Grant Award Number" as "{SavedValue:GrantAwardNumber}"
    Then I softly see field "Award EGMS ID" as "{SavedValue:AwardEGMSID}"
    Then I softly see link "{SavedValue:AwardEGMSID}" inside Page block
    And I wait for "2" seconds
    When I save the field labeled "Description of Other Changes" as "DescriptionofOtherChanges"
    When I save the field labeled "Justification for Purpose and Summary" as "JustificationforPurposeandSummary"
    When I save the field labeled "If Other amendment type, explain" as "IfOtheramendmenttypeexplain"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms1" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms1" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "1" for column name "Title" as "TermsTitle" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsTitle}" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see "Reviewer Name" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Role" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Allow Record Editing" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see value "David FO" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | Automation FD | Program Reviewer | Automation Description | 5        | No                   |
    Then I softly see value "Automation FD" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Edit" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Edit" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Edit" icon for "Fiscal Reviewer" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see fields "name__r.name" is in edit mode
    Then I softly see fields "ReviewerRole__c" is in edit mode
    Then I softly see fields "Responsibility__c" is in edit mode
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Edit" icon for "Program Reviewer" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see fields "name__r.name" is in edit mode
    Then I softly see fields "ReviewerRole__c" is in edit mode
    Then I softly see fields "Responsibility__c" is in edit mode
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Delete" icon for "Automation FD" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "Automation FD" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see that "Sent for Review" has been added in flextable with Id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I navigate to "Files" sub tab
    Then I softly see "Amendment Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Amendment Files" flex table
    Then I can see row level action button "Download" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "Delete" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "View" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---" by clicking "Edit" :
      | Title          | Title          | Classification  |
      | Attachment.pdf | Automation.pdf | Notice of Award |
    And I wait for "3" seconds
    Then I softly see "Notice of Award" has been added in "Amendment Files" flex table
    And I click on "Delete" icon for "Notice of Award" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---" without waiting for record
    Then I softly do not see value "Notice of Award" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    When I click on parallel lines menu bar with data target value "Amendment Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "Edit" :
      | Created By  | Title         | Description       |
      | <CreatedBy> | Notes Record1 | Automation Notes1 |
    And I wait for "2" seconds
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Recor1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    When I get the "EGMS ID"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I can see top right button "Edit" in page detail
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see that "Review Type" rendered in view mode only
    Then I softly see fields "Rating__c" is in edit mode
    Then I see textarea field "ReviewComments__c" is editable
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Rating is required to save.   |
      | Comments is required to save. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    Then I softly see "Edit" modal button
    Then I softly see "Submit Review" modal button
    And I click on submit review
    And I wait for "3" seconds
    Then I softly cannot see row level action button "Enter Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I click on "Resend for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see value "Sent for Review" for title "Status" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Reviewed" for title "New Value" inside field history table
    Then I softly see value "Submitted for Review" for title "Original Value" inside field history table
    And I click on back arrow
    And I wait for "3" seconds
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Name" in flex table header "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly see "Amendment Request" in flex table header "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 2            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 3            |
    Then I softly see link "Victor EXE" inside Page block
    Then I softly see link "David FO" inside Page block
    Then I softly see link "Sarah PM" inside Page block
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Submit for Approval.pdf" as name
    Then I softly see snapshot with name containing "Complete Review.pdf" as name
    And I wait for "2" seconds
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Approved"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Approved" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see "Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "From Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "To Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "CC Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Email Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Attention To" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Preview" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To          | Subject            | Body            |
      | <emailIdTo> | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "<emailIdFrom>" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "<emailIdTo>" for title "To Address" inside table "CommunicationHistory"
    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
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
    When I navigate to "Amendments" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Delete" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
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
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Activate Award" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID2}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see field "Description of Other Changes" as "{SavedValue:DescriptionofOtherChanges}"
    Then I softly see field "Justification for Purpose and Summary" as "{SavedValue:JustificationforPurposeandSummary}"
    Then I softly see field "If Other amendment type, explain" as "{SavedValue:IfOtheramendmenttypeexplain}"
    And I navigate to "Projections" sub tab
    And I wait for "3" seconds
    Then I softly see "Project Period Details" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I softly see "Focus Area" page block displayed
    Then I softly see "Award Budget" page block displayed
    Then I softly see "Program Income" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see field "Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Then I softly see field "Budget Period Start Date" as "{SavedValue:BudgetPeriodStartDate}"
    Then I softly see field "Budget Period End Date" as "{SavedValue:BudgetPeriodEndDate}"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$5,000.00" for title "Award  Budget" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$500.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$500.00" for title "Non-Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$1,000.00" for title "Total Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$0.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$6,000.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see "Financials Summary" page block displayed
    Then I softly see "Expenditure Detail" page block displayed
    Then I softly see "Program Income Revenue by Focus Area" page block displayed
    Then I softly see "Drawdown By Award" page block displayed
    Then I softly see value "$5,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Expenditures to Date" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Carry-Forward" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$5,000.00" for title "Remaining Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Program Income Expenditures" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see value "{SavedValue:TermsTitle}" for title "Title" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Activated" for title "New Value" inside field history table
    Then I softly see value "Pending Activation" for title "Original Value" inside field history table
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Financials" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see value "$5,000.00" for title "Awarded Budget" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$500.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$500.00" for title "Non-Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$1,000.00" for title "Total Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$0.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$6,000.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    When I navigate to "Awards" sub tab
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:AwardEGMSID}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardEGMSID2}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "{SavedValue:AwardEGMSID2}" for title "New Value" inside field history table
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "Original Value" inside field history table

    Examples:
      | OwnerType  | UserType      | emailIdFrom             | emailIdTo                       | CreatedBy         |
      | GRANTEE PM | GRANTEE PM    | sarah.pm.23@yopmail.com | victor.exeqagrantee@yopmail.com | Sarah PM          |
      | GRANTEE PO | GRANTEE ADMIN1| sarah.pm.23@yopmail.com | victor.exeqagrantee@yopmail.com | Product Admin     |
      | GRANTEE PO | GRANTEE EXE   | sarah.pm.23@yopmail.com | victor.exeqagrantee@yopmail.com | Victor EXE        |
      | GRANTEE PM | GRANTEE FD    | sarah.pm.23@yopmail.com | victor.exeqagrantee@yopmail.com | Danielle FD Garcia|
      | GRANTEE PM | GRANTEE FO    | sarah.pm.23@yopmail.com | victor.exeqagrantee@yopmail.com | David FO          |
      | GRANTEE PO | GRANTEE PO    | sarah.pm.23@yopmail.com | victor.exeqagrantee@yopmail.com | Grantee PO        |

  @485355 @SF424VerifyFOuserasaReviewershouldabletoedittheformifeditaccessisYes
  Scenario Outline: SF-424 -Verify FO user as a Reviewer should able to edit the form if edit access is Yes
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumber}"
    Given I login to "As a Grantee" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001241410" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumber}"
    And I refresh the page
    And I wait for "3" seconds
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
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
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
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I pause execution for "2" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Examples:
      | UserType    |
      | GRANTEE PM  |

  @485359 @SF424VerifyFOuserasaReviewershouldabletoedittheformifeditaccessisNo
  Scenario Outline: SF-424 -Verify FO user as a Reviewer should able to edit the form if edit access is No
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumber}"
    Given I login to "As a Grantee" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001241410" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumber}"
    And I refresh the page
    And I wait for "3" seconds
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
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
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
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I pause execution for "2" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | UserType    |
      | GRANTEE PM  |

  @482029 @GrantsgovlobbingformVerifyassignedreviewerFOwitheditaccessasYescanseeeditbuttonforGrantsgovlobbingformandcaneditallthedataontheformandvalidateitwhenapplicationisinSubmittedforreviewstate
  Scenario Outline: Grants.gov lobbing form - Verify assigned reviewer(FO)  with edit access as Yes can see edit button for Grants.gov lobbing form and can edit all the data on the form and validate it when application is in Submitted for review state
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumber}"
    Given I login to "As a Grantee" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001241410" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumber}"
    And I refresh the page
    And I wait for "3" seconds
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
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
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
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I pause execution for "2" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    And I enter "Lobbying_Form" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    Examples:
      | UserType    |
      | GRANTEE PM  |

  @485370 @485371 @485364 @485365 @485361 @Sf424VerifyAdminusershouldabletoviewaccessforforminallstateofApplication
  Scenario Outline: Sf-424-Verify Admin user should able to view access for form in all  state of Application
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0000660610" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
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
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
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
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 1      |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision In Progress"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision In Progress"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | OwnerType  | UserType        |
      | GRANTEE PM | GRANTEE ADMIN1  |
      | GRANTEE PM | GRANTEE AUDITOR |
      | GRANTEE PM | GRANTEE FO      |
      | GRANTEE PM | GRANTEE FD      |
      | GRANTEE PM | GRANTEE EXE     |

  @485395 @Sf424PMuserisrejecttheapplicationthensubmittograntsgovbuttonisnotdisplay&verifytheeditaccess
  Scenario Outline: Sf-424- PM user is reject the application then submit to grants.gov button is not display & verify the edit access
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0000660610" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
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
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
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
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 1      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Rejected"
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    Then I softly cannot see top right button "Submit To Grants.Gov" in page detail
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | OwnerType  |
      | GRANTEE PM |

  @485360 @SF424VerifyPMusershouldabletosubmittheapplicationtograntsgovifuserupdatethedatarevisioninprogressstate
  Scenario: SF-424-Verify PM user should able to submit the application to grants.gov if user update the data revision in progress state
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0000660610" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
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
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Areas Affected" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 1      |
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
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision In Progress"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I close the tab
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
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

  @485374 @Sf-424VerifyAdminuserusershouldabletoseethelastmodifycolumnisupdateifonlyformiseditedbyanyuser
  Scenario Outline: Sf-424- Verify Admin user user should able  to see the last modify column is update if only form is edited by any user
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0000660610" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
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
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
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
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly see value "Delinquent Federal Debt" for title "Classification" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly do not see value "Areas Affected" for title "Classification" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Areas Affected" from computer
    When I click modal button "Close"
    And I wait for "3" seconds
    Then I softly see value "Delinquent Federal Debt" for title "Classification" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly see value "Areas Affected" for title "Classification" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly see value "Delinquent Federal Debt" for title "Classification" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly see value "Areas Affected" for title "Classification" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Examples:
      | OwnerType  | UserType        |
      | GRANTEE PM | GRANTEE ADMIN1  |

  @485340 @SF424VerifyPMusershouldnotableedittheformsinsubmitforapprovalapprovedsubmittograntorstate
  Scenario: SF-424-Verify PM user should not able o edit the forms in submit for approval, approved, submit to grantor state
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0000660610" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
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
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 1      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
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
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail

  @485339 @SF424VerifyPMusershouldabletoedittheformsinCreatedSubmittedforreviewreviewedRevisioninprogressstate&Verifynonuserpermission
  Scenario: SF-424-Verify PM user should able to edit the forms in Created , Submitted for review, reviewed, Revision in progress state & Verify non user permission
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0000660610" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
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
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 1      |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    And I click on "Edit" in the page details
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail
    And I click on "Save" in the page details
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    And I click on "Edit" in the page details
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail
    And I click on "Save" in the page details
    And I close the tab
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    And I click on "Edit" in the page details
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    And I close the tab
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
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision In Progress"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail

  @477451 @477452 @477453 @4774514 @477455 @VerifyEXEuserNonOwneranonlyviewfilesaddedonBudgetNarrativeattachmentform
  Scenario Outline: Verify EXE user (Non Owner) can only view files added on Budget Narrative attachment form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001212745" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I refresh the page
    And I wait for "3" seconds
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
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
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
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Mandatory Budget Narrative Document" from computer
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Optional Budget Narrative Document" from computer
    When I click modal button "Close"
    Then I softly can see row level action button "Download" against "Mandatory Budget Narrative Document" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "View" against "Mandatory Budget Narrative Document" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Edit" against "Mandatory Budget Narrative Document" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Delete" against "Mandatory Budget Narrative Document" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    When I re-login to "As a Grantee" app as "<NonOwner>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Then  I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Download" against "Mandatory Budget Narrative Document" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "View" against "Mandatory Budget Narrative Document" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly cannot see row level action button "Edit" against "Mandatory Budget Narrative Document" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly cannot see row level action button "Delete" against "Mandatory Budget Narrative Document" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Examples:
      | OwnerType   | NonOwner      |
      | GRANTEE PM  |GRANTEE EXE    |
#      | GRANTEE PM  |GRANTEE FD     |
#      | GRANTEE PM  |GRANTEE FO     |
#      | GRANTEE PM  |GRANTEE ADMIN1 |
#      | GRANTEE PM  |GRANTEE AUDITOR|

  @477449 @477450 @BudgetNarrativeattachmentformVerifyvalidationdisplayedtoPMuseronBudgetNarrativeattachmentform
  Scenario Outline:Budget Narrative attachment form - Verify validation displayed to PM user on Budget Narrative attachment form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001212745" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I refresh the page
    And I wait for "3" seconds
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
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
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
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    When I click on "SplitView" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see top right button "Edit" in the split screen page details
    Then I softly can see top right button "Validate" in the split screen page details
    And I wait for "3" seconds
    And I click on "Edit" in the split screen page details
    And I click on "Save" in the split screen page details
    Then I softly see the following messages in the page details contains:
      | Add the file for Mandatory Budget Narrative Document type. |
    And I click on "Cancel" in the split screen page details
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Please upload the required attachments. |
    Examples:
      | OwnerType   |
      | GRANTEE PM  |
#      | GRANTEE PO  |

  @477446 @BudgetNarrativeattachmentformVerifyFDusercannotaddeditViewdeletefilesinBudgetnarrativeattachmentforminSplitviewmodewhenApplicationisinsubmittedforreviewstate
  Scenario: Budget Narrative attachment form - Verify FD user cannot add/edit/View/delete files in Budget narrative attachment form in Split view mode when Application is in submitted for review state
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001212745" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I refresh the page
    And I wait for "3" seconds
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
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Mandatory Budget Narrative Document" from computer
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 1      |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    When I click on "SplitView" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly cannot see top right button "Edit" in the split screen page details
    Then I softly cannot see top right button "Validate" in the split screen page details
    Then  I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Download" against "Mandatory Budget Narrative Document" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "View" against "Mandatory Budget Narrative Document" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly cannot see row level action button "Edit" against "Mandatory Budget Narrative Document" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly cannot see row level action button "Delete" against "Mandatory Budget Narrative Document" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"

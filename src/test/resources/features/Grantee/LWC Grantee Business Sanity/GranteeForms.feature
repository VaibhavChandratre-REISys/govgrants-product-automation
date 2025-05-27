@GranteeForms
Feature: Grantee Forms Scenario

  @485407 @485428 @ValidateProjectNarrativeAttachmentFOuserasaReviewershouldabletoedittheformifeditaccessisYes
  Scenario: Validate Project Narrative Attachment FO user as a Reviewer should able to edit the form if edit access is Yes
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberProjectnarrativeForm}"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001212704" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberProjectnarrativeForm}"
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "David FO" inside table
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Project Narrative File" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    #485428
    And I close the tab
    And I perform quick search inside global search "Project Narrative Attachment Form"
    Then I softly do not see value "Project Narrative Attachment Form" for title "Announcement Name" inside table "Announcements"
    Then I softly do not see value "Project Narrative Attachment Form" for title "ID" inside table "FOA Leads"
    Then I softly do not see value "Project Narrative Attachment Form" for title "Program Name" inside table "Programs"

  @485410 @ValidateProjectNarrativeAttachmentFOuserasaReviewershouldnotabletoedittheformifeditaccessisNo
  Scenario: Validate Project Narrative Attachment FO user as a Reviewer should not able to edit the form if edit access is No
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberProjectnarrativeForm}"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001212704" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberProjectnarrativeForm}"
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside table
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"

  @485414 @485415 @485416 @485417 @485418 @ValidateProjectNarrativeAttachmentEXEusershouldabletoviewaccessinallstateofApplicationforform
  Scenario: Validate Project Narrative Attachment EXE user should able to view access in all state of Application for form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberProjectnarrativeForm}"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001212704" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberProjectnarrativeForm}"
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
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Project Narrative File" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I click on "Edit" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I enter "SF424_FORM" values from "Application_Field_Values - backup.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I click on "Edit" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "3" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Budget Narrative" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I click on "Edit" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I enter value "Automation1234" into field "Funding_Opportunity_Number__c"
    And I enter value "11.123" into field "CFDA_Number__c"
    And I enter value "Automation Application" into field "Applicant_Name__c"
    And I enter value "Automation Test" into field "DescriptiveTitleOfProject__c"
    And I enter value "Automation Test Execution" into field "ProjectSummary__c"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
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
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    And I click on "Complete Review" in the page details
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
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
      | Name       | Application |
      | Grantee PO | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
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
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision in Progress"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision in Progress"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision in Progress"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision in Progress"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision in Progress"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision in Progress"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"

  @485425 @ValidateProjectNarrativeAttachmentAdminuserusershouldabletoseethelastmodifycolumnisupdateifonlyformiseditedbyanyuser
  Scenario: Validate Project Narrative Attachment Admin user user should able  to see the last modify column is update if only form is edited by any user
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberProjectnarrativeForm}"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001212704" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberProjectnarrativeForm}"
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
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Project Narrative File" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    Then I softly see value "Sarah PM" for title "Last Modified By Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "David FO" inside table
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment1.pdf" of type "Mandatory Project Narrative File" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment1.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "David FO" for title "Last Modified By Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"

  @485427 @478403 @ValidateProjectNarrativeAttachmentPMuserisrejecttheapplicationthensubmittograntsgovbuttonisnotdisplaytheeditaccess
  Scenario: Validate Project Narrative Attachment PM user is reject the application then submit to grants.gov button is not display & verify the edit access
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberProjectnarrativeForm}"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001212704" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberProjectnarrativeForm}"
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
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Project Narrative File" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I click on "Edit" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I enter "SF424_FORM" values from "Application_Field_Values - backup.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I click on "Edit" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "3" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Budget Narrative" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I click on "Edit" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I enter value "Automation1234" into field "Funding_Opportunity_Number__c"
    And I enter value "11.123" into field "CFDA_Number__c"
    And I enter value "Automation Application" into field "Applicant_Name__c"
    And I enter value "Automation Test" into field "DescriptiveTitleOfProject__c"
    And I enter value "Automation Test Execution" into field "ProjectSummary__c"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
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
      | Name       | Application |
      | Grantee PO | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Rejected"
    Then I softly cannot see top right button "Submit To Grants.Gov" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    #478403
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"

  @481435 @ValidateusershouldnotabletoSubmittheApptograntsgovifusernotaddedthemandatoryfileinattachment
  Scenario: Validate user should not able to Submit the App to grants gov if user not added the mandatory file in attachment
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberProjectnarrativeForm}"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001212704" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberProjectnarrativeForm}"
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
    Then I softly see field "Status" as "Created"
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
      | Name       | Application |
      | Grantee PO | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Please validate the Forms by clicking validate button. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly see the following messages in the page details contains:
      | Fill all the required data in the form before submitting. |

  @478400 @478403 @ValidateProjectNarrativeAttachmentformusershouldabletoaddtheattachmentincreatedsendforreviewsubmittedforreviewreviewedstate @P2_Grantee @P1_Grantee @ADMIN_Grantee @EXE_Grantee @GRegression1
  Scenario: Validate Project Narrative Attachment form user should able to add the attachment in created, send for review submitted for review, reviewed state
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
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
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
    And I wait for "2" seconds
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Project Narrative File" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I wait for "1" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment1.pdf" of type "Mandatory Project Narrative File" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment1.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Mandatory Project Narrative File" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I wait for "1" seconds
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
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
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"

  @478403_1 @ValidateProjectNarrativeAttachmentformusershouldabletoaddtheattachmentincreatedsendforreviewsubmittedforreviewreviewedstate
  Scenario: Validate Project Narrative Attachment form user should able to add the attachment in created, send for review submitted for review, reviewed state
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
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
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
    And I wait for "2" seconds
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Project Narrative File" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I wait for "1" seconds
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Project Narrative File" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Rejected"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"

  @477581 @477583 @477584 @477585 @477586 @477587 @ValidateAttachmentsformEXEuseruserNonOwnercanonlyviewfilesaddedonattachments @GRegression3 @GranteeTBE
  Scenario: Validate Attachments form EXE, PO, FO, FD, ADMIN, AUDITOR user user Non Owner can only view files added on attachments
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberAttachmentsForm}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001204576" with properties "default"
    Given I login to "As a Grantee" app as "Grantee PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001204576" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001204576" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "Edit" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "View" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "View" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "View" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "View" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "View" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "View" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"

  @477582 @ValidateAttachmentsformPMuserNonOwnercanonlyviewfilesaddedonattachments
  Scenario: Validate Attachments form PM user Non Owner can only view files added on attachments
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberAttachmentsForm}"
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001204576" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberAttachmentsForm}"
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
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "Edit" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "View" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"

  @479091 @ValidatePOProfiletheRevisebutton
  Scenario: Validate PO Profile the Revise button
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
    And I click on "Edit" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I enter "SF424_FORM" values from "Application_Field_Values - backup.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I click on "Edit" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    When I enter the following values into flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---" by clicking "Add" :
      | Name     | Is Key Contact | Project Role    |
      | Sarah PM | Checked        | Program Manager |
    When I click on "Validate" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name       | Application |
      | Grantee PO | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
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
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision in Progress"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Validate" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Edit" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"

  @479461 @479462 @ValidatePOProfileabletoseevalidateandsavebuttononformsandsplitviewscreenonceformsstatuscreatedSubmitedforreviewReviewed
  Scenario: Validate PO Profile able to see validate and save button on forms and split view screen once forms status created Submited for review Reviewed
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
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    And I click on "Edit" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I enter "SF424_FORM" values from "Application_Field_Values - backup.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    Then I softly can see row level action button "Edit" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    Then I softly can see top right button "Save" in page detail
    And I close the tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see top right button "Edit" in the split screen page details
    Then I can see top right button "Validate" in the split screen page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly can see row level action button "Edit" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    Then I softly can see top right button "Save" in page detail
    And I click on "Save" in the page details
    And I close the tab
    And I click on "Splitview" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see top right button "Edit" in the split screen page details
    Then I can see top right button "Validate" in the split screen page details
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly can see row level action button "Edit" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    Then I softly can see top right button "Save" in page detail
    And I click on "Save" in the page details
    And I close the tab
    And I click on "Splitview" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see top right button "Edit" in the split screen page details
    Then I can see top right button "Validate" in the split screen page details
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
      | Name       | Application |
      | Victor EXE | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly cannot see row level action button "Edit" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    And I click on "Splitview" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
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
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly cannot see row level action button "Edit" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    And I click on "Splitview" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly cannot see row level action button "Edit" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    And I click on "Splitview" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details
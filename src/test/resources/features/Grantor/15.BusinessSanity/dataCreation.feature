@dateCreation @regression
Feature: Validate all scenarios of every modules flow

  @focusAreaDemoOrg
  Scenario: Focus area
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Department Of Money" into field "Title__c"
    When I click modal button "Save and Continue"
    And I enter value "Department Details" into field "fieldDescription__c"
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "GrantorFocusAreaFilesgrid"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    When I enter the following values into flex table with id "GrantorFocusareaNotesgrid" by clicking "Add" :
      | Title            | Description            |
      | Department Money | Department Money Notes |
    When I click on "Activate" in the page details
    And I navigate to "Collab" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                              | Subject              | Body                      |
      | internal.user.product@gmail.com | Department Education | Department Education Body |
    And I close "Send Email" modal by clicking the top right x button
    Then I see status in Progress-bar is "Active" and is "Green"

  @focusAreaDemoOrg1
  Scenario: Focus area1
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Department Of Education" into field "Title__c"
    When I click modal button "Save and Continue"
    And I enter value "Department Details" into field "fieldDescription__c"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "GrantorFocusAreaFilesgrid"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    When I enter the following values into flex table with id "GrantorFocusareaNotesgrid" by clicking "Add" :
      | Title                | Description                |
      | Department Education | Department Education Notes |
    And I navigate to "Collab" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                              | Subject              | Body                      |
      | internal.user.product@gmail.com | Department Education | Department Education Body |
    And I close "Send Email" modal by clicking the top right x button
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @KPICreate
  Scenario:
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "KPI_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---keyperformanceindicator:-:GrantorKPIFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    When I enter the following values into flex table with id "GrantorKPINotesgrid" by clicking "Add" :
      | Title                | Description                |
      | Department Education | Department Education Notes |
    And I navigate to "Collab" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                              | Subject              | Body                      |
      | internal.user.product@gmail.com | Department Education | Department Education Body |
    And I close "Send Email" modal by clicking the top right x button
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @FundingSource
  Scenario: FundingSource
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Title" as "FundingSourceTitle"
    And I navigate to "Collab" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                              | Subject              | Body                      |
      | internal.user.product@gmail.com | Department Education | Department Education Body |
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"

  @ProgramActivation
  Scenario:
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "John Rambo" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name         | Program |
      | John Rambo   | Step 1  |
      | Daniel Smith | Step 2  |
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Department Of Money Education" in the table "---program:-:associateFocusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Department Of Education" in the table "---program:-:associateFocusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Plan for Health" in the table "---program:-:associateObjectivesTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Department of Education" in the table "---program:-:associateKPITableId---"
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                  | Required | Applies To  | Status |
      | Departmental Suapporting Doc | Optional | Application | Active |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description              | Due Date | Allow Record Editing |
      | John Rambo    | Fiscal Reviewer | Departmental Peer Review | 10       | No                   |
    And I click on "Send for Review" icon for "John Rambo" inside table
    Then I softly see status in Progress-bar is "Submitted for Review" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "John Rambo" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I click on "Complete Review" in the page details
    And I pause execution for "3" seconds
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I upload attachment without random number "Attachment.pdf" of type "Program Artifacts" from computer
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "Add" :
      | Title              | Description                    |
      | Departmental Notes | Departmental Notes Description |
    And I navigate to "Collab" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                              | Subject              | Body                      |
      | internal.user.product@gmail.com | Department Education | Department Education Body |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"

  @PublishedAnnDemo
  Scenario:
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 10000           |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "John Rambo" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
#    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
#    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name         | Announcement |
      | John Rambo   | Step 1       |
      | Daniel Smith | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name         | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Daniel Smith | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Daniel Smith" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---" without waiting for record
    Then I softly see value "Sent for Review" for title "Status" inside table "---announcement:-:flexGridApproverRolesTableId---"
    Then I softly see status in Progress-bar is "Submitted for Review" and is "green"
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Daniel Smith" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---" without waiting for record
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I click on submit review
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    And I wait for "2" seconds
#    And I click on "Edit" in the page details
#    When I navigate to "Financials" sub tab
#    And I enter value "Justified" into field "Justification__c"
#    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "flexGridGrantorAnnouncementFiles"
    And I pause execution for "5" seconds
    And I switch to iframe with id "GrantorAnnouncementFilesiframeContentId"
    And I upload attachment without random number "Attachment.pdf" of type "Funding Opportunity Announcement" from computer
    When I enter the following values into flex table with id "flexGridGrantorAnnouncementNotes" by clicking "Add" :
      | Title              | Description                    |
      | Departmental Notes | Departmental Notes Description |
    And I navigate to "Collab" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                              | Subject              | Body                      |
      | internal.user.product@gmail.com | Department Education | Department Education Body |
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"

  @Pre-ApplicationDemo
  Scenario:
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "Department of Health" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "Department of Health" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I enter the following values into flex table with id "---preApplication:-:preApplicationNotesTableId---" by clicking "Add" :
      | Title           | Description           |
      | Pre-Application | Pre-Application Notes |
    And I navigate to "Collab" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                              | Subject              | Body                      |
      | internal.user.product@gmail.com | Department Education | Department Education Body |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Contact |
      | Victoria Leeds | Project Director/Manager | Checked        |
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 5000   | 500        | 500            |
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name                      | Budget | Cash Match | Non-Cash Match |
      | Architectural and engineering fees | 5000   | 500        | 500            |
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Equipment     | 5000   | 500        | 500            |
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name                     | Budget | Cash Match | Non-Cash Match |
      | Administrative and legal expenses | 5000   | 500        | 500            |
    And I get the "EGMS ID"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---preApplication:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Accept" in the page details
    Then I softly see field "Status" as "Accepted"

  @ApplicationDemo
  Scenario:
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Applications" tab
#    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
#    When I click toggle button to select "Pre-Applications - Submitted"
#    And I perform quick search for "Department of Health" in "RecipientPreApplications" panel
#    When I click on "View" icon for "Department of Health" inside table
#    When I click on "Create Application" in the page details
#    And I click modal button "Save and Continue"
#    And I enter "Edition" values from "Application_Field_Values.xlsx"
#    When I click on "Save" in the page details
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Department of Health" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "Department of Health" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I navigate to "Budget" sub tab
#    Given I expand nested table containing column value "BP01"
#    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
#      | Category Name | Budget | Cash Match | Non-Cash Match |
#      | Construction  | 5000   | 500        | 500            |
#    Given I expand nested table containing column value "BP01"
#    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
#      | Category Name                      | Budget | Cash Match | Non-Cash Match |
#      | Architectural and engineering fees | 5000   | 500        | 500            |
#    Given I expand nested table containing column value "BP01"
#    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
#      | Category Name                     | Budget | Cash Match | Non-Cash Match |
#      | Administrative and legal expenses | 5000   | 500        | 500            |
    And I click on page navigation arrow "---applicationIntake:-:budgetPeriodTableId---" for table id "Next"
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Equipment     | 5000   | 500        | 500            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                 | Target |
      | Department of Education | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I enter the following values into flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---" by clicking "Add" :
      | Title       | Description       |
      | Application | Application Notes |
    And I navigate to "Collab" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                              | Subject              | Body                      |
      | internal.user.product@gmail.com | Department Education | Department Education Body |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name           | Project Role             | Is Key Contact |
      | Victoria Leeds | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "Green"

  @applicationReviewDemoOrg
  Scenario Outline:
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    And I pause execution for "5" seconds
    When I click on "Initiate Review Process" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I pause execution for "5" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Application Name>"
    When I click on "View" icon for "<Application Name>" inside table
    And I get the "EGMS ID"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer     |
      | Daniel Smith |
    And I click on "Assign" icon for "Daniel Smith" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Application Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Application Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer     |
      | John Rambo   |
      | Daniel Smith |
      | Simon Barlow |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "Simon Barlow" in "---applicationReview:-:panelAppTableId---" panel
    And I check "Simon Barlow" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "Daniel Smith" in "---applicationReview:-:panelAppTableId---" panel
    And I check "Daniel Smith" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "John Rambo" in "---applicationReview:-:panelAppTableId---" panel
    And I check "John Rambo" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I refresh the page
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer     |
      | Daniel Smith |
    Then I softly see that "Daniel Smith" has been added in flextable with Id "---applicationReview:-:reviewersTableId---"
    And I click on "Assign" icon for "Daniel Smith" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Application Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Application Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    And I refresh the page
    And I wait for "2" seconds
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    Then I softly see field "Status" as "Completed"
    When I click on "Funding Decision Memo" in the page details
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                    | Field                 |
      | AuGr                     | GrantCode__c          |
      | Departmental Description | fieldJustification__c |
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I edit the following rows inline in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title    | Recommended Budget | Recommend for Funding | Comments    | Total Commitment Amount |
      | Department of Health | 2000               | Yes                   | Recommended | 2000                    |
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name         | FDM    |
      | Daniel Smith | Step 1 |
      | John Rambo   | Step 2 |
    And I click on "Submit for Approval" in the page details
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

    Examples:
      | Announcement Name    | Application Name     |
      | Department of Health | Department of Health |

  @AwardDemoData
  Scenario:
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Department of Health" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Department of Health" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I click on "Create Subaward" icon for "Department of Health" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I enter value "Department of Education Description" into field "fieldGrantAwardDescription__c"
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Budget" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                   | Start Date                          | End Date                      |
      | Department Of Education | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodDate} |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                         | Start Date                          | End Date                      |
      | Department Of Money Education | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodDate} |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 20000       |
    When I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
#      | Name                       | Project Role             | Is Key Personnel |
#      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
#    And I click on "Remove" icon for "Project Director/Manager" inside flex table with id "---subAwardFromFDM:-:associateContactTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                   | Target |
      | Department of Education | 10     |
    And I navigate to "Terms" sub tab
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    When I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Responsibilities" sub tab
    And I get the "EGMS ID"
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name         | Award  |
      | John Rambo   | Step 1 |
      | Daniel Smith | Step 2 |
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Approved" and is "green"
    And I click on "Send to Subrecipient" in the page details

    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see that "Subaward" is in "Activated" status


  @dataCreationScenarios
  Scenario:
    And I published "Competitive" type announcement having name "Depart of Education Announcement" and properties "default"
    And I initiated an application review for application "{SavedValue:Depart of Education Announcement}" on announcement "{SavedValue:Depart of Education Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Depart of Education Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Depart of Education Announcement}"
    And I activate award from FDM having application name "{SavedValue:Depart of Education Announcement}"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Depart of Education Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Depart of Education Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Depart of Education Announcement}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Depart of Education Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Spent This Action |
      | Construction    | 30                |
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 30                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name       | Reimbursement |
      | John Rambo | Step 1        |
    When I get the "EGMS ID"
    And I pause execution for "5" seconds
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    Then I softly see field "Status" as "Submitted for Approval"

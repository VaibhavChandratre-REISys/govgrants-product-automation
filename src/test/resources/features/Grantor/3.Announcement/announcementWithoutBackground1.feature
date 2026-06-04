@announcement @grantor-regression @grantor-parallel-regression @regression @announcementWB1 @AnnouncementTemp
Feature: Validate all common scenarios in the  Announcement tab (Announcement without background)

  @198424 @ValidatefieldhistoryshouldbeupdateafterAnnownershiptaskreassigntootheruser @sprint-4  @reassignment @FieldHistoryExclude
  Scenario: Validate field history should be update after Ann ownership task reassign to other user
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation EXE | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Automation PM1" for title "New Value" inside field history table
    Then I softly see value "Automation PM" for title "Original Value" inside field history table

  @195677 @Validatethatnewapproversnameshouldbeupdatentheresponsibilitytabwhenapprovaltaskisreassigned @sprint-12-US-226646  @reassignment
  Scenario: Validate that new approver's name should be update in the responsibility tab when approval task is reassigned
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation PO1 | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Announcement" against the value "Automation PO" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation PO1" inside table "---announcement:-:approversTableId---"

  @217675 @ValidateAnnValidateapprovercanreassignthetaskifhe/shewasdefinedonthecurrentmodule @sprint-12-US-226646  @reassignment @OnHoldDueToApproverNotAdded
  Scenario: Validate Ann Validate approver can reassign the task if he/she was defined on the current module
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FD Username} | Step 3       |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "5" seconds
    When I "Approve" in the approval decision
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I wait for "3" seconds
    When I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click on remove for lookup from field "Program__c"
    And I enter in modal value "{SavedValue:ProgramEGMSID}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 2       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Announcement" against the value "{SavedValue:PO Username}" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 2" for title "Announcement" against the value "{SavedValue:FO Username}" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 3" for title "Announcement" against the value "{SavedValue:FD Username}" inside table "---announcement:-:approversTableId---"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "NA" for title "Announcement" against the value "{SavedValue:FO Username}" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 2" for title "Announcement" against the value "Automation FO1" inside table "---announcement:-:approversTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see value "Automation FO1" for title "Name" inside table "---program:-:approverTableId---"

  @221968 @Validatestep2approverisinsertedforAnncolumnwhenapprovaltaskisreassigned @sprint-12-US-226646  @reassignment @OnHoldDueToApproverNotAdded
  Scenario: Validate step2 approver is inserted for Ann column when approval task is reassigned
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation EXE | Step 1       |
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Name          | Announcement | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation PM | Step 2       | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 3       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "NA" for title "Announcement" against the value "{SavedValue:PM Username}" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 1" for title "Amendment Request" against the value "{SavedValue:PM Username}" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 1" for title "Post Award Reporting" against the value "{SavedValue:PM Username}" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 1" for title "Payment Request" against the value "{SavedValue:PM Username}" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 1" for title "Monitoring" against the value "{SavedValue:PM Username}" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 1" for title "Closeout" against the value "{SavedValue:PM Username}" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 2" for title "Announcement" against the value "Automation PM1" inside table "---announcement:-:approversTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Submitted for Approval"

  @224225 @ValidatePMuserontaskreassignmentpageexistingmessageshouldhaveappropriateinformationregardingQueueBasedTasks @sprint-12-US-226646  @reassignment
  Scenario: Validate PM user verify on task reassignment page existing message should have appropriate information regarding Queue Based Tasks
    Given I login to "Grantor" app as "PM" user
    And I navigate to "Home" tab
    Then I do not see "Reassign" inside "My Tasks" is displayed
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    Then I softly see the text containing :
      | Pre-Application and Applications Tasks which are assigned to the internal user will not be visible in the Task Reassignment page. These tasks are associated with Announcement Owner. To reassign these tasks, go to the Ownership Reassignment page and transfer the ownership of desired announcement. Queue based tasks(Related to User registration and Organizational Risk assessment) which are assigned to this user will not be shown here. Please check the Pending Tasks table for such tasks. |

  @230020 @ValidateAnnnewownercanseeeditanddeleteiconforformsafterAnnownershipwillgetchange @sprint-12-US-226646  @reassignment
  Scenario: Validate Ann new owner can see edit and delete icon for forms after Ann ownership will get change
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    And I wait for "4" seconds
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    Then I can see row level action button "Edit" against "Pre-Screen" in flex table with id "---announcement:-:annReviewFormsTableId---"
    Then I can see row level action button "Delete" against "Pre-Screen" in flex table with id "---announcement:-:annReviewFormsTableId---"
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Announcement" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Setup" sub tab
#    And I expand nested table containing column value "Pre-Screen Review"
    Then I can see row level action button "Edit" against "Pre-Screen" in flex table with id "---announcement:-:annReviewFormsTableId---"
    Then I can see row level action button "Delete" against "Pre-Screen" in flex table with id "---announcement:-:annReviewFormsTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Setup" sub tab
#    And I expand nested table containing column value "Pre-Screen Review"
    Then I cannot see row level action button "Edit" against "Pre-Screen" in flex table with id "---announcement:-:annReviewFormsTableId---"
    Then I cannot see row level action button "Delete" against "Pre-Screen" in flex table with id "---announcement:-:annReviewFormsTableId---"

  @195209  @sprint-12-US-226646  @reassignment
  Scenario: Validate  email should be generated for new owner once old owner reassign Ann ownership task to new user
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation EXE | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 2       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:AnnEGMSID} Automation PM Announcement

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    And I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:AnnEGMSID} Automation PM Announcement

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @194721 @194718  @sprint-11-US-224734  @reassignment
  Scenario: Validate email should get reached to "SA"(previous owner) when ownership of record is changed
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Announcement" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    And I click "OK" on modal confirmation box
    And I pause execution for "50" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I checkout to yopmail with mailid "govgrantsautomation.q2@yopmail.com"
    And I pause execution for "100" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:AnnEGMSID} Automation ADMIN Announcement

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
     #194721
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:AnnEGMSID} Automation ADMIN Announcement

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @221973  @sprint-11-US-218319  @reassignment
  Scenario: Validate task reassignment does not happen when a user tries to reassign his task to another user is responsible for different step of same module
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter in modal "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter in modal "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation EXE | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name            | Announcement |
      | Automation EXE1 | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 3       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure
      {SavedValue:AnnEGMSID} Approve Funding Announcement Not Started Approve Announcement #{SavedValue:AnnEGMSID} Created for Program #{SavedValue:ProgramEGMSID} Automation EXE You cannot specify the same user for multiple steps for Announcement


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """

  @221975 @ValidateAnnIfapproverandownerofaAnnaresamevalidateafterreassigningtheapprovaltaskownershipofrecordisnotchanged @sprint-11-US-218319  @reassignment
  Scenario: Validate Ann If approver and owner of a Ann are same validate after reassigning the approval task ownership of record is not changed
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | FDM    | Award  | Closeout |
      | Automation PM1 | Step 1       | Step 1 | Step 1 | Step 1   |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | Payment Request | Monitoring |
      | Automation EXE | Step 2       | Step 2          | Step 2     |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I see value "Automation EXE" for title "Name" inside table "---announcement:-:announcementOwner---"
    Then I softly see value "Step 2" for title "Announcement" against the value "Automation EXE1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation EXE" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 2" for title "Payment Request" against the value "Automation EXE" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 2" for title "Monitoring" against the value "Automation EXE" inside table "---announcement:-:approversTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I see value "Automation EXE" for title "Name" inside table "---announcement:-:announcementOwner---"
    Then I softly see value "Step 2" for title "Announcement" against the value "Automation EXE1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation EXE" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 2" for title "Payment Request" against the value "Automation EXE" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 2" for title "Monitoring" against the value "Automation EXE" inside table "---announcement:-:approversTableId---"

  @221979 @ValidateAnnIfapprandownerofAnnaresameafterreassigningtheownershipofAnnrecordapprovernameshouldnotchanged @sprint-11-US-218319  @reassignment
  Scenario: Validate Ann If approver and owner of a Ann are same validate after reassigning the ownership of Ann record approver name should not changed
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | Monitoring |
      | Automation EXE | Step 1       | Step 1     |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement | Closeout |
      | Automation PM | Step 2       | Step 2   |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | FDM    |
      | Automation PM1 | Step 3       | Step 3 |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Announcement" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I see value "Automation PM1" for title "Name" inside table "---announcement:-:announcementOwner---"
    Then I softly see value "Step 2" for title "Announcement" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 2" for title "Closeout" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 3" for title "Announcement" against the value "Automation PM1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 3" for title "FDM" against the value "Automation PM1" inside table "---announcement:-:approversTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @221985 @ValidateAnnIfapeerreviewerisalreadyaddedforsimilarroleandreviewertriestoreassignsuchtasktootherreviewerwithsameresponsibilityprogramreviewerreassignmentfails @sprint-11-US-218319  @reassignment
  Scenario: Validate Ann If a peer reviewer is already added for similar role and reviewer tries to reassign such task to other reviewer with same responsibility (program reviewer)validate reassignment fails
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter in modal "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    And I wait for "3" seconds
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation EXE | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name           | Responsibility   | Description                 | Due Date |
      | Automation EXE | Program Reviewer | Automation Test Description | 10       |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name            | Responsibility   | Description                 | Due Date |
      | Automation EXE1 | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    And I pause execution for "3" seconds
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "{SavedValue:EXE1 Username}" inside table
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I logout
    And I pause execution for "2" seconds
#    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
#    And I pause execution for "180" seconds
#    Then I refresh the page
#    And I see the mail subject is as follows :
#      """
#      Sandbox: Task Reassignment Report
#      """
#    Then I see the mail text is as follows :
#      """
#      Hello,
#
#      The task(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:
#
#      EGMS ID Type Status Subject Assigned By Due Date
#
#
#      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
#      Login in to EGMS and click on EGMS IDs to access the assigned record.
#
#
#      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.
#
#      EGMS ID Type Status Subject Assigned By Reason of Failure
#      {SavedValue:AnnEGMSID} Review Grantor Announcemen Not Started Review Announcement #{SavedValue:AnnEGMSID} Created for Program #{SavedValue:ProgramEGMSID} Automation EXE Responsibilities Tab - A person with the same role cannot be added again.
#
#
#      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
#
#      Thank you,
#
#      The EGMS Team.
#      """
    Given I am on "INTERNAL" portal
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I wait for "8" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---announcement:-:reviewersTableId---"
    And I wait for "4" seconds
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE1 Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I wait for "7" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---announcement:-:reviewersTableId---"

  @221992 @ValidateAnnstepshouldgetupdatedifDavidFOstep1approverreassignapprovertaskofsamerecordtoDanisFOwhosestepisNAforAnn @sprint-11-US-218319  @reassignment @OnHoldDueToApproverNotAdded
  Scenario: Validate Ann step should get updated if David FO step 1 approver reassign approver task of same record to Danis FO whose step is NA for Ann
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "6" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | FDM    |
      | Automation FO1 | NA           | Step 1 |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Announcement" against the value "Automation FO1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation FO" inside table "---announcement:-:approversTableId---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"

  @223503 @ValidateAnnstep4approveisinsertedforAnncolumnwhenapprovaltaskisreassigned @sprint-11-US-218319  @reassignment
  Scenario: Validate Ann step4 approver is inserted for Ann column when approval task is reassigned
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | Award  |
      | Automation EXE | Step 1       | Step 1 |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation PO | Step 2       | Step 1               | Step 1          | Step 1     | Step 1   |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement | FDM    |
      | Automation FD | Step 3       | Step 3 |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 4       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 4" for title "Announcement" against the value "Automation FO1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation FO" inside table "---announcement:-:approversTableId---"
    When I re-login to "Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @224665  @sprint-11-US-218319  @reassignment @Re-RunPlanningAndAnnouncement
  Scenario: Validate Ann failure email should generated for peer reviewer and success email generated for Approval
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter in modal "CompetitiveAnnBulkData" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter in modal "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement for Bulk"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 2       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter in modal "CompetitiveAnnBulkData" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter in modal "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID2"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement for Bulk"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    And I wait for "3" seconds
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name           | Responsibility   | Description                 | Due Date |
      | Automation PM1 | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "5" seconds
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "{SavedValue:PM1 Username}" inside table
    And I wait for "4" seconds
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I wait for "3" seconds
    And I enter in modal "CompetitiveAnnBulkData" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter in modal "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID3"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement for Bulk"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name           | Responsibility   | Description                 | Due Date |
      | Automation PM1 | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID2}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID2}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID2}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID2}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID3}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID3}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID3}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID3}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I logout
    And I wait for "5" seconds
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Task Reassignment Report
      """

    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date
      {SavedValue:AnnEGMSID} Approve Funding Announcement Not Started Approve Announcement #{SavedValue:AnnEGMSID} Created for Program #{SavedValue:ProgramEGMSID} Automation PM {Date:yyyy/MM/dd 00:00:00::d+10}


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure
      {SavedValue:AnnEGMSID2} Review Grantor Announcement Not Started Review Announcement #{SavedValue:AnnEGMSID2} Created for Program #{SavedValue:ProgramEGMSID} Automation PM Responsibilities Tab - A person with the same role cannot be added again.


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure
      {SavedValue:AnnEGMSID3} Review Grantor Announcement Not Started Review Announcement #{SavedValue:AnnEGMSID3} Created for Program #{SavedValue:ProgramEGMSID} Automation PM Responsibilities Tab - A person with the same role cannot be added again.


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """
    Given I am on "INTERNAL" portal
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Announcement" against the value "Automation PM1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation PM" inside table "---announcement:-:approversTableId---"

  @223430 @ValidateAnnouncementModulethetransferoftaskownershipisfail&Validatemailinyopmail @sprint-11-US-217998  @reassignment
  Scenario: Validate Announcement Module the transfer of task ownership is fail & Validate mail in yopmail
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter in modal "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
#    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    And I wait for "3" seconds
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name           | Responsibility   | Description                 | Due Date |
      | Automation PM1 | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "{SavedValue:PM1 Username}" inside table
    And I wait for "4" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure
      {SavedValue:AnnEGMSID} Review Grantor Announcement Not Started Review Announcement #{SavedValue:AnnEGMSID} Created for Program #{SavedValue:ProgramEGMSID} Automation PM Responsibilities Tab - A person with the same role cannot be added again.


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """

  @223528  @sprint-11-US-217998  @reassignment
  Scenario: Validate Announcement Module if Announcement record is in submitted for review state & submitted review by reviewer after changing the ownership of announcement then email should be send to the new owner
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter in modal "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    When I click on "Edit" in the page details
    And I wait for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name           | Responsibility   | Description                 | Due Date |
      | Automation PM1 | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "Automation PM1" inside table
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Announcement" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation PM1" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I wait for "7" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---announcement:-:reviewersTableId---"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "100" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Announcement {SavedValue:AnnEGMSID} has beenPeer Reviewed
      """
    Then I see the mail text is as follows :
      """
      Hello Automation,
      This email is to notify you that Announcement {SavedValue:AnnEGMSID} has been peer reviewed.

      Announcement Details:
      Announcement Title: {SavedValue:Automation Runtime Announcement}
      Announcement Type: Competitive
      Associated Program Name: Automation Permanent Internal Program

      Log in to EGMS and click here to start reviewing the details.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @224442 @ValidateReassignmentTaskallsimultaneousreassignmenttaskownershipshouldreassignedtonewowner&ValidatePass&failedtableinyopmail @sprint-11-US-217998  @reassignment
  Scenario: Validate Reassignment Task all simultaneous reassignment task ownership should reassigned to new owner & Validate Pass & failed table in yopmail
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I pause execution for "2" seconds
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID1"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter in modal "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    And I wait for "3" seconds
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation EXE | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility  | Description                 | Due Date |
      | Automation PM | Fiscal Reviewer | Automation Test Description | 7        |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name           | Responsibility  | Description                 | Due Date |
      | Automation PM1 | Fiscal Reviewer | Automation Test Description | 7        |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "Automation PM1" inside table
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime Direct Award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation PM | Fiscal Reviewer | Automation Description | 7        | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:EXE Username} | Step 1     |
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 2     |
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 3     |
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name           | Site Visit |
      | Automation PM1 | Step 4     |
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation EXE | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 3            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    And I click on advance filter of table id "---program:-:grantorTaskReassignTableId---" for LWC
    And I enter advance filter values inside id "---program:-:grantorTaskReassignTableId---" for LWC
      | Due Date | equals to | {Date:M/d/yyyy::d+7} |
    When I check "All" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "50" seconds
#    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AwardEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:ProgramEGMSID} Automation PM Program

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure
      {SavedValue:AnnEGMSID} Review Grantor Announcement Not Started Review Announcement #{SavedValue:AnnEGMSID} Created for Program #{SavedValue:ProgramEGMSID1} Automation PM Responsibilities Tab - A person with the same role cannot be added again.
      {SavedValue:SitevVisitId} Approve Site Visit Not Started Approve Site Visit for Organization SAN DIEGO ELECTRICAL TRAINING TRUST Automation PM You cannot specify the same user for multiple steps for Site Visit
      {SavedValue:SOWAMENDMENTREQUEST} Approve Amendment Request Not Started Approve Amendment Request for Subaward #{SavedValue:Automation Runtime Award for closeout} for SAN DIEGO ELECTRICAL TRAINING TRUST Automation PM You cannot specify the same user for multiple steps for Amendment Request


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """

  @223181 @sprint-11-US-217998  @reassignment
  Scenario Outline: Validate Announcement Module user should able to reassign the ownership to new user of more than 10 records & 1 email should be triggered for all records
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter in modal "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter in modal "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "4" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID1"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter in modal "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter in modal "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID2"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter in modal "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter in modal "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID3"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter in modal "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter in modal "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID4"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "3" seconds
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter in modal "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter in modal "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID5"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Given I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I pause execution for "5" seconds
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see "Other Leverage" in flex table header "---preApplication:-:preApplicationAttachmentId---"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 500        | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
#    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
#    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I click on "Back" in the page details
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I wait for "3" seconds
    #Bug446616
    And I click on "Edit" in the split screen page details
    Given I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Negotiation_Edit" values from "PreApplication_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---preApplication:-:negotiationFormTableId---" by clicking "Edit" :
      | Form Name                     | Needs Negotiation |
      | Standard Pre-Application form | Checked           |
    When I click on "Save" in the page details
    Then I softly can see top right button "Send to Subrecipient" in page detail
    And I click on "Send to Subrecipient" in the page details
    And I navigate to "Negotiations" sub tab
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:externalPendingTasktableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I navigate to "Negotiations" sub tab
    And I click on "Edit" in the page details
    When I enter value "Automation Test" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Negotiation Submitted"
    #Then I softly see field "Status" as "Submitted to Grantor" in "Negotiation Request Details" pageblock
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime Competitive Announcement}" on announcement "{SavedValue:Automation Runtime Competitive Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Competitive Announcement}"
    And I delete the record "{SavedValue:Automation Runtime Competitive Announcement}" from the object "FDM"
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---negotiation:-:homePendingTasks---"
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Negotiation Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor" in "Negotiation Request Details" pageblock
    #pre-screen Review
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    Given I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "default"
    When I initiated an application review for application "{SavedValue:Automation Runtime Competitive Announcement}" on announcement "{SavedValue:Automation Runtime Competitive Announcement}" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Application Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Application Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Application Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I pause execution for "5" seconds
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    #FDM submit for Approval state
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    Given I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "default"
    When I initiated an application review for application "{SavedValue:Automation Runtime Competitive Announcement}" on announcement "{SavedValue:Automation Runtime Competitive Announcement}" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Application Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
#    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
#    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Application Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Application Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I pause execution for "5" seconds
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    Then I softly can see top right button "Funding Decision Memo" in page detail
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    Then I softly see field "Status" as "Completed"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    And I click on "Edit" in the page details
    When I enter value "AuGr" into field "GrantCode__c"
    When I enter value "Automation Test Description" into field "Justification__c"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    When I check "<Application Name>" boxes in flex table with id "FundingDecisionMemoApplications"
    And I edit the following rows inline in flex table with id "FundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title                                        | Recommended Budget | Recommend for Funding | Comments    |
      | {SavedValue:Automation Runtime Competitive Announcement} | 500                | Yes                   | Recommended |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "GrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:PM Username} | Step 1 |
    Then I softly see that "{SavedValue:EXE Username}" has been added in flextable with Id "GrantorReviewStepRolesandResponsibilities"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID7"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I wait for "10" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    And I wait for "3" seconds
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation EXE | Step 1       | Step 2 | Step 2 | Step 2            | Step 2               | Step 2          | Step 2     | Step 2   |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name            | Announcement | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation EXE1 | Step 2       | Step 1               | Step 1          | Step 1     | Step 1   |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement | FDM    |
      | Automation FO | Step 3       | Step 3 |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Announcement" from reassign ownership dropdown
    When I perform quick search for "Automation Runtime Competitive Announcement" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "All" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:AnnEGMSID1}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID1}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID2}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID2}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID3}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID3}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID4}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID4}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID5}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID5}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID1}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID1}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---announcement:-:reviewersTableId---"
    Then I softly see value "Automation SPI3" for title "Name" inside table "---announcement:-:approversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---announcement:-:AnnouncementAttachmentTableId---"
    Then I can see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---home:-:internalHomePendingTaskTableId---" panel
    Then I see value "{SavedValue:PreappEGMSID}" for title "EGMS ID" inside table "---home:-:internalHomePendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    Then I softly can see top right button "Request Negotiation" in page detail
    Then I softly can see top right button "Accept" in page detail
    Then I softly can see top right button "Reject" in page detail
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID7}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID7}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I see value "Automation PM1" for title "Name" inside table "---announcement:-:announcementOwner---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "All Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly can see top right button "Previous Review Step" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "FDM" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I "Send to Owner" in the approval decision
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "All Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "GrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                     | FDM |
      | {SavedValue:PM Username} | NA  |
    When I enter the following values into flex table with id "GrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name           | FDM    |
      | Automation PM1 | Step 1 |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

    Examples:
      | Announcement Name                                        | Application Name                                         |
      | {SavedValue:Automation Runtime Competitive Announcement} | {SavedValue:Automation Runtime Competitive Announcement} |

  @238053 @ValidateAnnouncementaddeddifferentuserSimonPMforsameroleprogramreviewerandreassignedthenthereassignmentgotsuccessfulforthenewuser @sprint-14-US-235915  @reassignment
  Scenario: Validate Announcement added a different user Simon PM for same role program reviewer and reassigned then the reassignment got successful for the new user
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter in modal "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "2" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility   | Description                 | Due Date |
      | Automation FO | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:homePendingTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO1" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I wait for "7" seconds
    When I enter in modal value "Failed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---announcement:-:reviewersTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I click on "Resend for Review" icon for "Automation FO1" inside table
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"

  @238054 @ValidateannouncementwhenuseraddeddifferentuserSarahPMfordifferentrolefiscalreviewerandreassignedthereassignmentgotsuccessfulforthenewuser @sprint-14-US-235915  @reassignment
  Scenario: Validate announcement  when user added a different user Sarah PM for different role <fiscal reviewer> and reassigned the reassignment got successful for the new user
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter in modal "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name           | Responsibility   | Description                 | Due Date |
      | Automation EXE | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    And I wait for "3" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:homePendingTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name            | Responsibility  | Description                 | Due Date |
      | Automation EXE1 | Fiscal Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "All" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    And I wait for "3" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:homePendingTableId---"

  @238056 @238057  @sprint-14-US-235915  @reassignment @Re-RunPlanningAndAnnouncement
  Scenario: Validate announcement older comments are not editable to initial and reassigned reviewer when resend for review is performed
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter in modal "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
#    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
#    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility   | Description                 | Due Date |
      | Automation FO | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I wait for "4" seconds
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:homePendingTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO1" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I wait for "7" seconds
    When I enter in modal value "Failed" into field "Rating__c"
    And I enter in modal value "Failed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---announcement:-:reviewersTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I click on "Resend for Review" icon for "Automation FO1" inside table
    When I re-login to "Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---announcement:-:reviewersTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name           | Responsibility   | Description                 | Due Date |
      | Automation EXE | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:homePendingTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name            | Responsibility  | Description                 | Due Date |
      | Automation EXE1 | Fiscal Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    And I pause execution for "3" seconds
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "All" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:homePendingTableId---"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:homePendingTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Enter Review" against "Automation FO" in flex table with id "---announcement:-:reviewersTableId---"
    When I re-login to "Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see value "Automation FO1" for title "Name" inside table "---announcement:-:reviewersTableId---"
    #238057
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility   | Description                 | Due Date |
      | Automation PO | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "Automation PO" inside table
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:homePendingTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation PO" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I wait for "7" seconds
    When I enter in modal value "Failed" into field "Rating__c"
    And I enter in modal value "Failed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---announcement:-:reviewersTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I click on "Resend for Review" icon for "Automation PO" inside table
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"

  @223509 @ValidateAnnthecorrectstep&reviewermappingisdoneonindividualrecordforrespectiveassignmentwhenrecordswithsimilartasktypefordifferentstepandresponsibilitiesareselectedandprocessedreassignedsimultaneously @sprint-11-US-218319  @reassignment
  Scenario: Validate Ann the correct step & reviewer mapping is done on individual record for respective assignment when records with similar task type for different step and responsibilities are selected and processed/ reassigned simultaneously
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    And I wait for "3" seconds
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement | FDM    |
      | Automation PM | Step 1       | Step 2 |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID1"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    And I wait for "3" seconds
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 1       |
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Name          | Announcement |
      | Automation PM | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name            | Announcement |
      | Automation EXE1 | Step 3       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID1}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID1}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    #Ann-3
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID2"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    And I wait for "3" seconds
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation PM1 | Step 2       |
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Name          | Announcement |
      | Automation PM | Step 3       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID2}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID2}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID2}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID2}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID3"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    And I wait for "3" seconds
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation PM1 | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation EXE | Step 3       |
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Name          | Announcement |
      | Automation PM | Step 4       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID3}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID3}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID3}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID3}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID3}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID3}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID4"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 7        |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID5"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility  | Description                 | Due Date |
      | Automation PM | Fiscal Reviewer | Automation Test Description | 7        |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I click on advance filter "#advfGrantorTaskReassignment" of table id "---program:-:grantorTaskReassignTableId---"
    When I enter advance filter values inside id "advfGrantorTaskReassignment"
      | Due Date | Equals to | {Date:MM/dd/yyyy::d+7} |
    When I check "All" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID1}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID1}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID2}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID2}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID3}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID3}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID4}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID4}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID5}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID5}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I logout
    And I wait for "2" seconds
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "50" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Task Reassignment Report
      """

    Then I see the mail text is as follows :
      """
      Hello,


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """
    Given I am on "INTERNAL" portal
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Announcement" against the value "Automation PM1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 2" for title "FDM" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID1}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID1}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 2" for title "Announcement" against the value "Automation PM1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 1" for title "Amendment Request" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID1}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID1}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID2}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID2}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 3" for title "Announcement" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID3}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID3}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 4" for title "Announcement" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID4}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID4}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM1" for title "Name" inside table "---announcement:-:reviewersTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID4}" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID4}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation PM1" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I wait for "7" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---announcement:-:reviewersTableId---"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID4}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID4}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM1" for title "Name" inside table "---announcement:-:reviewersTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID5}" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID5}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation PM1" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I wait for "7" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---announcement:-:reviewersTableId---"

  @227763 @234373 @CompAnnPOusershouldseevalidationonsendtosrbuttonwhennegotiationisinitiatedduringFDMuserwhenuserselectonlybudgetsummarybyFocusAreasectionfornegotiationwhenbudgetedamountisnotequaltorecommendedamount @sprint-13-US-224612  @Allocation
  Scenario Outline: Comp Ann PO user should see validation on send to s/r button when negotiation is initiated during FDM user when user select only budget summary by Focus Area section for negotiation when budgeted amount is not equal to recommended amount
  | Direct Ann>>Verify PO user should see validation on send to s/r button when negotiation is initiated during FDM user when user select only budget summary by Focus Area section for negotiation|
    Given I published "<AnnouncementType>" type announcement having name "Automation Runtime Announcement" and properties "default-Automation PO user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
#    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
#    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I pause execution for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I pause execution for "5" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I pause execution for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I navigate to "Funding Decision Memo" sub tab
    When I enter value "AuGr" into field "GrantCode__c"
    And I enter value "Automation Test Description" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "GrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} | Step 1 |
    Then I softly see that "{SavedValue:<User> Username}" has been added in flextable with Id "GrantorReviewStepRolesandResponsibilities"
    #227763 #234373
    And I navigate to "Funding Decision Memo" sub tab
    And I edit the following rows inline in flex table with id "FundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommended Budget | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1500               | 1500                    | Yes                   | Recommended |
    And I click on "Submit for Approval" in the page details
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "Funding Decision Memo" sub tab
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "NegotiationDueDate__c"
    And I enter value "Budget Tab: Budget Summary by Focus Area" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    And I softly see the following messages in the page details contains:
      | Negotiation Tab: Please select "Budget Tab: Budget Details" with "Budget Tab: Budget Summary by Focus Area" in the Application Sections for the Negotiation field. |

    Examples:
      | Announcement Name                            | AnnouncementType | User |
      | {SavedValue:Automation Runtime Announcement} | Competitive      | PO   |
      | {SavedValue:Automation Runtime Announcement} | Directed         | PO   |

  @265360 @ValidateCompetitiveannvalidationisdisplayedtoEXEuseroncreateannoucementmodalwhenuserselectFocusareaasYesandAdvancepaymentasYes @sprint-21-US-265727  @Allocation
  Scenario: Validate Competitive ann validation is displayed to EXE user on create annoucement modal, when user select Focus area as Yes and Advance payment as Yes
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    When I enter in modal value "Yes" into field "IsAdvancePermitted__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | If the Focus Area Required is Yes, then the Advance Payment Allowed must be selected as No. |

  @265364 @267389 @ValidateFormulaannvalidationdisplayedtoPMuseroncreateannoucementmodalwhenuserselectallocationlevelasByapplicantwithFocusareaasYesandAdvancepaymentasYes @sprint-21-US-265727  @Allocation
  Scenario: Validate Formula ann validation is displayed to PM user on create annoucement modal when user select allocation level as By applicant with Focus area as Yes and Advance payment as Yes
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    When I enter in modal value "Yes" into field "IsAdvancePermitted__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | If the Focus Area Required is Yes, then the Advance Payment Allowed must be selected as No. |
    When I enter in modal value "No" into field "IsAdvancePermitted__c"
    And I click modal button "Save and Continue"
    #267389
    And I navigate to "Overview" sub tab
    Then I softly see fields "IsAdvancePermitted__c" is in edit mode
    When I enter value "Yes" into field "IsAdvancePermitted__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | If the Focus Area Required is Yes, then the Advance Payment Allowed must be selected as No. |

  @267387 @ValidateCompetitiveannvalidationisdisplayedtoAdminuseronannouncementLayoutAfterclickonSavebuttonwhenuserselectFocusareaasYesandAdvancepaymentasYes @sprint-21-US-265727  @Allocation
  Scenario: Validate Competitive ann validation is displayed to Admin user on announcement Layout After click on Save button, when user select Focus area as Yes and Advance payment as Yes
    When I login to "Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "competitive_Ann_AdminUser" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    Then I softly see fields "IsAdvancePermitted__c" is in edit mode
    When I enter value "Yes" into field "IsAdvancePermitted__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | If the Focus Area Required is Yes, then the Advance Payment Allowed must be selected as No. |

  @204082 @204086 @204090 @ValidatePMusershouldabletoaddsupportingdocumentinsteadofuploadingdocumentinsupportingdocumentchecklistsection @Sprint-7-US-203239  @SuppDoc
  Scenario Outline: Validate PM user should able to add supporting document instead of uploading document in supporting document checklist section
    When I login to "Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Setup" sub tab
    Then I softly can see top right button "Add" in flex table with id "---announcement:-:annChecklist---"
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    Then I softly see value "Application" for title "Applies To" inside table "---announcement:-:annChecklist---"
    And I click on "Upload Template" icon for "Automation test description" inside flex table with id "---announcement:-:annChecklist---" with wait for record
    Then I softly see "Upload Document" opens in overLay window
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    And I click in table hyperlink containing value "View"
    And I wait for "2" seconds
    And I download the file without rename
    And I wait for "3" seconds
    Then I softly verify that the file "Attachment.pdf" is downloaded
    Examples:
      | User |
      | PM   |
      | PO   |
      | EXE  |

  @204095 @204136 @ValidateAdminusershouldabletoseetheoptionUploadfilefromComputerafterclickonuploadfile @Sprint-7-US-203239  @SuppDoc
  Scenario: Validate Admin user should able to see the option "Upload file from Computer" after click on upload file
    When I login to "Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I wait for "5" seconds
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "competitive_Ann_AdminUser" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation of pre-app_nego_yes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition1" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I navigate to "Setup" sub tab
    Then I softly can see top right button "Add" in flex table with id "---announcement:-:annChecklist---"
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    Then I softly see value "Application" for title "Applies To" inside table "---announcement:-:annChecklist---"
    And I click on "Upload Template" icon for "Automation test description" inside flex table with id "---announcement:-:annChecklist---" with wait for record
    Then I softly see "Upload Document" opens in overLay window
    Then I see "Upload File from Computer" page block displayed
    #204136
    Then I softly see "Classification" inside page block detail
    Then I softly see "Upload File" inside page block detail
    Then I softly see "Description" inside page block detail

  @204154 @204155 @ValidatePMusershouldhavetwooptionsifuserclickonClassificationinUploadFilefromComputer @Sprint-7-US-203239  @SuppDoc
  Scenario: Validate PM user should have two options if user click on Classification in Upload File from Computer
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Setup" sub tab
    Then I softly can see top right button "Add" in flex table with id "---announcement:-:annChecklist---"
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    Then I softly see value "Application" for title "Applies To" inside table "---announcement:-:annChecklist---"
    And I click on "Upload Template" icon for "Automation test description" inside flex table with id "---announcement:-:annChecklist---" with wait for record
    Then I softly see "Upload Document" opens in overLay window
    #204155
    Then I see "Upload" button is disabled at modal under library
    Then I see "Cancel" button is displayed On Modal
    And I select Classification as "Others" at upload file modal
    When I upload file "AttachmentTesting.pdf" into library
    Then I do not see "Upload" button is disabled at modal under library

  @204160 @ValidateinsupportingdocumentchecklistusershouldabletoselectthesectionAppliesTotillPlanningAnnouncementPreApplicaitionandApplication @Sprint-7-US-203239  @SuppDoc
  Scenario: Validate in supporting document checklist user should able to select the section "Applies To" till Planning Announcement Pre-Applicaition and Application
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    And I wait for "3" seconds
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    Then I softly can see top right button "Add" in flex table with id "---announcement:-:annChecklist---"
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    Then I softly see value "Automation test description" for title "Description" inside table "---announcement:-:annChecklist---"
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    And I pause execution for "5" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Forms and Files" sub tab
    Then I softly see value "Automation test description" for title "Description" inside table "---applicationIntake:-:supportedDocumentsTableId---"
    Then I softly see value "Mandatory" for title "Required" inside table "---applicationIntake:-:supportedDocumentsTableId---"

  @336709 @336710 @336711 @336712 @336721 @336723 @336728 @ValidateAnnouncementPMusershouldabletoseeSystemEmailsectioninmessagestab @Sprint-13-US-341529-332637 @SystemEmail @ExcludeSendEmail
  Scenario: Validate Announcement PM user should able to see System Email section in messages tab
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Messages" sub tab
    Then I softly see "System Emails" page block displayed
    #336710
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility   | Description                 | Due Date |
      | Automation FD | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FD Username}" inside table
    And I pause execution for "4" seconds
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "180" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I softly see value "Notification: Announcement {SavedValue:AnnEGMSID} Awaiting Peer Review" for title "Subject" inside table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "pm.automation.qa2@yopmail.com" for title "From Address" inside table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "automation.fd.qa2@yopmail.com" for title "To Address" inside table "---announcement:-:systemEmailsTableId---"
    And I click on "View" icon for "automation.fd.qa2@yopmail.com" inside flex table with id "---announcement:-:systemEmailsTableId---" without waiting for record
    Then I softly see following details for email sent under collab:
      | pm.automation.qa2@yopmail.com                                          |
      | automation.fd.qa2@yopmail.com                                          |
      | Notification: Announcement {SavedValue:AnnEGMSID} Awaiting Peer Review |
    When I close "System Email" modal by clicking the top right x button
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:homePendingTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---program:-:homePendingTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "180" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I softly see value "Notification: Announcement {SavedValue:AnnEGMSID} Awaiting Peer Review" for title "Subject" inside table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "pm.automation.qa2@yopmail.com" for title "From Address" inside table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "automation.fd.qa2@yopmail.com" for title "To Address" inside table "---announcement:-:systemEmailsTableId---"
    And I click on "View" icon for "automation.fd.qa2@yopmail.com" inside flex table with id "---announcement:-:systemEmailsTableId---" without waiting for record
    And I pause execution for "4" seconds
    Then I softly see following details for email sent under collab:
      | pm.automation.qa2@yopmail.com                                          |
      | automation.fd.qa2@yopmail.com                                          |
      | Notification: Announcement {SavedValue:AnnEGMSID} Awaiting Peer Review |
    When I close "System Email" modal by clicking the top right x button
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FD" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    #336721
    And I wait for "220" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I softly see quick search inside table id "---announcement:-:systemEmailsTableId---"
    When I perform quick search for "Notification: Announcement {SavedValue:AnnEGMSID} has been Peer Reviewed" in "---announcement:-:systemEmailsTableId---" panel
    Then I softly see value "Notification: Announcement {SavedValue:AnnEGMSID} has been Peer Reviewed" for title "Subject" inside table "---announcement:-:systemEmailsTableId---"
    #336728
    And I click on "View" icon for "Notification: Announcement {SavedValue:AnnEGMSID} has been Peer Reviewed" inside flex table with id "---announcement:-:systemEmailsTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see following details for email sent under collab:
      | pm.automation.qa2@yopmail.com                                            |
      | automation.fd.qa2@yopmail.com                                            |
      | Notification: Announcement {SavedValue:AnnEGMSID} has been Peer Reviewed |
    When I close "System Email" modal by clicking the top right x button
    #336723
    And I wait for "5" seconds
    And I click on parallel menu button in flex table title "System Emails"
    And I select "Download as PDF" from parallel lines dropdown of "System Emails"
    And I download the file
    Then I softly see "System Emails" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    #336711
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I softly see value "Notification: Announcement {SavedValue:AnnEGMSID} has been Peer Reviewed" for title "Subject" inside table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "pm.automation.qa2@yopmail.com" for title "From Address" inside table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "automation.fd.qa2@yopmail.com" for title "To Address" inside table "---announcement:-:systemEmailsTableId---"
    And I click on "View" icon for "Notification: Announcement {SavedValue:AnnEGMSID} has been Peer Reviewed" inside flex table with id "---announcement:-:systemEmailsTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see following details for email sent under collab:
      | pm.automation.qa2@yopmail.com                                            |
      | automation.fd.qa2@yopmail.com                                            |
      | Notification: Announcement {SavedValue:AnnEGMSID} has been Peer Reviewed |
    When I close "System Email" modal by clicking the top right x button
    #336712
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I navigate to "Messages" sub tab
    Then I softly see value "Notification: Announcement {SavedValue:AnnEGMSID} has been Peer Reviewed" for title "Subject" inside table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "pm.automation.qa2@yopmail.com" for title "From Address" inside table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "automation.fd.qa2@yopmail.com" for title "To Address" inside table "---announcement:-:systemEmailsTableId---"
    And I click on "View" icon for "Notification: Announcement {SavedValue:AnnEGMSID} has been Peer Reviewed" inside flex table with id "---announcement:-:systemEmailsTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see following details for email sent under collab:
      | pm.automation.qa2@yopmail.com                                            |
      | automation.fd.qa2@yopmail.com                                            |
      | Notification: Announcement {SavedValue:AnnEGMSID} has been Peer Reviewed |

  @336713 @336714 @ValidateAnnouncementusershouldnotabletoseeemailtoNotifyApprovalinSystemEmailssectioninmessagestabwhensubmitAnnforapproval @Sprint-13-US-341529-332637 @SystemEmail
  Scenario: Validate Announcement PM user should not able to see email to Notify Approval in System Emails section in messages tab when submit Ann for approval
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    And I wait for "3" seconds
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 1000              |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "180" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---announcement:-:systemEmailsTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    #336714
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    And I wait for "150" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---announcement:-:systemEmailsTableId---"

  @336715  @Sprint-13-US-341529-332637 @SystemEmail @Re-RunPlanningAndAnnouncement
  Scenario: Validate Announcement PM user should not able to see email to Notify Approval in System Emails section in messages tab when forward Ann to other approver
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
#    And I save the field labeled "Announcement Name" as "Automation Runtime Formula Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    And I wait for "3" seconds
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 1000              |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:FD Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "180" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---announcement:-:systemEmailsTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---announcement:-:systemEmailsTableId---"

  @336716 @ValidateAnnouncementFDusershouldnotabletoseeemailtoNotifyAnnouncementRejectioninSystemEmailssectioninmessagestabwhenrejectAnn @Sprint-13-US-341529-332637 @SystemEmail
  Scenario: Validate Announcement FD user should not able to see email to Notify Announcement Rejection in System Emails section in messages tab when reject Ann
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I wait for "5" seconds
    And I click toggle button to select "Draft Directed Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    And I wait for "3" seconds
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Reject" in the approval decision
    And I pause execution for "5" seconds
    Then I softly see field "Status" as "Rejected"
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    And I wait for "150" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---announcement:-:systemEmailsTableId---"

  @336717 @Sprint-13-US-341529-332637 @SystemEmail
  Scenario: Validate Announcement FO user should not able to see email to Notify Announcement owner of send back in System Emails section in messages tab when send back Ann to record owner
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I wait for "5" seconds
    And I click toggle button to select "Draft Directed Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    And I wait for "3" seconds
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    And I wait for "3" seconds
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Draft"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I wait for "150" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see field "Status" as "Created"
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---announcement:-:systemEmailsTableId---"

  @336718 @336729 @ValidateAnnouncementPMusershouldnotabletoseeemailtoInvitedApplicantsofPublishedAnnouncementinSystemEmailssectioninmessagestabwhenPublishtheAnn @Sprint-13-US-341529-332637 @SystemEmail
  Scenario: Validate Announcement PM user should not able to see email to Notify Invited Applicants of Published Announcement in System Emails section in messages tab when Publish the Ann
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter value "Individuals" into field "EligibleApplicantTypes__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    And I wait for "3" seconds
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "Automation PM" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicant Organization              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    And I wait for "180" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---announcement:-:systemEmailsTableId---"
    #336729
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---announcement:-:systemEmailsTableId---"

  @336719 @ValidateAnnouncementEXEusershouldnotabletoseeEmailinSystemEmailssectionwhensendmailthroughmessagessectioninmessagestab @Sprint-13-US-341529-332637
  Scenario: Validate Announcement EXE user should not able to see Email in System Emails section when send mail through messages section in messages tab
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter value "Individuals" into field "EligibleApplicantTypes__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I pause execution for "5" seconds
    And I send the email under collab tab with following details:
      | To                            | Subject         | Body                       |
      | pm.automation.qa2@yopmail.com | Automation Test | Automation Test Email Body |
    And I wait for "2" seconds
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I softly see value "" for title "Attention To" inside table "---announcement:-:collabMessages---"
    Then I see the following rows under the following headers in table with id "---announcement:-:collabMessages---" :
      | Actions     | Subject         | From Address                   | To Address                    | CC Address | Attention To | Email Subject   | Preview                    |
      | Action menu | Automation Test | exe.automation.qa2@yopmail.com | pm.automation.qa2@yopmail.com |            |              | Automation Test | Automation Test Email Body |
    And I refresh the page
    And I wait for "3" seconds
    Then I see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"

  @336732 @336731 @ValidateAnnouncementFOuserseeRefreshbuttonunderhamburgericononSystemEmailssectionshouldabletorefreshthetable @Sprint-13-US-341529-332637 @SystemEmail
  Scenario: Validate Announcement FO user see Refresh button under hamburger icon on System Emails section & should able to refresh the table
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
#    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Messages" sub tab
    Then I softly see "System Emails" page block displayed
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility   | Description                 | Due Date |
      | Automation FD | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FD Username}" inside table
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "200" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I softly see value "Notification: Announcement {SavedValue:AnnEGMSID} awaiting peer review" for title "Subject" inside table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "pm.automation.qa2@yopmail.com" for title "From Address" inside table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "automation.fd.qa2@yopmail.com" for title "To Address" inside table "---announcement:-:systemEmailsTableId---"
    When I perform quick search for "exe.automation.qa2@yopmail.com" in "---announcement:-:systemEmailsTableId---" panel
    Then I see "No Records Found" inside flex table with id "---announcement:-:systemEmailsTableId---"
    When I click on button "resetIcon" in flex table with id "RecordSystemEmailHistory"
    Then I softly see value "Notification: Announcement {SavedValue:AnnEGMSID} awaiting peer review" for title "Subject" inside table "---announcement:-:systemEmailsTableId---"
    #336731
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    And I navigate to "Messages" sub tab
    When I perform quick search for "exe.automation.qa2@yopmail.com" in "---announcement:-:systemEmailsTableId---" panel
    Then I see "No Records Found" inside flex table with id "---announcement:-:systemEmailsTableId---"
    When I click on button "resetIcon" in flex table with id "RecordSystemEmailHistory"
    Then I softly see value "Notification: Announcement {SavedValue:AnnEGMSID} awaiting peer review" for title "Subject" inside table "---announcement:-:systemEmailsTableId---"

  @336722 @336724 @ValidateAnnouncementPOusercanseeAdvancefiltershouldworkcorrectlyonSystemEmailsection @Sprint-13-US-341529-332637 @SystemEmail
  Scenario: Validate Announcement PO user can see Advance filter should work correctly on System Email section
    When I login to "Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility   | Description                 | Due Date |
      | Automation FD | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FD Username}" inside table
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "220" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
#    When I click on advance filter "#advfRecordSystemEmailHistory" of table id "---announcement:-:systemEmailsTableId---"
#    When I enter advance filter values inside id "advfRecordSystemEmailHistory"
#      | Subject | contains | Notification: Announcement {SavedValue:AnnEGMSID} awaiting Peer Review |
#    Then I softly see value "Notification: Announcement {SavedValue:AnnEGMSID} awaiting Peer Review" for title "Subject" inside table "---announcement:-:systemEmailsTableId---"
#    And I refresh the page
    #336724
    Then I softly see "Created Date" in flex table header "---announcement:-:systemEmailsTableId---"
    Then I softly see "From Address" in flex table header "---announcement:-:systemEmailsTableId---"
    Then I softly see "To Address" in flex table header "---announcement:-:systemEmailsTableId---"
    Then I softly see "Subject" in flex table header "---announcement:-:systemEmailsTableId---"
    Then I softly see "Actions" in flex table header "---announcement:-:systemEmailsTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "Notification: Announcement {SavedValue:AnnEGMSID} awaiting Peer Review" for title "Subject" inside table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "automation.po.qa2@yopmail.com" for title "From Address" inside table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "automation.fd.qa2@yopmail.com" for title "To Address" inside table "---announcement:-:systemEmailsTableId---"

  @336725 @ValidateAnnouncementEXEusershouldnotabletoviewemailontableemailgeneratedafterPublishtheAnninSystemEmailssectionincollabtab @Sprint-13-US-341529-332637 @SystemEmail
  Scenario: Validate Announcement EXE user should not able to view email on table & email generated after Publish the Ann in System Emails section in collab tab
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO-Automation EXE user"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I wait for "180" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---announcement:-:systemEmailsTableId---"
    And I checkout to yopmail with mailid "automationspi31.qa2@yopmail.com"
    Then I refresh the page
    And I pause execution for "100" seconds
    And I click on mail with subject "Sandbox: Notification: New Opportunity #{SavedValue:AnnEGMSID}hasbeen Published"
    Then I see the mail subject is as follows :
      """
      Sandbox: Notification: New Opportunity #{SavedValue:AnnEGMSID}hasbeen Published
      """


  @336726 @336739 @ValidateAnnouncementPMusershouldabletoviewemailonclickofviewicondisplayontable&emailgeneratedafterclickonUndobuttonbylaststepapproverinSystemEmailssectioninmessagestab @Sprint-13-US-341529-332637 @SystemEmail @ExcludeSendEmail
  Scenario: Validate Announcement PM user should able to view email on click of view icon display on table & email generated after click on Undo button by last step approver in System Emails section in messages tab
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter value "Individuals" into field "EligibleApplicantTypes__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    And I wait for "3" seconds
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "Automation PM" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PO | Step 2       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicant Organization              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "180" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I softly see value "Notification: Approver initiated undo action on Announcement {SavedValue:AnnEGMSID}." for title "Subject" inside table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "automation.po.qa2@yopmail.com" for title "From Address" inside table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "automation.po.qa2@yopmail.com" for title "To Address" inside table "---announcement:-:systemEmailsTableId---"
    And I click on "View" icon for "automation.po.qa2@yopmail.com" inside flex table with id "---announcement:-:systemEmailsTableId---" without waiting for record
    And I pause execution for "5" seconds
    Then I softly see following details for email sent under collab:
      | automation.po.qa2@yopmail.com                                                        |
      | automation.po.qa2@yopmail.com                                                        |
      | Notification: Approver initiated undo action on Announcement {SavedValue:AnnEGMSID}. |
    When I close "System Email" modal by clicking the top right x button
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I softly see value "Notification: Approver initiated undo action on Announcement {SavedValue:AnnEGMSID}." for title "Subject" inside table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "automation.po.qa2@yopmail.com" for title "From Address" inside table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "pm.automation.qa2@yopmail.com" for title "To Address" inside table "---announcement:-:systemEmailsTableId---"
    And I click on "View" icon for "pm.automation.qa2@yopmail.com" inside flex table with id "---announcement:-:systemEmailsTableId---" without waiting for record
    And I pause execution for "5" seconds
    Then I softly see following details for email sent under collab:
      | automation.po.qa2@yopmail.com                                                        |
      | pm.automation.qa2@yopmail.com                                                        |
      | Notification: Approver initiated undo action on Announcement {SavedValue:AnnEGMSID}. |
    When I close "System Email" modal by clicking the top right x button
    #336739
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I navigate to "Messages" sub tab
    Then I softly see value "Notification: Approver initiated undo action on Announcement {SavedValue:AnnEGMSID}." for title "Subject" inside table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "automation.po.qa2@yopmail.com" for title "From Address" inside table "---announcement:-:systemEmailsTableId---"
    Then I softly see value "fo.automation.qa2@yopmail.com" for title "To Address" inside table "---announcement:-:systemEmailsTableId---"

  @336735 @ValidateAnnouncemenPMuserseeretesttablebuttonunderhamburgericononSystemEmailsectioshouldnotabletoResetthetablewhenuserapplytheadvancefilterclickonresetbutton
  Scenario: Validate Announcement PM user see retest table button under hamburger icon on System Email section & should not able to Reset the table when user apply the advance filter & click on reset button
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility   | Description                 | Due Date |
      | Automation FD | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FD Username}" inside table
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "220" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I softly see value "Notification: Announcement {SavedValue:AnnEGMSID} awaiting peer review" for title "Subject" inside table "---announcement:-:systemEmailsTableId---"
#    When I click on advance filter "#advfRecordSystemEmailHistory" of table id "---announcement:-:systemEmailsTableId---"
#    When I enter advance filter values inside id "advfRecordSystemEmailHistory"
#      | From Address | contains | pm.automation.qa2@yopmail.com |
#    And I wait for "3" seconds
#    Then I softly see value "pm.automation.qa2@yopmail.com" for title "From Address" inside table "---announcement:-:systemEmailsTableId---"
#    And I select "Reset Table" from parallel lines dropdown of "System Emails"
#    And I wait for "3" seconds
#    Then I softly see value "pm.automation.qa2@yopmail.com" for title "From Address" inside table "---announcement:-:systemEmailsTableId---"

  @336736 @ValidateAnnouncementPMuserusershouldabletoseeallSystemEmailsaresortedbydefaultbyCreatedDatewithmostrecentontopforInternalorganization @Sprint-13-US-341529-332637 @SystemEmail
  Scenario: Validate Announcement PM user user should able to see all System Emails are sorted by default by Created Date with most recent on top for Internal organization
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Messages" sub tab
    Then I softly see "System Emails" page block displayed
    #336710
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility   | Description                 | Due Date |
      | Automation FD | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FD Username}" inside table
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:homePendingTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---program:-:homePendingTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FD" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I wait for "200" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I softly see value "Notification: Announcement {SavedValue:AnnEGMSID} has been Peer Reviewed" for title "Subject" inside table "---announcement:-:systemEmailsTableId---"
    And I save the value from row "1" for column name "Subject" as "newSubject" from flex table "---announcement:-:systemEmailsTableId---"
    Then I softly see that the saved value "{SavedValue:newSubject}" and "Notification: Announcement {SavedValue:AnnEGMSID} has been Peer Reviewed" are equal
    And I save the value from row "2" for column name "Subject" as "oldSubject" from flex table "---announcement:-:systemEmailsTableId---"
    Then I softly see that the saved value "{SavedValue:oldSubject}" and "Notification: Announcement {SavedValue:AnnEGMSID} awaiting peer review" are equal

  @336737 @whenAnnownerassigntheirtasktootheruser @Sprint-13-US-341529-332637 @SystemEmail @Re-RunPlanningAndAnnouncement
  Scenario: Validate Announcement PM user should not able to see email for Task Reassignment in System Emails section in messages tab when Ann owner assign their task to other user
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter value "Individuals" into field "EligibleApplicantTypes__c"
    And I pause execution for "3" seconds
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    And I wait for "3" seconds
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "Automation PM" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation EXE | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I pause execution for "3" seconds
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicant Organization              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "50" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I wait for "180" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---announcement:-:systemEmailsTableId---"

  @336738 @ValidateAnnouncementEXEusershouldnotabletoseeemailforOwnershipTransferinSystemEmailssectioninmessagestabwhenAnnownertransfertheirownershiptootheruser @Sprint-13-US-341529-332637 @SystemEmail
  Scenario: Validate Announcement EXE user should not able to see email for Ownership Transfer in System Emails section in messages tab when Ann owner transfer their ownership to other user
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter value "Individuals" into field "EligibleApplicantTypes__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Announcement" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "All" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I wait for "180" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---announcement:-:systemEmailsTableId---"

  @329980 @329981 @ValidateforAnnouncementPMusershouldabletoseeAttentionToColumnundermessagessectioninmessagestab @Sprint-11-US-326384 @SystemEmail @ExcludeSendEmail
  Scenario: Validate for Announcement PM user should able to see Attention To Column under messages section in messages tab
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter value "Individuals" into field "EligibleApplicantTypes__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I navigate to "Messages" sub tab
    Then I softly see "Attention To" in flex table header "---announcement:-:collabMessages---"
    And I click on top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I wait for "5" seconds
    And I send the email under collab tab with following details:
      | To                             | Subject         | Body                       |
      | exe.automation.qa2@yopmail.com | Automation Test | Automation Test Email Body |
    And I wait for "2" seconds
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I softly see value "" for title "Attention To" inside table "---announcement:-:collabMessages---"
    Then I see the following rows under the following headers in table with id "---announcement:-:collabMessages---" :
      | Actions     | Subject         | From Address                  | To Address                     | CC Address | Attention To | Email Subject   | Preview                    |
      | Action menu | Automation Test | pm.automation.qa2@yopmail.com | exe.automation.qa2@yopmail.com |            |              | Automation Test | Automation Test Email Body |
    #329981
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I navigate to "Messages" sub tab
    Then I softly see "Attention To" in flex table header "---announcement:-:collabMessages---"
    And I click on top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I pause execution for "5" seconds
    And I send the email under collab tab with following details:
      | To                             | Subject             | Body                           |
      | pm1.automation.qa2@yopmail.com | Automation Test PM1 | Automation Test PM1 Email Body |
    And I wait for "1" seconds
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I softly see value "" for title "Attention To" inside table "---announcement:-:collabMessages---"
    And I navigate to "Messages" sub tab
    Then I see the following rows under the following headers in table with id "---announcement:-:collabMessages---" :
      | Actions     | Subject             | From Address                  | To Address                     | CC Address | Attention To | Email Subject       | Preview                        |
      | Action menu | Automation Test PM1 | automation.po.qa2@yopmail.com | pm1.automation.qa2@yopmail.com |            |              | Automation Test PM1 | Automation Test PM1 Email Body |

  @329982 @329983 @ValidateAnnouncementFOusershouldabletoseeAttentionToColumnundermessagessectioninmessagestab @Sprint-11-US-326384 @SystemEmail @ExcludeSendEmail
  Scenario: Validate Announcement FO user should able to see "Attention To" Column under messages section in messages tab
    And I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "default"
    When I login to "Grantor" app as "FO" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    Then I see status in Progress-bar is "Published" and is "dark blue"
    And I navigate to "Messages" sub tab
    Then I softly see "Attention To" in flex table header "---announcement:-:collabMessages---"
    And I click on top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I wait for "5" seconds
    And I send the email under collab tab with following details:
      | To                          | Subject              | Body                            |
      | exe1.automation@yopmail.com | Automation Test EXE1 | Automation Test EXE1 Email Body |
    And I wait for "2" seconds
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I softly see value "" for title "Attention To" inside table "---announcement:-:collabMessages---"
    Then I see the following rows under the following headers in table with id "---announcement:-:collabMessages---" :
      | Actions     | Subject              | From Address                  | To Address                  | CC Address | Attention To | Email Subject        | Preview                         |
      | Action menu | Automation Test EXE1 | fo.automation.qa2@yopmail.com | exe1.automation@yopmail.com |            |              | Automation Test EXE1 | Automation Test EXE1 Email Body |
    #329983
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    Then I see status in Progress-bar is "Published" and is "dark blue"
    And I navigate to "Messages" sub tab
    Then I softly see "Attention To" in flex table header "---announcement:-:collabMessages---"
    And I click on top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I pause execution for "5" seconds
    And I send the email under collab tab with following details:
      | To                             | Subject             | Body                           |
      | fo1.automation.qa2@yopmail.com | Automation Test FO1 | Automation Test FO1 Email Body |
    And I wait for "2" seconds
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I softly see value "" for title "Attention To" inside table "---announcement:-:collabMessages---"
    Then I see the following rows under the following headers in table with id "---announcement:-:collabMessages---" :
      | Actions     | Subject             | From Address                  | To Address                     | CC Address | Attention To | Email Subject       | Preview                        |
      | Action menu | Automation Test FO1 | automation.fd.qa2@yopmail.com | fo1.automation.qa2@yopmail.com |            |              | Automation Test FO1 | Automation Test FO1 Email Body |

  @329984 @ValidateforAnnouncementAdminusershouldabletoseeAttentionToColumnundermessagessectioninmessagestab @Sprint-11-US-326384
  Scenario: Validate for Announcement Admin user should able to see "Attention To" Column under messages section in messages tab
    When I login to "Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnn_AdminUser" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I navigate to "Messages" sub tab
    Then I softly see "Attention To" in flex table header "---announcement:-:collabMessages---"
    And I click on top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I pause execution for "5" seconds
    And I send the email under collab tab with following details:
      | To                             | Subject             | Body                           |
      | fo1.automation.qa2@yopmail.com | Automation Test FO1 | Automation Test FO1 Email Body |
    And I pause execution for "2" seconds
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I softly see value "" for title "Attention To" inside table "---announcement:-:collabMessages---"
    Then I see the following rows under the following headers in table with id "---announcement:-:collabMessages---" :
      | Actions     | Subject             | From Address                       | To Address                     | CC Address | Attention To | Email Subject       | Preview                        |
      | Action menu | Automation Test FO1 | govgrantsautomation.q2@yopmail.com | fo1.automation.qa2@yopmail.com |            |              | Automation Test FO1 | Automation Test FO1 Email Body |

  @329986 @ValidateforAnnouncementEXEusershouldabletoseeAttentionToColumnundermessagessectioninmessagestab @Sprint-11-US-326384
  Scenario: Validate for Announcement EXE user should able to see "Attention To" Column under messages section in messages tab
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter value "Individuals" into field "EligibleApplicantTypes__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I navigate to "Messages" sub tab
    Then I softly see "Attention To" in flex table header "---announcement:-:collabMessages---"
    And I click on top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I send the email under collab tab with following details:
      | To                            | Subject         | Body                       |
      | pm.automation.qa2@yopmail.com | Automation Test | Automation Test Email Body |
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I softly see value "" for title "Attention To" inside table "---announcement:-:collabMessages---"
    Then I see the following rows under the following headers in table with id "---announcement:-:collabMessages---" :
      | Actions     | Subject         | From Address                   | CC Address | To Address                    | Attention To | Email Subject   |
      | Action menu | Automation Test | exe.automation.qa2@yopmail.com |            | pm.automation.qa2@yopmail.com |              | Automation Test |
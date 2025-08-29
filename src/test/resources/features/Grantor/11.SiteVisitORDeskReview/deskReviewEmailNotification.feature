@deskReview @grantor-regression @grantor-parallel-regression @siteVisit @regression @siteAndDeskReview @deskReviewEmailNotification @EmailNotification @siteAndDeskReviewmailandPdf  @skipOnJenkins
Feature: Validate all scenarios in Desk Review for Email Notification

  @51021 @66557 @51022 @66549 @51023 @66146 @66485 @77256 @66550 @deskReviewSendToSubrecipientdAndCorrectiveActionsBySubrecipient
  Scenario: Send Desk Review to Subrecipient, Corrective Actions and Submit to Grantor by Subrecipient |Validate whether pending task is created for Program approver under Home Tab when the award owner submits the Desk Review for approval
  Validate when the desk review is submitted by the Subrecipient to grantor, the internal user recieves an email notification
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:EXE Username} | Step 1      |
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:FO Username} | Step 2      |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I wait for "3" seconds
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:homePendingTasksTableId---" panel
    Then I softly see that "Approve Desk Review" has been added in flextable with Id "---deskreview:-:homePendingTasksTableId---"
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:homePendingTasksTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    Then I softly can see top right button "Send to Subrecipient" in page detail
    When I click on "Send to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    And I pause execution for "4" seconds
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    And I collapse nested table containing column value "Automation Finding"
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I click on "Submit to Grantor" in the page details
    And I wait for "4" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Desk Review Report Submitted by Subrecipient
      """
    Given I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:DeskReview}" inside flex table with id "---deskreview:-:managementInitiateDRtableid---"
    Then I softly can see top right button "Send back to Subrecipient" in page detail
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"


  @55279 @66469 @66148 @approverSendBackToUserDeskReview
  Scenario: Validate whether the approver will be able to SendBack to Owner |Validate Pending task is not created to fiscal approver when program approver performs send to the owner.
  Verify when the FO user Send Back to owner during approval process of desk review, the record owner recieves an email notification
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:EXE Username} | Step 1      |
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:FO Username} | Step 2      |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I refresh the page
    And I click on "Notify" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    Then I softly can see top right button "Conduct" in page detail
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I wait for "3" seconds
    And I get the "EGMS ID"
    When I save the field containing "EGMS ID" as "dvID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:dvID}" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:dvID}" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    And I "Send to Owner" in the approval decision
    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "5" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Site Visit/Desk Review Report for {SavedValue:dvID} has been SentBack
      """
    Given I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:dvID}" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    Then I softly do not see value "{SavedValue:dvID}" for title "EGMS ID" inside table "---deskreview:-:monitoringTabPhasePendingTasks---"


  @69411 @61057 @61055 @55370 @66139 @77253 @66274 @snapshotAfterSubmitForApprovalDeskReviewIsAcceptedAndClosed  @skipOnJenkins @snapExecution
  Scenario: Validate whether record Owner is able to view the Accept and Close Button and User view the Snapshot after Desk Review is Submitted for Approval status also after Accepted and Closed |Subrecipient can view Closed Desk Review
  Validate whether the approver receives an email notification to approve the desk review| Validate whether external user will receive an email notification when desk review is accepted and closed.
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:EXE Username} | Step 1      |
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:FO Username} | Step 2      |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I wait for "3" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    And I click on Menu icon present on top right corner of the page
    And I wait for "5" seconds
    And I select "Take Snapshot" from dropdown
    And I wait for "2" seconds
    And I refresh the page
    When I navigate to "History" sub tab
    And I click on hyperlink which contains todays date with text "SnapShot on"
    And I click on "Download" button for snapshot view
    And I wait for "3" seconds
    When I download the file for snapshot
    And I wait for "3" seconds
    Then I softly see "{SavedValue:EGMSID}" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    And I click on "Close" button for view files page
    And I logout
    And I pause execution for "120" seconds
    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
    And I refresh the page
    And I see the mail subject is as follows :
     """
      Sandbox: Notification: Desk Review Approval Requested
      """
    Then I refresh the page
    And I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    And I collapse nested table containing column value "Automation Finding"
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Then I softly cannot see top right button "Accept and Close" in page detail
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    And I save the field labeled "EGMS ID" as "DeskReviewId"
    Then I softly can see top right button "Accept and Close" in page detail
    And I click on "Accept and Close" in the page details
    And I click on Menu icon present on top right corner of the page
    And I wait for "3" seconds
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Desk Review - Accept And Close"
    And I click on "Download" button for snapshot view
    And I wait for "3" seconds
    When I download the file for snapshot
    And I wait for "3" seconds
    Then I softly see "{SavedValue:EGMSID}" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    And I click on "Close" button for view files page
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:monitoringTabDeskReviewTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:monitoringTabDeskReviewTableId---"
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    When I pause execution for "120" seconds
    And I checkout to yopmail with mailid "automationspi31@yopmail.com"
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Desk Review Closed
      """

  @291416 @VerifythatwhenPMUserReassigntaskofsubmitforapprovaltonewuserthenUndoNotificationEmailwillrecievetoneuserandnottooldone @sprint-25-US-297269  @Undo
  Scenario: Verify that when PM User Reassign task of submit for approval to new user,then Undo Notification Email will recieve to ne user and not to old one.
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default" of type "Formula_By_Applicant_Focus_Area"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Formula_By_Applicant_Focus_Area"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:EXE Username} | Step 1      |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:DeskReview}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:DeskReview}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Undo" in page detail
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
    Notification: Approver has initiated Undo Action on #{SavedValue:DeskReview}
      """
    Then I see the mail text is as follows :
      """
    Hello,

    This email is to notify you that approver has initiated undo action.

    Details:

    EGMS ID: {SavedValue:DeskReview}

    Record Name: {SavedValue:Automation Runtime Award Desk Review}

    Log in to EGMS and click here to start reviewing the details.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    Then I refresh the page
    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    Then I do not see the mail text is as follows :
    """
    Hello,

    This email is to notify you that approver has initiated undo action.

    Details:

    EGMS ID: {SavedValue:DeskReview}

    Record Name: {SavedValue:Automation Runtime Award Desk Review}

    Log in to EGMS and click here to start reviewing the details.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """


  @291431 @VerifythatwhenPMUserForwardtaskofsubmitforapprovaltonewuserthenUndoNotificationEmailwillrecievetoneuserandnottooldone @sprint-25-US-297269  @Undo
  Scenario: Verify that when PM User Forward task of submit for approval to new user,then Undo Notification Email will recieve to ne user and not to old one.
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default" of type "Formula_By_Applicant_Focus_Area"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Formula_By_Applicant_Focus_Area"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:EXE Username} | Step 1      |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Submitted for Approval"
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:PO Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Undo" in page detail
    And I checkout to yopmail with mailid "automationpo@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
    Notification: Approver has initiated Undo Action on #{SavedValue:DeskReview}
      """
    Then I see the mail text is as follows :
      """
    Hello,

    This email is to notify you that approver has initiated undo action.

    Details:

    EGMS ID: {SavedValue:DeskReview}

    Record Name: {SavedValue:Automation Runtime Award Desk Review}

    Log in to EGMS and click here to start reviewing the details.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    Then I do not see the mail text is as follows :
    """
    Hello,

    This email is to notify you that approver has initiated undo action.

    Details:

    EGMS ID: {SavedValue:DeskReview}

    Record Name: {SavedValue:Automation Runtime Award Desk Review}

    Log in to EGMS and click here to start reviewing the details.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """

  @291416 @VerifythatwhenPMUserReassigntaskofsubmitforapprovaltonewuserthenUndoNotificationEmailwillrecievetoneuserandnottooldone @sprint-2-US-289061  @Undo
  Scenario:Verify that when PM User Reassign task of submit for approval to new user,then Undo Notification Email will recieve to ne user and not to old one.
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default" of type "Formula_By_Applicant_Focus_Area"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Formula_By_Applicant_Focus_Area"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:EXE Username} | Step 1      |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:DeskReview}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:DeskReview}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
    Notification: Approver has initiated Undo Action on #{SavedValue:DeskReview}
      """
    Then I see the mail text is as follows :
      """
    Hello,

    This email is to notify you that approver has initiated undo action.

    Details:

    EGMS ID: {SavedValue:DeskReview}

    Record Name: {SavedValue:Automation Runtime Award Desk Review}

    Log in to EGMS and click here to start reviewing the details.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    Then I refresh the page
    And I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Undo" in page detail
    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    Then I do not see the mail text is as follows :
    """
   Hello,

    This email is to notify you that approver has initiated undo action.

    Details:

    EGMS ID: {SavedValue:DeskReview}

    Record Name: {SavedValue:Automation Runtime Award Desk Review}

    Log in to EGMS and click here to start reviewing the details.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """


  @279028 @279033 @verifyiflastApproverandOwnerofDeskreviewissameRobertPOthenPOwillseeUNDOandSendtoSrbutton @sprint-25-US-297269  @Undo @Bug-Ticket-528330
  Scenario: verify if last Approver and Owner of Desk review is same, Robert PO then PO will see UNDO and Send to S/r button
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default" of type "Formula_By_Applicant_Focus_Area"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Formula_By_Applicant_Focus_Area"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:PM Username} | Step 1      |
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:PM1 Username} | Step 2      |
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:EXE Username} | Step 3      |
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:PO Username} | Step 4      |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    #Bug443578
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    And I pause execution for "5" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    #279033
    Then I cannot see top right button "Send to Subrecipient" in page detail
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    Then I softly see field "Status" as "Submitted for Approval"
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
    Notification: Approver has initiated Undo Action on #{SavedValue:DeskReview}
      """
    Then I see the mail text is as follows :
      """
    Hello,

    This email is to notify you that approver has initiated undo action.

    Details:

    EGMS ID: {SavedValue:DeskReview}

    Record Name: {SavedValue:Automation Runtime Award Desk Review}

    Log in to EGMS and click here to start reviewing the details.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
    Notification: Approver has initiated Undo Action on #{SavedValue:DeskReview}
      """
    Then I see the mail text is as follows :
      """
    Hello,

    This email is to notify you that approver has initiated undo action.

    Details:

    EGMS ID: {SavedValue:DeskReview}

    Record Name: {SavedValue:Automation Runtime Award Desk Review}

    Log in to EGMS and click here to start reviewing the details.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
    Notification: Approver has initiated Undo Action on #{SavedValue:DeskReview}
      """
    Then I see the mail text is as follows :
      """
    Hello,

    This email is to notify you that approver has initiated undo action.

    Details:

    EGMS ID: {SavedValue:DeskReview}

    Record Name: {SavedValue:Automation Runtime Award Desk Review}

    Log in to EGMS and click here to start reviewing the details.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "automationpo@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
    Notification: Approver has initiated Undo Action on #{SavedValue:DeskReview}
      """
    Then I see the mail text is as follows :
      """
    Hello,

    This email is to notify you that approver has initiated undo action.

    Details:

    EGMS ID: {SavedValue:DeskReview}

    Record Name: {SavedValue:Automation Runtime Award Desk Review}

    Log in to EGMS and click here to start reviewing the details.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """


  @290070 @VerifyemailshouldbegeneratedtoawardownerandapproversafterforwardedapproverclickonUndobuttonandapprovaltaskshouldgetcanceledfromcompletedtask @sprint-2-US-289061  @Undo
  Scenario:Verify email should be generated to award owner and approvers after forwarded approver click on Undo button and approval task should get canceled from completed task
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:EXE Username} | Step 1      |
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:PO Username} | Step 2      |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Submitted for Approval"
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:FO Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:homeCompletedTaskTableId---" panel
    Then I softly see value "Cancelled" for title "Status" against the value "{SavedValue:DeskReview}" inside table "---deskreview:-:homeCompletedTaskTableId---"
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:homeCompletedTaskTableId---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on #{SavedValue:DeskReview}.
      """
    Then I see the mail text is as follows :
    """
    Hello,

    This email is to notify you that approver #Automation FO has initiated undo action.

    Details:
    EGMS ID: {SavedValue:DeskReview}
    Record Name: {SavedValue:Automation Runtime Award Desk Review}

    Log in to EGMS and click here to start reviewing the details.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    And I checkout to yopmail with mailid "fo.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on #{SavedValue:DeskReview}.
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to notify you that approver #Automation FO has initiated undo action.

    Details:
    EGMS ID: {SavedValue:DeskReview}
    Record Name: {SavedValue:Automation Runtime Award Desk Review}

    Log in to EGMS and click here to start reviewing the details.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

   Thank you.
   The EGMS Team
    """


  @329543 @ValidateDRthatapprovaltaskandemailisgeneratedtolaststepapproveronclickofundobuttonbyLastApproverofdeskreview @Sprint-13-US-331643  @Undo
  Scenario: Validate DR that approval task and email is generated to last step approver on click of undo button by Last Approver of desk review
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default-Automation EXE user" of type "Formula_By_Applicant_Focus_Area"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default-Automation EXE user" of type "Formula_By_Applicant_Focus_Area"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:PM Username} | Step 1      |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---deskreview:-:monitoringTabPhasePendingTasks---"
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "100" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
    Sandbox: Notification: Approver has initiated Undo Action on#{SavedValue:DeskReview}
      """
    Then I see the mail text is as follows :
      """
    Hello,

    This email is to notify you that approver has initiated undo action.

    Details:

    EGMS ID: {SavedValue:DeskReview}

    Record Name: {SavedValue:Automation Runtime Award Desk}

    Log in to EGMS and click here to start reviewing the details.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
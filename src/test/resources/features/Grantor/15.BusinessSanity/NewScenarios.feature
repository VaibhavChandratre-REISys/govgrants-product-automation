@product @grantor-regression @regression @NewScenarios
Feature: Validate sanity testing of Complete Business Flow

  @197287 @ValidatePMusercanreassignad-hocreimbursementpaymentrequestownershiptaskstootherPMuser @sprint4  @reassignment
  Scenario: Validate PM user can reassign ad-hoc reimbursement payment request ownership tasks to other PM user
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Formula_By_Applicant"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 30         | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:PayreqId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "Review Payment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:PayreqId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:PayreqId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:PayreqId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:PayreqId}" for title "EGMS ID" inside table "---paymentRequest:-:pendingTaskTableId---"

  @197366 @ValidatePMusercanreassignadvancepaymentrequestownershiptaskstootherPMuser @sprin-4  @reassignment
  Scenario: Validate PM user can reassign advance payment request ownership tasks to other PM user
    And I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:PayreqId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "Review Payment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:PayreqId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:PayreqId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:PayreqId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"

  @202653 @Validate#ofReviewsAssignedvalueshouldbeupdatedinreviewertableafterthePMreviewertaskreassigntootherreviewer @sprint-12-US-226646  @reassignment
  Scenario Outline: Validate # of Reviews Assigned" value should be updated in reviewer table after the PM reviewer task reassign to other reviewer
    When I login to "As a Grantor" app as "EXE" user
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
    And I save the field labeled "Announcement Name" as "Automation Runtime FDM Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
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
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Application Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    When I save the field labeled "EGMS ID" as "AppEGMSID"
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
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
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
      | Reviewer                 |
      | {SavedValue:PM Username} |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I refresh the page
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    Then I softly see value "3" for title "# of Reviews Assigned" against the value "{SavedValue:PM Username}" inside table "---applicationReview:-:reviewersTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEGMSID}" in "---applicationReview:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AppEGMSID}" for title "EGMS ID" inside table "---applicationReview:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AppEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    And I check "All" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AppEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AppEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see value "0" for title "# of Reviews Assigned" against the value "{SavedValue:PM Username}" inside table "---applicationReview:-:reviewersTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see value "3" for title "# of Reviews Assigned" against the value "Automation PM1" inside table "---applicationReview:-:reviewersTableId---"

    Examples:
      | Announcement Name                                | Application Name                                 |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |


  @202576 @ValidateApplicationReviewtaskofpre-screenreviewshouldbegeneratedforassignedreviewerPMuserandhecanreassignreviewtasktootherPMuser @sprint-6-US-201906  @reassignment
  Scenario Outline: Validate Application Review' task of pre-screen review should be generated for assigned reviewer PM user and he can reassign review task to other PM user
    And I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default-Automation EXE user"
    When I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Application Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    When I save the field labeled "EGMS ID" as "AppEGMSID"
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
      | {SavedValue:PM Username} |
    And I click on "Assign" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Application Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Application Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "3" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    Then I softly see that "Sent for Review" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEGMSID}" in "---applicationReview:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AppEGMSID}" for title "EGMS ID" inside table "---applicationReview:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AppEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AppEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AppEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AppEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    Then I softly see value "Automation PM1" for title "Assigned To" inside table "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEGMSID}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEGMSID}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see that "Status" is in "Review Completed" status
    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
    And I pause execution for "100" seconds
    Then I refresh the page
    #Bug412940
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Application {SavedValue:AppEGMSID} has been reviewed
      """

    Then I see the mail text is as follows :
      """
      Hello Automation EXE,

      This email is to inform you that Automation PM1 has completed a review of Application #{SavedValue:AppEGMSID} for Funding Opportunity #{SavedValue:AnnEGMSID}.

      Log in to EGMS and click here for more details.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com, if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

    Examples:
      | Announcement Name                                               | Application Name                                                |
      | {SavedValue:Automation Runtime Announcement Application Review} | {SavedValue:Automation Runtime Announcement Application Review} |

  @308590 @308685 @ValidateSPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonform @sprint-1-US-282692 @Forms
  Scenario: Validate SPI user can able to save & validate form after entering correct & valid data on all fields present on form
    And I activated standalone subaward "Automation Runtime award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Request for Advance or Reimbursement - SF-270" for title "Form Name" inside table "---paymentRequest:-:paymentRequestFormsTableId---"
    Then I can see row level action button "Preview" against "Request for Advance or Reimbursement - SF-270" in flex table with id "---paymentRequest:-:paymentRequestFormsTableId---"
    Then I can see row level action button "View" against "Request for Advance or Reimbursement - SF-270" in flex table with id "---paymentRequest:-:paymentRequestFormsTableId---"
    Then I can see row level action button "Edit" against "Request for Advance or Reimbursement - SF-270" in flex table with id "---paymentRequest:-:paymentRequestFormsTableId---"
    And I click on "Edit" icon for "Request for Advance or Reimbursement - SF-270" inside flex table with id "---paymentRequest:-:paymentRequestFormsTableId---" without waiting for record
    And I switch to tab number "1"
    Then I softly see the text containing "OMB Number: 4040-0012"
    Then I softly see the text containing "Expiration Date: 01/31/2025"
    And I select below checkbox options for field "AdvanaceorReimbursement__c"
      | Advance |
    And I enter "SF270_Form" values from "PaymentRequest_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---paymentRequest:-:sf270ComputationAmountTableId---" by clicking "Edit" :
      | Classification                                   | Programs | Functions | Activities |
      | a. Total program outlays to date                 | 12345    | 12345     | 12345      |
      | b. Less: Cumulative program income               | 12345    | 12345     | 12345      |
      | d. Estimated net cash outlays for advance period | 12345    | 12345     | 12345      |
      | f. Non-Federal share of amount on line e         | 12345    | 12345     | 12345      |
      | g. Federal share of amount on line e             | 12345    | 12345     | 12345      |
      | h. Federal payments previously requested         | 12345    | 12345     | 12345      |
      | 1st month                                        | 12345    | 12345     | 12345      |
      | 2nd month                                        | 12345    | 12345     | 12345      |
      | 3rd month                                        | 12345    | 12345     | 12345      |
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I wait for "3" seconds
    When I click on "Save" in the page details
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
#    Then I softly can see top right button "Back" in page detail
    And I wait for "6" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
   #308685
#    When I click on "Back" in the page details
    And I close the tab
    And I save the field labeled "EGMS ID" as "PayreqId1"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 500        | 1        | Feet        |
    And I wait for "2" seconds
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "5" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 500                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:PO Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "5" seconds
    Then I see status in Progress-bar is "Paid" and is "dark blue"

  @287170 @308690 @ValidateSPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonform @sprint-2-US-288254 @Forms
  Scenario: Validate SPI user can able to save & validate form after entering correct & valid data on all fields present on form
    And I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 100                           |
    When I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Request for Advance or Reimbursement - SF-270" for title "Form Name" inside table "---paymentRequest:-:paymentRequestFormsTableId---"
    Then I can see row level action button "Preview" against "Request for Advance or Reimbursement - SF-270" in flex table with id "---paymentRequest:-:paymentRequestFormsTableId---"
    Then I can see row level action button "View" against "Request for Advance or Reimbursement - SF-270" in flex table with id "---paymentRequest:-:paymentRequestFormsTableId---"
    Then I can see row level action button "Edit" against "Request for Advance or Reimbursement - SF-270" in flex table with id "---paymentRequest:-:paymentRequestFormsTableId---"
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Request for Advance or Reimbursement - SF-270" inside flex table with id "---paymentRequest:-:paymentRequestFormsTableId---" without waiting for record
    And I wait for "3" seconds
    And I click on "Edit" in the split screen page details
    And I pause execution for "3" seconds
    Then I softly see the text containing "OMB Number: 4040-0012"
    Then I softly see the text containing "Expiration Date: 01/31/2025"
    And I select below checkbox options for field "AdvanaceorReimbursement__c"
      | Advance |
    And I enter "SF270_Form" values from "PaymentRequest_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:sf270ComputationAmountTableId---" by clicking "Edit" :
      | Classification                                   | Programs | Functions | Activities |
      | a. Total program outlays to date                 | 12345    | 12345     | 12345      |
      | b. Less: Cumulative program income               | 12345    | 12345     | 12345      |
      | d. Estimated net cash outlays for advance period | 12345    | 12345     | 12345      |
      | f. Non-Federal share of amount on line e         | 12345    | 12345     | 12345      |
      | g. Federal share of amount on line e             | 12345    | 12345     | 12345      |
      | h. Federal payments previously requested         | 12345    | 12345     | 12345      |
      | 1st month                                        | 12345    | 12345     | 12345      |
      | 2nd month                                        | 12345    | 12345     | 12345      |
      | 3rd month                                        | 12345    | 12345     | 12345      |
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I click on "Save" in the split screen page details
    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
#    Then I softly can see top right button "Back" in page detail
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #308690
#    When I click on "Back" in the page
    When I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 100                           |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                      | Advance |
      | {SavedValue:EXE Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Advances" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "5" seconds
    Then I see status in Progress-bar is "Paid" and is "dark blue"

  @165810  @sprint-3
  Scenario: Validate SPI user is not able to edit selected form on application when application is in Negotiation initiated state and application is submitted to Grantor
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
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
    And I click on "Edit" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter value "Automation Negotiation Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:internalHomePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:internalHomePendingTableId---"
    When I click on "Request Negotiations" in the page details
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Negotiations" sub tab
    And I edit the following rows inline in flex table with id "---negotiation:-:NegotiationFormsTableId---" by clicking "Edit" :
      | Form Name                | Needs Negotiation |
      | Standard Assurances Form | Checked           |
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---negotiation:-:NegotiationFormsTableId---" by clicking "Edit" :
      | Form Name                | Needs Negotiation |
      | Program Application Form | Checked           |
    And I wait for "2" seconds
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly can see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    And I switch to tab number "1"
    When  I enter "Form_stand" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    And I switch to tab number "1"
    When  I enter "Form_prog" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    And I wait for "5" seconds
    When I navigate to "Forms and Files" sub tab
    Then I softly cannot see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"

  @204886  @sprint-11-US-224734  @reassignment
  Scenario: Validate Award PM as new peer reviewer he can edit the tables on award after review task ownership assign to PM if allow edit access is 'yes'
    Given I login to "As a Grantor" app as "EXE" user
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
      | Automation PM | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AwardEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AwardEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation PM1" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I pause execution for "5" seconds
    And I click on submit review
    Then I softly see value "Submitted" for title "Status" inside table "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    Then I softly do not see value "{SavedValue:AwardEGMSID}" for title "EGMS ID" inside table "---subAwardFromFDM:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AwardEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM1" for title "Reviewer Name" against the value "Fiscal Reviewer" inside table "---subAwardStandAlone:-:peerReviewersTableId---"

  @70075 @auditorCannotBeAnApprover
  Scenario: Validate approver user is not allowed to reassign tasks their tasks to Auditor.
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "GrantorActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---deskreview:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 2     |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
#    When I click on "Back" in the page details
    And I close the tab
    And I refresh the page
    When I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    And I select radio button "Forward" in the approval decision
    Then I cannot see user "{SavedValue:AUDITOR Username}" in the user lookup in the approval decision

  @152782 @ValidateUserIsAbleToAddThreeStepApproverForAdvancePaymentRequestAndForwardItOnStepThree
  Scenario Outline: Validate User Is Able To Add Three Step Approver For Advance Payment Request And Forward It On Step Three
    And I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I get the "EGMS ID"
    When I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I pause execution for "1" seconds
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                      | Advance |
      | {SavedValue:PM Username}  | Step 1  |
      | {SavedValue:FO Username}  | Step 2  |
      | {SavedValue:EXE Username} | Step 3  |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:PO Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"

    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @286458  @sprint-1-US-295145  @Undo
  Scenario:Verify Admin user as step 1 approver should not see Undo button in Reject state of award
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields3" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Undo" in page detail
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    And I wait for "3" seconds
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    Then I refresh the page
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                        | Award  |
      | {SavedValue:ADMIN Username} | Step 1 |
    And I halt execution
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "dark blue"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Reject" in the approval decision
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "10" seconds
    Then I see status in Progress-bar is "Rejected" and is "Red"
    Then I cannot see top right button "Undo" in page detail

  @292872 @ValidatethatwhenPMuserReasignTaskofsubmitforapprovalischangedtonewusethennewownerwillseeundobuttonafterapprovingtheCarryFwdAmmendrequestAmmendrequest @Sprint-3-US-288693  @Undo
  Scenario: Validate that when PM user Reasign Task of submit for approval is changed to new user,then new owner will see undo button after approving the Carry Fwd Ammend request Ammend request
    And I activated standalone subaward "Automation Runtime award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Formula_By_Applicant_Focus_Area"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Then I softly see that "Subaward" is in "Activated" status
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "PeriodicEditionFocusYes" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                |
      | 4000  | RevisedCommitment__c |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           | New Obligation |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} | 1000           |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter value "Automation Justification" into field "PurposeRTA__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:carryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Carry Forward Amount |
      | Automation Permanent Focus Area | 200                  |
    And I edit the following rows inline in flex table with id "---amendment:-:carryForwardFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Carry Forward Amount |
      | Automation Permanent Focus Area2 | 500                  |
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 200           |
    And I expand nested table containing column value "BP01"
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    When I click on button "resetIcon" in flex table with id "---progressReport:-:budgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1200                 | 120        | 0              |
    And I click on page navigation arrow "---progressReport:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2700                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 4            |
    And I wait for "9" seconds
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:CFAmendmentId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send to Owner |
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 4" for title "Amendment Request" against the value "Automation PM1" inside table "---amendment:-:approversTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Submitted for Approval" for title "New Value" inside field history table
    Then I softly see value "Approved" for title "Original Value" inside field history table
    And I click on back arrow
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    Then I softly see field "Status" as "Submitted for Approval"
    And I pause execution for "6" seconds
    And I navigate to "Grants" tab
    And I pause execution for "5" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "220" seconds
    Then I refresh the page
    And I click on mail with subject "Sandbox: Notification: Approver has initiated Undo Action onAmendment Request #{SavedValue:CFAmendmentId}"
    And I see the mail subject is as follows :
      """
     Sandbox: Notification: Approver has initiated Undo Action onAmendment Request #{SavedValue:CFAmendmentId}
      """
    Then I see the mail text is as follows :
     """
    Hello,

    This email is to inform you that the Approver Automation PM1  has initiated Undo Action for amendment request #{SavedValue:CFAmendmentId}  for the award #{SavedValue:ActivatedSubAwardId}.

    Amendment Details:
	Amendment Type: Carry Forward
	Amendment ID: {SavedValue:CFAmendmentId}
	Key POC: Automation SPI3
 	Status: Submitted for Approval
 	Grant: {SavedValue:GrantEGMSID}
 	Funding Organization: Test Automation Organization

    Log in to EGMS and click here to review the amendment request.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """

  @58817 @59253 @activeRiskAssesmentRequiredToIssueAward
  Scenario Outline: Validate system generates a message to enforce the user to activate risk assessment before issuing an award or the system generates an error message when Risk Assessment Required =Yes.
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I refresh the page
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---riskassessment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---riskassessment:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I see the following messages in the page details contains:
      | Management Tab - Create and activate a Risk Assessment as the Subaward cannot be accepted without an active Risk Assessment. |
    Examples:
      | Award Name                                                | Grant Name                                                |
      | {SavedValue:Automation Runtime Award for Risk Assessment} | {SavedValue:Automation Runtime Award for Risk Assessment} |

  @58168 @58169 @59875 @pendingTaskCreationforRiskAssesmentostRejectCheckFieldHistory @FieldHistoryExclude
  Scenario: Validate the field history after rejection of Risk Assessment and whether user is able to view the pending task once submitted for approval under Monitoring Tab and First Approver is able to reject the Risk Assessment then status in Progress bar is Rejected.
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    Then I softly see that "Approve Subaward Risk Assessment" has been added in flextable with Id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    When I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Rejected" for title "New Value" inside field history table

  @ann2 @274172 @ValidatePMusercanupdateallocationonparticularApplicantacrossFAunderApplicantsectiononAnnouncementaftersubmittingapplicationseeupdatedAllocationAmountonsameApplicationFAYES&AllocationTypeByApplicant @Sprint-23-US-273843  @Allocation
  Scenario: Validate PM user can update allocation on particular Applicant across FA under Applicant section on Announcement after submitting application & see updated Allocation Amount on same Application FA YES & Allocation TypeBy Applicant
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter value "Individuals" into field "EligibleApplicantTypes__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---announcement:-:selectAnnouncementServiceArea1TableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I pause execution for "2" seconds
    When I click "Add" after selection of "Automation IND" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                            | Allocation Amount |
      | Automation Permanent Focus Area  | 500               |
      | Automation Permanent Focus Area2 | 500               |
    And I refresh the page
    When I collapse nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I expand nested table containing column value "Automation IND"
    And I pause execution for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 1000              |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Publish" in the page details
    And I halt execution
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Published"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I halt execution
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "AppId"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    And I refresh the page
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:IND Username} | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I pause execution for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I softly see field "Allocation Amount" as "$1,000.00"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "AppId1"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 500    | 100        | 100            |
#    When I expand nested table containing column value "BP01"
    And I click on page navigation arrow "---applicationReview:-:budgetTableId---" for table id "Next"
    And I click on page navigation arrow "---applicationReview:-:budgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 500    | 100        | 100            |
    And I refresh the page
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI3 Username} | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I pause execution for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I softly see field "Allocation Amount" as "$1,000.00"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "Automation IND"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 2000              |
    And I pause execution for "5" seconds
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppId}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:AppId}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I softly see field "Allocation Amount" as "$2,000.00"
    Then I softly see value "$1,000" for title "Budgeted Amount" against the value "Automation Permanent Focus Area" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$0" for title "Budgeted Amount" against the value "Automation Permanent Focus Area2" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$2,000" for title "Allocation Amount" against the value "Automation Permanent Focus Area" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$0" for title "Allocation Amount" against the value "Automation Permanent Focus Area2" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppId1}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:AppId1}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I softly see field "Allocation Amount" as "$1,000.00"
    Then I softly see value "$500" for title "Budgeted Amount" against the value "Automation Permanent Focus Area" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$500" for title "Budgeted Amount" against the value "Automation Permanent Focus Area2" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$500" for title "Allocation Amount" against the value "Automation Permanent Focus Area" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$500" for title "Allocation Amount" against the value "Automation Permanent Focus Area2" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"

  @268300 @ValidateImpactonSpentvalueswhenPaymentrequestisinflightandAmendmentrequestisprocessedandnewawardisactivatedafterCarryforwardAmendment @sprint-21-US-265880  @Allocation
  Scenario: Validate Impact on Spent values when Payment request is inflight and Amendment request is processed and new award is activated after Carry forward Amendment
    And I activated standalone subaward "Automation Runtime Award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY-Automation PO user" of type "Formula_By_Applicant"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 500        | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 4000  | RevisedCommitment__c       |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date                                | End Date                                |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date                                | End Date                                |
      | Automation Permanent Focus Area2 | {SavedValue:updatedBudgetPeriodStartDate} | {SavedValue:updatedBudgetPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 100            |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 100            |
    And I wait for "2" seconds
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "5" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "PurposeRTA__c"
    And I enter value "700" into field "RequestedChangeInBudget__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 200           |
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "2" seconds
    When I click on button "resetIcon" in flex table with id "---progressReport:-:budgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1200                 | 120        | 0              |
    And I click on page navigation arrow "---progressReport:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I wait for "2" seconds
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:CFAmendmentId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    Then I see value "Review Amendment Request" for title "Task Type" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2700                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Amend Subaward" in the page details
    And I wait for "4" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    When I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$0.00"
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I softly see value "$500.00" for title "Awarded Budget" against the value "Construction" inside table "---paymentRequest:-:paymentRequestBudgetTableId---"
    Then I softly see value "$500.00" for title "Subaward Balance" against the value "Construction" inside table "---paymentRequest:-:paymentRequestBudgetTableId---"

  @200856 @ValidateFundingchangeAmendmentRequestSubmittedGrantorNotifyemailshouldbegenerateforPMnewownerofamendmentrequest @sprint-5-US-194231  @reassignment
  Scenario: Validate Funding change Amendment Request Submitted Grantor Notify email should be generate for PM new owner of amendment request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "Automation PM1 user" of type "Competitive"
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
      | 2000                        | RequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 2            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Review Amendment Request" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
    Then I see value "Not Started" for title "Status" against the value "{SavedValue:FundingID}" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:FundingID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Send Back to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "220" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Amendment Request #{SavedValue:FundingID} hasbeen submitted
      """
    Then I see the mail text is as follows :

      """
      Hello,
      This email is to inform you that the amendment request #{SavedValue:FundingID} for the award #{SavedValue:AwardEGMSID} has been submitted by subrecipient. You are requested to review the amendment made for the award.

      Amendment Details:
         Amendment Type: Funding Change
         Amendment ID: {SavedValue:FundingID}
         Subrecipient Key POC: Automation SPI3
         Status: Submitted to Grantor
         Grant:  {SavedValue:GrantEGMSID}

      Log in to EGMS and click here to perform the review.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @FlexSharing2 @ValidateFlexSharingRelatedScenarioForPaymentrequestAllTables
  Scenario: Validate FlexSharing Related Scenario For Payment Request All Tables
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Direct Award}" in "---progressReport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside table
    And I navigate to "Files" sub tab
    And I wait for "2" seconds
    And I click on "Upload Template" icon for "Advance Request" inside flex table with id "---progressreport:-:grantChecklistsTableId---" with wait for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "View" for title "Template Link" against the value "Advance Request" inside table "---progressreport:-:grantChecklistsTableId---"
    And I save the value from row "3" for column name "Template Link" as "TemplateLink" from flex table "---progressreport:-:grantChecklistsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---progressreport:-:GrantsSubAwardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I save the value from row "1" for column name "Funding Account" as "fundingAccountId" from flex table "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I save the value from row "1" for column name "Encumbrance" as "Encumbrance" from flex table "---subAwardStandAlone:-:fundingAccountsTableId---"
    Then I softly see value "$1,000.00" for title "Award Amount" against the value "Construction" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "$100.00" for title "Cash Match" against the value "Construction" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "$100.00" for title "Non-Cash Match" against the value "Construction" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "$200.00" for title "Total Match" against the value "Construction" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "$1,200.00" for title "Total Project Cost" against the value "Construction" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Direct Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    Then I softly see value "$1,000.00" for title "Awarded Budget" against the value "Construction" inside table "---paymentRequest:-:budgetTableId---"
    Then I softly see value "$1,000.00" for title "Subaward Balance" against the value "Construction" inside table "---paymentRequest:-:budgetTableId---"
    Then I softly see value "$1,000.00" for title "Advance Request Balance" against the value "Construction" inside table "---paymentRequest:-:budgetTableId---"
    Then I softly see value "$10.00" for title "Advance Requested This Action" against the value "Construction" inside table "---paymentRequest:-:budgetTableId---"
    Then I softly see value "$10.00" for title "Total Advance" against the value "Construction" inside table "---paymentRequest:-:budgetTableId---"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "{SavedValue:TemplateLink}" for title "Template Link" inside table "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---"
    And I click on hyperlink for the field "ContentVersionLink__c" containing value "{SavedValue:TemplateLink}"
    And I download the file without rename
    And I wait for "3" seconds
    Then I softly verify that the file "Attachment.pdf" is downloaded
    And I close the tab
    And I wait for "2" seconds
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Others" from computer
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "View" for title "Subrecipient Document Link" inside table "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---"
    And I save the value from row "1" for column name "Subrecipient Document Link" as "SubrecipientDocumentLink" from flex table "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---"
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:recipientAdvancePaymentFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Invoice" from computer
    And I click modal button "Close"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PayreqId}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    Then I softly see value "{SavedValue:fundingAccountId}" for title "Funding Account" inside table "---paymentRequest:-:fundingAccountsAdvTableId---"
    Then I softly see value "{SavedValue:Encumbrance}" for title "Encumbrance Balance" inside table "---paymentRequest:-:fundingAccountsAdvTableId---"
    And I click on hyperlink containing value "{SavedValue:fundingAccountId}"
    Then I see the header is "Funding Account" in the page details
    Then I see the sub-header is "Automation Permanent Funding Account" in the page details
    And I wait for "2" seconds
    And I click on back arrow
    And I wait for "2" seconds
    Then I softly see value "$1,000.00" for title "Awarded Budget" against the value "Construction" inside table "---paymentRequest:-:budgetTableId---"
    Then I softly see value "$1,000.00" for title "Subaward Balance" against the value "Construction" inside table "---paymentRequest:-:budgetTableId---"
    Then I softly see value "$1,000.00" for title "Advance Request Balance" against the value "Construction" inside table "---paymentRequest:-:budgetTableId---"
    Then I softly see value "$10.00" for title "Advance Requested This Action" against the value "Construction" inside table "---paymentRequest:-:budgetTableId---"
    Then I softly see value "$10.00" for title "Total Advance" against the value "Construction" inside table "---paymentRequest:-:budgetTableId---"
    When I navigate to "Forms and Files" sub tab
    And I click on hyperlink for the field "ContentVersionLink__c" containing value "{SavedValue:TemplateLink}"
    And I download the file without rename
    And I wait for "3" seconds
    Then I softly verify that the file "Attachment.pdf" is downloaded
    And I close the tab
    And I wait for "2" seconds
    And I click on hyperlink for the field "ContentVersionSubrecipientLink__c" containing value "{SavedValue:SubrecipientDocumentLink}"
    And I download the file without rename
    And I wait for "3" seconds
    Then I softly verify that the file "AttachmentTesting.pdf" is downloaded
    And I close the tab
    And I wait for "2" seconds
    Then I softly can see top right button "Add Files" in flex table with id "---paymentRequest:-:advanceFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---paymentRequest:-:advanceFilesTableId---"
    Then I softly see value "Invoice" for title "Classification" inside table "---paymentRequest:-:advanceFilesTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---paymentRequest:-:advanceFilesTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---paymentRequest:-:advanceFilesTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---paymentRequest:-:advanceFilesTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---paymentRequest:-:advanceFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"

  @FlexSharingScenarioforpaymentForms
  Scenario: Validate Flex Sharing Payement Forms
    And I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPA" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 100                           |
    When I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Request for Advance or Reimbursement - SF-270" for title "Form Name" inside table "---paymentRequest:-:paymentRequestFormsTableId---"
    And I click on "Edit" icon for "Request for Advance or Reimbursement - SF-270" inside flex table with id "---paymentRequest:-:paymentRequestFormsTableId---" without waiting for record
    And I switch to tab number "1"
    And I wait for "2" seconds
    And I select below checkbox options for field "AdvanaceorReimbursement__c"
      | Advance |
    And I enter "SF270_Form" values from "PaymentRequest_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---paymentRequest:-:sf270ComputationAmountTableId---" by clicking "Edit" :
      | Classification                                   | Programs | Functions | Activities |
      | a. Total program outlays to date                 | 12345    | 12345     | 12345      |
      | b. Less: Cumulative program income               | 12345    | 12345     | 12345      |
      | d. Estimated net cash outlays for advance period | 12345    | 12345     | 12345      |
      | f. Non-Federal share of amount on line e         | 12345    | 12345     | 12345      |
      | g. Federal share of amount on line e             | 12345    | 12345     | 12345      |
      | h. Federal payments previously requested         | 12345    | 12345     | 12345      |
      | 1st month                                        | 12345    | 12345     | 12345      |
      | 2nd month                                        | 12345    | 12345     | 12345      |
      | 3rd month                                        | 12345    | 12345     | 12345      |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Advances" content inside "Payments" subheader on left panel
    When I click toggle button to select "Advances - All"
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:subrecipientPaymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:subrecipientPaymentrequestAdvancesTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Request for Advance or Reimbursement - SF-270" inside flex table with id "---paymentRequest:-:paymentRequestFormsTableId---" without waiting for record
    And I switch to tab number "1"
    And I wait for "2" seconds
    Then I softly see field "Advance" as "checked"
    Then I softly see field "Final" as "Checked"
    Then I softly see field "Cash" as "Checked"
    Then I softly see field "3. Federal Sponsoring Agency and organizational Element to which this Report is submitted" as "TEST12345"
    Then I softly see field "4. Federal Grant or Other Identifying Number assigned by Federal Agency" as "123456789"
    Then I softly see field "5. Partial Payment Request Number for this Request" as "2121323223"
    Then I softly see field "7. Financial Assistance Identification Number" as "2121323223"
    Then I softly see field "From" as "{Date:M/d/yyyy::d+365}"
    Then I softly see field "To" as "{Date:M/d/yyyy::d+730}" in "8. Period Covered by this Request" pageblock
    Then I softly see field "Name" as "TEST Organization" in "9. Recipient Organization" pageblock
    Then I softly see field "Street1" as "123" in "9. Recipient Organization" pageblock
    Then I softly see field "Street2" as "Street 2" in "9. Recipient Organization" pageblock
    Then I softly see field "City" as "NY: New York" in "9. Recipient Organization" pageblock
    Then I softly see field "County" as "NY" in "9. Recipient Organization" pageblock
    Then I softly see field "State" as "FL: Florida" in "9. Recipient Organization" pageblock
    Then I softly see field "Province" as "NY" in "9. Recipient Organization" pageblock
    Then I softly see field "Country" as "USA: UNITED STATES" in "9. Recipient Organization" pageblock
    Then I softly see field "Zip / Postal Code" as "12345-1234" in "9. Recipient Organization" pageblock
    Then I softly see field "Name" as "TEST Organization" in "10. Payee (Where check is to be sent if different than item 9)" pageblock
    Then I softly see field "Street1" as "123" in "10. Payee (Where check is to be sent if different than item 9)" pageblock
    Then I softly see field "Street2" as "Street 2" in "10. Payee (Where check is to be sent if different than item 9)" pageblock
    Then I softly see field "City" as "NY: New York" in "10. Payee (Where check is to be sent if different than item 9)" pageblock
    Then I softly see field "County" as "NY" in "10. Payee (Where check is to be sent if different than item 9)" pageblock
    Then I softly see field "State" as "FL: Florida" in "10. Payee (Where check is to be sent if different than item 9)" pageblock
    Then I softly see field "Province" as "NY" in "10. Payee (Where check is to be sent if different than item 9)" pageblock
    Then I softly see field "Country" as "USA: UNITED STATES" in "10. Payee (Where check is to be sent if different than item 9)" pageblock
    Then I softly see field "Zip / Postal Code" as "12345-1234" in "10. Payee (Where check is to be sent if different than item 9)" pageblock
    Then I softly see field "Programs" as "12345" in "Programs / Functions / Activities" pageblock
    Then I softly see field "Functions" as "12345" in "Programs / Functions / Activities" pageblock
    Then I softly see field "Activities" as "12345" in "Programs / Functions / Activities" pageblock
    Then I softly see field "Total Program Outlays To Date" as "{Date:M/d/yyyy::d+570}" in "Programs / Functions / Activities" pageblock
    Then I softly see value "$12,345.00" for title "Programs" against the value "a. Total program outlays to date" inside table "---paymentRequest:-:sf270ComputationAmountTableId---"
    Then I softly see value "$12,345.00" for title "Functions" against the value "a. Total program outlays to date" inside table "---paymentRequest:-:sf270ComputationAmountTableId---"
    Then I softly see value "$12,345.00" for title "Activities" against the value "a. Total program outlays to date" inside table "---paymentRequest:-:sf270ComputationAmountTableId---"
    Then I softly see value "$37,035.00" for title "Total" against the value "a. Total program outlays to date" inside table "---paymentRequest:-:sf270ComputationAmountTableId---"
    Then I softly see field "12a. Estimated Federal cash outlays that will be made during period covered by the advance" as "$12,345.00" in "12. Alternate Computation for Advances Only" pageblock
    Then I softly see field "12b. Less: Estimated balance of Federal cash on hand as of beginning of advance period" as "$12,345.00" in "12. Alternate Computation for Advances Only" pageblock
    Then I softly see field "12c. Amount Requested (Line 12a minus line 12b)" as "$0.00" in "12. Alternate Computation for Advances Only" pageblock
    Then I softly see field "Acknowledgement" as "checked"
    Then I softly see field "Signature of Authorized Certifying official" as "John Mathews" in "13. Certification" pageblock
    Then I softly see field "Date Request Submitted" as "{Date:M/d/yyyy::d+0}" in "13. Certification" pageblock
    Then I softly see field "Prefix" as "Mr." in "13. Certification" pageblock
    Then I softly see field "First Name" as "John" in "13. Certification" pageblock
    Then I softly see field "Middle Name" as "Andrew" in "13. Certification" pageblock
    Then I softly see field "Last Name" as "Mathews" in "13. Certification" pageblock
    Then I softly see field "Suffix" as "Jr." in "13. Certification" pageblock
    Then I softly see field "Title" as "Associate" in "13. Certification" pageblock
    Then I softly see field "Telephone (Area Code, Number, Extension)" as "(212) 234-2342" in "13. Certification" pageblock
    And I click on "Edit" in the page details
    And I select below checkbox options for field "AdvanaceorReimbursement__c"
      | Reimbursement |
    And I enter value "Partial" into field "TypeOfRequest__c"
    And I enter value "1267589" into field "FederalAwardIdentifier__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Reimbursement" as "checked"
    Then I softly see field "Partial" as "Checked"
    Then I softly see field "4. Federal Grant or Other Identifying Number assigned by Federal Agency" as "1267589"

  @flexhsaringProgress @ValidateToCheckFlexSharingForProgressReportAllTables
  Scenario: Validate To Check FlexSharing For All Tables
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    And I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Direct Award}" in "---progressReport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside table
    And I navigate to "Files" sub tab
    And I click on "Upload Template" icon for "Progress Report" inside flex table with id "---progressreport:-:grantChecklistsTableId---" with wait for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "View" for title "Template Link" against the value "Progress Report" inside table "---progressreport:-:grantChecklistsTableId---"
    And I save the value from row "4" for column name "Template Link" as "TemplateLink" from flex table "---progressreport:-:grantChecklistsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---progressreport:-:GrantsSubAwardsTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    And I save the value from row "1" for column name "EGMS ID" as "strategicPlanEGMSID" from flex table "GrantorAwardGoalsObjectives"
    And I save the value from row "2" for column name "EGMS ID" as "objectiveEGMSID" from flex table "GrantorAwardGoalsObjectives"
    And I save the value from row "1" for column name "Title" as "KPIEGMSID" from flex table "GrantorAwardKeyOutcomes"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "{SavedValue:TemplateLink}" for title "Template Link" inside table "---progressReport:-:progressReportChecklistsTableId---"
    And I click on hyperlink for the field "ContentVersionLink__c" containing value "{SavedValue:TemplateLink}"
    And I download the file without rename
    And I wait for "3" seconds
    Then I softly verify that the file "Attachment.pdf" is downloaded
    And I close the tab
    And I wait for "2" seconds
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I save the field labeled "Subaward ID" as "SubAwardID"
    Then I softly see value "View" for title "Subrecipient Document Link" inside table "---progressReport:-:progressReportChecklistsTableId---"
    And I save the value from row "1" for column name "Subrecipient Document Link" as "SubrecipientDocumentLink" from flex table "---progressreport:-:progressReportChecklistsTableId---"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Then I softly see value "{SavedValue:KPIEGMSID}" for title "Title" inside table "---progressReport:-:kpiTableId---"
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    Then I softly see value "{SavedValue:strategicPlanEGMSID}" for title "Title" inside table "AwardStrategicGoalsObjectives"
    Then I softly see value "{SavedValue:objectiveEGMSID}" for title "Title" inside table "AwardStrategicGoalsObjectives"
    And I click on hyperlink containing value "{SavedValue:strategicPlanEGMSID}"
    Then I see the header is "Strategic Plan" in the page details
    Then I see the sub-header is "Automation Permanent Strategic Plan" in the page details
    And I wait for "2" seconds
    And I click on back arrow
    And I wait for "2" seconds
    And I click on hyperlink containing value "{SavedValue:objectiveEGMSID}"
    Then I see the header is "Objective" in the page details
    Then I see the sub-header is "Automation Permanent Objective" in the page details
    And I wait for "2" seconds
    And I click on back arrow
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:RecipientProgressReportFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I click modal button "Close"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---progressReport:-:progressNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Performance" sub tab
    When I save the value from row "1" for column name "Title" as "KPITitle" from flex table "---progressReport:-:kpiTableId---"
    When I save the value from row "2" for column name "Title" as "objectiveTitle" from flex table "---progressReport:-:objectivesTableId---"
    When I navigate to "Forms and Files" sub tab
    When I save the value from row "1" for column name "Required" as "checkList" from flex table "---progressReport:-:progressReportChecklistsTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly see value "Review Progress Report" for title "Task Type" inside table "---progressReport:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I softly see value "{SavedValue:KPITitle}" for title "Title" inside table "---progressReport:-:kpiTableId---"
    Then I softly see value "{SavedValue:objectiveTitle}" for title "Title" inside table "---progressReport:-:objectivesTableId---"
    And I click on hyperlink containing value "{SavedValue:strategicPlanEGMSID}"
    Then I see the header is "Strategic Plan" in the page details
    Then I see the sub-header is "Automation Permanent Strategic Plan" in the page details
    And I wait for "2" seconds
    And I click on back arrow
    And I wait for "2" seconds
    And I click on hyperlink containing value "{SavedValue:objectiveEGMSID}"
    Then I see the header is "Objective" in the page details
    Then I see the sub-header is "Automation Permanent Objective" in the page details
    And I wait for "2" seconds
    And I click on back arrow
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "{SavedValue:checkList}" for title "Required" inside table "---progressReport:-:progressReportChecklistsTableId---"
    And I click on hyperlink for the field "ContentVersionLink__c" containing value "{SavedValue:TemplateLink}"
    And I download the file without rename
    And I wait for "3" seconds
    Then I softly verify that the file "Attachment.pdf" is downloaded
    And I close the tab
    And I wait for "2" seconds
    And I click on hyperlink for the field "ContentVersionSubrecipientLink__c" containing value "{SavedValue:SubrecipientDocumentLink}"
    And I download the file without rename
    And I wait for "3" seconds
    Then I softly verify that the file "AttachmentTesting.pdf" is downloaded
    And I close the tab
    And I wait for "2" seconds
    Then I softly cannot see top right button "Add Files" in flex table with id "---progressReport:-:RecipientProgressReportFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---progressReport:-:RecipientProgressReportFilesTableId---"
    Then I softly see value "Other" for title "Classification" inside table "---progressReport:-:RecipientProgressReportFilesTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---progressReport:-:RecipientProgressReportFilesTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---progressReport:-:RecipientProgressReportFilesTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---progressReport:-:RecipientProgressReportFilesTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---progressReport:-:RecipientProgressReportFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---progressReport:-:RecipientProgressReportFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---progressReport:-:GrantorNotesProgressReporttableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---progressReport:-:GrantorNotesProgressReporttableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---progressReport:-:GrantorNotesProgressReporttableId---"

  @ValidateFlexSharingScenarioForForms
  Scenario: Validate FlexSharing Scenario For Forms
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPA" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "3" seconds
    And I click on "View" icon for "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF271_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---progressReport:-:sf271FormTableId---" by clicking "Edit" :
      | Classification                                       | Programs | Functions | Activities |
      | a. Administrative expense                            | 12345    | 12345     | 12345      |
      | b. Preliminary expense                               | 12345    | 12345     | 12345      |
      | c. Land, structures, right-of-way                    | 12345    | 12345     | 12345      |
      | d. Architectural engineering basic fees              | 12345    | 12345     | 12345      |
      | e. Other architectural engineering fees              | 12345    | 12345     | 12345      |
      | f. Project inspection fees                           | 12345    | 12345     | 12345      |
      | g. Land development                                  | 12345    | 12345     | 12345      |
      | h. Relocation expense                                | 12345    | 12345     | 12345      |
      | i. Relocation payments to individuals and businesses | 12345    | 12345     | 12345      |
      | j. Demolition and removal                            | 12345    | 12345     | 12345      |
      | k. Construction and project improvement cost         | 12345    | 12345     | 12345      |
      | l. Equipment                                         | 12345    | 12345     | 12345      |
      | m. Miscellaneous cost                                | 12345    | 12345     | 12345      |
      | o. Deductions for program income                     | 12345    | 12345     | 12345      |
      | q. Federal share to date                             | 12345    | 12345     | 12345      |
      | r. Rehabilitation grants (100% reimbursement)        | 12345    | 12345     | 12345      |
      | t. Federal payments previously requested             | 12345    | 12345     | 12345      |
      | u. Amount requested for reimbursement                | 12345    | 12345     | 12345      |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I save the field labeled "From" as "From"
    And I save the field labeled "To" as "To"
    And I save the field labeled "Date Report Submitted:" as "DateReportSubmitted"
    And I close the tab
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I click on "View" icon for "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    Then I softly see field "Final" as "Checked"
    Then I softly see field "Cash" as "Checked"
    Then I softly see field "3. Federal Sponsoring Agency and Organizational Element to Which This Report Is Submitted" as "Automation Organization"
    Then I softly see field "4. Federal Grant or Other Identifying Number Assigned by Federal Agency" as "1234"
    Then I softly see field "5. Partial Payment Request Number for This Request" as "8967589"
    Then I softly see field "7. Financial Assistance Identification Number" as "34567"
    Then I softly see field "From" as "{SavedValue:From}"
    Then I softly see field "Name" as "Health" in "9. Recipient Organization" pageblock
    Then I softly see field "Street1" as "123" in "9. Recipient Organization" pageblock
    Then I softly see field "Street2" as "Street" in "9. Recipient Organization" pageblock
    Then I softly see field "City" as "NY" in "9. Recipient Organization" pageblock
    Then I softly see field "County" as "NY" in "9. Recipient Organization" pageblock
    Then I softly see field "State" as "FL: Florida" in "9. Recipient Organization" pageblock
    Then I softly see field "Province" as "NY" in "9. Recipient Organization" pageblock
    Then I softly see field "Country" as "USA: UNITED STATES" in "9. Recipient Organization" pageblock
    Then I softly see field "ZIP / Postal Code" as "12345-1234" in "9. Recipient Organization" pageblock
    Then I softly see field "Name" as "Test Automation" in "10. Payee (Where check is to be sent if different than item 9)" pageblock
    Then I softly see field "Street1" as "123" in "10. Payee (Where check is to be sent if different than item 9)" pageblock
    Then I softly see field "Street2" as "Str1" in "10. Payee (Where check is to be sent if different than item 9)" pageblock
    Then I softly see field "City" as "NY" in "10. Payee (Where check is to be sent if different than item 9)" pageblock
    Then I softly see field "County" as "NY" in "10. Payee (Where check is to be sent if different than item 9)" pageblock
    Then I softly see field "State" as "FL: Florida" in "10. Payee (Where check is to be sent if different than item 9)" pageblock
    Then I softly see field "Province" as "NY" in "10. Payee (Where check is to be sent if different than item 9)" pageblock
    Then I softly see field "Country" as "USA: UNITED STATES" in "10. Payee (Where check is to be sent if different than item 9)" pageblock
    Then I softly see field "ZIP / Postal Code" as "12345-1234" in "10. Payee (Where check is to be sent if different than item 9)" pageblock
    Then I softly see field "Programs" as "Test Programs"
    Then I softly see field "Functions" as "Test Functions"
    Then I softly see field "Activities" as "Test Activities"
    Then I softly see field "Percentage of Physical Completion of Project - Programs" as "75.00%"
    Then I softly see field "Percentage of Physical Completion of Project - Functions" as "65.00%"
    Then I softly see field "Percentage of Physical Completion of Project - Activities" as "85.00%"
    Then I softly see field "Percentage of Physical Completion of Project - Total" as "55.00%"
    Then I softly see field "Acknowledgement" as "checked"
    Then I softly see field "Signature of Authorized Certifying Official" as "John Matthew"
    Then I softly see field "Date Report Submitted:" as "{SavedValue:DateReportSubmitted}"
    Then I softly see field "Prefix:" as "Mr."
    Then I softly see field "First Name:" as "John"
    Then I softly see field "Middle Name:" as "rob"
    Then I softly see field "Last Name:" as "Matthew"
    Then I softly see field "Suffix:" as "Jr."
    Then I softly see field "Title:" as "Associate"
    Then I softly see field "Telephone (Area code, number, and extension)" as "(986) 987-5890"
    And I click on "Edit" in the page details
    And I enter value "Partial" into field "TypeOfRequest__c"
    And I enter value "Accrual" into field "BasisOfRequest__c"
    And I enter value "1267589" into field "PartialPaymentRequest__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Partial" as "Checked"
    Then I softly see field "Accrual" as "Checked"
    Then I softly see field "5. Partial Payment Request Number for This Request" as "1267589"
    Then I softly see value "$12,345.00" for title "Programs" against the value "a. Administrative expense" inside table "---progressReport:-:sf271FormTableId---"
    Then I softly see value "$12,345.00" for title "Functions" against the value "a. Administrative expense" inside table "---progressReport:-:sf271FormTableId---"
    Then I softly see value "$12,345.00" for title "Activities" against the value "a. Administrative expense" inside table "---progressReport:-:sf271FormTableId---"
    Then I softly see value "$37,035.00" for title "Total" against the value "a. Administrative expense" inside table "---progressReport:-:sf271FormTableId---"





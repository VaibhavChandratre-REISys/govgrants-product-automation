@announcement @grantor-regression @grantor-parallel-regression @regression @announcementWB @AnnouncementTemp
Feature: Validate all common scenarios in the  Announcement tab (Announcement without background)

  @70878 @70373 @70821 @70978 @validationOverrideProgramSetting
  Scenario: To Verify that user can override program settings at Announcement level
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I enter value "No" into field "IsMatchRequired__c"
    Then I softly see that "GranteeMatch__c" rendered in view mode only
    And I enter value "No" into field "FocusAreaRequired__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    #Bug446474
    Then I softly see field "Focus Areas Required?" as "No"
    Then I softly cannot see field "Pre-Application Due Date" inside page block

  @70369 @validationForSubrecipientMatch @smoke
  Scenario: To Validate system generates validation message for  by keeping the "Subrecipient Match(%)" field as blank while creating Announcement
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal3" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the following messages in the page details :
      | Formula Announcement must have the "Pre-Application Required?" as 'No'. |

  @70553 @70604 @validationForNoFocusAreaAndNOObjective @smoke
  Scenario: To Verify thatIf user selected focus area as NO then at announcement level then no other focus area are allowed to add while creating the Announcement
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal FA" values from "Announcement_Field_Values.xlsx"
    And I enter value "No" into field "IsGoalsRequired__c"
    And I click modal button "Save and Continue"
    And I navigate to "Setup" sub tab
    Then I softly do not see "Related Focus Areas" page block displayed
    Then I softly do not see "Objectives" page block displayed

  @75457 @validationDetailsOfPublishedCompetitiveAnnouncement @smoke
  Scenario: To Verify that If user selected focus area as NO then at announcement level then no other focus area are allowed to add while creating the Announcement
    And I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:competitiveTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---announcement:-:competitiveTableId---" without waiting for record
    And I navigate to "Related Log" sub tab
    And I click on "View" icon for "Funding Decision Memo" inside flex table with id "---grantor_tableId:-:FDMTableId---" without waiting for record
    And I wait for "3" seconds
    Then I softly can see "Funding Decision Memo" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page

  @75546 @75639 @75633 @75645 @75646 @75544 @75545 @75543  @downloadPDF @skipOnJenkins @ExcludeSendEmail
  Scenario: To verify system allow to download PDF for Announcement-published table for announcement tab
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for FDM tests" and properties "default"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for FDM tests}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime Announcement for FDM tests}" for title "Announcement Name" inside table "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for FDM tests}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Messages" sub tab
    #And I click on advance filter "#advfCommunicationHistory" of table id "---announcement:-:collabMessages---"
    #And I enter advance filter values inside id "advfCommunicationHistory"
    #  | Subject | Contains | Dont mess with jitu |
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:collabMessages---"
    And I click on top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I send the email under collab tab with following details:
      | To                              | Subject | Body             |
      | internal.user.product@gmail.com | jitu    | this is bodyless |
    # next 2 Then statements are combined to validate the single test @75633
    Then I softly see the following messages in the page details :
      | Email sent succesfully. |
    And I close "Send Email" modal by clicking the top right x button
    And I refresh the page
    And I pause execution for "31" seconds
    Then I softly can see mail notification for "INTERNAL" user with following subject:
      | jitu |
    And I click on "View" icon for "jitu" inside flex table with id "---announcement:-:collabMessages---" without waiting for record
    Then I softly see following details for email sent under collab:
      | abc@gmail.com |
      | jitu          |
    And I refresh the page
    And I click on "Reply" icon for "jitu" inside flex table with id "---announcement:-:collabMessages---" without waiting for record
    And I send the email under collab tab with following details:
      | To                              | Subject      | Body             |
      | internal.user.product@gmail.com | changed jitu | this is bodyless |
    And I pause execution for "30" seconds
    Then I softly can see mail notification for "INTERNAL" user with following subject:
      | changed jitu |
    And I close "Reply" modal by clicking the top right x button
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    #And I click on advance filter "#advfActiveFundingOpportunitiesCompitive" of table id "---announcement:-:competitiveAnnouncementTableId---"
    #And I enter advance filter values inside id "advfActiveFundingOpportunitiesCompitive"
    #  | Announcement Name | Contains | {SavedValue:Automation Runtime Announcement for FDM tests} |
    Then I softly see value "{SavedValue:Automation Runtime Announcement for FDM tests}" for title "Announcement Name" inside table "---announcement:-:competitiveAnnouncementTableId---"
    And I refresh the page
    #And I click on advance filter "#advfActiveFundingOpportunitiesCompitive" of table id "---announcement:-:competitiveAnnouncementTableId---"
    #And I enter advance filter values inside id "advfActiveFundingOpportunitiesCompitive"
    #  | Announcement Name | Contains | Dont mess with jitu |
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I refresh the page
    And I click on parallel menu button in flex table title "Published Competitive Announcements"
    And I select "Download as PDF" from dropdown
    And I download the file
    And I pause execution for "10" seconds
    And I softly see "Published Competitive Announcements" on page "1" of "govgrants" pdf file

  @70999 @73627 @73632 @70997 @70980 @71010 @71011 @71012 @70998 @71022 @71023 @71037 @71027 @validationForErrorMessageOfPreApplication
  Scenario: To validate system generated error message when Pre Application Due Date is greater than Application Due Date while submitting information
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Pre-Application Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I navigate to "Overview" sub tab
    When I enter value "45" into field "PreApplicationDueDate__c"
    When I click on "Save" in the page details
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
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Automation Testjustification" into field "Justification__c"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FO Username} | Step 3       |
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description | Required  | Applies To  | Status |
      | Test1       | Mandatory | Application | Active |
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description | Required  | Applies To  | Status |
      | Test2       | Mandatory | Application | Active |
    Then I softly see value "Pre-Screen Review" for title "Step Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see value "SME Review" for title "Step Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see value "Management Review" for title "Step Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 20              |
    Then I softly see value "20.00%" for title "Step Weight (%)" inside table "---announcement:-:AnnouncementReviewPanel---"
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 75              |
    And I click on "Submit For Approval" in the page details
    And I pause execution for "5" seconds
    #Bug446485
    Then I softly see the following messages in the page details :
      | Setup Tab - The total Review Step weight must equal 100%. It is currently 150.00%. |
    And I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 25              |
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "5" seconds
    #Bug446485
    Then I softly see the following messages in the page details :
      | Setup Tab - The total Review Step weight must equal 100%. It is currently 50.00%. |
    And I wait for "3" seconds
    And I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 0               |
      | SME Review        | 0               |
      | Pre-Screen Review | 0               |
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "5" seconds
    #Bug446485
    Then I softly see the following messages in the page details :
      | Setup Tab - The total Review Step weight must equal 100%. It is currently 0.00%. |
    And I wait for "3" seconds
    And I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 50              |
    And I click on "Delete" icon for "Pre-Screen Review" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    Then I softly do not see value "Pre-Screen Review" for title "Step Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I enter value "30" into field "ApplicationDueDate__c"
    And I enter value "40" into field "PreApplicationDueDate__c"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details :
      | Pre-Application Due Date cannot be after Application Due Date |
    And I enter value "20" into field "PreApplicationDueDate__c"
    And I click on "Save" in the page details
    And I save the field labeled "Application Due Date" as "ADD"
    And I save the field labeled "PreApplication Due Date" as "PDD"
    Then I softly see field "PreApplication Due Date" as "{SavedValue:PDD}"
    Then I softly see field "Application Due Date" as "{SavedValue:ADD}"
    And I click on "Edit" in the page details
    And I enter value "-5" into field "PreApplicationDueDate__c"
    And I enter value "-5" into field "ApplicationDueDate__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Overview Tab - Application Due Date cannot be in the past. |

  @71445 @71580 @71593 @userCanValidateGeneratedErrorMessage
  Scenario: To validate system generates error message,when user giving form weight but review steps weight is 0 in Announcement
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Pre-Application Modal" values from "Announcement_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 100             |
      | SME Review        | 0               |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Fiscal Review     | 25              |
      | Program Review    | 25              |
      | Compliance Review | 50              |
    And I refresh the page
    And I wait for "3" seconds
    Then I see value "25.00%" for title "Form Weight (%)" against the value "Program Review" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I see value "25.00%" for title "Form Weight (%)" against the value "Fiscal Review" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I see value "50.00%" for title "Form Weight (%)" against the value "Compliance Review" inside table "---announcement:-:AnnouncementReviewPanel---"
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    Then I softly can see top right button "New" in flex table with id "---announcement:-:AnnouncementReviewPanel---"

  @71150 @71578 @71303 @71051 @71054 @71497 @71500 @71503 @71523 @71518 @71151 @71152 @71540 @71153 @71056 @71314 @71307 @verifyTotalReviewFormWeight @smoke
  Scenario: To validate system generated error message when total Review Form  weight(%) is more than 100 % while creating Announcement
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Pre-Application Modal" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I click modal button "Save and Continue"
    And I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 50              |
    And I pause execution for "2" seconds
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I expand nested table containing column value "SME Review"
    And I pause execution for "3" seconds
    Then I softly see "Form Name" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Form Weight (%)" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Minimum Number of Reviews per Application" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Fiscal Review  | 75              |
      | Program Review | 75              |
    And I pause execution for "3" seconds
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    And I pause execution for "1" seconds
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 150.00%. |
    And I pause execution for "3" seconds
    And I refresh the page
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Fiscal Review  | 20              |
      | Program Review | 20              |
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 40.00%. |
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Fiscal Review  | 0               |
      | Program Review | 0               |
    And I pause execution for "3" seconds
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 0%. |
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Fiscal Review  | 60              |
      | Program Review | 40              |
    And I pause execution for "3" seconds
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    And I pause execution for "1" seconds
    Then I softly see the following messages in the page details :
      | There are no errors with the review step templates. |
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Program Review | 0               |
    And I pause execution for "3" seconds
    When I enter the following values into flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "New" :
      | Step Order | Step Name           | Description | Step Weight (%) |
      | 4          | Program Review Form | Test        | 70.00%          |
    And I pause execution for "2" seconds
    Then I softly see value "Program Review Form" for title "Form Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    And I pause execution for "3" seconds
    And I click on "Delete" icon for "Program Review Form" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    And I pause execution for "3" seconds
    Then I softly see the following messages in the page details :
      | Record deleted successfully. |
    And I pause execution for "3" seconds
    Then I softly do not see value "Program Review Form" for title "Form Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    Then I softly see value "75%" for title "Section Weight (%)" against the value "Budget" inside table "---announcement:-:reviewPanelTableId---"
    Then I softly see value "15%" for title "Section Weight (%)" against the value "Match" inside table "---announcement:-:reviewPanelTableId---"
    Then I softly see value "10%" for title "Section Weight (%)" against the value "Program Income" inside table "---announcement:-:reviewPanelTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Weight (%) | Section Header         |
      | 10%                | Program Income updated |
    And I pause execution for "3" seconds
    Then I softly see value "Program Income updated" for title "Section Header" inside table "---announcement:-:reviewPanelTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Weight (%) | Section Header |
      | 10%                | Program Income |
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 50                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Match          | 60                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Program Income | 70                 |
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I pause execution for "3" seconds
    And I click modal button "Close"
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 60.00%. |
      | Setup Tab - SME Review - Fiscal Review: The total section weight must equal 100% or 0%. It is currently 180%.     |
    And I pause execution for "3" seconds
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 0                  |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Match          | 0                  |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Program Income | 0                  |
    And I pause execution for "2" seconds
    And I click modal button "Close"
    And I pause execution for "3" seconds
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    And I pause execution for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 60.00%.                                   |
      | Setup Tab - SME Review - Fiscal Review: A score cannot be associated to a question in the Budget section because it does not have a weight.         |
      | Setup Tab - SME Review - Fiscal Review: A score cannot be associated to a question in the Match section because it does not have a weight.          |
      | Setup Tab - SME Review - Fiscal Review: A score cannot be associated to a question in the Program Income section because it does not have a weight. |
      | Setup Tab - SME Review - Fiscal Review: A weighted form must contain weighted sections.                                                             |
    And I pause execution for "3" seconds
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 25                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Match          | 25                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Program Income | 50                 |
    And I pause execution for "3" seconds
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I pause execution for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---announcement:-:annReviewFormsTableId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) |
      | Fiscal Review | 100             |
    And I pause execution for "3" seconds
    When I collapse nested table containing column value "SME Review"
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    And I pause execution for "3" seconds
    Then I softly see the following messages in the page details :
      | There are no errors with the review step templates. |
    And I pause execution for "3" seconds
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header      | Section Weight (%) |
      | Strategic Alignment | 30                 |
    And I pause execution for "3" seconds
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I pause execution for "3" seconds
    And I click modal button "Close"
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    And I pause execution for "3" seconds
    Then I softly see the following messages in the page details :
      | Setup Tab - Management Review - Management Review: The total section weight must equal 100% or 0%. It is currently 80%. |
    And I pause execution for "3" seconds
    And I refresh the page
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---announcement:-:annReviewFormsTableId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Program Review | 70              |
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:annReviewFormsTableId---" by clicking "Edit" :
      | Form Weight (%) | Form Name           |
      | 70.00%          | Program Review Form |
    And I pause execution for "3" seconds
    Then I softly see value "Program Review Form" for title "Form Name" inside table "---announcement:-:annReviewFormsTableId---"
    And I click on "Review Form" icon for "Program Review Form" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Weight (%) | Section Header   |
      | 15%                | Capability Forms |
    And I pause execution for "3" seconds
    Then I softly see value "Capability Forms" for title "Section Header" inside table "---announcement:-:reviewPanelTableId---"
    And I expand nested table containing column value "Capability Forms"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question             | Max Score |
      | 1              | Review form question | 50        |
    And I pause execution for "3" seconds
    And I expand nested table containing column value "1"
    Then I softly see value "Review form question" for title "Question" inside table "---announcement:-:reviewPanelQuestionsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Question                    | Type | Max Score |
      | 1              | Review form question Edited | Date | 40        |
    And I pause execution for "3" seconds
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I pause execution for "3" seconds
    Then I softly see value "Review form question Edited" for title "Question" inside table "---announcement:-:reviewPanelQuestionsTableId---"
    Then I softly see value "Date" for title "Type" inside table "---announcement:-:reviewPanelQuestionsTableId---"
    Then I softly see value "40" for title "Max Score" inside table "---announcement:-:reviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "Review form question Edited" inside flex table with id "---announcement:-:reviewPanelQuestionsTableId---" without waiting for record
    Then I softly do not see value "Review form question Edited" for title "Question" inside table "---announcement:-:reviewPanelQuestionsTableId---"

  @71293 @71295 @71440 @71416 @verifyUserCanAddReviewers
  Scenario: To verify that user is allow to add reviewers to review forms while creating Announcement | To verify default review forms & reviewer section are populated on Draft announcement
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Pre-Application Modal" values from "Announcement_Field_Values.xlsx"
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 0               |
      | SME Review        | 100             |
    And I click on "Save" in the page details
    And I expand nested table containing column value "SME Review"
    And I pause execution for "2" seconds
    Then I softly see value "Fiscal Review" for title "Form Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see value "Program Review" for title "Form Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see value "Compliance Review" for title "Form Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Form Name" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Form Weight (%)" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Minimum Number of Reviews per Application" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Required?" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Reviewer" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Email" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Organization Name" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "# of Applications Assigned" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name     | Form Weight (%) |
      | Fiscal Review | 25              |
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Program Review | 25              |
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Compliance Review | 50              |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 50                 |
      | Environment    | 25                 |
      | Permits        | 25                 |
    And I pause execution for "2" seconds
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "2" seconds
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question2 | Written | 100       |
    And I pause execution for "2" seconds
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question3 | Written | 100       |
    And I pause execution for "2" seconds
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see the following messages in the page details :
      | There are no errors with the review step templates. |
    And I pause execution for "3" seconds
    When I enter the following values into flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    Then I softly see value "{SavedValue:PM Username}" for title "Reviewer" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see value "pm.automation.qa2@yopmail.com" for title "Email" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see value "Test Automation Organization" for title "Organization Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    And I click on "Remove from Form" icon for "Automation PM" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:AnnouncementReviewPanel---"

  @70861 @70858 @profileNotAllowedToCreateAnnouncement
  Scenario Outline: Verify user having FO/FD Profile are not allowed to create announcements
    When I login to "Grantor" app as "<users>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    Then I cannot see top right button "New" in flex table with id "---announcement:-:competitiveTableId---"
    Examples:
      | users |
      | FO    |
      | FD    |

  @73630 @73626 @SystemsErrorAfterApplyingWrongFilter @wip
  Scenario: To validate system is getting displayed error message while adding invalid values into the filter for Approves section on responsibility tab of announcement
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Pre-Application Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FO Username} | Step 3       |
    #And I click on advance filter "#advfGrantorAnnouncementRolesandResponsibilities" of table id "---announcement:-:approversTableId---"
    #And I enter advance filter values inside id "advfGrantorAnnouncementRolesandResponsibilities"
    #  | Announcement | equals to | Step 4 |
#    Then I softly see "No Records Found" inside flex table with id "---announcement:-:approversTableId---"
    And I navigate to "Setup" sub tab
#    And I click on advance filter "#advfAnnoucementPackagesGrantor" of table id "---announcement:-:businessFormlistTableId---"
#    And I enter advance filter values inside id "advfAnnoucementPackagesGrantor"
#      | Name | Contains | Anything |
    And I pause execution for "10" seconds
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:businessFormlistTableId---"

  @73854 @73855 @73852 @73853  @filterNotYetQualifiedSPAUser
  Scenario:  To verify, filter functionality for Not Yet Qualified:All section for announcement by external user
  | To verify, all closed opportunity which has Not Qualified should reflect under Not Yet Qualified: Closed list view
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "annId" from flex table "---applicationIntake:-:activeOpportunitiesTableId---"
    And I click on advance filter of table id "---applicationIntake:-:activeOpportunitiesTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:activeOpportunitiesTableId---" for LWC
      | EGMS ID | contains | {SavedValue:annId} |
    And I pause execution for "5" seconds
    Then I softly see value "{SavedValue:annId}" for title "EGMS ID" inside table "---applicationIntake:-:activeOpportunitiesTableId---"
    And I refresh the page
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    And I wait for "3" seconds
    And I click on advance filter of table id "---applicationIntake:-:activeOpportunitiesTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:activeOpportunitiesTableId---" for LWC
      | EGMS ID | contains | I am laughing |
    And I pause execution for "5" seconds
    Then I softly see "No records found" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    And I refresh the page
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:annId}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    Then I softly see value "{SavedValue:annId}" for title "EGMS ID" inside table "---applicationIntake:-:activeOpportunitiesTableId---"

  @73866 @73870  @viewQualifiedOpportunitySPA
  Scenario: To verify user allow to view Qualified opportunity  in opportunity tab
  | To verify, searched functionality for Qualified Opportunities :All section for opportunities phase
    Given I published "Directed" type announcement having name "Automation Runtime Announcement for Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Application Intake}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Application Intake}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I pause execution for "5" seconds
    And I click toggle button to select "Qualified Opportunities - All"
    And I pause execution for "3" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Application Intake}" in "---preApplication:-:qualifiedOpprtunitesTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime Announcement for Application Intake}" for title "Opportunity Name" inside table "---preApplication:-:qualifiedOpprtunitesTableId---"
    And I save the value from row "1" for column name "EGMS ID" as "egms id" from flex table "---preApplication:-:qualifiedOpprtunitesTableId---"
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Application Intake}" inside flex table with id "---preApplication:-:qualifiedOpprtunitesTableId---" without waiting for record
    Then I softly see field "EGMS ID" as "{SavedValue:egms id}"

  @73857 @75635 @75624 @publishingExtendDatedButtonDisplay @buglogged95462 @wip @ExcludeSendEmail
  Scenario: To Verify that Extend Dates(Revise) button will be shown when Announcement status is Published  for announcement
    Given I published "Competitive" type announcement having name "Announcement Runtime for Announcement Extend" and properties "default"
    And I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Announcement Runtime for Announcement Extend}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Announcement Runtime for Announcement Extend}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Then I softly can see top right button "Extend Dates" in page detail
    And I navigate to "Messages" sub tab
    And I enter value "test @Sarah PM" in my feed section and share the post
    And I refresh the page
    And I enter value "testing collab @Sarah PM" in my feed section and share the post
    Then I softly see "Sarah PM" inside flex table with id "---announcement:-:myFeedTableId---"
    Then I softly see "test" inside flex table with id "---announcement:-:myFeedTableId---"
    Then I softly see "testing collab" inside flex table with id "---announcement:-:myFeedTableId---"
    And I click on hyperlink containing value "More Options"
    And I click on hyperlink containing value "Delete"
    And I click modal button "OK"
    Then I softly do not see "testing collab" inside flex table with id "---announcement:-:collabMessages---"
    And I click on top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I send the email under collab tab with following details:
      | To                              | Subject | Body             |
      | internal.user.product@gmail.com | jitu    | this is bodyless |
    Then I softly see the following messages in the page details :
      | Email sent succesfully. |
    And I close "Send Email" modal by clicking the top right x button
    #And I click on advance filter "#advfCommunicationHistory" of table id "---announcement:-:collabMessages---"
    #And I enter advance filter values inside id "advfCommunicationHistory"
    #  | Subject | Contains | jitu |
    Then I softly see "jitu" inside flex table with id "---announcement:-:collabMessages---"

  @75524 @publishedAllowToDownloadPDF
  Scenario: To verify system allow to download PDF for Announcement after publishing it
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for pdf Tests" and properties "default"
    And I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for pdf Tests}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for pdf Tests}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on Menu icon present on top right corner of the page
    And I select "Download As PDF" from dropdown
    And I wait for "3" seconds
    And I download the file
    And I wait for "10" seconds
    Then I see "{SavedValue:Automation Runtime Announcement for pdf Tests}" on page "1" of "govgrants" pdf file

  @75632 @75621 @searchFunctionalityForMessagesMyFeedInCollab  @buglogged95462 @wip @ExcludeSendEmail
  Scenario: To verify search functionality for messages section in collab tab for announcement
  | To verify entered My Feed from the collab tab section of announcement is getting displayed on home phase.
    Given I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "default"
    And I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Messages" sub tab
    And I enter value "Hi @{SavedValue:PM Username}" in my feed section and share the post
    Then I softly see "{SavedValue:PM Username}" inside flex table with id "---announcement:-:myFeedTableId---"
    And I click on top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I send the email under collab tab with following details:
      | To                              | Subject | Body             |
      | internal.user.product@gmail.com | jitu    | this is bodyless |
    Then I softly see the following messages in the page details :
      | Email sent succesfully. |
    And I close "Send Email" modal by clicking the top right x button
    #When I perform quick search for "jitu" in "---announcement:-:collabMessages---" panel
    Then I softly see "jitu" inside flex table with id "---announcement:-:collabMessages---"
    And I navigate to "Home" tab
    Then I softly see "{SavedValue:PM Username}" inside flex table with id "---announcement:-:homeCollabFeedId---"
    Then I softly see "Hi" inside flex table with id "---announcement:-:homeCollabFeedId---"

  @78086 @validatingReviewersForSMEAndManagementReviewForm
  Scenario: To validate the Program review steps are copied to Announcement
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I wait for "2" seconds
    And I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When  I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I refresh the page
    When I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    Then I softly see value "Automation FO" for title "Reviewer" inside table "---announcement:-:AnnouncementReviewPanel---"
    And I wait for "2" seconds
#    And I expand nested table containing column value "Management Review"
    Then I softly see value "Automation EXE" for title "Reviewer" inside table "---announcement:-:AnnouncementReviewPanel---"

  @139787 @VerifyInheritatedApproverAtAnnouncementFromProgram_CompetitiveAnnouncement-RnRFunctionality
  Scenario Outline:  verify  approver get inherited from program level to announcement
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "<Focus Area>" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I wait for "4" seconds
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "4" seconds
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "4" seconds
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I wait for "5" seconds
    Then I softly see value "{SavedValue:EXE Username}" for title "Name" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Program" inside table "---program:-:approverTableId---"
    And I click on "Submit For Approval" in the page details
    And I pause execution for "5" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "<Program Name>" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    When I save the field labeled "EGMS ID" as "ActivatedProgramForAnnouncement"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click on remove for lookup from field "Program__c"
    And I enter in modal value "{SavedValue:ActivatedProgramForAnnouncement}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I pause execution for "4" seconds
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 1" for title "Announcement" inside table "---announcement:-:approversTableId---"
    Examples:
      | Focus Area                      | Program Name                                     |
      | Automation Permanent Focus Area | {SavedValue:Automation Runtime Internal Program} |

  @169903 @169904 @169905 @169906 @169900 @169907 @Verifyuserabletosee"Preview"actionof"GrantorPre-applicationform"atcreatedstateforAnnouncementrecord. @Sprint-7 @Vrishali
  Scenario: Verify user should able to see "Preview" action of "Grantor Pre-application form" at created state for Announcement record.
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I wait for "3" seconds
    And I click modal button "Close"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Program Artifacts" from computer
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I click on "Edit" icon for "Program Artifacts" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Other Artifacts" at upload file modal
    When I click modal button "Save"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---program:-:GrantorInternalProgramFilesTableId---"
    Then I softly see value "Other Artifacts" for title "Classification" inside table "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I wait for "3" seconds
    When I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I wait for "5" seconds
    And I click on remove for lookup from field "Program__c"
    And I enter in modal value "{SavedValue:ProgramEGMSID}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Setup" sub tab
   #169900
    #And I perform quick search for "Grantor Pre-application Form" in "---announcement:-:businessFormlistTableId---" panel
    Then I softly see value "Grantor Pre-application Form" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"
   #174348
    Then I softly see value "1" for title "Version Number" inside table "---announcement:-:businessFormlistTableId---"
   #169906
    Then I softly can see row level action button "Preview" against "Grantor Pre-application Form" in flex table with id "---announcement:-:businessFormlistTableId---"
    And I click on "Preview" icon for "Grantor Pre-application Form" inside flex table with id "---announcement:-:businessFormlistTableId---" without waiting for record
    #169904
    Then I softly see "Preview Package" opens in overLay window
    #169905
    Then I can see row level action button "Preview" against "Standard Pre-Application form" in flex table with id "---program:-:previewPackageTableId---"
    #169907
    And I click on "Preview" icon for "Standard Pre-Application form" inside flex table with id "---program:-:previewPackageTableId---" without waiting for record
    And I wait for "2" seconds
    And I switch to tab number "1"
    Then I see the header is "Create Pre-Application Form - Preview" in the page details

  @bug-397757 @194677 @194682 @194683 @194690 @194685  @sprint-4  @reassignment @ownvai
  Scenario: Validate user should able to click on play button after selecting the source & target user with the same profile PM
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
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Announcement" from reassign ownership dropdown
      #194682
    Then I softly see "Announcements Available for Reassignment " page block displayed
    When I navigate to "Records of Source User" sub tab
    #194690
    And I click on top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    And I click "OK" on modal confirmation box
    And I pause execution for "2" seconds
    Then I see the following messages in the page details contains:
      | You need to select at least one record |
    #194685
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    And I click on top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    #194683
    Then I softly see "Announcements Owned by Target User " page block displayed
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"

  @194692 @Validateaftertransfertorecordusershouldabletoseethetheserecordintargetusertable @sprint-4  @reassignment
  Scenario: Validate after transfer to record user should able to see the these record in target user table
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
    And I click on top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"

  @bug-397757 @194694 @194714 @194712 @Validateclickontransferredbuttonthenusershouldabletoseethewarningmessage @sprint-4  @reassignment
  Scenario: Validate click on transferred button then user should able to see the warning message
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
    #194714
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Cancel" on modal confirmation box
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminOwnerReplaceTableId---"
    #194712
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "5" seconds
    Then I see the following messages in the page details contains:
      | You need to select at least one record |

  @194722 @ValidateownershipischangedthenonlyAnnouncementownerischanged @sprint-4  @reassignment
  Scenario: Validate  ownership is changed then only Announcement owner is changed
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
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "40" seconds
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

  @194741 @Validatenewownercanchangetheextenddate&unpublisht @sprint-4  @reassignment  @Re-RunPlanningAndAnnouncement
  Scenario: Validate new owner can change the extend date & unpublish the announcement only if announcement is in published state
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
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    And I wait for "3" seconds
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
    Then I softly can see top right button "Extend Dates" in page detail
    Then I softly can see top right button "Unpublish" in page detail

  @PGannouncement @194742 @Validateoldownershouldonlyseetheannouncementrecord @sprint-4  @reassignment
  Scenario: Validate old owner should only see the announcement record
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
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I can see row level action button "View" against "{SavedValue:AnnEGMSID}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:AnnEGMSID}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:AnnEGMSID}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"

  @194755 @Validateonlyownerofannouncementrecordcaninitiatethereview @sprint-4  @reassignment
  Scenario: Validate only owner of announcement record can initiate the review
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "5" seconds
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
      | Name                      | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
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
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "input-1"
    And I select value "Automation PM" into field "input-2"
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
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "5" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "2" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
#    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
#    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    Given I click on "Back" in the page details
#    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
#    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    Given I click on "Back" in the page details
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I close the tab
    And I wait for "3" seconds
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I pause execution for "2" seconds
    And I switch to tab number "1"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "AppContactFlexGrid" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationReview:-:announcementListTableId---" panel
    Then I softly can see row level action button "Initiate Review Process" against "{SavedValue:AnnEGMSID}" in flex table with id "---applicationReview:-:announcementListTableId---"

  @194756 @Validateowneristransferredbeforeinitiatingthereviewonlynewreassignedownershouldbeabletoinitiatethereview @sprint-4  @reassignment
  Scenario: Validate owner is transferred before initiating the review only new reassigned owner should be able to initiate the review
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
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
      | Name                     | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:PM Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
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
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
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
    And I pause execution for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I wait for "2" seconds
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
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
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationReview:-:announcementListTableId---" panel
    Then I softly can see row level action button "Initiate Review Process" against "{SavedValue:AnnEGMSID}" in flex table with id "---applicationReview:-:announcementListTableId---"

  @194760 @Validateapplicationsorpreapplicationattachedtothatannouncementbeforeownershiptransfer @sprint-4  @reassignment @ownvai
  Scenario: Validate applications or pre-application attached to that announcement before ownership transfer
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal4" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Edition1" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
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
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I click on "Publish" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I pause execution for "5" seconds
    When I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "preAppId"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    And I pause execution for "3" seconds
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    When  I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I pause execution for "3" seconds
    And I switch to tab number "1"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I close the tab
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Accept" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:recipientPreApplicationsTableId---"
    When I click on "Create Application" in the page details
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "3" seconds
    And I pause execution for "3" seconds
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I pause execution for "3" seconds
    And I switch to tab number "1"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I close the tab
    When I click on "Submit Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "input-1"
    And I select value "Automation PM" into field "input-2"
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
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationReview:-:announcementListTableId---" panel
    Then I softly can see row level action button "Initiate Review Process" against "{SavedValue:AnnEGMSID}" in flex table with id "---applicationReview:-:announcementListTableId---"

  @194763 @Validateownershipreassignmentofannouncementfieldhistoryshouldgetupdated @sprint-4  @reassignment @FieldHistoryExclude
  Scenario: Validate ownership reassignment of announcement field history should get updated
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
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Automation EXE1" for title "New Value" inside field history table
    Then I softly see value "Automation EXE" for title "Original Value" inside field history table

  @196847 @Validateuserapprovedtheannouncement&reassignownershiptonewuserthenpublishoptionshoulddisplaytonewowner @sprint-4  @reassignment
  Scenario: Validate user approved the announcement & reassign ownership to  new user then publish option should display to new owner
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
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
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Then I softly cannot see top right button "Publish" in page detail
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail

  @PGannouncement @196852 @ValidateuseraddedtheYesNofunctionalitybeforereassignmentownershipthenafterownershipnewownerhavingtheaccessofthisparticularsettings @sprint-4  @reassignment
  Scenario: Validate user added the Yes No functionality before reassignment ownership then after ownership new owner having the access of this particular settings
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
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    And I reset the table
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Setup" sub tab
    Then I can see top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    Then I can see top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    Then I can see top right button "Associate" in flex table with id "---announcement:-:kpiflextableid---"

  @196887 @Validateusershouldnotabletoseetheinactiveinternaluserintargetuser @sprint-4  @reassignment
  Scenario: Validate user should not able to see the inactive internal user in  target user
    When I login to "Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I enter value "User FD" in reassign lookup
    And I pause execution for "3" seconds
    Then I softly do not see "No matches found" inside auto search result

  @PGannouncement @197927 @Validateannouncementiscreated&changetheownershipofannouncementthennewbuttonofpeerreviewisdisplaytothenewowner @sprint-4  @reassignment
  Scenario: Validate announcement is created & change the ownership of announcement then new button of peer review is display to the new owner
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
    And I reset the table
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---announcement:-:reviewersTableId---"

  @PGannouncement @197931 @Validateafterapprovedtheannouncementwhenuserchangetheownershipofannouncementthenpublishbuttonshoulddisplaytothenewowner @sprint-4  @reassignment
  Scenario: Validate after approved the announcement when user change the ownership of  announcement then publish button should display to the new owner
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
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
      | Name                      | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
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
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail

  @197932 @197934 @197935 @197937 @Validateaftercreatedannouncementuserchangedtheownershipofannouncementthenalloverviewtabbuttonaccessshouldgettothenewowner @sprint-4  @reassignment
  Scenario: Validate after created announcement user changed the ownership of announcement then all overview tab button access should get to the new owner
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
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:AnnEGMSID}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    Then I softly see fields "AnnouncementName__c" is in edit mode
    Then I softly see fields "Organization__c" is in edit mode
    Then I softly see fields "AdministrationBureauUnit__c" is in edit mode
    Then I softly see fields "MaxApplicationsAllowed__c" is in edit mode
    Then I softly see fields "AreExpensesBuildIUpLevel__c" is in edit mode
    Then I softly see fields "IsAdvancePermitted__c" is in edit mode
    Then I softly see fields "IsNegotiationsAllowed__c" is in edit mode
    Then I softly see fields "AnnouncementDescription__c" is in edit mode
    Then I softly see fields "ApplicationDueDate__c" is in edit mode
    Then I softly see fields "QAAvailability__c" is in edit mode
    Then I can see top right button "Associate" in flex table with id "---announcement:-:relatedAnnouncementTableId---"
    Then I can see top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    Then I can see top right button "New" in flex table with id "---announcement:-:contactTableId---"
    #197934
    And I navigate to "Financials" sub tab
    Then I softly see fields "AwardFloor__c" is in edit mode
    Then I softly see fields "AwardCeiling__c" is in edit mode
    Then I softly see fields "TotalCommittedAmount__c" is in edit mode
    Then I can see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I can see top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    Then I can see top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    #197935
    When I navigate to "Setup" sub tab
    Then I can see top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    Then I can see top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    Then I can see top right button "Associate" in flex table with id "---announcement:-:kpiflextableid---"
    Then I can see top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    Then I can see top right button "New" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    #197937
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---announcement:-:reviewersTableId---"
    Then I softly can see top right button "New" in flex table with id "---announcement:-:approversTableId---"
    And I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---announcement:-:AnnouncementAttachmentTableId---"
    Then I softly can see top right button "New" in flex table with id "---announcement:-:AnnouncementNotestableId---"

  @194693 @ValidatePMuserIcanseemyownpendingtasksinMyTasksectionandcanreassignownershiptaskstotargeuser @sprint-4  @reassignment @taskreassign
  Scenario: Validate PM user I can see my own pending tasks in 'My Task' section and can reassign ownership tasks to target user
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
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
      | Name                      | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
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
    Then I see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"

  @195050 @ValidatePOuserIcanseemyownpendingtasksinMyTasksectionandcanreassignownershiptaskstotargeuser @sprint-4  @reassignment
  Scenario: Validate PO user I can see my own pending tasks in 'My Task' section and can reassign ownership tasks to target user
    When I login to "Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I wait for "5" seconds
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
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"

  @195051 @ValidateEXEuserIcanseemyownpendingtasksinMyTasksectionandcanreassignownershiptaskstotargeuser @sprint-4  @reassignment @taskreassign
  Scenario: Validate EXE user I can see my own pending tasks in 'My Task' section and can reassign ownership tasks to target user
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
      | Name                     | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:PM Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
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
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
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
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"

  @195195 @ValidateusercancheckthetaskfromReassignMyCurrentTasktableandreassignthemtothenewuserofsameprofileandsameorganization @sprint-4  @reassignment
  Scenario: Validate user can check the task from Reassign My Current Task table and reassign them to the new user of same profile and same organization
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
      | Name                      | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
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

  @195196 @Validateusercannotreassignownershiptasktothenewuserwithdifferentprofileandsameorganization @sprint-4  @reassignment
  Scenario: Validate user can not reassign ownership task to the new user with different profile and same organization
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Draft Directed Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "10" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
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
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    And I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE"
    And I pause execution for "4" seconds
    Then I softly do not see "Automation EXE" inside auto search result

  @195199 @ValidateusercannotreassignownershiptasktothenewuserwithSameprofileanddifferentorganization @sprint-4  @reassignment
  Scenario: Validate user can not reassign ownership task to the new user with Same profile and different organization
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Directed Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
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
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    And I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
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
    When I reassign task to "Sarah PM"
    And I pause execution for "4" seconds
    Then I softly do not see "No matches found" inside auto search result

  @195201 @ValidatependingtaskshouldbegeneratedforPOasnewownerofAnn @sprint-4  @reassignment @taskreassign
  Scenario: Validate pending task should be generated for PO as new owner of Ann
    When I login to "Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I wait for "3" seconds
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
      | Name                      | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
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
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PO1" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---home:-:internalHomePendingTaskTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---home:-:internalHomePendingTaskTableId---"

  @195215  @sprint-4  @reassignment
  Scenario: Validate PM as old Ann owner can only view Ann record once he reassign Ann ownership task to new user
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I wait for "3" seconds
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
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
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
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I wait for "5" seconds
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I can see row level action button "View" against "{SavedValue:AnnEGMSID}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:AnnEGMSID}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:AnnEGMSID}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"

  @195225 @ValidatenewAnnownershouldbedisplayforownersectionunderresponsibilitytabafterownershiptaskreassigntonewuser @sprint-4  @reassignment
  Scenario: Validate new Ann owner should be display for owner section under responsibility tab after ownership task reassign to new user
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
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
      | Automation PM1 | Step 1       |
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
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    Then I see value "Automation PM" for title "Name" inside table "---announcement:-:announcementOwner---"

  @195229 @ValidatevalidationmessageshouldbedisplayifusertrytoreassignAnnownershiptasktohimself @sprint-4  @reassignment @Re-RunPlanningAndAnnouncement
  Scenario: Validate validation message should be display if user try to reassign Ann ownership task to him self
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I wait for "5" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I wait for "4" seconds
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
      | Automation PM1 | Step 1       |
    And I wait for "3" seconds
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
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-source"
    And I enter value "Automation PM" in reassign lookup
    Then I softly do not see "Automation PM" inside auto search result

  @195230 @ValidateoldAnnownershouldnotabletoseeAnntaskinMyTasktableonceownershiptaskreassigntootheruser @sprint-4  @reassignment
  Scenario: Validate old Ann owner should not able to see Ann task in My Task table once ownership task reassign to other user
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
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
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation PM1 | Step 1       |
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
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"

  @195265 @ValidatepreapptaskassigntonewAnnownerPOaftersubmittograntorifpreappcreatedonnewAnnownerafterownershipreassignment  @sprint-4  @reassignment
  Scenario: Validate preapp task assign to new Ann owner PO after submit to grantor if preapp created on new Ann owner after ownership reassignment
    When I login to "Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal4" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition1" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
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
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I pause execution for "5" seconds
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "preAppId"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 500        | 50             | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---preApplication:-:flexGridPreAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI3 Username} | Checked        |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I pause execution for "3" seconds
    And I switch to tab number "1"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    When I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:preAppId}" in "---home:-:internalHomePendingTaskTableId---" panel
    Then I see value "{SavedValue:preAppId}" for title "EGMS ID" inside table "---home:-:internalHomePendingTaskTableId---"

  @195276 @ValidateoldownerofapplicationinternalshouldnotabletoproccedfurtherreviewinitiationprocessifappcreatedonnewownerafterAnnownershipreassignment @sprint-4  @reassignment
  Scenario: Validate old owner of application internal should not able to procced further review initiation process if app created on new owner after Ann ownership reassignment
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "5" seconds
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
      | Name          | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation PM | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
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
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
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
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationReview:-:announcementListTableId---" panel
    Then I softly cannot see row level action button "Initiate Review Process" against "{SavedValue:AnnEGMSID}" in flex table with id "---applicationReview:-:announcementListTableId---"

  @197929  @sprint-4  @reassignment @Re-RunPlanningAndAnnouncement
  Scenario: Validate Ann owner unpublish Ann and reassign ownership to new user for publish then pending task should generate for new owner
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I wait for "8" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
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
      | Name           | Announcement |
      | Automation EXE | Step 1       |
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
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    And I click on "Unpublish" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
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
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---home:-:internalHomePendingTaskTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---home:-:internalHomePendingTaskTableId---"
    Then I see value "Publish Announcement" for title "Task Type" inside table "---home:-:internalHomePendingTaskTableId---"

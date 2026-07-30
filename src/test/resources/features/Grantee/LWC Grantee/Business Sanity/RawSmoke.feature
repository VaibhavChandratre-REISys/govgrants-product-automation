@GranteeSmokeTestCases_raw @GranteeTBE @granteeBusinessFlowSanity
Feature: Grantee Smoke scenarios

  @440386 @ValidatePMusercancreateandActivateStrategicplan @Grantee_Smoke1
  Scenario Outline: Validate PM user can create and Activate Strategic plan
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I enter in modal "Grantee_StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see "AttachmentTesting.pdf" has been added in "Strategic Plan Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Strategic Plan" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I softly see value "Strategic Plan" for title "Classification" inside table "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see "Attachment.pdf" has been added in "Strategic Plan Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
#    And I navigate to "Messages" sub tab
#    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
#    And I send the email under collab tab with following details:
#      | To          | Subject            | Body            |
#      | <emailIdTo> | Automation Subject | Automation Body |
#    And I wait for "5" seconds
#    Then I softly see the text "Email Sent Successfully." in modal
#    When I click modal button "Close"
#    And I refresh the page
#    And I wait for "5" seconds
#    And I navigate to "Messages" sub tab
#    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
#    Then I softly see value "<emailIdFrom>" for title "From Address" inside table "CommunicationHistory"
#    Then I softly see value "<emailIdTo>" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I enter in modal value "Automation Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Strategic GoaI Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Strategic Goal" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    Then I softly see value "Strategic Goal" for title "Classification" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see "Attachment.pdf" has been added in "Strategic GoaI Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
#    And I navigate to "Messages" sub tab
#    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
#    And I send the email under collab tab with following details:
#      | To          | Subject            | Body            |
#      | <emailIdTo> | Automation Subject | Automation Body |
#    And I wait for "5" seconds
#    Then I softly see the text "Email Sent Successfully." in modal
#    When I click modal button "Close"
#    And I refresh the page
#    And I navigate to "Messages" sub tab
#    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
#    Then I softly see value "<emailIdFrom>" for title "From Address" inside table "CommunicationHistory"
#    Then I softly see value "<emailIdTo>" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---grantee_tableId:-:Objectives---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Activities" as "Automation Test Description"
    When I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    When I perform quick search for "Automation Runtime KPI" in "---program:-:programsTableId---" panel
    And I save the value from row "1" for column name "Title" as "Automation Runtime KPI" from flex table "---grantee_tableId:-:strategicObjectivesKPITableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---grantee_tableId:-:objectivesSelectKPITableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see that "{SavedValue:Automation Runtime KPI}" has been added in flextable with Id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    Then I softly see field "Status" as "Draft"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Objective Files" flex table
    And I click on "Edit" icon for "Others" inside flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Objective" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    Then I softly see value "Objective" for title "Classification" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see "Attachment.pdf" has been added in "Objective Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    And I navigate to "Messages" sub tab
#    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
#    And I send the email under collab tab with following details:
#      | To          | Subject            | Body            |
#      | <emailIdTo> | Automation Subject | Automation Body |
#    Then I softly see the text "Email Sent Successfully." in modal
#    And I wait for "3" seconds
#    When I click modal button "Close"
#    And I refresh the page
#    And I wait for "3" seconds
#    And I navigate to "Messages" sub tab
#    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
#    Then I softly see value "<emailIdFrom>" for title "From Address" inside table "CommunicationHistory"
#    Then I softly see value "<emailIdTo>" for title "To Address" inside table "CommunicationHistory"
    And I save the field labeled "Strategic Plan" as "StrategicPlan"
    And I click on hyperlink containing value "{SavedValue:StrategicPlan}"
    When I navigate to "Related Log" sub tab
    Then I softly see that "{SavedValue:Automation Runtime KPI}" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    Examples:
      | userType   | emailIdFrom                     | emailIdTo                         |
      | GRANTEE PM | sarah.pm.ggmergeqa2@yopmail.com | victor.exe.ggmergeqa2@yopmail.com |

  @Bug-PROD-83414 @445639 @ValidateprogressreportscheduleusercaneditprogressreportscheduleonCreatedSubmittedforreviewReviewedActivatedaward @Grantee_Smoke1
  Scenario Outline: Validate progress report schedule user can edit progress report schedule on Created , Submitted for review, Reviewed, Activated award
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_Creation_Schedules" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "<UEI>" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edit_Schedules" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Projections" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    When I navigate to "Management" sub tab
    Then I softly see "Reports Schedule" page block displayed
    Then I softly see value "Progress Report" for title "Report Type" inside table "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see value "Financial Report" for title "Report Type" inside table "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Report Title" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "View" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    Then I softly see "Scheduled Report" page block displayed on modal
    Then I softly see field "Report Type" inside page block
    Then I softly see field "Report Title" inside page block
    Then I softly see field "Reporting Period Start Date" inside page block
    Then I softly see field "Reporting Period End Date" inside page block
    Then I softly see field "Frequency" inside page block
    Then I softly see field "Schedule Base" inside page block
    Then I softly see field "Description" inside page block
    Then I softly see field "Lead time (in days) for report task creation" inside page block
    Then I softly see field "# of days for report submission" inside page block
    Then I softly see field "Report Type" as "Progress Report"
    Then I softly see field "Report Title" as "{SavedValue:Automation Runtime award}"
    Then I softly see field "Reporting Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Reporting Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Then I softly see field "Frequency" as "Not Applicable"
    Then I softly see field "Schedule Base" as ""
    Then I softly see field "Description" as ""
    Then I softly see field "Lead time (in days) for report task creation" as "15"
    Then I softly see field "# of days for report submission" as "15"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    Then I softly see "Scheduled Report" page block displayed on modal
    Then I softly see field "Report Type" inside page block
    Then I softly see field "Report Title" inside page block
    Then I softly see field "Reporting Period Start Date" inside page block
    Then I softly see field "Reporting Period End Date" inside page block
    Then I softly see field "Frequency" inside page block
    Then I softly see field "Schedule Base" inside page block
    Then I softly see field "Description" inside page block
    Then I softly see field "Lead time (in days) for report task creation" inside page block
    Then I softly see field "# of days for report submission" inside page block
    Then I softly see field "Report Type" as "Progress Report"
    Then I softly see fields "SubmissionTitle__c" is in edit mode
    Then I softly see fields "CalReportingStartDate__c" is in edit mode
    Then I softly see fields "CalReportingEndDate__c" is in edit mode
    Then I softly see fields "Frequency__c" is in edit mode
    Then I softly see fields "ScheduleBase__c" is in edit mode
    Then I softly see fields "Description__c" is in edit mode
    Then I softly see fields "DaysBeforeEndDate__c" is in edit mode
    Then I softly see fields "DaysAfterEndDate__c" is in edit mode
    When I enter in modal "Grantee_Progress_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "Reporting Period End Date" as "ReportingPeriodEndDate" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I pause execution for "5" seconds
#    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
#      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date |
#      | {SavedValue:EGMS ID1} | 17                          | 27                        |
#    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
#      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
#      | {SavedValue:EGMS ID2} | 27                          | {SavedValue:ReportingPeriodEndDate} |
#    Then I softly see value "{Date:M/d/yyyy::d+17}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
#    Then I softly see value "{Date:M/d/yyyy::d+27}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date |
      | {SavedValue:EGMS ID1} | 15                          | 25                        |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
      | {SavedValue:EGMS ID2} | 25                          | {SavedValue:ReportingPeriodEndDate} |
    Then I softly see value "{Date:M/d/yyyy::d+15}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly see value "{Date:M/d/yyyy::d+25}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I navigate to "Overview" sub tab
    And I wait for "5" seconds
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "<userName>" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name       | Project Role    | Is Key Contact |
      | <userName> | Project Officer | Checked        |
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click "Associate" after selection of "Automation Permanent NGO Program" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
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
    When I close "Award Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    When I enter in modal "Grantee_Progress_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
#    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
#      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date |
#      | {SavedValue:EGMS ID1} | 17                          | 27                        |
#    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
#      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
#      | {SavedValue:EGMS ID2} | 27                          | {SavedValue:ReportingPeriodEndDate} |
#    Then I softly see value "{Date:M/d/yyyy::d+17}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
#    Then I softly see value "{Date:M/d/yyyy::d+27}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date |
      | {SavedValue:EGMS ID1} | 15                          | 25                        |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
      | {SavedValue:EGMS ID2} | 25                          | {SavedValue:ReportingPeriodEndDate} |
    Then I softly see value "{Date:M/d/yyyy::d+15}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly see value "{Date:M/d/yyyy::d+25}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
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
    When I re-login to "Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<GrantEGMSID>" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "<GrantEGMSID>" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "<AwardEGMSID>" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    When I enter in modal "Grantee_Progress_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
#    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
#      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
#      | {SavedValue:EGMS ID1} | 17                          | 27                                  |
#      | {SavedValue:EGMS ID2} | 27                          | {SavedValue:ReportingPeriodEndDate} |
#    Then I softly see value "{Date:M/d/yyyy::d+17}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
#    Then I softly see value "{Date:M/d/yyyy::d+27}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date |
      | {SavedValue:EGMS ID1} | 15                          | 25                        |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
      | {SavedValue:EGMS ID2} | 25                          | {SavedValue:ReportingPeriodEndDate} |
    Then I softly see value "{Date:M/d/yyyy::d+15}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly see value "{Date:M/d/yyyy::d+25}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | <userName> | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---" by clicking "Edit" :
      | Title                               | Target | Current Value | Current Value As Of |
      | {SavedValue:Automation Runtime KPI} | 10     | 10            | 0                   |
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
    And I wait for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly cannot see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    When I enter in modal "Grantee_Progress_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
#    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
#      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date |
#      | {SavedValue:EGMS ID1} | 17                          | 27                        |
#    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
#      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
#      | {SavedValue:EGMS ID2} | 27                          | {SavedValue:ReportingPeriodEndDate} |
#    Then I softly see value "{Date:M/d/yyyy::d+17}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
#    Then I softly see value "{Date:M/d/yyyy::d+27}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date |
      | {SavedValue:EGMS ID1} | 15                          | 25                        |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
      | {SavedValue:EGMS ID2} | 25                          | {SavedValue:ReportingPeriodEndDate} |
    Then I softly see value "{Date:M/d/yyyy::d+15}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly see value "{Date:M/d/yyyy::d+25}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"

    Examples:
      | userType   | userName | UEI          | GrantEGMSID              | AwardEGMSID              |
      | GRANTEE PM | Sarah PM | 123456789123 | {SavedValue:GrantEGMSID} | {SavedValue:AwardEGMSID} |

  @Bug-PROD-83414 @445640 @ValidateFinancialReportScheduleusercaneditFinancialreportscheduleonCreatedSubmittedforreviewReviewedActivatedaward @Grantee_Smoke1
  Scenario Outline: Validate Financial Report Schedule user can edit Financial report schedule on Created Submitted for review Reviewed Activated award
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I enter "Grantee_Creation_Schedules" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "<UEI>" into field "DUNS__c"
    And I click on "Save" in the page details
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edit_Schedules" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Projections" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    When I navigate to "Management" sub tab
    Then I softly see "Reports Schedule" page block displayed
    Then I softly see value "Progress Report" for title "Report Type" inside table "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see value "Financial Report" for title "Report Type" inside table "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Report Title" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "View" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "Edit" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "View" icon for "Financial Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    Then I softly see "Scheduled Report" page block displayed on modal
    Then I softly see field "Report Type" inside page block
    Then I softly see field "Report Title" inside page block
    Then I softly see field "Reporting Period Start Date" inside page block
    Then I softly see field "Reporting Period End Date" inside page block
    Then I softly see field "Frequency" inside page block
    Then I softly see field "Schedule Base" inside page block
    Then I softly see field "Description" inside page block
    Then I softly see field "Lead time (in days) for report task creation" inside page block
    Then I softly see field "# of days for report submission" inside page block
    Then I softly see field "Report Type" as "Financial Report"
    Then I softly see field "Report Title" as "{SavedValue:Automation Runtime award}"
    Then I softly see field "Reporting Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Reporting Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Then I softly see field "Frequency" as "Not Applicable"
    Then I softly see field "Schedule Base" as ""
    Then I softly see field "Description" as ""
    Then I softly see field "Lead time (in days) for report task creation" as "15"
    Then I softly see field "# of days for report submission" as "15"
    When I click modal button "Close"
    And I wait for "1" seconds
    And I click on "Edit" icon for "Financial Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    Then I softly see "Scheduled Report" page block displayed on modal
    Then I softly see field "Report Type" inside page block
    Then I softly see field "Report Title" inside page block
    Then I softly see field "Reporting Period Start Date" inside page block
    Then I softly see field "Reporting Period End Date" inside page block
    Then I softly see field "Frequency" inside page block
    Then I softly see field "Schedule Base" inside page block
    Then I softly see field "Description" inside page block
    Then I softly see field "Lead time (in days) for report task creation" inside page block
    Then I softly see field "# of days for report submission" inside page block
    Then I softly see field "Report Type" as "Financial Report"
    Then I softly see fields "SubmissionTitle__c" is in edit mode
    Then I softly see fields "CalReportingStartDate__c" is in edit mode
    Then I softly see fields "CalReportingEndDate__c" is in edit mode
    Then I softly see fields "Frequency__c" is in edit mode
    Then I softly see fields "ScheduleBase__c" is in edit mode
    Then I softly see fields "Description__c" is in edit mode
    Then I softly see fields "DaysBeforeEndDate__c" is in edit mode
    Then I softly see fields "DaysAfterEndDate__c" is in edit mode
    When I enter in modal "Grantee_Financial_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "1" seconds
    And I expand nested table containing column value "Financial Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "Reporting Period End Date" as "ReportingPeriodEndDate" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
#    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
#      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
#      | {SavedValue:EGMS ID1} | 17                          | 27                                  |
#      | {SavedValue:EGMS ID2} | 27                          | {SavedValue:ReportingPeriodEndDate} |
#    And I wait for "5" seconds
#    Then I softly see value "{Date:M/d/yyyy::d+17}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
#    Then I softly see value "{Date:M/d/yyyy::d+27}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
      | {SavedValue:EGMS ID1} | 15                          | 25                                  |
      | {SavedValue:EGMS ID2} | 25                          | {SavedValue:ReportingPeriodEndDate} |
    And I wait for "5" seconds
    Then I softly see value "{Date:M/d/yyyy::d+15}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly see value "{Date:M/d/yyyy::d+25}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "<userName>" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name       | Project Role    | Is Key Contact |
      | <userName> | Project Officer | Checked        |
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click "Associate" after selection of "Automation Permanent NGO Program" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
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
    When I close "Award Line Items" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "Edit" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "Edit" icon for "Financial Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    When I enter in modal "Grantee_Financial_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I expand nested table containing column value "Financial Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
#    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
#      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
#      | {SavedValue:EGMS ID1} | 17                          | 27                                  |
#      | {SavedValue:EGMS ID2} | 27                          | {SavedValue:ReportingPeriodEndDate} |
#    Then I softly see value "{Date:M/d/yyyy::d+17}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
#    Then I softly see value "{Date:M/d/yyyy::d+27}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
      | {SavedValue:EGMS ID1} | 15                          | 25                                  |
      | {SavedValue:EGMS ID2} | 25                          | {SavedValue:ReportingPeriodEndDate} |
    Then I softly see value "{Date:M/d/yyyy::d+15}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly see value "{Date:M/d/yyyy::d+25}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "Edit" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "Edit" icon for "Financial Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    When I enter in modal "Grantee_Financial_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I expand nested table containing column value "Financial Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
#    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
#      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
#      | {SavedValue:EGMS ID1} | 17                          | 27                                  |
#      | {SavedValue:EGMS ID2} | 27                          | {SavedValue:ReportingPeriodEndDate} |
#    Then I softly see value "{Date:M/d/yyyy::d+17}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
#    Then I softly see value "{Date:M/d/yyyy::d+27}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
      | {SavedValue:EGMS ID1} | 15                          | 25                                  |
      | {SavedValue:EGMS ID2} | 25                          | {SavedValue:ReportingPeriodEndDate} |
    Then I softly see value "{Date:M/d/yyyy::d+15}" for title "Reporting Period Start Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly see value "{Date:M/d/yyyy::d+25}" for title "Reporting Period End Date" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | <userName> | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---" by clicking "Edit" :
      | Title                               | Target | Current Value | Current Value As Of |
      | {SavedValue:Automation Runtime KPI} | 10     | 10            | 0                   |
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly cannot see row level action button "Edit" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I expand nested table containing column value "Financial Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "Edit" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "Edit" icon for "Financial Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    When I enter in modal "Grantee_Financial_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I expand nested table containing column value "Financial Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I select value inside table "---grantee_tableId:-:financialReportProgressReportSchedules---" is "All"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "7" for column name "EGMS ID" as "EGMS ID7" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "8" for column name "EGMS ID" as "EGMS ID8" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "9" for column name "EGMS ID" as "EGMS ID9" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "10" for column name "EGMS ID" as "EGMS ID10" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "11" for column name "EGMS ID" as "EGMS ID11" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "12" for column name "EGMS ID" as "EGMS ID12" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "13" for column name "EGMS ID" as "EGMS ID13" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID7}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID8}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID9}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID10}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID11}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID12}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID13}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
      | {SavedValue:EGMS ID2} | 25                          | {SavedValue:ReportingPeriodEndDate} |
    Then I softly see value "{Date:M/d/yyyy::d+25}" for title "Reporting Period Start Date" against the value "{SavedValue:EGMS ID2}" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly see value "{SavedValue:ReportingPeriodEndDate}" for title "Reporting Period End Date" against the value "{SavedValue:EGMS ID2}" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"

    Examples:
      | userType   | userName | UEI          |
      | GRANTEE PM | Sarah PM | 123456789123 |

  @477625 @ValidatePMusershouldabletoCreateActivatetheKPI @Grantee_Smoke1
  Scenario Outline: Validate PM user should able to Create & Activate the KPI
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:KPITable---"
    And I enter "Grantee_Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    And I save the field labeled "Domain" as "Domain"
    And I save the field labeled "Title" as "KPITitle"
    And I save the field labeled "Measure" as "Measure"
    And I save the field labeled "Unit of Measurement" as "UnitofMeasurement"
    And I save the field labeled "Indicator" as "Indicator"
    Then I softly see field "Domain" as "{SavedValue:Domain}"
    Then I softly see field "Title" as "{SavedValue:KPITitle}"
    Then I softly see field "Measure" as "{SavedValue:Measure}"
    Then I softly see field "Unit of Measurement" as "{SavedValue:UnitofMeasurement}"
    Then I softly see field "Indicator" as "{SavedValue:Indicator}"
    When I navigate to "Related Log" sub tab
    Then I softly see "No Records Found" inside flex table with id "Goals"
    Then I softly see "No Records Found" inside flex table with id "KPIsGranteeRelatedAwards"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Supporting Documents" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:KPIFilesTableId---"
    Then I softly see value "Supporting Documents" for title "Classification" inside table "---grantee_tableId:-:KPIFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    And I upload attachment without random number "Attachment1.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    And I upload attachment without random number "sample.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "5" seconds
    Then I softly see "AttachmentTesting.pdf" has been added in "KPI Files" flex table
    Then I softly see "Attachment.pdf" has been added in "KPI Files" flex table
    Then I softly see "Attachment1.pdf" has been added in "KPI Files" flex table
    Then I softly see "sample.pdf" has been added in "KPI Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:KPINotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record  | Automation Notes  |
      | Notes Record1 | Automation Notes1 |
      | Notes Record2 | Automation Notes2 |
      | Notes Record3 | Automation Notes3 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:KPINotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:KPINotesTableId---"
    Then I softly see value "Notes Record2" for title "Title" inside table "---grantee_tableId:-:KPINotesTableId---"
    Then I softly see value "Notes Record3" for title "Title" inside table "---grantee_tableId:-:KPINotesTableId---"
    And I navigate to "Messages" sub tab
#    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
#    And I send the email under collab tab with following details:
#      | To                        | Subject            | Body            |
#      | pm.automation@yopmail.com | Automation Subject | Automation Body |
#    When I click modal button "Close"
#    And I refresh the page
#    And I wait for "3" seconds
#    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
#    Then I softly see value "<emailId>" for title "From Address" inside table "CommunicationHistory"
#    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "Related Log" sub tab
    Then I softly see "No Records Found" inside flex table with id "Goals"
    Then I softly see "No Records Found" inside flex table with id "KPIsGranteeRelatedAwards"
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Activate.pdf" as name
    Examples:
      | userType   | emailId                         |
      | GRANTEE PM | sarah.pm.ggmergeqa2@yopmail.com |

  @PROD-689 @485463 @ValidatePMuserFinancialreportOwnercanabletocreateAdhocFinancialReportabletosubmitFinancialReporttoGrantor @Grantee_Smoke2
  Scenario: Validate PM user Financial report Owner can able to create Adhoc Financial Report  able to submit Financial Report to Grantor
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:FinancialsReportTableId---"
    And I enter "Creation" values from "Financial_Report_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "financialEGMSID"
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - My Records"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:financialEGMSID}" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "Edit" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "View" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "Delete" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly do not see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly do not see value "Approved" for title "Status" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly do not see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    And I click toggle button to select "Financial Reports - Draft"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:financialEGMSID}" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "Edit" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "View" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "Delete" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Grant Award Number" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Award Title" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside table
    Then I softly see "Collapse" button for header
    Then I see the header is "Financial Report" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:financialEGMSID}"
    Then I softly see field "Status" as "Created"
    And I save the field labeled "Grant Award Number" as "GrantNumber"
    Then I softly see field "Grant Award Number" as "{SavedValue:GrantNumber}"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see "Resize" button for page
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Forms and Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly see "Report Overview" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "System Information" page block displayed
    And I save the field labeled "Award ID" as "AwardID"
    Then I softly see field "Award ID" inside page block
    Then I softly see link "{SavedValue:AwardID}" inside Page block
    Then I softly see field "Budget Period" inside page block
    Then I softly see field "Budget Period Number" inside page block
    Then I softly see field "Internal Organization" inside page block
    And I save the field labeled "Internal Organization" as "InternalOrganization"
    Then I softly see link "{SavedValue:InternalOrganization}" inside Page block
    Then I softly see field "Funding Organization" inside page block
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see link "{SavedValue:FundingOrganization}" inside Page block
    Then I softly see field "Reporting Period Start Date" inside page block
    Then I softly see field "Reporting Period End Date" inside page block
    Then I softly see field "Report Due Date" inside page block
    Then I softly see field "Final Report?" inside page block
    Then I softly see field "Submitted On" inside page block
    And I click on "Edit" in the page details
    Then I softly see fields "ReportingPeriodStartDate__c" is in edit mode
    Then I softly see fields "ReportingPeriodEndDate__c" is in edit mode
    Then I softly see fields "ReportDueDate__c" is in edit mode
    Then I softly see fields "IsFinalReport__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see "Project Role" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Name" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Is Key Contact" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Is User" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see field "Created By" inside page block
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified By" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I softly see field "Last Modified Date" inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Sarah PM      | Fiscal Reviewer | Automation Description | 5        | No                   |
#    Then I softly see the following messages in the page details contains:
#      | Saved Successfully! |
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Edit" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Delete" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I click on "Delete" icon for "Sarah PM" inside table with table id "---grantee_tableId:-:financialReportPeerReviewTableId---" without processing
    Then I softly see confirmation box with body "Do you want to delete? Once it is deleted it cannot be restored." is displayed
    When I click modal button "Continue"
    Then I softly do not see value "Sarah PM" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I click on "Send for Review" icon for "Grantee PO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "Grantee PO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Rating is required.   |
      | Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "2" seconds
    Then I softly see value "Submitted" for title "Status" against the value "Grantee PO" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Enter Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - Draft"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside table
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Edit" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Delete" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Send for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportApproverTableId---" by clicking "New" :
      | Name     | Financial Report |
      | Sarah PM | Step 1           |
#    Then I softly see the following messages in the page details contains:
#      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportApproverTableId---" by clicking "New" :
      | Name       | Financial Report |
      | Victor EXE | Step 2           |
#    Then I softly see the following messages in the page details contains:
#      | Saved Successfully! |
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Forms" page block displayed
    Then I softly see "Financial Report Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Form Name" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Mandatory" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Percentage" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified By" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified Date" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "cross" symbol against the value "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I save the value from row "1" for column name "Last Modified By" as "LastModifiedBy" from flex table "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    And I wait for "5" seconds
    Then I softly see the text containing "sarah.pm.ggmergeqa2@yopmail.com"
    And I click on back arrow
    And I wait for "5" seconds
    Then I softly can see row level action button "View" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Federal Financial Report (SF-425)" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I enter "FederalFinancialReport_425" values from "Financial_Report_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I enter value "Automation for Execution" into field "Remark__c"
    And I click on "Cancel" in the page details
    And I wait for "2" seconds
    Then I softly see field "Remarks" as "Automation test"
    Then I softly can see top right button "Edit" in page detail
    And I close the tab
    When I click on "View" icon for "Federal Financial Report (SF-425)" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Edit" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Financial Information" page block displayed
    Then I softly see "Recipient Information" page block displayed
    Then I softly see "Transactions" page block displayed
    Then I softly see "Indirect Expense" page block displayed
    Then I softly see "Remarks" page block displayed
    Then I softly see "Certification" page block displayed
    Then I softly see "Authorized Certifying Official" page block displayed
    Then I softly see field "1. Federal Agency and Organizational Element to Which Report is Submitted" inside page block
    Then I softly see field "2. Federal Grant or Other Identifying Number Assigned by Federal Agency" inside page block
    Then I softly see field "3. Recipient Organization (Name and complete address including Zip code):" inside page block
    Then I softly see field "4a. UEI" inside page block
    Then I softly see field "4b. EIN:" inside page block
    Then I softly see field "5. Recipient Account Number or Identifying Number:" inside page block
    Then I softly see field "6. Report Type:" inside page block
    Then I softly see field "7. Basis of Accounting:" inside page block
    Then I softly see field "8. Project/Grant Period From: (Month, Day, Year):" inside page block
    Then I softly see field "8. Project/Grant Period From: (Month, Day, Year):" inside page block
    And I close the tab
    And I navigate to "Quickview" sub tab in split screen
    When I click on "Splitview" icon for "Federal Financial Report (SF-425)" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see top right button "Edit" in the split screen page details
    Then I softly can see top right button "Download as PDF" in the split screen page details
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I see "Upload" button is disabled at modal under library
    And I select Classification as "Financial Report" at upload file modal
    When I upload file "AttachmentTesting.pdf" into library
    Then I do not see "Upload" button is disabled at modal under library
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Financial Report" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly see value "Financial Report" for title "Classification" inside table "---grantee_tableId:-:financialReportAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Description      |
      | Automation Notes |
    Then I softly see the following messages in the page details :
      | Required Fields Missing |
    And I refresh the page
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
#    Then I softly see the following messages in the page details contains:
#      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I click on "Delete" icon for "Notes Record" inside flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see "Actions" in flex table header "CommunicationHistory"
    Then I softly see "Subject" in flex table header "CommunicationHistory"
    Then I softly see "From Address" in flex table header "CommunicationHistory"
    Then I softly see "To Address" in flex table header "CommunicationHistory"
    Then I softly see "CC Address" in flex table header "CommunicationHistory"
    Then I softly see "Attention To" in flex table header "CommunicationHistory"
    Then I softly see "Email Subject" in flex table header "CommunicationHistory"
    Then I softly see "Preview" in flex table header "CommunicationHistory"
#    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
#    And I send the email under collab tab with following details:
#      | To                        | Subject            | Body            |
#      | pm.automation@yopmail.com | Automation Subject | Automation Body |
#    And I wait for "5" seconds
#    Then I softly see the text "Email Sent Successfully." in modal
#    When I click modal button "Close"
#    And I refresh the page
#    And I wait for "3" seconds
#    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
#    Then I softly see value "sarah.pm.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
#    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
#    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
#    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Report has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - All"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:financialEGMSID}" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "View" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside table
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportApproverTableId---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "View" against "Automation.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Automation.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I "Approve" in the approval decision
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:financialEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:financialEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - All"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Name" in flex table header "---grantee_tableId:-:financialReportOwnerTableId---"
    Then I softly see "Responsibility" in flex table header "---grantee_tableId:-:financialReportOwnerTableId---"
    And I save the value from row "1" for column name "Name" as "ownerName" from flex table "---grantee_tableId:-:financialReportOwnerTableId---"
    Then I softly see link "{SavedValue:ownerName}" inside Page block
    And I click on hyperlink containing value "{SavedValue:ownerName}"
    Then I softly see the text containing "victor.exe@ggp.test8.ggmergeqa2"
    And I wait for "2" seconds
    And I click on back arrow
    And I wait for "2" seconds
    Then I softly can see top right button "Mark as Submitted" in page detail
    And I click on "Mark as Submitted" in the page details
    And I wait for "2" seconds
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Submitted to Grantor On is required. |
    And I enter in modal "Submit Details" values from "Financial_Report_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "1" seconds
    When I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Submitted By" as "SubmittedBy"
    Then I softly see field "Submitted By" as "{SavedValue:SubmittedBy}"
    And I save the field labeled "Submitted On" as "SubmittedOn"
    Then I softly see field "Submitted On" as "{SavedValue:SubmittedOn}"
    When I click on "Revise" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to revise the report? The report will require an approval again after being revised." is displayed
    And I click "Continue" on modal confirmation box
    When I enter in modal value "Automation Feedback" into field "ReviseComments__c"
    And I enter in modal value "0" into field "RevisedDate__c"
    When I click modal button "Save"
    When I click modal button "Close"
    Then I softly see field "Status" as "Created"
    When I navigate to "History" sub tab
    Then I softly see "Grantor Feedback History" page block displayed
    Then I softly see field "Feedback from Grantor" as "Automation Feedback"
    And I save the field labeled "Feedback Received On Date" as "FeedbackReceivedOnDate"
    Then I softly see field "Feedback Received On Date" as "{SavedValue:FeedbackReceivedOnDate}"
    Then I softly can see top right button "Edit" in page detail
    Then I softly see "Resize" button for page
    Then I softly see "Collapse" button for page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Quickview" sub tab at view detail page
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"

  @485491 @ValidatePOusershouldabletocreateScheduledFinancialReportabletosubmitFinancialReporttoGrantorverifytheaccessofauditoruser @Grantee_Smoke1
  Scenario: Validate PO user should able to create Scheduled Financial Report & able to submit Financial Report to Grantor & verify the access of auditor user
    And I "Created" standalone subaward "Automation Runtime award" with properties "default-Grantee PO user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Financial Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    When I enter in modal "Grantee_Financial_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Financial Report"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Report Creation Date |
      | {SavedValue:EGMS ID1} | 0                    |
    And I wait for "220" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "financialEGMSID" from flex table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "Scheduled" for title "Report Type" against the value "{SavedValue:financialEGMSID}" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    And I navigate to "Monitoring" tab
    Then I see "Schedules" inside "Monitoring" is displayed
    Then I see "Progress Reports" inside "Monitoring" is displayed
    Then I see "Financial Reports" inside "Monitoring" is displayed
    Then I see "Awards Special Conditions" inside "Monitoring" is displayed
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - My Records"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:financialEGMSID}" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "Edit" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "View" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    And I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    Then I softly do not see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    And I perform quick search for "Approved" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    Then I softly do not see value "Approved" for title "Status" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    And I perform quick search for "Submitted to Grantor" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    Then I softly do not see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    And I click toggle button to select "Financial Reports - Approved"
    And I save the value from row "1" for column name "EGMS ID" as "EGMSID" from flex table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    And I perform quick search for "Approved" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    Then I softly see value "Approved" for title "Status" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    And I click toggle button to select "Financial Reports - All"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:financialEGMSID}" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "Edit" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "View" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    And I click toggle button to select "Financial Reports - Draft"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:financialEGMSID}" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "Edit" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "View" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Grant Award Number" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Award Title" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside table
    Then I softly see "Collapse" button for header
    Then I see the header is "Financial Report" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime award}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:financialEGMSID}"
    Then I softly see field "Status" as "Created"
    And I save the field labeled "Grant Award Number" as "GrantNumber"
    Then I softly see field "Grant Award Number" as "{SavedValue:GrantNumber}"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see "Resize" button for page
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Forms and Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly see "Report Overview" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "System Information" page block displayed
    And I save the field labeled "Award ID" as "AwardID"
    Then I softly see field "Award ID" inside page block
    Then I softly see link "{SavedValue:AwardID}" inside Page block
    Then I softly see field "Budget Period" inside page block
    Then I softly see field "Budget Period Number" inside page block
    Then I softly see field "Internal Organization" inside page block
    And I save the field labeled "Internal Organization" as "InternalOrganization"
    Then I softly see link "{SavedValue:InternalOrganization}" inside Page block
    Then I softly see field "Funding Organization" inside page block
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see link "{SavedValue:FundingOrganization}" inside Page block
    Then I softly see field "Reporting Frequency" inside page block
    Then I softly see field "Reporting Period Start Date" inside page block
    Then I softly see field "Reporting Period End Date" inside page block
    Then I softly see field "Report Due Date" inside page block
    Then I softly see field "Final Report?" inside page block
    Then I softly see field "Submitted On" inside page block
    Then I softly see field "Submitted By" inside page block
    And I click on "Edit" in the page details
    Then I softly see that "Reporting Period Start Date" rendered in view mode only
    Then I softly see that "Reporting Period End Date" rendered in view mode only
    Then I softly see that "Report Due Date" rendered in view mode only
    Then I softly see fields "IsFinalReport__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see "Project Role" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Name" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Is Key Contact" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Is User" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly see field "Created By" inside page block
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified By" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I softly see field "Last Modified Date" inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Sarah PM      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Victor EXE    | Fiscal Reviewer | Automation Description | 5        | No                   |
    Then I softly can see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Delete" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly can see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I click on "Delete" icon for "Victor EXE" inside table with table id "---grantee_tableId:-:financialReportPeerReviewTableId---" without processing
    Then I softly see confirmation box with body "Do you want to delete? Once it is deleted it cannot be restored." is displayed
    When I click modal button "Continue"
    And I wait for "3" seconds
    Then I softly do not see value "Victor EXE" for title "Reviewer Name" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I click on "Send for Review" icon for "Sarah PM" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I pause execution for "5" seconds
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "Sarah PM" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Rating is required.   |
      | Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "1" seconds
    Then I softly see value "Submitted" for title "Status" against the value "Sarah PM" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Enter Review" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - Draft"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside table
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Delete" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly cannot see row level action button "Send for Review" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportApproverTableId---" by clicking "New" :
      | Name     | Financial Report |
      | Sarah PM | Step 1           |
#    Then I softly see the following messages in the page details contains:
#      | Saved Successfully! |
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportApproverTableId---" by clicking "New" :
      | Name       | Financial Report |
      | Victor EXE | Step 2           |
#    Then I softly see the following messages in the page details contains:
#      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportApproverTableId---" by clicking "New" :
      | Name     | Financial Report |
      | David FO | Step 3           |
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportApproverTableId---" by clicking "New" :
      | Name               | Financial Report |
      | Danielle FD Garcia | Step 4           |
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Forms" page block displayed
    Then I softly see "Financial Report Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Form Name" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Mandatory" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Percentage" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified By" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Last Modified Date" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see "Check" symbol against the value "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I save the value from row "1" for column name "Last Modified By" as "LastModifiedBy" from flex table "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "sarah.pm@ggp.test8.ggmergeqa2"
    And I wait for "2" seconds
    And I click on back arrow
    And I wait for "2" seconds
    Then I softly can see row level action button "View" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    When I click on "Edit" icon for "Federal Financial Report (SF-425)" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I enter "FederalFinancialReport_425" values from "Financial_Report_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I enter value "Automation for Execution" into field "Remark__c"
    And I click on "Cancel" in the page details
    And I wait for "2" seconds
    Then I softly see field "Remarks" as "Automation test"
    Then I softly can see top right button "Edit" in page detail
    And I close the tab
    When I click on "View" icon for "Federal Financial Report (SF-425)" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Edit" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Financial Information" page block displayed
    Then I softly see "Recipient Information" page block displayed
    Then I softly see "Transactions" page block displayed
    Then I softly see "Indirect Expense" page block displayed
    Then I softly see "Remarks" page block displayed
    Then I softly see "Certification" page block displayed
    Then I softly see "Authorized Certifying Official" page block displayed
    Then I softly see field "1. Federal Agency and Organizational Element to Which Report is Submitted" inside page block
    Then I softly see field "2. Federal Grant or Other Identifying Number Assigned by Federal Agency" inside page block
    Then I softly see field "3. Recipient Organization (Name and complete address including Zip code):" inside page block
    Then I softly see field "4a. UEI" inside page block
    Then I softly see field "4b. EIN:" inside page block
    Then I softly see field "5. Recipient Account Number or Identifying Number:" inside page block
    Then I softly see field "6. Report Type:" inside page block
    Then I softly see field "7. Basis of Accounting:" inside page block
    Then I softly see field "8. Project/Grant Period From: (Month, Day, Year):" inside page block
    Then I softly see field "8. Project/Grant Period From: (Month, Day, Year):" inside page block
    And I close the tab
    And I navigate to "Quickview" sub tab in split screen
    When I click on "Splitview" icon for "Federal Financial Report (SF-425)" inside flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see top right button "Edit" in the split screen page details
    Then I softly can see top right button "Download as PDF" in the split screen page details
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    And I wait for "2" seconds
    Then I see "Upload" button is disabled at modal under library
    And I select Classification as "Financial Report" at upload file modal
    When I upload file "AttachmentTesting.pdf" into library
    And I wait for "2" seconds
    Then I do not see "Upload" button is disabled at modal under library
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Financial Report" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly see value "Financial Report" for title "Classification" inside table "---grantee_tableId:-:financialReportAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Description      |
      | Automation Notes |
    Then I softly see the following messages in the page details :
      | Please complete all field(s) marked in red. |
    And I refresh the page
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
#    Then I softly see the following messages in the page details contains:
#      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I click on "Delete" icon for "Notes Record" inside flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see "Actions" in flex table header "CommunicationHistory"
    Then I softly see "Subject" in flex table header "CommunicationHistory"
    Then I softly see "From Address" in flex table header "CommunicationHistory"
    Then I softly see "To Address" in flex table header "CommunicationHistory"
    Then I softly see "CC Address" in flex table header "CommunicationHistory"
    Then I softly see "Attention To" in flex table header "CommunicationHistory"
    Then I softly see "Email Subject" in flex table header "CommunicationHistory"
    Then I softly see "Preview" in flex table header "CommunicationHistory"
#    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
#    And I wait for "1" seconds
#    And I send the email under collab tab with following details:
#      | To                        | Subject            | Body            |
#      | pm.automation@yopmail.com | Automation Subject | Automation Body |
#    And I wait for "5" seconds
#    Then I softly see the text "Email Sent Successfully." in modal
#    When I click modal button "Close"
#    And I refresh the page
#    And I wait for "3" seconds
#    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
#    Then I softly see value "govgrantsuat@yopmail.com" for title "From Address" inside table "CommunicationHistory"
#    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
#    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
#    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Report has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - All"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:financialEGMSID}" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "View" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside table
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportApproverTableId---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:financialReportApproverTableId---"
    Then I softly cannot see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportApproverTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:financialReportApproverTableId---"
    Then I softly cannot see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:financialReportApproverTableId---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "View" against "Automation.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Automation.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:financialEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:financialEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:financialEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:financialEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:financialEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:financialEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:financialEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:monitoringCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:financialEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:monitoringCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - All"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside table
    Then I softly can see top right button "Mark as Submitted" in page detail
    And I click on "Mark as Submitted" in the page details
    And I wait for "2" seconds
    And I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Submitted to Grantor On is required. |
    And I enter in modal "Submit Details" values from "Financial_Report_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Name" in flex table header "---grantee_tableId:-:financialReportOwnerTableId---"
    Then I softly see "Responsibility" in flex table header "---grantee_tableId:-:financialReportOwnerTableId---"
    And I save the value from row "1" for column name "Name" as "ownerName" from flex table "---grantee_tableId:-:financialReportOwnerTableId---"
    Then I softly see link "{SavedValue:ownerName}" inside Page block
    And I click on hyperlink containing value "{SavedValue:ownerName}"
    And I wait for "3" seconds
    Then I softly see the text containing "grantee.po@yopmail.com.ggmergeqa2"
    And I click on back arrow
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I save the field labeled "Submitted By" as "SubmittedBy"
    Then I softly see field "Submitted By" as "{SavedValue:SubmittedBy}"
    And I save the field labeled "Submitted On" as "SubmittedOn"
    Then I softly see field "Submitted On" as "{SavedValue:SubmittedOn}"
    When I click on "Revise" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to revise the report? The report will require an approval again after being revised." is displayed
    And I click "Continue" on modal confirmation box
    When I enter in modal value "Automation Feedback" into field "ReviseComments__c"
    And I enter in modal value "0" into field "RevisedDate__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"
    When I navigate to "History" sub tab
    Then I softly see "Grantor Feedback History" page block displayed
    Then I softly see field "Feedback from Grantor" as "Automation Feedback"
    And I save the field labeled "Feedback Received On Date" as "FeedbackReceivedOnDate"
    Then I softly see field "Feedback Received On Date" as "{SavedValue:FeedbackReceivedOnDate}"
    Then I softly can see top right button "Edit" in page detail
    Then I softly see "Resize" button for page
    Then I softly see "Collapse" button for page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Quickview" sub tab at view detail page
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Edit" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    And I navigate to "Chatter" sub tab in split screen
    And I post the message "Automation Test1 Execution" inside chatter
    Then I softly see post "Automation Test1 Execution" by user "Grantee PO"
    When I re-login to "Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - All"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside table
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - All"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:financialEGMSID}" inside table "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly can see row level action button "View" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:financialEGMSID}" in flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside table
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:OtherKeyContactsForFinancialReport---"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportApproverTableId---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:financialReportApproverTableId---"
    Then I softly cannot see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:financialReportApproverTableId---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Splitview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly can see row level action button "Preview" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Federal Financial Report (SF-425)" in flex table with id "---grantee_tableId:-:financialReportFormsTableId---"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "View" against "Automation.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Automation.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation.pdf" in flex table with id "---grantee_tableId:-:financialReportAddFilesTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:financialReportNotesTableId---"

  @486585 @ValidateBudgetRedirectionARPMusershouldabletoactivatenewawardthroughBRAR @Grantee_Smoke2
  Scenario Outline: Validate Budget Redirection AR- PM user should able to activate new award through BR AR
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-<OwnerType>"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "SECOND_FOCUS_WITH_BUDGET"
    When I login to "Grantee" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    Then I softly can see "Actuals" sub tab at view detail page
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I see textarea field "Impact__c" is editable
    Then I see textarea field "PurposeRTA__c" is editable
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Please select Amendment Request Type is required. |
      | Initiated By is required.                         |
      | Justification is required.                        |
    And I enter "Grantee_Budget_Redirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "BDRAMENDID"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
#    And I click on hyperlink containing value "{SavedValue:AwardEGMSID1}"
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
    Then I softly can see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---"
    Then I softly see fields "GeneralConditionChanged__c" is in edit mode
    And I enter value "Checked" into field "GeneralConditionChanged__c"
    And I enter value "Checked" into field "AreTCspartofNGAAttachments__c"
    And I click on "Save" in the page details
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
    Then I softly see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Responsibilities Tab - A person with the same role cannot be added again. |
    And I refresh the page
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name      | Role             | Description            | Due Date | Allow Record Editing |
      | Danielle FD Garcia | Program Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly see that "Sent for Review" has been added in flextable with Id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I get the "EGMS ID"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
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
    When I re-login to "Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
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
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
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
    Then I softly see the text containing "victor.exe@ggp.test8.ggmergeqa2"
    And I wait for "5" seconds
    And I click on back arrow
    And I wait for "5" seconds
    And I navigate to "Files" sub tab
    Then I softly see "Amendment Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
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
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Notice of Award" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I refresh the page
    And I wait for "5" seconds
    Then I softly see "Notice of Award" has been added in "Amendment Files" flex table
    And I click on "Delete" icon for "Notice of Award" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---" without waiting for record
    Then I softly do not see value "Notice of Award" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I wait for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I refresh the page
    And I navigate to "Files" sub tab
    And I wait for "2" seconds
    Then I softly see "Terms and Conditions" has been added in "Amendment Files" flex table
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
    When I close "Amendment Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title     | Narrative     | Awarded Budget | Cash Match |
      | Site work | The narrative | 500            | 50         |
    When I close "Amendment Line Items" modal by clicking the top right x button
    Then I softly see value "$4,500.00" for title "Revised Award Budget" against the value "Construction" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    Then I softly see value "$500.00" for title "Revised Award Budget" against the value "Site work" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    And I click on page navigation arrow "---grantee_tableId:-:AmendmentBudgetTableId---" for table id "Next"
    Then I softly see value "$5,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:AmendmentBudgetTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Narrative     | Awarded Budget | Cash Match |
      | Construction | The narrative | 4500           | 450        |
    When I close "Amendment Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title     | Narrative     | Awarded Budget | Cash Match |
      | Site work | The narrative | 500            | 50         |
    When I close "Amendment Line Items" modal by clicking the top right x button
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
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Submit for Approval.pdf" as name
    Then I softly see snapshot with name containing "Complete Review.pdf" as name
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
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
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
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
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
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
#    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
#    And I send the email under collab tab with following details:
#      | To          | Subject            | Body            |
#      | <emailIdTo> | Automation Subject | Automation Body |
#    And I wait for "5" seconds
#    Then I softly see the text "Email Sent Successfully." in modal
#    When I click modal button "Close"
#    And I refresh the page
#    And I wait for "3" seconds
#    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
#    Then I softly see value "sarah.pm.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
#    Then I softly see value "<emailIdTo>" for title "To Address" inside table "CommunicationHistory"
#    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
#    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
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
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
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
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
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
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
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
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
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
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
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
    Then I softly see value "$0.00" for title "Spent to Date" against the value "Site work" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Carry-Forward" against the value "Site work" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$500.00" for title "Remaining Budget" against the value "Site work" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Cash Match" against the value "Site work" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Program Income Expenditures" against the value "Site work" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$4,500.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Spent to Date" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
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
    And I wait for "3" seconds
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
      | OwnerType     | UserType   | emailIdTo                       | CreatedBy |
      | Sarah PM user | GRANTEE PM | victor.exeqagrantee@yopmail.com | Sarah PM  |

  @486598 @ValidateKeyPersonalChangeARPMusershouldabletoapprovedtheARshouldabletocreateverifyactivatenewaward @Grantee_Smoke2
  Scenario: Validate Key Personal Change AR PM user should able to approved the AR & should able to create verify activate new award
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    And I "Created" of type "Key Personnel Change" amendment request for title "{SavedValue:Automation Runtime Opportunity}" with properties "KEY_PERSONNEL_CHANGE"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I navigate to "Projections" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    When I navigate to "Amendments" sub tab
    And I save the value from row "1" for column name "EGMS ID" as "KPCEGMSID" from flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:KPCEGMSID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:KPCEGMSID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:KPCEGMSID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:KPCEGMSID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:KPCEGMSID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:KPCEGMSID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:KPCEGMSID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:KPCEGMSID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - Draft"
    When I perform quick search for "{SavedValue:KPCEGMSID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:KPCEGMSID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:KPCEGMSID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:KPCEGMSID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - Accepted"
    When I perform quick search for "{SavedValue:KPCEGMSID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly do not see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - Rejected"
    When I perform quick search for "{SavedValue:KPCEGMSID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly do not see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - My Records"
    And I click on "View" icon for "{SavedValue:KPCEGMSID}" inside table
    Then I see the header is "Amendment Request" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    Then I softly see "Collapse" button for header
    Then I softly see field "EGMS ID" as "{SavedValue:KPCEGMSID}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Initiated By" as "Grantee"
    Then I softly see field "Amendment Type" as "Key Personnel Change"
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
    Then I softly see "Key Personnel Change" page block displayed
    Then I softly see "General Condition" page block displayed
    Then I softly see "Special Conditions" page block displayed
    Then I softly see "System Information" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentContactTableId---" by clicking "Edit" :
      | Proposed Name | Is Key Contact |
      | Victor EXE    | Unchecked      |
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    And I halt execution
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Specify at least one Key Personnel for Key Personnel Change request. |
    And I refresh the page
    And I wait for "5" seconds
    When I click on "Delete" icon for "Victor EXE" inside flex table with id "---grantee_tableId:-:amendmentContactTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:amendmentContactTableId---"
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentContactTableId---"
    When I click "Associate" after selection of "David FO" in the table "---grantee_tableId:-:amendmentAssociateContactTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentContactTableId---" by clicking "Edit" :
      | Proposed Name | Project Role    | Is Key Contact |
      | David FO      | Project Officer | Checked        |
    When I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentContactTableId---"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Project Role is required to save. Enter it in the Contact Information section.   |
      | First Name is required to save. Enter it in the Contact Information section.     |
      | Last Name is required to save. Enter it in the Contact Information section.      |
      | Email is required to save. Enter it in the Contact Information section.          |
      | Address Line 1 is required to save. Enter it in the Address Information section. |
      | City is required to save. Enter it in the Address Information section.           |
      | Country is required to save. Enter it in the Address Information section.        |
      | Zip Code is required to save. Enter it in the Address Information section.       |
    And I click modal button "Close"
    And I refresh the page
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I enter value "Checked" into field "GeneralConditionChanged__c"
    And I enter value "Checked" into field "AreTCspartofNGAAttachments__c"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Files Tab- Provide attachment in Files section with classification "Terms and Conditions" if 'Separate Attachment for Terms and Conditions' in Overview tab is selected. |
    When I navigate to "Files" sub tab
    And I wait for "5" seconds
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Terms and Conditions" has been added in "Amendment Files" flex table
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I enter value "www.automate.com" into field "FederalTCLink__c"
    And I click on "Save" in the page details
    And I wait for "1" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "TermsExecution" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I save the value from row "1" for column name "Title" as "TermsTitle" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I wait for "5" seconds
    Then I softly see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | Automation FD | Program Reviewer | Automation Description | 5        | No                   |
    Then I softly see value "Automation FD" for title "Reviewer Name" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Edit" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Edit" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Edit" icon for "Fiscal Reviewer" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see fields "Name__r.Name" is in edit mode
    Then I softly see fields "ReviewerRole__c" is in edit mode
    Then I softly see fields "Responsibility__c" is in edit mode
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Edit" icon for "Program Reviewer" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see fields "Name__r.Name" is in edit mode
    Then I softly see fields "ReviewerRole__c" is in edit mode
    Then I softly see fields "Responsibility__c" is in edit mode
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Delete" icon for "Automation FD" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "Automation FD" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I wait for "5" seconds
    Then I softly see that "Sent for Review" has been added in flextable with Id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "5" seconds
    Then I softly see "Attachment.pdf" has been added in "Amendment Files" flex table
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Notice of Award" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see "Notice of Award" has been added in "Amendment Files" flex table
    And I click on "Delete" icon for "Notice of Award" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---" without waiting for record
    Then I softly do not see value "Notice of Award" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
#    Then I softly see the following messages in the page details contains:
#      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "Edit" :
      | Created By | Title         | Description       |
      | Sarah PM   | Notes Record1 | Automation Notes1 |
    And I wait for "2" seconds
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Recor1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I get the "EGMS ID"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
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
      | Rating is required.   |
      | Comments is required. |
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
    When I re-login to "Grantee" app as "Grantee PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:KPCEGMSID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:KPCEGMSID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:KPCEGMSID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "{SavedValue:KPCEGMSID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I click on "Resend for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see value "Sent for Review" for title "Status" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
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
      | Victor EXE | Step 2            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 3            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name               | Amendment Request |
      | Danielle FD Garcia | Step 4            |
    Then I softly see link "Victor EXE" inside Page block
    Then I softly see link "David FO" inside Page block
    Then I softly see link "Sarah PM" inside Page block
    Then I softly see link "Danielle FD Garcia" inside Page block
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:KPCEGMSID}" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I softly see that "{SavedValue:KPCEGMSID}" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:KPCEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:KPCEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:KPCEGMSID}" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I softly see that "{SavedValue:KPCEGMSID}" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:KPCEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:KPCEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:KPCEGMSID}" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I softly see that "{SavedValue:KPCEGMSID}" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:KPCEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:KPCEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:KPCEGMSID}" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I softly see that "{SavedValue:KPCEGMSID}" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "Grantee PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:KPCEGMSID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "{SavedValue:KPCEGMSID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
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
#    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
#    And I send the email under collab tab with following details:
#      | To                              | Subject            | Body            |
#      | victor.exeqagrantee@yopmail.com | Automation Subject | Automation Body |
#    And I wait for "5" seconds
#    Then I softly see the text "Email Sent Successfully." in modal
#    When I click modal button "Close"
#    And I refresh the page
#    And I wait for "7" seconds
#    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
#    Then I softly see value "sarah.pm.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
#    Then I softly see value "victor.exe.ggmergeqa2@yopmail.com" for title "To Address" inside table "CommunicationHistory"
#    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
#    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
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
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Delete" in the page details
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
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    And I navigate to "Overview" sub tab
    And I navigate to "Projections" sub tab
    Then I softly see field "Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Then I softly see field "Budget Period Start Date" as "{SavedValue:BudgetPeriodStartDate}"
    Then I softly see field "Budget Period End Date" as "{SavedValue:BudgetPeriodEndDate}"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$6,000.00" for title "Award  Budget" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$600.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$500.00" for title "Non-Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$7,200.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see "Financials Summary" page block displayed
    Then I softly see "Expenditure Detail" page block displayed
    Then I softly see "Program Income Revenue by Focus Area" page block displayed
    Then I softly see "Drawdown By Award" page block displayed
    Then I softly see value "$6,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Spent to Date" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Carry-Forward" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$6,000.00" for title "Remaining Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Program Income Expenditures" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see value "TermsExecution" for title "Title" inside table "---grantee_tableId:-:SpecialConditionTableId---"
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
    Then I softly see value "$6,000.00" for title "Awarded Budget" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$600.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$500.00" for title "Non-Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$7,200.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    When I navigate to "Awards" sub tab
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:AwardEGMSID}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardEGMSID2}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "{SavedValue:AwardEGMSID2}" for title "New Value" inside field history table
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "Original Value" inside field history table

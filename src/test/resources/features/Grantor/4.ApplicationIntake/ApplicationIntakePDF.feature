@applicationIntakeAllocation @grantor-regression @grantor-parallel-regression @app @ApplicationExecution-reg @applicationIntakePDF @applicationIntakemailandPdf @PDF @skipOnJenkins
Feature: Validate all scenarios in the Formula Announcement tab for PDF

  @73521 @70526 @snapshotAfterApplicationIsSubmitted @snapExecution
  Scenario Outline: Validate SR user is able to view the Snapshot after Application is Submitted to Grantor status| Validate once the Application is submitted to Grantor then the field Submitted by on Overview Tab will get updated by the User Name.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "5" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition-app" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And  I navigate to "Quickview" sub tab in split screen
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit Application" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Submitted By" as "{SavedValue:SPI3 Username}"
    Given I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Application Name>" in "---applicationIntake:-:appAllTableId---" panel
    When I click on "View" icon for "<Application Name>" inside table
    And I click on Menu icon present on top right corner of the page
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Snapshot_Application_Submission.pdf"
    And I click on "Download" button for snapshot view
    And I wait for "3" seconds
    When I download the file for snapshot
    And I wait for "3" seconds
    Then I see "Submitted to Grantor" on page "1" of "govgrants" pdf file
    Examples:
      | Application Name                                         |
      | {SavedValue:Automation Runtime Announcement Application} |

  @72512 @72513 @75965 @75966 @matchPercentageIFsetAsYES  @skipOnJenkins
  Scenario: Validate the Match Percentage validation during submit for approval when the Match required setting as Yes | Validate if user submits the application without one key personal contact details then the system should throw an error message|
  Validate History Field is getting updated for PM user when Application status is Submitted to Grantor | Validate whether the Internal user is able to view the Snapshot after Application is Submitted to Grantor status
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "6" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    And I save the field containing "Match Required?" as "Yes"
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
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Enter budget details before submitting an Application to the Grantor.                                                                  |
      | Budget Tab - Provide the match (Cash Match/Non-Cash Match) details to submit this application.                                                      |
      | Overview Tab - Specify at least one contact as Key Personnel for Application.                                                                       |
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |
      | Budget Tab - The Subrecipient Match should not be less than the given value.                                                                        |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI3 Username} | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I click on "Submit Application" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "dark blue"
    Given I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    When I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Submitted to Grantor" for title "New Value" inside field history table
    And I click on back arrow
    And I click on Menu icon present on top right corner of the page
    And I select "Take Snapshot" from dropdown
    And I wait for "5" seconds
    And I click on hyperlink containing value "Submission"
    When I download the file
    Then I softly see "Submitted to Grantor" on page "1" of "govgrants" pdf file


  @77657 @snapshotHistoryApplication @snapExecution
  Scenario: Validate whether SPI user will be able to take the snapshot on page when the Application is in Created status and is saved under snapshot history
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on Menu icon present on top right corner of the page
    And I select "Take Snapshot" from dropdown
    And I wait for "10" seconds
    When I navigate to "History" sub tab
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "5" seconds
    And I click on hyperlink containing value "SnapShot on"
    And I click on "Download" button for snapshot view
    And I wait for "3" seconds
    When I download the file for snapshot
    And I wait for "3" seconds
    Then I see "Created" on page "1" of "govgrants" pdf file


  @70523 @snapshotAfterPreApplicationIsSubmitted  @skipOnJenkins @snapExecution
  Scenario:  Validate SR user is able to view the Snapshot after Pre- Application is Submitted to Grantor status
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I wait for "5" seconds
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I switch to tab number "1"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I switch to parent tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I click on Menu icon present on top right corner of the page
    And I select "Take Snapshot" from dropdown
    And I wait for "5" seconds
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Submission"
    And I click on "Download" button for snapshot view
    And I wait for "3" seconds
    When I download the file for snapshot
    And I wait for "3" seconds
    Then I see "Submitted to Grantor" on page "1" of "govgrants" pdf file


  @75523 @77655 @75522 @preApplicationPDFRelatedLog
  Scenario Outline: To verify system allow to download PDF for Pre-application section in Related log tab of announcement | To verify user able to view Pre-Applications in Pre-Applications section in Related log tab of announcement
  Validate whether user can view the Accepted Status on progress bar once the pre-application is accepted by Grantor
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       |  Is Key Contact |
      | {SavedValue:SPI3 Username} |  Checked        |
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I wait for "2" seconds
    And I switch to tab number "1"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "<Announcement Name>" in "RecipientPreApplications" panel
    When I click on "View" icon for "<Announcement Name>" inside table
    Then I softly cannot see top right button "Create Application" in page detail
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---preApplication:-:pendingTaskTableId---" panel
    Then I softly see that "Record Id" has been added in flextable with Id "---preApplication:-:pendingTaskTableId---"
    And I click on "Start" icon for "Record id" inside flex table with id "---preApplication:-:pendingTaskTableId---"
    When I click on "Accept" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - Submitted"
    And I perform quick search for "<Announcement Name>" in "RecipientPreApplications" panel
    Then I softly see value "<Announcement Name>" for title "Pre-Application Title" against the value "Accepted" inside table "RecipientPreApplications"
    When I click on "View" icon for "<Announcement Name>" inside table
    Then I softly see status in Progress-bar is "Accepted" and is "dark blue"
    Then I softly can see top right button "Create Application" in page detail
    When I click on "Create Application" in the page details
    And I wait for "4" seconds
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I get the "EGMS ID"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I wait for "2" seconds
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I wait for "2" seconds
    And I switch to tab number "1"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Given I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "ActiveFundingOpportunitiesCompitive"
    When I navigate to "Related Log" sub tab
    And I click on parallel menu button in flex table title "Submitted Pre-Applications"
    And I select "Download as PDF" from dropdown
    And I wait for "5" seconds
    And I download the file
    Then I softly see "Submitted Pre-Applications" on page "1" of "govgrants" pdf file
    Examples:
      | Announcement Name                                        |
      | {SavedValue:Automation Runtime Announcement Application} |


  @34156 @75962 @75963 @75964 @preAppHistoryFieldGetUdated  @skipOnJenkins @snapExecution
  Scenario: Validate History Field is getting updated for PM user when Pre Application status is Submitted to Grantor.| Validate the History field is getting updated when internal user accepts the pre-application
  Validate whether the Internal user is able to view the Snapshot after Pre-Application is Submitted to Grantor status | Validate whether spi user can view the snapshot once the pre-application is submitted to grantor
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Pre-Application Due Date" is not editable
    And I wait for "2" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "4" seconds
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnId"
    When  I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI3 Username} | Checked        |
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I switch to tab number "1"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit to Grantor" in the page details
    When I navigate to "History" sub tab
    And I click on Menu icon present on top right corner of the page
    And I select "Take Snapshot" from dropdown
    And I wait for "7" seconds
    Then I softly see snapshot with name containing "Submission" as name
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---preApplication:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    When I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Submitted to Grantor" for title "New Value" inside field history table
    And I click on back arrow
    When I click on "Accept" in the page details
    And I wait for "2" seconds
    When I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Accepted" for title "New Value" inside field history table
    And I softly see value "Submitted to Grantor" for title "Original Value" inside field history table
    And I click on back arrow
    And I click on Menu icon present on top right corner of the page
    And I select "Take Snapshot" from dropdown
    And I wait for "5" seconds
    And I click on hyperlink containing value "Submission"
    And I click on "Download" button for snapshot view
    And I wait for "3" seconds
    When I download the file for snapshot
    And I wait for "3" seconds
    Then I softly see "Submitted to Grantor" on page "1" of "govgrants" pdf file


  @77656 @snapshotHistoryPreApplication @snapExecution
  Scenario: Validate whether SPI user will be able to take the snapshot on page when the pre-application is in draft status and is saved under snapshot history
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "4" seconds
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on Menu icon present on top right corner of the page
    And I select "Take Snapshot" from dropdown
    And I wait for "5" seconds
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "SnapShot on"
    And I click on "Download" button for snapshot view
    And I wait for "3" seconds
    When I download the file for snapshot
    And I wait for "3" seconds
    Then I see "Created" on page "1" of "govgrants" pdf file
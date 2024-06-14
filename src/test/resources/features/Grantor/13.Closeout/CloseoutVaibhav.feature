@closeoutVaibhavExecution @closeout @grantor-regression @grantor-parallel-regression @regression
Feature: Validate all scenarios in Closeout

  Background: Navigate to award
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"

  @93641 @ValidatingUserCanSeeProjectPeriodCloseoutRequestListView @monu
  Scenario: Verify user can see created closeout request in draft list view
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    Then I softly see field "EGMS ID" as "{SavedValue:GrantID}"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    Then I softly see "Create Closeout Request" opens in overLay window
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "CloseoutEGMSID"
    And I wait for "3" seconds
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - Draft"
    When I perform quick search for "{SavedValue:CloseoutEGMSID}" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    Then I softly see value "{SavedValue:CloseoutEGMSID}" for title "EGMS ID" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"
    Then I softly see value "Early Completion" for title "Sub-Type" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"
    Then I softly see value "Created" for title "Status" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"

  @87350 @86706 @88851 @VerifyOverriddenJustificationinCloseout  @meenakshi
  Scenario: To verify closeout owner allow to entered the Justification when Overriding the pending items in closeout phase
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "CloseoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    #87350
    When I click on "Override" in the page details
    Then I softly see the following messages in the page details :
      | Overview Tab - Provide Justification for overriding open items to closure and proceed with the closeout. |
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Override Justification" as "Automation Test justification"
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:homePendingTaskTableId---" panel
    #86706
    Then I softly see that "{SavedValue:CloseoutID}" has been added in flextable with Id "---closeout:-:homePendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:homePendingTaskTableId---"
    When I "Approve" in the approval decision
    #88851
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see field "EGMS ID" as "{SavedValue:CloseoutID}"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Open Items" sub tab at view detail page
    Then I softly can see "Checklist" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page

  @40636 @40741 @VerifyProjectPeriodCloseoutsStatus @meenakshi
  Scenario: To verify Project Period Closeouts with status: Created, Sent to Subrecipient, Overridden , Submitted to Grantor, Rejected, Submitted For Approval, Completed should display in the Project Period Closeouts - All table in the Closeout phase
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    When I perform quick search for "Created" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"
    When I perform quick search for "Sent to Subrecipient" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    Then I softly see value "Sent to Subrecipient" for title "Status" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"
    When I perform quick search for "Overridden" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    Then I softly see value "Overridden" for title "Status" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"
    When I perform quick search for "Acknowledged by Subrecipient" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    Then I softly see value "Acknowledged by Subrecipient" for title "Status" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"
    When I perform quick search for "Rejected" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"
    When I perform quick search for "Completed" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    Then I softly see value "Completed" for title "Status" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"
    #40741
    And I click toggle button to select "Project Period Closeouts - Submitted"
    Then I softly see value "Submitted for Approval" for title "Status" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"

  @93540 @VerifyDifferentTypeOfCloseoutRequestOnSameGrantInCloseout @meenakshi @wip
  Scenario: Verify user can create different type of closeout request on the same grant though another closeout is in progress.
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "TerminationEdition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID1"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID1}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID1}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID1}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID1}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    Then I softly see field "Override Justification" as "Automation Test justification"
    When I click on "Override" in the page details
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    Then I softly see value "{SavedValue:closeoutID1}" for title "EGMS ID" inside table "---closeout:-:closeoutTableId---"
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID2"
    When I click on "Save" in the page details
    When I click "{SavedValue:GrantID}" lookup link
    When I navigate to "Requests" sub tab
    Then I softly see value "{SavedValue:closeoutID1}" for title "EGMS ID" inside table "---closeout:-:closeoutTableId---"
    And I softly see value "Termination" for title "Type" inside table "---closeout:-:closeoutTableId---"
    And I softly see value "Overridden" for title "Status" inside table "---closeout:-:closeoutTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:closeoutID1}" in flex table with id "---closeout:-:closeoutTableId---"
    Then I softly see value "{SavedValue:closeoutID2}" for title "EGMS ID" inside table "---closeout:-:closeoutTableId---"
    And I softly see value "Early Completion" for title "Type" inside table "---closeout:-:closeoutTableId---"
    And I softly see value "Automation Test Description" for title "Reason" inside table "---closeout:-:closeoutTableId---"
    And I softly see value "Created" for title "Status" inside table "---closeout:-:closeoutTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:closeoutID2}" in flex table with id "---closeout:-:closeoutTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:closeoutID2}" in flex table with id "---closeout:-:closeoutTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:closeoutID2}" in flex table with id "---closeout:-:closeoutTableId---"

  @93254 @93255 @93256 @VerifyCloseOutRequestDetailsPage @smoke @monu
  Scenario: Validate user is able to see closeout request details page after clicking on start button under pending tasks
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    Then I softly see field "EGMS ID" as "{SavedValue:closeoutID}"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Open Items" sub tab at view detail page
    Then I softly can see "Checklist" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    #93255 #monu
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    #93256 #monu
    When I click on "Edit" in the page details
    And I clear the value from field "Reason__c"
    And I enter value "Automation Test Reason" into field "Reason__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    Then I softly see field "Reason" as "Automation Test Reason"

  @93096 @40743 @VerifyEditOfCreatedCloseoutRequest @smoke @monu
  Scenario: Validate user is able to edit fields values of created closeout
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I clear the value from field "Reason__c"
    And I enter value "Automation Test Reason" into field "Reason__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    Then I softly see field "Reason" as "Automation Test Reason"
    #40743 #monu
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:closeoutTableId---"

  @93258 @42108 @VerifyExpectedStatusOfCloseoutRequest-Overridden @monu
  Scenario: verify Status change as Submit for Approval after clicking submit for Approval button for closeout request
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Override" in the page details
    And I wait for "3" seconds
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:ProjectPeriodCloseoutTableId---"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    #42108 #monu
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"

  @86708 @VerifyStatusOfCloseoutRequestInApprovalHistoryPageBlock  @monu
  Scenario: Validate user is able to see status of closeout request in chevron diagram and inside Approval history table after first approval only
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I clear the value from field "Justification__c"
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Override Justification" as "Automation Test justification"
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    When I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    And I navigate to "History" sub tab
    Then I softly see column "Date" at position "3" contains text "Step : Step 1"
    Then I softly see column "Overall Status" at position "3" contains text "Approved"
    Then I softly see column "Overall Status" at position "1" contains text "Pending"

  @40759 @VerifyExpectedValueInsideFieldHistoryPageBlockOfCloseoutRequest @monu @FieldHistoryExclude
  Scenario: Validate expected New value and Old value inside Field History page block for closeout request
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    Then I softly see field "EGMS ID" as "{SavedValue:GrantID}"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    Then I softly see "Create Closeout Request" opens in overLay window
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "CloseoutEGMSID"
    And I save the field labeled "Closeout" as "CloseoutName"
    And I save the field labeled "Closeout Effective Date" as "CloseoutEffectiveDate"
    Then I softly see field "Closeout" as "{SavedValue:CloseoutName}"
    Then I softly see field "Closeout Effective Date" as "{SavedValue:CloseoutEffectiveDate}"
    Then I softly see field "EGMS ID" as "{SavedValue:CloseoutEGMSID}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---closeout:-:closeoutTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I enter value "07/20/2023" into field "CloseoutDate__c"
    And I enter value "08/12/2023" into field "CloseoutDueDateGrantor__c"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send To Subrecipient" in the page details
    Then I softly see field "Status" as "Sent To Subrecipient"
    Then I softly see status in Progress-bar is "Sent To Subrecipient" and is "dark blue"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutEGMSID}" in "---closeout:-:externalHomePendingTasktableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutEGMSID}" inside flex table with id "---closeout:-:externalHomePendingTasktableId---"
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I enter value "checked" into field "Aggreement__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Acknowledgement" as "checked"
    And I click on "Acknowledge" in the page details
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "dark blue"
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CloseoutEGMSID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CloseoutEGMSID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I wait for "4" seconds
    And I navigate to "History" sub tab
    And I perform quick search for "{SavedValue:CloseoutEGMSID}" in "History" panel
    Then I softly see value "Acknowledged by Subrecipient" for title "New Value" inside table "History"
    Then I softly see value "Sent to Subrecipient" for title "Old Value" inside table "History"

  @87355 @VerifyCloseoutRequestWithMultipleStatusInListVIew @monu
  Scenario: Validate user should be able to see Created, Send to sub-recipient, Overridden, Submitted to grantor status of closeout request inside closeout request list view
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    Then I softly see field "EGMS ID" as "{SavedValue:GrantID}"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    Then I softly see "Create Closeout Request" opens in overLay window
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "CloseoutEGMSID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - Draft"
    And I perform quick search for "{SavedValue:closeoutID}" in "ProjectPeriodCloseoutGrantor" panel
    Then I softly see value "Created" for title "Status" inside table "ProjectPeriodCloseoutGrantor"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---closeout:-:closeoutTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I wait for "2" seconds
    And I enter value "Automation Test justification" into field "Justification__c"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Send To Subrecipient" in the page details
    Then I softly see field "Status" as "Sent To Subrecipient"
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - Draft"
    And I perform quick search for "{SavedValue:closeoutID}" in "ProjectPeriodCloseoutGrantor" panel
    Then I softly see value "Sent to Subrecipient" for title "Status" inside table "ProjectPeriodCloseoutGrantor"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutEGMSID}" in "---closeout:-:externalHomePendingTasktableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutEGMSID}" inside flex table with id "---closeout:-:externalHomePendingTasktableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "dark blue"
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Recipient Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - Draft"
    And I perform quick search for "{SavedValue:closeoutID}" in "ProjectPeriodCloseoutGrantor" panel
    Then I softly see value "Acknowledged by Subrecipient" for title "Status" inside table "ProjectPeriodCloseoutGrantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Override" in the page details
    And I wait for "5" seconds
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - Draft"
    And I perform quick search for "{SavedValue:closeoutID}" in "ProjectPeriodCloseoutGrantor" panel
    Then I softly see value "Overridden" for title "Status" inside table "ProjectPeriodCloseoutGrantor"

  @76490 @VerifyEmailNotificationForApprovedCloseoutRequest @monu
  Scenario: Validate user should receive email notification for approval of closeout Request
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "CloseoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    And I wait for "4" seconds
    Then I softly see field "Override Justification" as "Automation Test justification"
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Closeout Request {SavedValue:closeoutID} has beenapproved
      """
@closeoutExecution @closeout @grantor-regression @grantor-parallel-regression @regression
Feature: Validate all scenarios in Closeout

  Background: Navigate to award
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"

  @96255 @VerifySystemErrorMessageForReason @monu
  Scenario: Validate user should get error message for reason while creating closeout request
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "TerminationValues" values from "Closeout_Field_Values.xlsx"
    When I enter value "" into field "Reason__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Reason is required to save. |

  @95522 @VerifyAttachmentUploadBySubrecipientForAdhocCloseoutRequest @monu @buglogged141573
  Scenario: Validate sub-recipient user should be able to upload attachment while creating adhoc closeout request
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CloseoutID"
    When I navigate to "Files" sub tab
    Then I softly see value "Automation" for title "Description" inside table "CloseoutChecklists"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    Then I softly see that "{SavedValue:FO Username}" has been added in flextable with Id "---closeout:-:closeoutApproverTableId---"
    When I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I navigate to "Files" sub tab
    When I click on "Attach" icon for "Not Applicable" inside flex table with id "CloseoutChecklists" without waiting for record
    Then I softly see "Add Supporting Documents Checklist" opens in overLay window
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Others" from computer
    When I close "Add Supporting Documents Checklist" modal by clicking the top right x button
    And I pause execution for "3" seconds
    And I click on hyperlink containing value "View"
    And I pause execution for "3" seconds
    Then I softly see new tab is opened

  @95560 @VerifyVisibilityOfAddFilesFopTerminationCloseoutRequest @monu
  Scenario: Validate user is able to see Add files button under closeout details while creating termination closeout request
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "CloseoutID"
    When I click on "Save" in the page details
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---closeout:-:CloseoutDetailsTableId---"
    Then I softly see "Title" in flex table header "---closeout:-:CloseoutDetailsTableId---"
    Then I softly see "Classification" in flex table header "---closeout:-:CloseoutDetailsTableId---"
    Then I softly see "File Extension" in flex table header "---closeout:-:CloseoutDetailsTableId---"
    Then I softly see "Description" in flex table header "---closeout:-:CloseoutDetailsTableId---"

  @95671 @VerifyUserCanAcknowledgeCloseoutRequest @monu @buglogged141573
  Scenario: Validate user can acknowledge closeout request without uploading attachment
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CloseoutID"
    When I navigate to "Files" sub tab
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    Then I softly see that "{SavedValue:FO Username}" has been added in flextable with Id "---closeout:-:closeoutApproverTableId---"
    When I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "dark blue"

  @95688 @VerifyChecklistFieldsInReadModeOnly @monu
  Scenario: Verify user can is not able to edit the checklist details filled by grantor
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
    When I navigate to "Checklist" sub tab
    And I enter value "Yes" into field "ChecklistQuestionPick1__c"
    And I enter value "Yes" into field "ChecklistQuestionPick7__c"
    And I enter value "Yes" into field "ChecklistQuestionPick8__c"
    And I enter value "Yes" into field "ChecklistQuestionPick9__c"
    And I enter value "Yes" into field "ChecklistQuestionPick10__c"
    And I enter value "Yes" into field "ChecklistQuestionPick11__c"
    And I enter value "Yes" into field "ChecklistQuestionPick12__c"
    And I enter value "Yes" into field "ChecklistQuestionPick13__c"
    And I enter value "Yes" into field "ChecklistQuestionPick14__c"
    And I enter value "Yes" into field "ChecklistQuestionPick15__c"
    And I enter value "Yes" into field "ChecklistQuestionPick16__c"
    And I enter value "Yes" into field "ChecklistQuestionPick17__c"
    And I enter value "Yes" into field "ChecklistQuestionPick18__c"
    And I enter value "Yes" into field "ChecklistQuestionPick19__c"
    And I enter value "Yes" into field "ChecklistQuestionPick20__c"
    And I enter value "Yes" into field "ChecklistQuestionPick21__c"
    And I enter value "Yes" into field "ChecklistQuestionPick22__c"
    And I enter value "Yes" into field "ChecklistQuestionPick23__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    Given I click on "Send To Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID1}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID1}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I navigate to "Checklist" sub tab
    Then I softly see field "Has the subrecipient submitted all payment requests?" as "Yes"
    Then I softly see field "Has the subrecipient met the match requirement?" as "Yes"
    Then I softly see field "Did the subrecipient fully expend program income earned during the award period prior to the closeout of the award?" as "Checklist Question Pick 9 Yes"
    Then I softly see field "Has the subrecipient completed the scope of work as outlined in the subaward agreement?" as "Checklist Question Pick 11 Yes"

  @96612 @VerifyAdvanceBalanceOfFundingAccountAtcloseoutRequest @monu
  Scenario: Verify user can see advance balance of funding account at closeout request as same as on SubAward
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---"
    And I navigate to "Actuals" sub tab
    And I save the field labeled "Balance" as "Balance"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see value "{SavedValue:Balance}" for title "Encumbrance Balance" inside table "---closeout:-:closeoutFundingAccountsTableId---"

  @96485 @93576 @93582 @VerifyOverriddenPermissionWithSubRecipientUser  @monu
  Scenario: Validate sub recipient user is not allowed to override pending item
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantID"
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
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    #93576 #monu
    Then I softly see value "{SavedValue:CloseoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I enter value "checked" into field "Aggreement__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly can see top right button "Edit" in page detail
    Then I softly cannot see top right button "Override" in page detail
    And I click on "Acknowledge" in the page details
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    #93582 #monu
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "dark blue"
    And I click on hyperlink containing value "{SavedValue:GrantID}"
    And I navigate to "Requests" sub tab
    And I click on "View" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:RecipientCloseoutRequestTableId---"
    Then I softly cannot see top right button "Override" in page detail

  @140329 @Verify1StepApprovalForAdhocCloseoutRequest-RnRFuntionality @monu
  Scenario: Verify user is able to add step 1 approver for adhoc closeout request
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    Then I softly see "Saved Successfully!" inside flex table with id "---closeout:-:closeoutApproverTableId---"

  @140331 @141540 @verifyAdditionOfApproverAtCloseoutRequestAfterOverriden-RnRFuntionality @monu
  Scenario: Verify user is able to add approver on closeout request after it is overriden
  |Verify user is able to add approver on closeout request before it is overridden|
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Override" in page detail
    #141540
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---closeout:-:closeoutApproverTableId---"
    #140331
    And I click on "Override" in the page details
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---closeout:-:closeoutApproverTableId---"

  @141537 @Verify2StepApprovalForAdhocCloseoutRequest-RnRFuntionality @monu
  Scenario: Verify user is able to add step 2 approver for closeout request
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    Then I softly see "Saved Successfully!" inside flex table with id "---closeout:-:closeoutApproverTableId---"

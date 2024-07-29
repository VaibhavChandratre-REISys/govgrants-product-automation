@closeoutExecution @closeout @grantor-regression @grantor-parallel-regression @regression @closeoutExecution
Feature: Validate all scenarios in Closeout

  Background: Navigate to award
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"

  @50971 @50973 @96200 @creationAndEditionOfAdhocCloseout
  Scenario: To create and Edit an Adhoc Closeout Request
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "closeoutRequestNo"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"

  @50975 @50974 @assigningApproversAndsendCloseoutToSubrecipient @smoke
  Scenario: Send Closeout Request to Subrecipient and assigning approvers to the closeout Request
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    Then I softly see that "{SavedValue:FO Username}" has been added in flextable with Id "---closeout:-:closeoutApproverTableId---"
    When I click on "Send To Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"

  @50977 @50976 @subrecipientEntersFieldInCloseoutAndAcknowledges
  Scenario: Validate whether Subrecipient enters closeout fields and acknowledges
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
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
    When I perform quick search for "Record Id" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    And I click on "Acknowledge" in the page details
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "dark blue"

  @50979 @50978 @86715 @overrideCloseoutAndSubmitForApproval @smoke
  Scenario Outline: Grant owner overrides the Closeout and is submitted for approval
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 500        | 1        | Feet        | 0                 | 0                        | 100        | 100            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSID}" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 500                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:FO Username} | Step 1        |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "DynamicUser" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    #86715
    Then I softly see field "EGMS ID" as "{SavedValue:closeoutID}"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Open Items" sub tab at view detail page
    Then I softly can see "Checklist" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
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
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    Examples:
      | Award Name                                         |
      | {SavedValue:Automation Runtime Award for closeout} |

  @50980 @adhocCloseoutHappyPath @smoke
  Scenario: Approval of Closeout
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I wait for "2" seconds
    And I enter value "Automation Test justification" into field "Justification__c"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:EXE Username} | Step 2   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:subrecpientPendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:subrecpientPendingTaskTableId---"
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
    When I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Completed"

  @40066 @40605 @40608  @NavigationAcknowledgementAutoPopulatedFieldsGrantOverview  @Keerti
  Scenario: Navigating to the Closeout Request/Validating whether the Acknowledgement section has Default Null Value before sent to sub-recipient
  / Verifying the Auto-populated fields Closeout Effective Date and the Closeout Activities Due date
  /Validating whether the fields are carried forward from the Grant Overview tab to Closeout Grant Overview Tab
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    And I save the field labeled "Subrecipient Organization" as "SubrecipientOrganization"
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    And I navigate to "Requests" sub tab
    Then I softly see "Closeout Requests" page block displayed
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "Acknowledgement" as "AcknowledgementCheck"
    And I save the field labeled "Acknowledgement Date" as "AcknowledgementDate"
    And I save the field labeled "Acknowledgement By" as "AcknowledgementBy"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I save the field labeled "Closeout Effective Date" as "CloseoutEffectiveDate"
    And I save the field labeled "Subrecipient Organization" as "CloseoutSubrecipientOrganization"
    And I save the field labeled "Funding Organization" as "CloseoutFundingOrganization"
    Then I softly see field "Acknowledgement" as "{SavedValue:AcknowledgementCheck}"
    Then I softly see field "Acknowledgement Date" as "{SavedValue:AcknowledgementDate}"
    Then I softly see field "Acknowledgement By" as "{SavedValue:AcknowledgementBy}"
    Then I softly see that the saved value "{SavedValue:ProjectPeriodEndDate}" and "{SavedValue:CloseoutEffectiveDate}" are equal
    Then I softly see that the saved value "{SavedValue:SubrecipientOrganization}" and "{SavedValue:CloseoutSubrecipientOrganization}" are equal
    Then I softly see that the saved value "{SavedValue:FundingOrganization}" and "{SavedValue:CloseoutFundingOrganization}" are equal

  @40636 @40747 @ChecklistSupportingDocumentNotes @Keerti @buglogged141573
  Scenario: Verifying the Checklist of Closeout Request/ Validate the Supporting Document Checklist Section / Validate the user can add the Notes for Closeout Requests
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Checklist" sub tab
    Then I softly see field "Has the subrecipient submitted all payment requests?" as "Yes"
    Then I softly see field "Did the subrecipient incur any costs after the period of performance end date?" as "Yes"
    Then I softly see field "Have all submitted payments to the subrecipient been issued, including the final payment?" as "Yes"
    Then I softly see field "Have all expenditures been reviewed for allowability?" as "Yes"
    Then I softly see field "Is there an unspent balance remaining on this award?" as "Yes"
    Then I softly see field "Have all indirect expenses been posted to the award?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    Then I softly see field "Has the subrecipient met the match requirement?" as "Yes"
    Then I softly see field "Has the subrecipient provided supporting documentation for all reported match, including third party in-kind match?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    Then I softly see field "Did the subrecipient fully expend program income earned during the award period prior to the closeout of the award?" as "Yes"
    Then I softly see field "Has the subrecipient returned unexpended program income to the funding organization, if required by program regulations?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    Then I softly see field "Has the subrecipient completed the scope of work as outlined in the subaward agreement?" as "Yes"
    Then I softly see field "Has the subrecipient met all deliverable requirements?" as "Yes"
    Then I softly see field "Has the subrecipient submitted required documentation of performance completion?" as "Yes"
    Then I softly see field "Did the subrecipient request an extension to the period of performance?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    Then I softly see field "Has the subrecipient submitted all programmatic or progress reports?" as "Yes"
    Then I softly see field "Has the subrecipient submitted all required site visit reports?" as "Yes"
    Then I softly see field "Has the funding organization program staff reviewed and accepted all reports?" as "Yes"
    Then I softly see field "Is the subrecipient required to provide ongoing outcome or compliance reporting after the period of performance end date?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    Then I softly see field "Has the subrecipient submitted a equipment inventory?" as "Yes"
    Then I softly see field "Has the subrecipient put in place the required deed restrictions or mortgage liens for real property acquired, constructed, rehabilitated, or reconstructed with federal award funds?" as "Yes"
    Then I softly see field "Did the subrecipient make facility or infrastructure improvements that trigger change of use requirements and is the subrecipient required to provide ongoing maintenance?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    Then I softly see field "Has the subrecipient completed all corrective actions for any open findings/concerns?" as "Yes"
    Then I softly see field "Has the funding organization reviewed and accepted all corrective actions?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    When I navigate to "Files" sub tab
    Then I softly see value "Automation" for title "Description" inside table "---closeout:-:closeoutSupportingDocumentChecklist---"
    And I pause execution for "4" seconds
    When I enter the following values into flex table with id "---closeout:-:closeoutNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---closeout:-:closeoutNotesTableId---"

  @40729 @87356 @VerifyErrorMessageForCloseoutRequest
  Scenario: Validate user should get error message on closeout request for Type and Reason fields
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    #87356
    Then I softly see "Create Closeout Request" opens in overLay window
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    #40729
    Then I softly see the following messages in the page details contains:
      | Type is required to save.   |
      | Reason is required to save. |

  @40065 @87352 @40608 @89221 @89222 @89223 @89224 @89225 @89226 @89229 @89227 @88734 @88735 @88736 @88737 @88738 @88739 @ValidatingCloseoutRequest  @buglogged141573
  Scenario: To verify the PM user should be able to create the Closeout Request
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    #40065
    Then I softly see "Create Closeout Request" opens in overLay window
    #87352
    And I save the field labeled "Closeout" as "CloseoutName"
    And I save the field labeled "Closeout Effective Date" as "CloseoutEffectiveDate"
    Then I softly see field "Closeout" as "{SavedValue:CloseoutName}"
    Then I softly see field "Closeout Effective Date" as "{SavedValue:CloseoutEffectiveDate}"
    Then I softly see field "EGMS ID" as "{SavedValue:GrantID}"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    #40608
    And I save the field labeled "Closeout Activities Due Date" as "CloseoutActivitiesDueDate"
    Then I softly see field "Closeout Activities Due Date" as "{SavedValue:CloseoutActivitiesDueDate}"
    Then I softly see field "Closeout Effective Date" as "{SavedValue:CloseoutEffectiveDate}"
    When I navigate to "Responsibilities" sub tab
    #89221
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    Then I softly see that "{SavedValue:FO Username}" has been added in flextable with Id "---closeout:-:closeoutApproverTableId---"
    Then I softly see that "{SavedValue:PM Username}" has been added in flextable with Id "---closeout:-:closeoutApproverTableId---"
    #89223
    When I navigate to "Files" sub tab
    Then I softly see value "Automation" for title "Description" inside table "---closeout:-:closeoutSupportingDocumentChecklist---"
    #89224
    And I click on "Upload Template" icon for "Automation" inside flex table with id "---closeout:-:closeoutSupportingDocumentChecklist---" with wait for record
    Then I softly see "Upload Template" opens in overLay window
    When I upload file "AttachmentTesting.pdf" into library
    And I click modal button "Save"
    Then I see the following messages in the page details contains:
      | Attachment saved successfully. |
    When I close "Upload Template" modal by clicking the top right x button
    #89225
    And I click on hyperlink containing value "View"
    Then I softly see new tab is opened
    And I switch to parent tab
    And I click on top right button "Add Files" in flex table with id "---closeout:-:closeoutFilesTableId---"
    #89226
    When I upload attachment "Permanent Records.xlsx" of type "Other" from computer
    #89229
    And I click on "View" icon for "Other" inside flex table with id "---closeout:-:closeoutFilesTableId---" with wait for record
    Then I softly see "View" opens in overLay window
    Then I see field "Title" as "Permanent Records.xlsx" on modal
    Then I see field "Classification" as "Other" on modal
    When I close "View" modal by clicking the top right x button
    #89227
    And I click on top right button "Add Files" in flex table with id "---closeout:-:closeoutFilesTableId---"
    When I upload file "ParentChild.txt" present in the flex table "---closeout:-:closeoutAddFileTableId---" from library
    Then I softly see value "ParentChild.txt" for title "Title" inside table "---closeout:-:closeoutFilesTableId---"
    Then I softly can see row level action button "Download" against "ParentChild.xlsx" in flex table with id "---closeout:-:closeoutFilesTableId---"
    Then I softly can see row level action button "View" against "ParentChild.xlsx" in flex table with id "---closeout:-:closeoutFilesTableId---"
    Then I softly can see row level action button "Delete" against "ParentChild.xlsx" in flex table with id "---closeout:-:closeoutFilesTableId---"
    #88734
    When I navigate to "Checklist" sub tab
    And I enter value "Yes" into field "ChecklistQuestionPick7__c"
    And I enter value "Yes" into field "ChecklistQuestionPick8__c"
    #88735
    And I enter value "Yes" into field "ChecklistQuestionPick9__c"
    And I enter value "Yes" into field "ChecklistQuestionPick10__c"
    #88736
    And I enter value "Yes" into field "ChecklistQuestionPick11__c"
    And I enter value "Yes" into field "ChecklistQuestionPick12__c"
    And I enter value "Yes" into field "ChecklistQuestionPick13__c"
    And I enter value "Yes" into field "ChecklistQuestionPick14__c"
    #88737
    And I enter value "Yes" into field "ChecklistQuestionPick15__c"
    And I enter value "Yes" into field "ChecklistQuestionPick16__c"
    And I enter value "Yes" into field "ChecklistQuestionPick17__c"
    And I enter value "Yes" into field "ChecklistQuestionPick18__c"
    #88738
    And I enter value "Yes" into field "ChecklistQuestionPick19__c"
    And I enter value "Yes" into field "ChecklistQuestionPick20__c"
    And I enter value "Yes" into field "ChecklistQuestionPick21__c"
    #88739
    And I enter value "Yes" into field "ChecklistQuestionPick22__c"
    And I enter value "Yes" into field "ChecklistQuestionPick23__c"
    When I click on "Save" in the page details
    Then I softly see field "Has the subrecipient met the match requirement?" as "Yes"
    Then I softly see field "Has the subrecipient provided supporting documentation for all reported match, including third party in-kind match?" as "Yes"
    Then I softly see field "Did the subrecipient fully expend program income earned during the award period prior to the closeout of the award?" as "Yes"
    Then I softly see field "Has the subrecipient returned unexpended program income to the funding organiation, if required by program regulations?" as "Yes"
    Then I softly see field "Has the subrecipient completed the scope of work as outlined in the subaward agreement?" as "Yes"
    Then I softly see field "Has the subrecipient met all deliverable requirements?" as "Yes"
    Then I softly see field "Has the subrecipient submitted required documentation of performance completion?" as "Yes"
    Then I softly see field "Did the subrecipient request an extension to the period of performance?" as "Yes"
    Then I softly see field "Has the subrecipient submitted all programmatic or progress reports?" as "Yes"
    Then I softly see field "Has the subrecipient submitted all required site visit reports?" as "Yes"
    Then I softly see field "Has the funding organization program staff reviewed and accepted all reports?" as "Yes"
    Then I softly see field "Is the subrecipient required to provide ongoing outcome or compliance reporting after the period of performance end date?" as "Yes"
    Then I softly see field "Has the subrecipient submitted a equipment inventory?" as "Yes"
    Then I softly see field "Has the subrecipient put in place the required deed restrictions or mortgage liens for real property acquired, constructed, rehabilitated, or reconstructed with federal award funds?" as "Yes"
    Then I softly see field "Did the subrecipient make facility or infrastructure improvements that trigger change of use requirements and is the subrecipient required to provide ongoing maintenance?" as "Yes"
    Then I softly see field "Has the subrecipient completed all corrective actions for any open findings/concerns?" as "Yes"
    Then I softly see field "Has the funding organization reviewed and accepted all corrective actions?" as "Yes"

  @89228 @ValidatingDownloadBehaviour @buglogged141573
  Scenario: To verify the PM user should be able to create the Closeout Request
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    When I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutSupportingDocumentChecklist---" by clicking "Add" :
      | Description                 | Required  | Status |
      | Automation test description | Mandatory | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---closeout:-:closeoutSupportingDocumentChecklist---" without waiting for record
    Then I softly see "Upload Template" opens in overLay window
    When I upload file "AttachmentTesting.pdf" into library
    And I click modal button "Save"
    Then I see the following messages in the page details contains:
      | Attachment saved successfully. |
    When I close "Upload Template" modal by clicking the top right x button
    And I click on hyperlink containing value "View"
    Then I softly see new tab is opened
    And I switch to parent tab
    And I click on top right button "Add Files" in flex table with id "---closeout:-:closeoutFilesTableId---"
    When I upload attachment "Permanent Records.xlsx" of type "Other" from computer
    And I click modal button "Close"
    When I save the value from row "1" for column name "Title" as "AttachedFile" from flex table "---closeout:-:closeoutFilesTableId---"
    Then I softly see value "{SavedValue:AttachedFile}" for title "Title" inside table "---closeout:-:closeoutFilesTableId---"
    And I click on "Download" icon for "{SavedValue:AttachedFile}" inside flex table with id "---closeout:-:closeoutFilesTableId---" with wait for record
    Then I softly verify that the file "{SavedValue:AttachedFile}" is downloaded

  @87353 @86713  @93106 @40644 @86714 @76488 @42103 @87351 @76487 @86716 @86712 @87346 @ValidatingSentToSubrecipientInCloseoutRequest  @buglogged141586
  Scenario: To validate status : Sent to Subrecipient in closeout request section when closeout request is Sent to Subrecipient by an internal user
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    Then I softly see field "EGMS ID" as "{SavedValue:GrantID}"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    Then I softly see "Create Closeout Request" opens in overLay window
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #87353
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "CloseoutEGMSID"
    And I save the field labeled "Closeout" as "CloseoutName"
    And I save the field labeled "Closeout Effective Date" as "CloseoutEffectiveDate"
    Then I softly see field "Closeout" as "{SavedValue:CloseoutName}"
    Then I softly see field "Closeout Effective Date" as "{SavedValue:CloseoutEffectiveDate}"
    Then I softly see field "EGMS ID" as "{SavedValue:CloseoutEGMSID}"
    #40071
    And I save the field labeled "Grant Title" as "GrantTitle"
    And I save the field labeled "Subrecipient Organization" as "SubrecipientOrganization"
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see field "Grant Title" as "{SavedValue:GrantTitle}"
    Then I softly see field "Subrecipient Organization" as "{SavedValue:SubrecipientOrganization}"
    Then I softly see field "Funding Organization" as "{SavedValue:FundingOrganization}"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    #93106
    Then I softly see value "{SavedValue:CloseoutEGMSID}" for title "EGMS ID" inside table "---closeout:-:closeoutTableId---"
    And I softly see value "Early Completion" for title "Type" inside table "---closeout:-:closeoutTableId---"
    And I softly see value "Automation Test Description" for title "Reason" inside table "---closeout:-:closeoutTableId---"
    And I softly see value "Created" for title "Status" inside table "---closeout:-:closeoutTableId---"
    And I click on "View" icon for "Created" inside flex table with id "---closeout:-:closeoutTableId---" without waiting for record
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Open Items" sub tab at view detail page
    Then I softly can see "Checklist" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    #40644
    And I navigate to "Overview" sub tab
    Then I softly see field "Spent" as "$0.00"
    Then I softly see field "Actual Cash Match" as "$0.00"
    Then I softly see field "Actual Non-Cash Match" as "$0.00"
    Then I softly see field "Actual Total Match" as "$0.00"
    #86714
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I enter value "0" into field "CloseoutDate__c"
    And I enter value "30" into field "CloseoutDueDateGrantor__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Closeout Effective Date" as "CloseoutEffectiveDate"
    And I save the field labeled "Closeout Activities Due Date" as "CloseoutActivitiesDueDate"
    #76488
    Then I softly see value "---AUTOEnvData:-:fundingAccount---" for title "Funding Account" inside table "---closeout:-:closeoutFundingAccountsTableId---"
    And I softly see value "$1,000.00" for title "Encumbrance" inside table "---closeout:-:closeoutFundingAccountsTableId---"
    And I softly see value "$0.00" for title "Spent" inside table "---closeout:-:closeoutFundingAccountsTableId---"
    And I softly see value "$1,000.00" for title "Encumbrance Balance" inside table "---closeout:-:closeoutFundingAccountsTableId---"
    And I softly see value "$0.00" for title "Closeout Deobligation" inside table "---closeout:-:closeoutFundingAccountsTableId---"
    When I click on "Send To Subrecipient" in the page details
    Then I softly see field "Status" as "Sent To Subrecipient"
    #76487
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    #42103
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutEGMSID}" in "---closeout:-:externalHomePendingTasktableId---" panel
    Then I softly see that "{SavedValue:CloseoutEGMSID}" has been added in flextable with Id "---closeout:-:externalHomePendingTasktableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---closeout:-:externalHomePendingTasktableId---"
    Then I softly see value "Review Closeout Request" for title "Task Type" inside table "---closeout:-:externalHomePendingTasktableId---"
    Then I softly see value "{Date:MM/dd/yyyy::d+7}" for title "Due Date" inside table "---closeout:-:externalHomePendingTasktableId---"
    Then I softly see value "Review Closeout Request for Grant #{SavedValue:GrantID}" for title "Subject" inside table "---closeout:-:externalHomePendingTasktableId---"
    #87351
    And I click on "Start" icon for "{SavedValue:CloseoutEGMSID}" inside flex table with id "---closeout:-:externalHomePendingTasktableId---"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Open Items" sub tab at view detail page
    Then I softly can see "Checklist" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    #86716
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I enter value "checked" into field "Aggreement__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Acknowledgement" as "checked"
    #86712
    And I click on "Acknowledge" in the page details
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "dark blue"
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    #93583
    And I save the field labeled "Acknowledgement" as "AcknowledgementCheck"
    And I save the field labeled "Acknowledgement Date" as "AcknowledgementDate"
    And I save the field labeled "Acknowledgement By" as "AcknowledgementBy"
    Then I softly see field "Acknowledgement Date" as "{SavedValue:AcknowledgementDate}"
    Then I softly see field "Acknowledgement By" as "{SavedValue:AcknowledgementBy}"
    Then I softly see field "Acknowledgement" as "{SavedValue:AcknowledgementCheck}"
    #87346
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutEGMSID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I softly see that "{SavedValue:CloseoutEGMSID}" has been added in flextable with Id "---closeout:-:pendingTaskTableId---"
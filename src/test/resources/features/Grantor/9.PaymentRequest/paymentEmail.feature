@paymentRequestWithBackground @paymntRequestEmails @paymentRequest @grantor-regression @grantor-parallel-regression
Feature: Validate all scenarios in Payment Request

  Background: Navigate to award
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"

#    PaymentRequest

  @55631 @PRSendBackToSubrecipientCheckMailNotification
  Scenario: Verify that on Send Back to subrecipient , user is able to check email (Reimbursement)
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PaymentId"
    And I save the field labeled "Subaward" as "Subaward Id"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                | 0               | 20                       | 100        | 100            |
    When I close "Payment Line Items" modal by clicking the top right x button
    When I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 10                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:FO Username} | Step 1        |
    And I click on "Send Back to Subrecipient" in the page details
    And I checkout to yopmail with mailid "automationspi31.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Payment Request {SavedValue:PaymentId} has been SentBack
      """

  @55626 @advancePaymentRequestSubmitToGrantorBySPIEmailNotification
  Scenario: Verify that on submit to grantor , user is able to check  email notifications Payment Request (Advance)
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PaymentId"
    And I save the field labeled "Subaward" as "Subaward Id"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:recipientAdvancePaymentFilesTableId---"
    And I pause execution for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Invoice" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I pause execution for "3" seconds
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "60" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Payment Request {SavedValue:PaymentId} fromAutomation SPI3 has been Submitted
      """

  @55627 @emailNotificationOnSubmitToGrantorReimbursement
  Scenario: Verify that on submit to grantor , user is able to check  email notifications Payment Request (Reimbursement)
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PaymentId"
    And I save the field labeled "Subaward" as "Subaward Id"
    And I navigate to "Financials" sub tab
    And I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 0                 | 0               | 0                        | 100        | 100            |
    When I close "Payment Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "30" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Payment Request {SavedValue:PaymentId} fromAutomation SPI3 has been Submitted
      """

  @55630 @validateAdvancePRSendBackToSubReceipientEmailNotification
  Scenario: Verify that on Send Back to subrecipient , user is able to check email(Advance)
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PaymentId"
    And I save the field labeled "Subaward" as "Subaward Id"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I get the "EGMS ID"
    When I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:recipientAdvancePaymentFilesTableId---"
    And I pause execution for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Invoice" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I click on "Send Back to Subrecipient" in the page details
    And I checkout to yopmail with mailid "automationspi31.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
     """
     Sandbox: Notification: Payment Request {SavedValue:PaymentId} has been SentBack
     """

  @55628 @approvalOfAdvancePaymentRequestEmailNotification
  Scenario: Verify that on submitting for approval , user is able to check email (Advance)
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PaymentId"
    And I save the field labeled "Subaward" as "Subaward Id"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I get the "EGMS ID"
    When I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:recipientAdvancePaymentFilesTableId---"
    And I pause execution for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Invoice" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                     | Advance |
      | {SavedValue:FO Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    And I checkout to yopmail with mailid "fo.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
     """
     Sandbox: Approve Payment Request #{SavedValue:PaymentId} for Subaward#{SavedValue:Subaward Id}
     """

  @55636 @approversApprovePaymentRequestEmailNotificationReimbursement
  Scenario Outline: Verify that on Approved, user will receive email notifications for Payment Request (Reimbursement)
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PaymentId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                | 0               | 20                       | 10         | 10             |
    When I close "Payment Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    And I pause execution for "4" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:FO Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
     """
     Sandbox: Notification: Payment Request {SavedValue:PaymentId} has beenApproved
     """
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @55629 @PRSubmittingForApproveEmailNotificationReimbursement
  Scenario Outline: Verify that on submitting for approval , user is able to check email (Reimbursement)
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PaymentId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                | 0               | 20                       | 10         | 10             |
    When I close "Payment Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I pause execution for "4" seconds
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:FO Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    And I checkout to yopmail with mailid "fo.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Payment Request {SavedValue:PaymentId} for{SavedValue:SubawardId} has been Submitted for Approval
      """
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @55635 @forwardedEmailNotificationAdvancePR
  Scenario: Verify that on Forward , user will receive email notifications for Payment Request (Advance)
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PaymentId"
    And I save the field labeled "Subaward" as "SubawardId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I get the "EGMS ID"
    When I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:recipientAdvancePaymentFilesTableId---"
    And I pause execution for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Invoice" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                     | Advance |
      | {SavedValue:FO Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Reassign" to user "{SavedValue:EXE Username}" in the approval decision
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Payment Request {SavedValue:PaymentId} for {SavedValue:SubawardId} hasbeen Submitted for Approval
      """

  @55632 @approvalOfPREmailNotificationAdvance
  Scenario: Verify that after approval of advance PR , user can check email notifications for Advance Payment request.
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PaymentId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I get the "EGMS ID"
    When I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:recipientAdvancePaymentFilesTableId---"
    And I pause execution for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Invoice" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                     | Advance |
      | {SavedValue:FO Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "60" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Payment Request {SavedValue:PaymentId} has beenApproved
      """

  @55634 @sendToOwnerEmailNotificationAdvance
  Scenario: Verify that on Send to Owner , user is able to check  email notifications Payment Request (Advance)
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PaymentId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I get the "EGMS ID"
    When I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:recipientAdvancePaymentFilesTableId---"
    And I pause execution for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Invoice" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                     | Advance |
      | {SavedValue:FO Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Payment Request {SavedValue:PaymentId} has been SentBack
      """

  @55638 @sendToOwnerPREmailNotificationReimbursement
  Scenario Outline: Verify that on Send to Owner , user is able to check  email notifications Payment Request (Reimbursement)
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PaymentId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                | 0               | 20                       | 10         | 10             |
    When I close "Payment Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    And I pause execution for "4" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:FO Username} | Step 1        |
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Payment Request {SavedValue:PaymentId} has been SentBack
      """
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @55637 @rejectPREmailNotificationReimbursement
  Scenario Outline: Verify that on Reject , user is able to check  email notifications Payment Request (Reimbursement)
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PaymentId"
    And I save the field labeled "Subaward" as "SubawardId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                | 0               | 20                       | 10         | 10             |
    When I close "Payment Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    And I pause execution for "4" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:FO Username} | Step 1        |
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Disapprove" in the approval decision
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Payment Request #{SavedValue:PaymentId} has beenRejected.
      """
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @55633 @rejectEmailNotificationAdvance
  Scenario: Verify that on Reject, user is able to check  email notifications Payment Request (Advance)
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PaymentId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I get the "EGMS ID"
    When I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:recipientAdvancePaymentFilesTableId---"
    And I pause execution for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Invoice" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                     | Advance |
      | {SavedValue:FO Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Disapprove" in the approval decision
    And I pause execution for "5" seconds
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "120" seconds
    And I refresh the page
    Then I see the mail subject is as follows :
      """
      Sandbox: Notification: Payment Request #{SavedValue:PaymentId} has beenRejected.
      """

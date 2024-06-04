@amendmentRequestsWB @amendmentRequest @t5 @grantor-regression @grantor-parallel-regression @regression
Feature: Amendment Request scenarios without background

  @151129 @Verify3StepApprovalFor-PeriodicRenewal-RnRFunctionality @monu
  Scenario: Verify user is able to add three step approver for Periodic Renewal and forward it on step three
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
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
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role           |
      | {SavedValue:SPI3 Username} | Principal Investigator |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:PM Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Submitted for Approval"

  @151893 @VerifyUserShouldNotBeAbleToAddSameUserForMultipleStep-BudgetRedirection-RnRFunctionality @monu
  Scenario: Verify validation displayed when same approver is added on different  step for Budget Redirection amendment
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter value "Automation Justification" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 2            |
    Then I softly see "You cannot specify the same user for multiple steps for Amendment Request" inside flex table with id "---amendment:-:approversTableId---"

  @151896 @verifyRemovalOfAddedApprover-BudgetRedirection-RnRFunctionality @monu
  Scenario: To verify user can  remove the added approver on Budget Redirection amendment
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter value "Automation Justification" into field "Justification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:approversTableId---"
    And I select value "{SavedValue:PM Username}" into field "Name__c"
#    And I enter value "Step 1" into field "AmendmentRequestRole__c"
    And I click on "Remove record" icon for "NA" inside table
    Then I softly see "No Records Found" inside flex table with id "---amendment:-:approversTableId---"

  @151664 @VerifyErrorMessageAtApproverSectionWhileSkippingAt-BudgetRedirection-RnRFunctionality @monu
  Scenario: To validate message ,when user give NA  on approval step on Budget Redirection amendment
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter value "Automation Justification" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | NA                |
    And I wait for "9" seconds
    When I click on "Submit for Approval" in the page details
    Then I see the following messages in the page details contains:
      | Responsibilities - At least one approver is required |

  @138356 @VerifyIsnotallowingusertosubmitAmendmentrequestkeypersonnelchangeforapprovalwithoutaddingapprovers
  Scenario: Verify Is not allowing user to submit Amendment request key personnel change for approval without adding approvers
    Given I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AmendmentId"
    And I navigate to "Overview" sub tab
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---amendment:-:RecipientKeyPersonalTableId---" without waiting for record
    And I enter value "Other" into field "ProjectRole__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:AmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:AmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I see the following messages in the page details contains:
      | Responsibilities - At least one approver is required |

  @151125 @ValidateApproversAreGettingInheritedFromAwardRecordToFundingChangeAmendment @vaibhav
  Scenario Outline: Validate Approvers Are Getting Inherited From Award Record To Funding Change Amendment
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "AMENDMENT_REQUEST_BUILDUP_MATCH_YES" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  | Amendment Request |
      | {SavedValue:PM Username} | Step 1 | Step 1            |
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 1000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---amendment:-:approversTableId---"
    Then I softly see value "Step 1" for title "Amendment Request" inside table "---amendment:-:approversTableId---"

    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Amendment Award} | {SavedValue:Automation Runtime Amendment Award} |


  @102285 @VerifyBudgetPeriodEndDateisupdatedonBudgetPeriodDetailsonGrant-BudgetPeriodChange
  Scenario:Verify Budget Period End Date is updated on Budget Period Details on Grant-Budget Period Change
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "AMENDMENT_REQUEST" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantId"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    When I click on "Save" in the page details
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantId}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantId}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see field "Project Period End Date" as "{SavedValue:updatedBudgetPeriodDate}"

  @150170 @VerifyUserShouldNotBeAbleToAddSameUserForMultipleStep-PeriodicRenewal-RnRFunctionality @monu
  Scenario: Verify validation displayed when same approver is added on different  step for Periodic Renewal amendment
    And I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
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
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 2            |
    Then I softly see "You cannot specify the same user for multiple steps for Amendment Request" inside flex table with id "---amendment:-:approversTableId---"

  @154982 @VerifyUserShouldNotBeAbleToAddSameStepForMultipleUser-KPCAmendmentRequest-RnRFunctionality @monu
  Scenario: Verify validation displayed when same approver is added on different  step for amendment key personnel change
    Given I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AmendmentId"
    And I navigate to "Overview" sub tab
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---amendment:-:RecipientKeyPersonalTableId---" without waiting for record
    And I enter value "Other" into field "ProjectRole__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:AmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:AmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 2            |
    Then I softly see "You cannot specify the same user for multiple steps for Amendment Request" inside flex table with id "---amendment:-:approversTableId---"

  @154980 @Verify2StepApprovalFor-KPCAmendmentRequest-RnRFunctionality @monu
  Scenario: Verify that user is able to add two step approver for amendment key personnel change
    Given I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AmendmentId"
    And I navigate to "Overview" sub tab
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---amendment:-:RecipientKeyPersonalTableId---" without waiting for record
    And I enter value "Other" into field "ProjectRole__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:AmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:AmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    Then I softly see value "Step 2" for title "Amendment Request" inside table "---amendment:-:approversTableId---"

  @151666 @VerifyUserShouldNotBeAbleToAddSameStepForMultipleUser-BudgetRedirection-RnRFunctionality @monu
  Scenario: Verify user cannot add same step for different approver on Budget Redirection amendment
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter value "Automation Justification" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    Then I softly see "You cannot specify the same step for multiple users for Amendment Request." inside flex table with id "---amendment:-:approversTableId---"

  @154978 @Verify3StepApprovalFor-KPCAmendmentRequest-RnRFuntionality @monu
  Scenario: Verify user can add three step approver and forward it on  amendment  request  Key Personnel change
    Given I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST" of type "Competitive"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AmendmentId"
    And I navigate to "Overview" sub tab
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---amendment:-:RecipientKeyPersonalTableId---" without waiting for record
    And I enter value "Other" into field "ProjectRole__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    Then I softly see value "Other" for title "Project Role" inside table "---amendment:-:RecipientKeyPersonalTableId---"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:AmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:AmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:PO Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"

  @138074 @VerifyInheritatedApproverAtTCAmendmentRequestFromAward-RnRFunctionality @monu
  Scenario: Verify that approvers are inherited from award to amendment scope of work change
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime Execution Award"
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
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  | Amendment Request |
      | {SavedValue:PM Username} | Step 1 | Step 1            |
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
    When I perform quick search for "{SavedValue:Automation Runtime Execution Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Execution Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Execution Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Execution Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Execution Award}" inside table without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Execution Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see that "Subaward" is in "Activated" status
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Execution Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Execution Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---amendment:-:approversTableId---"
    Then I softly see value "Step 1" for title "Amendment Request" inside table "---amendment:-:approversTableId---"

  @151645 @VerifyInheritatedApproverAtBudgetRedirectionAmendmentRequestFromAward-RnRFunctionality @monu
  Scenario: Validate Approvers are getting inherited from award record to Budget Redirection amendment
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account1" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I refresh the page
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Encumbrance |
      | {SavedValue:fundingAccount1} | 1000        |
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
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  | Amendment Request |
      | {SavedValue:PM Username} | Step 1 | Step 1            |
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
    When I perform quick search for "{SavedValue:Automation Runtime Execution Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Execution Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Execution Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Execution Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Execution Award}" inside table without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Execution Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Execution Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Execution Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter value "Automation Justification" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---amendment:-:approversTableId---"
    Then I softly see value "Step 1" for title "Amendment Request" inside table "---amendment:-:approversTableId---"

  @200481 @ValidateFundingchangeVerifyPMusercanreassignownershiptootheruserincreatedstateofFCamendment @sprint-5-US-196841 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate Funding change Verify PM user can reassign ownership to other user in created state of FC amendment
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Amendment Request"
    And I Click on "Reassign Records" icon for "Amendment Request" without tableid
    Then I softly see "Amendment Requests Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly see value "Automation PM1" for title "New Value" inside table "---amendment:-:historyTableId---"
    Then I softly see value "Automation PM" for title "Old Value" inside table "---amendment:-:historyTableId---"

  @200483 @ValidateFundingchangeVerifyEXEusercanreassignownershiptootheruserincreatedstateofFCamendment @sprint-5-US-196841 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate Funding change Verify EXE user can reassign ownership to other user in created state of FC amendment
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Amendment Request"
    And I Click on "Reassign Records" icon for "Amendment Request" without tableid
    Then I softly see "Amendment Requests Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly see value "Automation EXE1" for title "New Value" inside table "---amendment:-:historyTableId---"
    Then I softly see value "Automation EXE" for title "Old Value" inside table "---amendment:-:historyTableId---"

  @200503 @ValidatePMusercanreassignownershiptootheruserinsubmittograntorstateofFCamendment @sprint-5-US-196841 @vaibhav @reassignment
  Scenario: Validate PM user can reassign ownership to other user in submit to grantor state of FC amendment
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
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
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Amendment Request"
    And I Click on "Reassign Records" icon for "Amendment Request" without tableid
    Then I softly see "Amendment Requests Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit For Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

  @200504 @ValidateFOusercanreassignownershiptootheruserinsubmittoapprovalstateofFCamendment @sprint-5-US-196841 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate FO user can reassign ownership to other user in submit to approval state of FC amendment
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                     |
      | 3100  | fieldRevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation FO" into field "s2id_autogen1"
    And I select value "Automation FO1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation FO" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Amendment Request"
    And I Click on "Reassign Records" icon for "Amendment Request" without tableid
    Then I softly see "Amendment Requests Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly see value "Automation FO1" for title "New Value" inside table "---amendment:-:historyTableId---"
    Then I softly see value "Automation FO" for title "Old Value" inside table "---amendment:-:historyTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---amendment:-:amendmentAddNotesTableId---"

  @200514 @Validateapprovedtaskshouldbegeneratedfornewownerifuserchangeownerwhilesubmitforapprovalstate @sprint-5-US-196841 @vaibhav @reassignment
  Scenario: Validate approved task should be generated for new owner if user change owner while submit for approval state
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                     |
      | 4100  | fieldRevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Amendment Request"
    And I Click on "Reassign Records" icon for "Amendment Request" without tableid
    Then I softly see "Amendment Requests Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I softly see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"

  @200520 @ValidateEXEusercanreassignownershiptootheruserinRejectedstateofFCamendment @sprint-5-US-196841 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate EXE user can reassign ownership to other user in Rejected state of FC amendment
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                     |
      | 4100  | fieldRevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Reject" in the approval decision
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Amendment Request"
    And I Click on "Reassign Records" icon for "Amendment Request" without tableid
    Then I softly see "Amendment Requests Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I softly see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly see value "Automation EXE1" for title "New Value" inside table "---amendment:-:historyTableId---"
    Then I softly see value "Automation EXE" for title "Old Value" inside table "---amendment:-:historyTableId---"
    Then I softly see field "Status" as "Rejected"

  @200524 @Validatefieldhistoryshouldbeupdatedfornewownerofamendmentrequest @sprint-5-US-196841 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate field history should be updated for new owner of amendment request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
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
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Amendment Request"
    And I Click on "Reassign Records" icon for "Amendment Request" without tableid
    Then I softly see "Amendment Requests Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:FundingID}" for title "EGMS ID" inside table "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly see value "Automation PM1" for title "New Value" inside table "---amendment:-:historyTableId---"
    Then I softly see value "Automation PM" for title "Old Value" inside table "---amendment:-:historyTableId---"

  @200533 @ValidateAmendmentRequestSubmittedGrantorNotifyemailshouldbegenerateforPMnewownerofamendmentrequest @sprint-5-US-196841 @vaibhav @reassignment
  Scenario: Validate Amendment Request Submitted Grantor Notify' email should be generate for PM new owner of amendment request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
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
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Amendment Request"
    And I Click on "Reassign Records" icon for "Amendment Request" without tableid
    Then I softly see "Amendment Requests Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
"""
      Sandbox: Notification: Owner Reassignment Report
      """

  @200540 @ValidateAmendmentRequestSentBackemailshouldbegenerateforPMnewownerofamendmentrequest @sprint-5-US-196841 @vaibhav @reassignment
  Scenario: Validate Amendment Request Sent Back' email should be generate for PM new owner of amendment request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
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
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Site work     | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                     |
      | 4100  | fieldRevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Amendment Request"
    And I Click on "Reassign Records" icon for "Amendment Request" without tableid
    Then I softly see "Amendment Requests Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:FundingID}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:FundingID}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
"""
      Sandbox: Notification: Amendment Request #{SavedValue:FundingID} has been SentBack by an Approver
      """
    Then I see the mail text is as follows :

"""
     Hello,
     This email is to inform you that the amendment request #{SavedValue:FundingID} which has been created for the award #{SavedValue:AwardEGMSID} has been sent back by the approver.

     Amendment Details:
     Amendment Type:
     Amendment ID: {SavedValue:FundingID}
     Status: Created
     Grant: {SavedValue:GrantEGMSID}

     Log in to EGMS and click here to access the record.

     Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
     Thank you.
     The EGMS Team
      """

  @200543 @Validateamendmentrequestownershouldnotchangeevenifitsrelatedawardownershipchangetootherowner @sprint-5-US-196841 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate amendment request owner should not change even if it's related award ownership change to other owner
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
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
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    And I Click on "Reassign Records" icon for "Grant" without tableid
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:grantSourceOwnerTableId---" panel
    When I check "{SavedValue:GrantEGMSID}" boxes in flex table with id "---subAwardStandAlone:-:grantSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---subAwardStandAlone:-:grantSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:grantTargetOwnerTableId---" panel
    Then I see value "{SavedValue:GrantEGMSID}" for title "Grant ID" inside table "---subAwardStandAlone:-:grantTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly see value "Automation PM" for title "New Value" inside table "---amendment:-:historyTableId---"

  @200559 @ValidatePMusercanreassignownershiptootheruserincreatedstateofPRamendment @sprint-5-US-196841 @vaibhav @reassignment
  Scenario: Validate PM user can reassign ownership to other user in created state of PR amendment
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
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
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Amendment Request"
    And I Click on "Reassign Records" icon for "Amendment Request" without tableid
    Then I softly see "Amendment Requests Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    Then I softly see fields "fieldPurposeRTA__c" is in edit mode
    Then I softly see fields "fieldImpact__c" is in edit mode
    Then I softly see fields "fieldGrantAwardName__c" is in edit mode
    Then I softly see fields "fieldGrantAwardDescription__c" is in edit mode
    Then I softly see fields "fieldRequestedChangeInBudget__c" is in edit mode
    Then I softly see fields "fieldBudgetRedirectionThreshhold__c" is in edit mode

  @200641 @ValidatePOusercanreassignownershiptootheruserincreatedstateofperiodicrenewalamendment @sprint-5-US-196841 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate PO user can reassign ownership to other user in created state of periodic renewal amendment
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PO" user
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
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "s2id_autogen1"
    And I select value "Automation PO1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PO" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Amendment Request"
    And I Click on "Reassign Records" icon for "Amendment Request" without tableid
    Then I softly see "Amendment Requests Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly see value "Automation PO1" for title "New Value" inside table "---amendment:-:historyTableId---"
    Then I softly see value "Automation PO" for title "Old Value" inside table "---amendment:-:historyTableId---"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    Then I softly see fields "fieldPurposeRTA__c" is in edit mode
    Then I softly see fields "fieldImpact__c" is in edit mode
    Then I softly see fields "fieldGrantAwardName__c" is in edit mode
    Then I softly see fields "fieldGrantAwardDescription__c" is in edit mode
    Then I softly see fields "fieldRequestedChangeInBudget__c" is in edit mode
    Then I softly see fields "fieldBudgetRedirectionThreshhold__c" is in edit mode
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

  @200644 @200656 @ValidatePMusercanreassignownershiptootheruserinsubmittograntorstateofperiodicrenewalamendment @sprint-5-US-196841 @vaibhav @reassignment
  Scenario: Validate PM user can reassign ownership to other user in submit to grantor state of periodic renewal amendment
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
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
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role           |
      | {SavedValue:SPI3 Username} | Principal Investigator |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Amendment Request"
    And I Click on "Reassign Records" icon for "Amendment Request" without tableid
    Then I softly see "Amendment Requests Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    #200656
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit For Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---amendment:-:fundingChangeApproversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---amendment:-:amendmentAddNotesTableId---"
    Then I can see top right button "Add Files" in flex table with id "---amendment:-:amendmentAddFilesTableId---"

  @200645 @ValidateEXEusercanreassignownershiptootheruserinsubmittoapprovalstateofPeriodicrenewalamendment @sprint-5-US-196841 @vaibhav @reassignment
  Scenario: Validate EXE user can reassign ownership to other user in submit to approval state of Periodic renewal amendment
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "EXE" user
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
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role           |
      | {SavedValue:SPI3 Username} | Principal Investigator |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Amendment Request"
    And I Click on "Reassign Records" icon for "Amendment Request" without tableid
    Then I softly see "Amendment Requests Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I softly see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    When I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---amendment:-:amendmentAddNotesTableId---"

  @200652 @ValidatePOusercanreassignownershiptootheruserinapprovedstateofPeriodicrenewalamendment @sprint-5-US-196841 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate PO user can reassign ownership to other user in approved state of Periodic renewal amendment
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PO" user
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
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role             |
      | {SavedValue:SPI3 Username} | Principal Investigator   |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "s2id_autogen1"
    And I select value "Automation PO1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PO" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Amendment Request"
    And I Click on "Reassign Records" icon for "Amendment Request" without tableid
    Then I softly see "Amendment Requests Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly see value "Automation PO1" for title "New Value" inside table "---amendment:-:historyTableId---"
    Then I softly see value "Automation PO" for title "Old Value" inside table "---amendment:-:historyTableId---"

  @200655 @ValidatePMusercanreassignownershiptootheruserinRejectedstateofPeriodicrenewalamendment @sprint-5-US-196841 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate PM user can reassign ownership to other user in Rejected  state of Periodic renewal amendment
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation EXE user" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM1" user
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
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentKPITableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | -8     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role             |
      | {SavedValue:SPI3 Username} | Principal Investigator   |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM1" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Amendment Request"
    And I Click on "Reassign Records" icon for "Amendment Request" without tableid
    Then I softly see "Amendment Requests Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I softly see value "{SavedValue:PERIODICRENEWAL}" for title "EGMS ID" inside table "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly see value "Automation PM" for title "New Value" inside table "---amendment:-:historyTableId---"
    Then I softly see value "Automation PM1" for title "Old Value" inside table "---amendment:-:historyTableId---"
    Then I softly see field "Status" as "Rejected"

  @200657 @Validatefieldhistoryshouldbeupdatedfornewownerofamendmentrequest @sprint-5-US-196841 @vaibhav @reassignment @FieldHistoryExclude
  Scenario: Validate field history should be updated for new owner of amendment request
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
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
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "PERIODICRENEWAL"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Amendment Request"
    And I Click on "Reassign Records" icon for "Amendment Request" without tableid
    Then I softly see "Amendment Requests Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentSourceOwnerTableId---" panel
    When I check "{SavedValue:PERIODICRENEWAL}" boxes in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---amendment:-:amendmentSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:amendmentTargetOwnerTableId---" panel
    Then I see value "{SavedValue:PERIODICRENEWAL}" for title "Amendment Request ID" inside table "---amendment:-:amendmentTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:PERIODICRENEWAL}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:PERIODICRENEWAL}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly see value "Automation PM1" for title "New Value" inside table "---amendment:-:historyTableId---"
    Then I softly see value "Automation PM" for title "Old Value" inside table "---amendment:-:historyTableId---"
@GranteeAmendment
Feature: Validate all scenarios for Grantee Amendment Request

  @489010 @ValidateCFFDuserAROwnercanabletoSubmitARforApprovalApprovedfromassigned4stepapprovercandoSendtoOwnerForwardApproveactionsseeSubmittoGrantorbuttononceApprovedtheBPCARRecord
  Scenario: Validate CF FD user AR Owner can able to Submit AR for Approval & Approved from assigned 4 step approver & can do Send to Owner/ Forward/ Approve actions & see 'Submit to Grantor' button once Approved the AR Record
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-Grantee PO user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I "Approved" of type "Periodic Renewal" amendment request for title "{SavedValue:Automation Runtime Award}" with properties "default-Grantee PO user"
    When I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
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
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardId1"
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I "Created" of type "Carry Forward" amendment request for title "{SavedValue:Automation Runtime Award}" with properties "CARRY_FORWARD_STEP_FOUR_APPROVER-Danielle FD Garcia user"
    And I refresh the page
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardId1}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Carry Forward" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I save the field labeled "EGMS ID" as "CFAMENDID"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I wait for "100" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAMENDID}" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I softly see that "{SavedValue:CFAMENDID}" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAMENDID}" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I softly see that "{SavedValue:CFAMENDID}" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I "Approve" in the approval decision
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAMENDID}" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I softly see that "{SavedValue:CFAMENDID}" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I "Approve" in the approval decision
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAMENDID}" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I softly see that "{SavedValue:CFAMENDID}" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "Danielle FD Garcia" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see the following messages in the page details contains:
      | Successfully Re-Assigned |
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAMENDID}" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I softly see that "{SavedValue:CFAMENDID}" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Submitted to Grantor On is required. |
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I navigate to "Overview" sub tab
    When I save the field labeled "Submitted to Grantor On" as "SubmittedtoGrantorOn"
    Then I see field "Submitted to Grantor On" as "{SavedValue:SubmittedtoGrantorOn}"

  @495182 @ValidateFOusercanseeonclickofARseeoptionsfromGrantphasecanseedefaultlandingpageshowsMyRecordslistviewtableofARabletotogglethelistviewfilteractionsacctostatusofrecordAlsocomfunctshouldworkontable
  Scenario: Validate FO user can see on click of AR see options from Grant phase & can see default landing page shows 'My Records' list view table of AR & able to toggle the list view filter & actions acc to status of record, Also com funct should work on table
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-Grantee PO user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I "Created" of type "Periodic Renewal" amendment request for title "{SavedValue:Automation Runtime Award}" with properties "default-David FO user"
    When I login to "As a Grantee" app as "GRANTEE FO" user
    And I navigate to "Grants" tab
    When I "Collapse" left navigation contaninig value "Grants, Awards & Amendment Requests"
    Then I do not see "Grants" inside "Grants, Awards & Amendment Requests" is displayed
    Then I do not see "Awards" inside "Grants, Awards & Amendment Requests" is displayed
    Then I do not see "Amendment Requests" inside "Grants, Awards & Amendment Requests" is displayed
    When I "Expanded" left navigation contaninig value "Grants, Awards & Amendment Requests"
    Then I see "Grants" inside "Grants, Awards & Amendment Requests" is displayed
    Then I see "Awards" inside "Grants, Awards & Amendment Requests" is displayed
    Then I see "Amendment Requests" inside "Grants, Awards & Amendment Requests" is displayed
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    Then I softly see toggle option "Amendment Requests - My Records" inside flex table id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see toggle option "Amendment Requests - Draft" inside flex table id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see toggle option "Amendment Requests - Accepted" inside flex table id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see toggle option "Amendment Requests - Rejected" inside flex table id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see toggle option "Amendment Requests - All" inside flex table id "---grantee_tableId:-:AmendmentTableId---"
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I save the value from row "1" for column name "EGMS ID" as "PriodicId" from flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see value "{SavedValue:PriodicId}" for title "EGMS ID" inside table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I can see row level action button "View" against "{SavedValue:PriodicId}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I can see row level action button "Delete" against "{SavedValue:PriodicId}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I can see row level action button "Edit" against "{SavedValue:PriodicId}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    Then I softly see default toggle as "Amendment Requests - My Records" for table "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "{SavedValue:PriodicId}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I can see row level action button "View" against "{SavedValue:PriodicId}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I can see row level action button "Delete" against "{SavedValue:PriodicId}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I can see row level action button "Edit" against "{SavedValue:PriodicId}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Accepted" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Created" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "Created" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Not Accepted" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Submitted to Grantor" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "Submitted to Grantor" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Reviewed" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "Reviewed" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "Reviewed" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Delete" against "Reviewed" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Submitted for review" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Submitted for review" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Edit" against "Submitted for review" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "Submitted for review" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Delete" against "Submitted for review" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Accepted" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Accepted" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Edit" against "Accepted" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "Accepted" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Delete" against "Accepted" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Created" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "Created" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Edit" against "Rejected" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "Rejected" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Delete" against "Rejected" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Edit" against "Submitted for Approval" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "Submitted for Approval" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Delete" against "Submitted for Approval" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Not Accepted" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Not Accepted" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Edit" against "Not Accepted" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "Not Accepted" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Delete" against "Not Accepted" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Submitted to Grantor" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Edit" against "Submitted to Grantor" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "Submitted to Grantor" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Delete" against "Submitted to Grantor" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Reviewed" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "Reviewed" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "Reviewed" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Delete" against "Reviewed" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Submitted for review" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Submitted for review" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Edit" against "Submitted for review" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "Submitted for review" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Delete" against "Submitted for review" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - Draft"
    When I perform quick search for "Accepted" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Created" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "Created" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Not Accepted" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Submitted to Grantor" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Reviewed" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "Reviewed" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "Reviewed" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Delete" against "Reviewed" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Submitted for review" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Submitted for review" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Edit" against "Submitted for review" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "Submitted for review" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Delete" against "Submitted for review" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - Accepted"
    When I perform quick search for "Accepted" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Accepted" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Edit" against "Accepted" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "Accepted" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Delete" against "Accepted" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Created" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Not Accepted" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Submitted to Grantor" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Submitted for review" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - Rejected"
    When I perform quick search for "Accepted" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Created" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Edit" against "Rejected" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "View" against "Rejected" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly cannot see row level action button "Delete" against "Rejected" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Not Accepted" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Submitted to Grantor" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Submitted for review" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - Draft"
    When I perform quick search for "{SavedValue:PriodicId}" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I save the value from row "1" for column name "Award EGMS ID" as "AwardEGMSID" from flex table "---grantee_tableId:-:AmendmentTableId---"
    And I click on hyperlink for invisible fields containing value "{SavedValue:AwardEGMSID}"
    And I wait for "2" seconds
    Then I softly see field "EGMS ID" as "{SavedValue:AwardEGMSID}"
    And I click on back arrow
    And I wait for "2" seconds
    Then I softly see toggle option "Amendment Requests - Draft" inside flex table id "---grantee_tableId:-:AmendmentTableId---"
    And I save the value from row "1" for column name "Funding Organization" as "FundingOrganization" from flex table "---grantee_tableId:-:AmendmentTableId---"
    And I click on hyperlink for invisible fields containing value "{SavedValue:FundingOrganization}"
    And I wait for "2" seconds
    Then I see the sub-header is "{SavedValue:FundingOrganization}" in the page details
    And I click on back arrow
    And I wait for "2" seconds
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:AmendmentTableId---"
    When I click on parallel lines menu bar with data target value "Amendment Requests - Draft"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:AmendmentTableId---"
    And I select value inside table "---grantee_tableId:-:AmendmentTableId---" is "5"
    Then I see "5" records inside flex table id "---grantee_tableId:-:AmendmentTableId---"
    And I save the total records from the flex table id "---grantee_tableId:-:AmendmentTableId---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "{SavedValue:PriodicId}" in "---grantee_tableId:-:AmendmentTableId---" panel
    When I click on "Delete" icon for "{SavedValue:PriodicId}" inside table with table id "---grantee_tableId:-:AmendmentTableId---" without processing
    Then I softly see confirmation box with body "Are you sure you want to permanently delete the draft amendment request?" is displayed
    When I click modal button "OK"
    And I wait for "3" seconds
    When I perform quick search for "{SavedValue:PriodicId}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AmendmentTableId---"
@amendmentRequestswithBackground @amendmentRequests @grantor-regression @grantor-parallel-regression @parallel-regression @regression @amendmentRequestsPDF @PDF @amendmentRequestsmailandPdf @skipOnJenkins
Feature: Validate all scenarios in the Amendment Request for PDF

  @292455 @292634 @VerifyUndobuttonvisibilityonapprovedamendmentaftersubawardisdeletedfromPendingactivationstate @sprint-3-US-288689  @Undo @snapExecution
  Scenario:Verify Undo button visibility on approved amendment after subaward is deleted from Pending activation state
    And I activated standalone subaward "Automation Runtime award" with properties "Automation PM user" of type "Formula_By_Applicant_Focus_Area"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "Justification__c"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
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
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    #292634
    And I click on Menu icon present on top right corner of the page
    And I select "Take Snapshot" from dropdown
    And I click "OK" on modal confirmation box
    And I pause execution for "3" seconds
    When I navigate to "History" sub tab
    And I pause execution for "10" seconds
    And I refresh the page
    And I click on hyperlink which contains todays date with text "SnapShot on"
    And I click on "Download" button for snapshot view
    And I wait for "3" seconds
    When I download the file for snapshot
    And I wait for "3" seconds
    Then I softly see "{SavedValue:BUDGETREDIRECTIONID}" on page "1" of "govgrants" pdf file
    Then I softly see "Approved" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    And I click on "Close" button for view files page
    And I click on "Amend Subaward" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    #292455
    When I click on "Delete" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | NA                |
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | NA                |
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | NA                |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I can see top right button "Undo" in page detail
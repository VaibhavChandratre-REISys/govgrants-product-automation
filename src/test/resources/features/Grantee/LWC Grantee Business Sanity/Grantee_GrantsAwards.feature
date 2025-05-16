@GranteeGrantsAwards
Feature: Validate all scenarios for Grants & Awards

  @456238 @ValidateGrantPOFOFDthePhasewiselevellistviewforGrant @P3_Grantee @PO_Grantee @GRegression2
  Scenario: Validate Grant PO FO FD the Phase wise level list view for Grant
    When I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    Then I softly see default toggle as "Grants - My Records" for table "---grantee_tableId:-:GrantsTable---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:GrantsTable---"
    When I click on parallel lines menu bar with data target value "Grants - My Records"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see toggle option "Grants - All" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Draft" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Active" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Rejected" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Closed" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - My Records" inside flex table id "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - All"
    And I wait for "3" seconds
    And I select value inside table "---grantee_tableId:-:GrantsTable---" is "5"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Active" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Active" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Closed/Completed" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Closed/Completed" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Cl" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Pending Closeout" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Terminated" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Terminated" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Active" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Active" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Rejected"
    When I perform quick search for "Terminated" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Terminated" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Closed"
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - My Records"
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"

  @456238_1 @ValidateGrantPOFOFDthePhasewiselevellistviewforGrant @P3_Grantee @FO_Grantee @GRegression2
  Scenario: Validate Grant PO FO FD the Phase wise level list view for Grant
    When I login to "As a Grantee" app as "GRANTEE FO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    Then I softly see default toggle as "Grants - My Records" for table "---grantee_tableId:-:GrantsTable---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:GrantsTable---"
    When I click on parallel lines menu bar with data target value "Grants - My Records"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see toggle option "Grants - All" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Draft" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Active" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Rejected" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Closed" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - My Records" inside flex table id "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - All"
    And I wait for "2" seconds
    Then I see "10" records inside flex table id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Active" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Active" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Closed/Completed" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Closed/Completed" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Cl" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Pending Closeout" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Terminated" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Terminated" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Active" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Active" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Rejected"
    When I perform quick search for "Terminated" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Terminated" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Closed"
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - My Records"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"

  @456238_2 @ValidateGrantPOFOFDthePhasewiselevellistviewforGrant @P3_Grantee @FD_Grantee @GRegression2
  Scenario: Validate Grant PO FO FD the Phase wise level list view for Grant
    When I login to "As a Grantee" app as "GRANTEE FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    Then I softly see default toggle as "Grants - My Records" for table "---grantee_tableId:-:GrantsTable---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:GrantsTable---"
    When I click on parallel lines menu bar with data target value "Grants - My Records"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see toggle option "Grants - All" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Draft" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Active" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Rejected" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Closed" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - My Records" inside flex table id "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - All"
    And I wait for "2" seconds
    Then I see "10" records inside flex table id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Active" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Active" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Closed/Completed" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Closed/Completed" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Cl" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Pending Closeout" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Terminated" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Terminated" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Active" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Active" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Rejected"
    When I perform quick search for "Terminated" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Terminated" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Closed"
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - My Records"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"

  @456280 @ValidateAwardPOFOFDthePhasewiselevellistviewforAward @PO_Grantee @P4_Grantee @GRegression2
  Scenario: Validate Award PO FO FD the Phase wise level list view for Award
    When I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    Then I softly see default toggle as "Awards - My Records" for table "---grantee_tableId:-:awardTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:awardTableId---"
    When I click on parallel lines menu bar with data target value "Awards - My Records"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see toggle option "Awards - All" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Draft" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Active" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Rejected" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Closed" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - My Records" inside flex table id "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - All"
    And I wait for "5" seconds
    And I select value inside table "---grantee_tableId:-:awardTableId---" is "5"
    When I perform quick search for "created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "created" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Activated" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Activated" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Review" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Submitted for Review" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Closed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Closed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Amended" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Amended" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Pending Closeout" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Pending Closeout" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Reviewed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    Then I softly see top right button "Advance Filter" inside flex table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - All"
    And I click toggle button to select "Awards - Draft"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Active"
    When I perform quick search for "Activated" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Activated" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Rejected"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Closed"
    When I perform quick search for "Closed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Closed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I wait for "2" seconds
    And I click toggle button to select "Awards - My Records"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:awardTableId---"

  @456280_1 @ValidateAwardPOFOFDthePhasewiselevellistviewforAward @FO_Grantee @P4_Grantee @GRegression2
  Scenario: Validate Award PO FO FD the Phase wise level list view for Award
    When I login to "As a Grantee" app as "GRANTEE FO" user
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    Then I softly see default toggle as "Awards - My Records" for table "---grantee_tableId:-:awardTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:awardTableId---"
    When I click on parallel lines menu bar with data target value "Awards - My Records"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see toggle option "Awards - All" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Draft" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Active" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Rejected" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Closed" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - My Records" inside flex table id "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - All"
    And I wait for "5" seconds
    And I select value inside table "---grantee_tableId:-:awardTableId---" is "5"
    When I perform quick search for "created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "created" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Activated" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Activated" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Review" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Submitted for Review" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Closed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Closed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Amended" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Amended" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Pending Closeout" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Pending Closeout" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Reviewed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    Then I softly see top right button "Advance Filter" inside flex table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - All"
    And I click toggle button to select "Awards - Draft"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Active"
    When I perform quick search for "Activated" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Activated" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Rejected"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Closed"
    When I perform quick search for "Closed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Closed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I wait for "2" seconds
    And I click toggle button to select "Awards - My Records"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"

  @456280_2 @ValidateAwardPOFOFDthePhasewiselevellistviewforAward @FD_Grantee @P4_Grantee @GRegression2
  Scenario: Validate Award PO FO FD the Phase wise level list view for Award
    When I login to "As a Grantee" app as "GRANTEE FD" user
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    Then I softly see default toggle as "Awards - My Records" for table "---grantee_tableId:-:awardTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:awardTableId---"
    When I click on parallel lines menu bar with data target value "Awards - My Records"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see toggle option "Awards - All" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Draft" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Active" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Rejected" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Closed" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - My Records" inside flex table id "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - All"
    And I wait for "5" seconds
    And I select value inside table "---grantee_tableId:-:awardTableId---" is "5"
    When I perform quick search for "created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "created" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Activated" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Activated" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Review" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Submitted for Review" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Closed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Closed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Amended" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Amended" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Pending Closeout" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Pending Closeout" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Reviewed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    Then I softly see top right button "Advance Filter" inside flex table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - All"
    And I click toggle button to select "Awards - Draft"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Active"
    When I perform quick search for "Activated" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Activated" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Rejected"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Closed"
    When I perform quick search for "Closed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Closed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I wait for "2" seconds
    And I click toggle button to select "Awards - My Records"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"

  @488680 @ValidatePOProfilewithnonownerNewbuttonunabletoseeonFinancialTransactionsubsection @P3_Grantee @PO_Grantee @GRegression2
  Scenario: Validate PO Profile with non owner New button unable to see on Financial Transaction sub section
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "As a Grantee" app as "GRANTEE PO" user
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
    When I navigate to "Actuals" sub tab
    Then I softly see "Drawdown By Award" page block displayed
    Given I expand nested table containing column value "Automation Permanent Focus Area"
    Then I softly see "Financial Transactions" page block displayed
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
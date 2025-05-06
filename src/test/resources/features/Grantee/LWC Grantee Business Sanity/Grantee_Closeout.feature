@GranteeCloseout
Feature: Validate all scenarios for closeout

  @456081 @ValidateCloseoutAdminPOFDFOListViewFunctionalitythelistviewfunctionalityverifythesession @GRegression2 @P4_Grantee @ADMIN_Grantee
  Scenario: Validate Closeout Admin PO FD FO List View Functionality the list view functionality & verify the session
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    And I navigate to "Closeout" tab
    And I wait for "2" seconds
    Then I softly see default toggle as "Project Period Closeout - My Records" for table "---grantee_tableId:-:phaseCloseoutTableId---"
    And I click toggle button to select "Project Period Closeout - Draft"
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I navigate to "Closeout" tab
    Then I softly see default toggle as "Project Period Closeout - Draft" for table "---grantee_tableId:-:phaseCloseoutTableId---"

  @456081_1 @ValidateCloseoutAdminPOFDFOListViewFunctionalitythelistviewfunctionalityverifythesession @GRegression2 @P4_Grantee @PO_Grantee
  Scenario: Validate Closeout Admin PO FD FO List View Functionality the list view functionality & verify the session
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Closeout" tab
    And I wait for "2" seconds
    Then I softly see default toggle as "Project Period Closeout - My Records" for table "---grantee_tableId:-:phaseCloseoutTableId---"
    And I click toggle button to select "Project Period Closeout - Draft"
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I navigate to "Closeout" tab
    Then I softly see default toggle as "Project Period Closeout - Draft" for table "---grantee_tableId:-:phaseCloseoutTableId---"

  @456081_2 @ValidateCloseoutAdminPOFDFOListViewFunctionalitythelistviewfunctionalityverifythesession @GRegression2 @P4_Grantee @FD_Grantee
  Scenario: Validate Closeout Admin PO FD FO List View Functionality the list view functionality & verify the session
    Given I login to "As a Grantee" app as "GRANTEE FD" user
    And I navigate to "Closeout" tab
    And I wait for "2" seconds
    Then I softly see default toggle as "Project Period Closeout - My Records" for table "---grantee_tableId:-:phaseCloseoutTableId---"
    And I click toggle button to select "Project Period Closeout - Draft"
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I navigate to "Closeout" tab
    Then I softly see default toggle as "Project Period Closeout - Draft" for table "---grantee_tableId:-:phaseCloseoutTableId---"

  @456081_3 @ValidateCloseoutAdminPOFDFOListViewFunctionalitythelistviewfunctionalityverifythesession @GRegression2 @P4_Grantee @FO_Grantee
  Scenario: Validate Closeout Admin PO FD FO List View Functionality the list view functionality & verify the session
    Given I login to "As a Grantee" app as "GRANTEE FD" user
    And I navigate to "Closeout" tab
    Then I softly see default toggle as "Project Period Closeout - My Records" for table "---grantee_tableId:-:phaseCloseoutTableId---"
    And I click toggle button to select "Project Period Closeout - Draft"
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I navigate to "Closeout" tab
    Then I softly see default toggle as "Project Period Closeout - Draft" for table "---grantee_tableId:-:phaseCloseoutTableId---"


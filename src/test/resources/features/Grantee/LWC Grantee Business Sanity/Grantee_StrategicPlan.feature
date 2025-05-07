@GranteeStrategicPlan
Feature: Validate all scenarios for Strategic Plan

  @476591 @validateAdminusercandeactivateactivestrategicplancreatedbyEXEuserfromsameinternalorganization @P2_Grantee @ADMIN_Grantee @GRegression2
  Scenario: Validate Admin user can Deactivate active Strategic plan created by EXE user from same internal organization
    Given I login to "As a Grantee" app as "GRANTEE EXE1" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "1" seconds
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I enter in modal value "Automation Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---grantee_tableId:-:Objectives---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Activities" as "Automation Test Description"
    When I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:objectivesSelectKPITableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    Then I softly see field "Status" as "Draft"
    And I save the field labeled "Strategic Plan" as "StrategicPlan"
    And I click on hyperlink containing value "{SavedValue:StrategicPlan}"
    When I navigate to "Related Log" sub tab
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    When I click on "View" icon for "{SavedValue:StrategicPlan}" inside flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I wait for "2" seconds
    When I click on "Activate" in the page details without processing
    And I wait for "2" seconds
    Then I softly see confirmation box with body "You will not be able to edit the Strategic Plan once it is active. Are you sure you want to continue?" is displayed
    And I wait for "2" seconds
    When I click modal button "OK"
    Then I softly see field "Status" as "Active"
    Then I see status in Progress-bar is "Active" and is "Dark Blue"
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN2" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    When I click on "View" icon for "{SavedValue:StrategicPlan}" inside flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I wait for "2" seconds
    When I click on "Deactivate" in the page details without processing
    And I wait for "2" seconds
    Then I softly see confirmation box with body "Are you sure, you want to deactivate?" is displayed
    And I wait for "2" seconds
    When I click modal button "OK"
    Then I softly see field "Status" as "Inactive"

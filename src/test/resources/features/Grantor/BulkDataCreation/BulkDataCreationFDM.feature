@GovGrantsSanityPreRequisiteCheck @regression
Feature: Validate Pre-requisiste check for Sanity/Regression

  @ApprovedFDMBulkRecordCreation
  Scenario: Competitive Type
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "default"
    When I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"

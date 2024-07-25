@globalSearch @grantor-regression @grantor-parallel-regression @regression @testSaran
Feature: Validate all scenarios for the global search

  @390386 @390389 @ValidateEXEuserisabletoseetheglobalsearchbarforanannouncement @sprint-2-US-386939 @GlobalSearch
  Scenario Outline: subrecipient organization ->Verify that user is able to expand the result by External S/R org module and Filter/Refine the the result by configured Columns for an External S/R org.
  |subrecipient Organization -> Verify that user redirect to that record when user click on any hyperlink provided (e.g. - Acc Name ) on objects after global search the any record for External S/R org.|
    When I login to "As a Grantor" app as "<User>" user
    And I select "Organizations" from dropdown for Global search
    And I perform quick search inside global search "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Account Name" inside table "Organizations"
    And I click on hyperlink for global search containing value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see page title contains as "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see field "Status" as "Active"
    And I select "Organizations" from dropdown for Global search
    And I perform quick search inside global search "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Account Name" inside table "Organizations"
    Then I softly see "Account Name" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "EIN" inside refine by filter
    Then I softly see "DUNS" inside refine by filter
    Then I softly see "Organization Type" inside refine by filter
    Then I softly see "Created Date" inside refine by filter
    Then I softly see "Agency Abbreviation" inside refine by filter
    Then I softly see "Executive Office" inside refine by filter
    And I refresh the page
    And I select "Organizations" from dropdown for Global search
    And I perform quick search inside global search "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see record count "3" for module "Organizations" on left navigation for global search

    Examples:
      | User  |
      | ADMIN |
#      | EXE   |
#      | PM    |

  @390405 @390408 @ValidateEXEuserisabletoseetheglobalsearchbarforanDeskReview @sprint-2-US-386939 @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Award Desk Review is in the Created, submit for review and sent to grantor state
  |Verify that Non-Owner user doesn't have an edit option in any stage of Award Desk Review and will get error message on page.|
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default" of type "Formula_By_Applicant_Focus_Area"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Formula_By_Applicant_Focus_Area"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    And I wait for "2" seconds
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---deskreview:-:deskReviewOwnerTableId---" by clicking "Edit" :
      | Responsibility | Name                     |
      | Owner          | {SavedValue:PM Username} |
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    #390420 #390428
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "SiteVisitReviewerRoles" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "Record Id"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly see field "Status" as "Created"
    #390410 #390428
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:PO Username}" inside flex table with id "SiteVisitReviewerRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    And I pause execution for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "Record Id"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    When I click on "Save" in the page details
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    And I pause execution for "5" seconds
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I can see top right button "Send to Subrecipient" in page detail
    Then I can see top right button "Undo" in page detail
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    Then I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    Then I softly see field "Status" as "Created"
    #390408 #390424
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390406 @ValidateEXEuserisabletoseetheglobalsearchbarforSiteVisit @sprint-2-US-386939 @GlobalSearch
  Scenario:Verify that the record owner is able to edit the access for record when Award site visit is in the Created, submit for review and sent to grantor state
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I pause execution for "3" seconds
    And I click modal button "Close"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    And I click on row level action button "Edit" against "{SavedValue:SitevVisitId}" in global search with id "Site Visits"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---deskreview:-:deskReviewOwnerTableId---" by clicking "Edit" :
      | Responsibility | Name                     |
      | Owner          | {SavedValue:PM Username} |
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    #390421 #390427
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "SiteVisitReviewerRoles" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "Record Id"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly see field "Status" as "Created"
    #390411 #390427
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:PO Username}" inside flex table with id "SiteVisitReviewerRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    And I pause execution for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "Record Id"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    When I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PO Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I softly see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I can see top right button "Undo" in page detail
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    And I collapse nested table containing column value "Automation Finding"
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    And I click on row level action button "Edit" against "{SavedValue:SitevVisitId}" in global search with id "Site Visits"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    And I click on row level action button "Edit" against "{SavedValue:SitevVisitId}" in global search with id "Site Visits"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---" without waiting for record
    And I click on "Accept and Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "dark blue"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    And I click on row level action button "Edit" against "{SavedValue:SitevVisitId}" in global search with id "Site Visits"
    Then I softly see field "Status" as "Created"
    #390409 #390425
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390415 @390418 @ValidateEXEuserisabletoseetheglobalsearchbarforSiteVisit @sprint-2-US-386939 @GlobalSearch
  Scenario:Verify that user is able to expand the result by award site visit module and Filter/Refine the the result by configured Columns for an award site visit.
  |Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID, S/R POC ) on objects after global search the any record for Award site visit.|
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I pause execution for "3" seconds
    And I click modal button "Close"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    Then I softly see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "Site Visits"
    And I perform quick search inside global search "Site Visits"
    #390430
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "Title" inside refine by filter
    Then I softly see "Visit Period" inside refine by filter
    Then I softly see "External Organization" inside refine by filter
    Then I softly see "MonitoringType" inside refine by filter
    Then I softly see "Subrecipient POC" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I refresh the page
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    Then I softly see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "Site Visits"
    And I click on hyperlink for global search containing value "{SavedValue:SitevVisitId}"
  #390418 #390432
    Then I softly see page title contains as "{SavedValue:Automation Runtime Award Desk Review}"

  @390416 @390419 @ValidateEXEuserisabletoseetheglobalsearchbarforDeskReview @sprint-2-US-386939 @GlobalSearch
  Scenario: Verify that user is able to expand the result by award desk review module and Filter/Refine the the result by configured Columns for an award desk review
  |Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID, S/R POC ) on objects after global search the any record for Award desk review.|
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default" of type "Formula_By_Applicant_Focus_Area"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Formula_By_Applicant_Focus_Area"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    And I wait for "2" seconds
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    Then I softly see value "{SavedValue:DeskReview}" for title "EGMS ID" inside table "Site Visits"
    And I perform quick search inside global search "Site Visits"
    #390429
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "Title" inside refine by filter
    Then I softly see "Visit Period" inside refine by filter
    Then I softly see "External Organization" inside refine by filter
    Then I softly see "MonitoringType" inside refine by filter
    Then I softly see "Subrecipient POC" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I refresh the page
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    Then I softly see value "{SavedValue:DeskReview}" for title "EGMS ID" inside table "Site Visits"
    And I click on hyperlink for global search containing value "{SavedValue:DeskReview}"
      #390419 #390431
    Then I softly see page title contains as "{SavedValue:Automation Runtime Award Desk Review}"

  @390454
  Scenario: Verify that Record owner can edit only the negotiation tab when application is in the review initiated state and negotiation is in the created state
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "3" seconds
    Then I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly can see "Negotiations" sub tab at view detail page
    And I navigate to "Negotiations" sub tab
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AppID"
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I select "Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AppID}"
    And I click on row level action button "Edit" against "{SavedValue:AppID}" in global search with id "Applications"
    When I click on "Save" in the page details
      #390454
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send to Subrecipient" in page detail
    Then I softly can see top right button "Cancel Negotiation" in page detail
    Then I softly can see top right button "Back to Current Review Step" in page detail
    And I click on hyperlink for global search containing value "{SavedValue:AppID}"
      #390457
    Then I softly see page title contains as "{SavedValue:Automation Runtime FDM Announcement}"
    And I select "Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AppID}"
    Then I softly see value "{SavedValue:AppID}" for title "EGMS ID" inside table "Applications"
    And I perform quick search inside global search "Applications"
      #390458
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Application Name" inside refine by filter
    Then I softly see "Announcement Name" inside refine by filter
    Then I softly see "External Organization" inside refine by filter
    Then I softly see "Application Due Date" inside refine by filter
    Then I softly see "Owner First Name" inside refine by filter
    Then I softly see "Owner Last Name" inside refine by filter
    Then I softly see "Submitted On" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I refresh the page
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I select "Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AppID}"
    And I click on row level action button "Edit" against "{SavedValue:AppID}" in global search with id "Applications"
      #390455
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390459
  Scenario: Verify that Record owner can edit only the negotiation tab when pre-application is in the submit to grantor state and negotiation is in the created state
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "2" seconds
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreAppID"
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I switch to tab number "1"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I switch to parent tab
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I select "Pre-Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:PreAppID}"
    And I click on hyperlink for global search containing value "{SavedValue:PreAppID}"
    #390459 #390461
    Then I softly see page title contains as "{SavedValue:Automation Runtime Announcement for Pre-App}"
    Then I softly can see top right button "Request Negotiation" in page detail
    Then I softly can see top right button "Accept" in page detail
    Then I softly can see top right button "Reject" in page detail
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    #390459
    Then I softly can see top right button "Edit" in page detail
    When I enter "Negotiation_Edit" values from "PreApplication_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---preApplication:-:negotiationFormTableId---" by clicking "Edit" :
      | Form Name                     | Needs Negotiation |
      | Standard Pre-Application form | Checked           |
    When I click on "Save" in the page details
    And  I wait for "2" seconds
    #390459
    Then I softly can see top right button "Send to Subrecipient" in page detail
    And I select "Pre-Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:PreAppID}"
    Then I softly see value "{SavedValue:PreAppID}" for title "EGMS ID" inside table "Pre-Applications"
    And I perform quick search inside global search "Pre-Applications"
    #390465
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Pre-Application Name" inside refine by filter
    Then I softly see "Announcement EGMS ID" inside refine by filter
    Then I softly see "External Organization" inside refine by filter
    Then I softly see "Pre-Application Due Date" inside refine by filter
    Then I softly see "Owner First Name" inside refine by filter
    Then I softly see "Owner Last Name" inside refine by filter
    Then I softly see "Status" inside refine by filter
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I select "Pre-Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:PreAppID}"
    And I click on row level action button "Edit" against "{SavedValue:PreAppID}" in global search with id "Pre-Applications"
     #390460
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390873
  Scenario: Subrecipient Contact-> Verify that the record owner and Admin is able to edit the access for record when Subrecipient contact is in the New, Invitation sent, Register, Active, Invitation Expired state
    When I login to "As a Grantor" app as "EXE" user
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{user:NewUser}"
    #390886
    Then I softly see "Full Name" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "Organization Name" inside refine by filter
    Then I softly see "Email" inside refine by filter
    Then I softly see "Phone" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I click on row level action button "Edit" against "{user:NewUser}" in global search with id "Contacts"
    #390873
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{user:InvitationSentUser}"
    And I click on row level action button "Edit" against "{user:InvitationSentUser}" in global search with id "Contacts"
     #390873
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{user:ActiveUser}"
    And I click on row level action button "Edit" against "{user:ActiveUser}" in global search with id "Contacts"
     #390873
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{user:InactiveUser}"
    And I click on row level action button "Edit" against "{user:InactiveUser}" in global search with id "Contacts"
     #390875
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    And I pause execution for "3" seconds
    When I click on top right button "New" in flex table with id "---home:-:subrecipientContactTableId---"
    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    And I refresh the page
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:Automation Runtime Contact}"
    And I click on hyperlink for global search containing value "{SavedValue:Automation Runtime Contact}"
    #390882
    Then I softly see page title contains as "{SavedValue:Automation Runtime Contact}"
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:Automation Runtime Contact}"
    And I click on hyperlink for global search containing value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    #390882
    Then I softly see page title contains as "{SavedValue:Automation Runtime Contact}"
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:Automation Runtime Contact}"
    And I click on hyperlink for global search containing value "{SavedValue:uniqueEmailID}"
    #390882
    Then I softly see page title contains as "{SavedValue:Automation Runtime Contact}"

  @393746 @ValidateEXEuserisabletoseetheglobalsearchbarforanannouncement @sprint-2-US-386939 @GlobalSearch @done
  Scenario: Verify that Column label should correctly displayed and clickable on that object when user global search any record by using EGMS ID or any keyword
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    And I wait for "2" seconds
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "Announcements"
    Then I softly see value "{SavedValue:Automation Runtime Competitive Announcement}" for title "Announcement Name" inside table "Announcements"
    Then I softly see value "" for title "Application Due Date" inside table "Announcements"
    Then I softly see value "Automation EXE" for title "Created By" inside table "Announcements"
    Then I softly see value "Created" for title "Status" inside table "Announcements"
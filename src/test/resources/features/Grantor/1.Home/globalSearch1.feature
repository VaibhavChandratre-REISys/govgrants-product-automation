@globalSearch @grantor-regression @grantor-parallel-regression @regression
Feature: Validate all scenarios for the global search

  @389538 @ValidateEXEuserisabletoseetheglobalsearchbarforanannouncement @sprint-2-US-386939 @hitesh @GlobalSearch
  Scenario: VerifythattherecordownerisabletoedittheaccessforrecordwhenCloseoutRequestisintheCreatedAcknowledgedbySRSenttoreviewReviewedOverriddenorinUnpublishedstate
  Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "closeoutRequestNo"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutRequestNo}"
    And I click on row level action button "Edit" against "{SavedValue:closeoutRequestNo}" in global search with id "Closeout"
    Then I softly see field "Status" as "Created"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:EXE Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutRequestNo}" in "---closeout:-:subrecpientPendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutRequestNo}" inside flex table with id "---closeout:-:subrecpientPendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutRequestNo}"
    And I click on row level action button "Edit" against "{SavedValue:closeoutRequestNo}" in global search with id "Closeout"
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date |
      | Automation PM | Fiscal Reviewer | Automation Description | 5        |
    When I click on "Send for Review" icon for "{SavedValue:PM Username}" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutRequestNo}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutRequestNo}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation PM" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---"
    And I wait for "3" seconds
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutRequestNo}"
    And I click on row level action button "Edit" against "{SavedValue:closeoutRequestNo}" in global search with id "Closeout"
    When I click on "Save" in the page details
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I wait for "3" seconds
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutRequestNo}"
    And I click on row level action button "Edit" against "{SavedValue:closeoutRequestNo}" in global search with id "Closeout"
    Then I softly see field "Status" as "Reviewed"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I wait for "3" seconds
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutRequestNo}"
    And I click on row level action button "Edit" against "{SavedValue:closeoutRequestNo}" in global search with id "Closeout"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail

  @389558 @VerifythatPeerreviewerhaveeditaccessforrecordonlywheneditaccesssettingisyesforpeerreviewerwhenCloseoutisasubmittedforreviewandReviewedstate @sprint-2-US-386939 @hitesh @GlobalSearch
  Scenario: Verify that Peer reviewer have edit access for record only when edit access setting is yes for peer reviewer when Closeout is a submitted for review and Reviewed state.
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name           | Closeout |
      | Automation EXE | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:CloseoutID}"
    And I click on row level action button "Edit" against "{SavedValue:CloseoutID}" in global search with id "Closeout"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | Automation PM | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    When I click on "Send for Review" icon for "{SavedValue:PM Username}" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:CloseoutID}"
    And I click on row level action button "Edit" against "{SavedValue:CloseoutID}" in global search with id "Closeout"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail

  @389644 @VerifythatuserisabletoexpandtheresultbyCloseoutandFilterRefinetheresultbyconfigureColumnsforanCloseout @sprint-2-US-386939 @hitesh @GlobalSearch
  Scenario: Verify that user is able to expand the result by Closeout and Filter/Refine the the result by configured Columns for an Closeout.
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I wait for "3" seconds
    And I navigate to "Closeout" tab
    And I select "Closeouts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:CloseoutID}"
    And I wait for "2" seconds
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "Funding Sources"
    And I perform quick search inside global search "Closeouts"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Title" inside refine by filter
    Then I softly see "Closeout" inside refine by filter
    Then I softly see "Grant EGMS ID" inside refine by filter
    Then I softly see "Project Name" inside refine by filter
    Then I softly see "Project Period" inside refine by filter
    Then I softly see "Created By" inside refine by filter
    Then I softly see "Status" inside refine by filter
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "Closeouts"
    Then I softly see value "{SavedValue:EXE Username}" for title "Created By" inside table "Closeouts"

  @389645 @VerifythatuserredirecttothatrecordwhenuserclickonanyhyperlinkprovidedEGMSIDGrantEGMSIDCreatedByonobjectsafterglobalsearchtheanyrecordf0orCloseout @sprint-2-US-386939 @hitesh @GlobalSearch
  Scenario: Verify that user redirect to that record when user click on any hyperlink provided (e.g. -EGMS ID, Grant EGMS ID, Created By) on objects after global search the any record for Closeout.
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I wait for "2" seconds
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "{SavedValue:closeoutID}"
    Then I softly see field "Status" as "Created"
    And I wait for "2" seconds
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "{SavedValue:EXE Username}"
    Then I softly see the text containing "{SavedValue:EXE Username}"

  @390081 @VerifythattherecordownerisabletoedittheaccessforrecordwhenFundingSourceisintheCreatedstate @sprint-2-US-386939 @hitesh @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Funding Source is in the Created state
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "FundingSourcesID"
    And I wait for "3" seconds
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    Then I softly can see row level action button "Change Owner" against "{SavedValue:FundingSourcesID}" in global search with id "Funding Sources"
    And I click on row level action button "Edit" against "{SavedValue:FundingSourcesID}" in global search with id "Funding Sources"
    And I wait for "2" seconds
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail

  @390082 @VerifythatNonOwneruserdoesnthaveaneditoptioninanystageofFundingsourcesandwillgeterrormessageonpage
  Scenario: Verify that Non-Owner user doesn't have an edit option in any stage of Funding sources and will get error message on page.
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - Draft"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "FundingSourcesID"
    Then I softly see field "Status" as "Created"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    And I click on row level action button "Edit" against "{SavedValue:FundingSourcesID}" in global search with id "Funding Sources"
    Then I softly see field "Status" as "Created"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - All"
    When I perform quick search for "{SavedValue:FundingSourcesID}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingSourcesID}" inside table
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    And I click on row level action button "Edit" against "{SavedValue:FundingSourcesID}" in global search with id "Funding Sources"
    Then I softly see field "Status" as "Activated"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - All"
    When I perform quick search for "{SavedValue:FundingSourcesID}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingSourcesID}" inside table
    When I click on "Deactivate" in the page details
    Then I softly see field "State" as "Closed"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    And I click on row level action button "Edit" against "{SavedValue:FundingSourcesID}" in global search with id "Funding Sources"
    Then I softly see field "State" as "Closed"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail

  @390084 @VerifythatuserisabletoexpandtheresultbyFundingSourceandFilterRefinethetheresultbyconfiguredColumnsforafundingSource @sprint-2-US-386939 @hitesh @GlobalSearch
  Scenario: Verify that user is able to expand the result by FundingSource and Filter/Refine the the result by configured Columns for a funding Source
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "FundingSourcesID"
    And I wait for "3" seconds
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    Then I softly see value "{SavedValue:FundingSourcesID}" for title "EGMS ID" inside table "Funding Sources"
    And I perform quick search inside global search "Funding Sources"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Title" inside refine by filter
    Then I softly see "Funding Source Type" inside refine by filter
    Then I softly see "Created By" inside refine by filter
    Then I softly see "Status" inside refine by filter
    Then I softly see value "{SavedValue:FundingSourcesID}" for title "EGMS ID" inside table "Funding Sources"
    Then I softly see value "{SavedValue:EXE Username}" for title "Created By" inside table "Funding Sources"

  @390085 @VerifythatuserredirecttothatrecordwhenuserclickonanyhyperlinkprovidedEGMSIDCreatedbyonobjectsafteglobalsearchtheanyrecordforFundingSources @sprint-2-US-386939 @hitesh @GlobalSearch
  Scenario: Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID, Created by ) on objects after global search the any record for Funding Sources.
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "FundingSourcesID"
    And I wait for "3" seconds
    And I wait for "2" seconds
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "{SavedValue:FundingSourcesID}"
    Then I softly see field "Status" as "Created"
    And I wait for "2" seconds
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "{SavedValue:FundingSourcesID}"
    Then I softly see the text containing "{SavedValue:FundingSourcesID}"

  @390107 @SubrecipientOrganizationVerifythattheAdminisabletoedittheaccessfororganizationwhenOrganizationiintheactivestate @sprint-2-US-386939 @hitesh @GlobalSearch
  Scenario: Subrecipient Organization -> Verify that the Admin is able to edit the access for organization when Organization is in the active state.
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Home" tab
    And I select "Organizations" from dropdown for Global search
    And I perform quick search inside global search "Automation Permanent Organization for Risk Assessment"
    And I click on row level action button "Edit" against "Automation Permanent Organization for Risk Assessment" in global search with id "Organizations"
    Then I softly see the text containing "Automation Permanent Organization for Risk Assessment"
    Then I softly see field "Status" as "Active"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail

  @390112 @SubrecipientOrganizationVerifythaNonwneruserdoesnthaveaneditoptioninanyOrganizationandwillgeterrormessageonpage @sprint-2-US-386939 @hitesh @GlobalSearch
  Scenario: Subrecipient Organization -> Verify that Non-owner user doesn't have an edit option in any Organization and will get error message on page.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    And I select "Organizations" from dropdown for Global search
    And I perform quick search inside global search "Automation Permanent Organization for Risk Assessment"
    And I click on row level action button "Edit" against "Automation Permanent Organization for Risk Assessment" in global search with id "Organizations"
    Then I softly see field "Status" as "Active"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390139 @390140 @VerifythattherecordownerisabletoedittheaccessforrecordwhenAmendmentisintheCreatedAcknowledgedstate @sprint-7-US-198153 @vaibhav @reassignment
  Scenario: Verify that the record owner is able to edit the access for record when Amendment is in the Created, Acknowledged state
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I wait for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Sent To Subrecipient"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    Then I softly see field "Status" as "Acknowledged"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Acknowledged"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Acknowledged"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Activated"
    And I pause execution for "10" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name           | Closeout |
      | Automation EXE | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    And I refresh the page
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Completed" and is "dark blue"
    And I wait for "4" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---closeout:-:grantsTableId---"
    Then I softly see field "Status" as "Closed/Completed"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I select "Amendment Requests" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Closed/Completed"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390145 @VerifythatuserisabletoexpandtheresultbyAmendmentmoduleandFilterRefinetheresultbyconfiguredColumnsforanAmendment @sprint-2-US-386939 @vaibhav @GlobalSearch
  Scenario: Verify that user is able to expand the result by Amendment module and Filter/Refine the the result by configured Columns for an Amendment
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I select "Amendment Requests" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    Then I softly see value "{SavedValue:budgetPChangeId}" for title "EGMS ID" inside table "Amendment Requests"
    And I perform quick search inside global search "Amendment Request"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Subaward ID" inside refine by filter
    Then I softly see "Subaward Title" inside refine by filter
    Then I softly see "Request Type" inside refine by filter
    Then I softly see "Initiated By" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I filter field record by "{SavedValue:budgetPChangeId}" by label "EGMS ID" in left panel for global search
    Then I softly see value "{SavedValue:budgetPChangeId}" for title "EGMS ID" inside table "Amendment Requests"
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Programs" on left navigation for global search
    Then I softly see the text "Grants" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search

  @390150 @VerifythatuserredirecttothatrecordwhenuserclickonanyhyperlinkprovidedegEGMSIDonobjectsafterglobalsearchtheanyrecordforamendment @sprint-2-US-386939 @vaibhav @GlobalSearch
  Scenario: Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID ) on objects after global search the any record for amendment.
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I select "Amendment Requests" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see the text containing "{SavedValue:budgetPChangeId}"
    Then I softly see field "Status" as "Created"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail





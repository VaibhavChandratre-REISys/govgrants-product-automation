@globalSearch @grantor-regression @grantor-parallel-regression @regression
Feature: Validate all scenarios for the global search

  @389538 @ValidateEXEuserisabletoseetheglobalsearchbarforanannouncement @sprint-2-US-386939 @hitesh @GlobalSearch
  Scenario: VerifythattherecordownerisabletoedittheaccessforrecordwhenCloseoutRequestisintheCreatedAcknowledgedbySRSenttoreviewReviewedOverriddenorinUnpublishedstate
  Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "Automation EXE" user
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date |
      | Automation PM | Fiscal Reviewer | Automation Description | 5        |
    When I click on "Send for Review" icon for "{SavedValue:PM Username}" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutRequestNo}"
    Then I softly can see row level action button "Edit" against "{SavedValue:closeoutRequestNo}" in flex table with id "Closeout"
    And I click on row level action button "Edit" against "{SavedValue:closeoutRequestNo}" in global search with id "Closeout"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation PM" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutRequestNo}"
    And I click on row level action button "Edit" against "{SavedValue:closeoutRequestNo}" in global search with id "Closeout"
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I wait for "3" seconds
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutRequestNo}"
    And I click on row level action button "Edit" against "{SavedValue:closeoutRequestNo" in global search with id "Closeout"
    Then I softly see field "Status" as "Reviewed"
    Then I cannot see top right button "Edit" in page detail
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I wait for "3" seconds
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutRequestNo}"
    And I click on row level action button "Edit" against "{SavedValue:closeoutRequestNo" in global search with id "Closeout"
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
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation PM" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:CloseoutID}"
    And I click on row level action button "Edit" against "{SavedValue:CloseoutID}" in global search with id "Closeout"
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:CloseoutID}"
    And I click on row level action button "Edit" against "{SavedValue:CloseoutID}" in global search with id "Closeout"
    Then I softly see field "Status" as "Reviewed"
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
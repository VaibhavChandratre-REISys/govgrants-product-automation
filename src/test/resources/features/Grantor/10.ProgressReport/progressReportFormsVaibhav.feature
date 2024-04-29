@grantor-regression @grantor-parallel-regression @progressReport @progressReportFormsVaibhav @regression
Feature: Validate scenarios in Progress Report Forms 

  @285223 @ValidateSF428BvalidationshouldbedisplayonparentformSF428ifchildformnotvalidatedbutselectyesonparentform @sprint-26-US-282679 @vaibhav @Forms @wip
  Scenario: Validate SF428 B validation should be display on parent form SF428 if child form not validated but select yes on parent form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "SF428B_2c_deselect" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Federal Award Identifier is required if "Request transfer to Award" is selected in the "2a. Federally-owned Property".                                                    |
      | One selection is required in "2c. Reports Residual Unused Supplies", If "1c" is checked in 'Report' section.                                                              |
      | Adding file is required in "Files section" with classification "Additional File for Comments", if 'Other' is checked in "2a. Federally-owned Property".                   |
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent" is required, If "1b " is checked in 'Report' section. |
    # SF-428
    And I close the tab
#    We don't have support for dropdown in form hence commented this step
#    And I select "Tangible Personal Property Report - SF-428" from dropdown at forms
#    When I click on "Edit" in the page details
    And I click on "Edit" icon for "Tangible Personal Property Report - SF-428" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "SF428_Form" values from "ProgressReport_Field_Values.xlsx"
    When I enter value "Unchecked" into field "AnnualReportSF428A__c"
    When I enter value "Unchecked" into field "FinalReportSF428B__c"
    When I enter value "Unchecked" into field "DispositionReportRequestSF428C__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    When I click on "Edit" in the page details
    When I enter value "Checked" into field "FinalReportSF428B__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Final (Award Closeout) Report (SF-428-B) is required to be submitted as it is selected in field 6 'Attachment'. |
    When I click on "Edit" in the page details
    When I enter value "Unchecked" into field "FinalReportSF428B__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    #Fill SF428-B Form
    And I close the tab
#    We don't have support for dropdown in form hence commented this step
#    And I select "Tangible Personal Property Report - Final Report - SF-428-B" from dropdown at forms
#    When I click on "Edit" in the page details
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "SF428B_Form" values from "ProgressReport_Field_Values.xlsx"
    And I enter "SF428B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
#    We don't have support for dropdown in form hence commented this step
#    And I select "Tangible Personal Property Report - SF-428" from dropdown at forms
    And I click on "View" icon for "Tangible Personal Property Report - SF-428" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Select the Final (Award Closeout) Report (SF-428-B) as required form is filled. |

  @280653 @ValidateSPIusercanseefieldReportsResidualUnusedSuppliesseefollowingoptionsunderthiieldonCompleterelevantsectionsofSF428Bform @sprint-25-US-280119 @vaibhav @Forms @BugLogged-281717 @wip
  Scenario: Validate SPI user can see field "Reports Residual Unused Supplies" & see following options under this field on Complete relevant section(s) of SF428B form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    When I enter value "1234" into field "FederalGrantIdentifyingNumbe__c"
    Then I softly see "a. Federally-owned Property (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2a below)" inside page block detail
    Then I softly see "b. Acquired Equipment with acquisition cost of $5,000 or more for which the awarding agency has reserved the right to transfer title (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2b below)" inside page block detail
    Then I softly see "c. Residual Unused Supplies with total aggregate fair market value exceeding $5,000 not needed for any other Federally sponsored programs or projects (Complete Section 2c below)" inside page block detail
    Then I softly see "d. None of the above" inside page block detail
    When I enter value "Checked" into field "ResidualUnusedSupplies__c"
    Then I softly see "2c. Reports Residual Unused Supplies" inside page block detail
    Then I softly see "Total Amount" inside page block detail
    Then I softly see "(ii) Percentage of Federal participation" inside page block detail
    Then I softly see "(iii) Federal Share" inside page block detail
    Then I softly see "(iv) Selling and handling allowance" inside page block detail
    Then I softly see fields "SaleProceedsrEstimateofCurrentFai__c" is in edit mode
    #TO DO: commented below step due to Logged the bug for below validation Bug ID:- 281717 once bug reolved will uncomment this step
#    Then I softly see that "Total Amount" rendered in view mode only
    Then I softly see fields "FederalShare__c" is in edit mode
    Then I softly see fields "SellingandHandlingAllowance__c" is in edit mode
    Then I softly see that "(v) Amount remitted to the Federal Government" rendered in view mode only
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | One selection is required in "2c. Reports Residual Unused Supplies", If "1c" is checked in 'Report' section.                            |
      | "Percentage of Federal participation" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section. |
      | "Federal share" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section.                       |
      | "Selling and handling allowance" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section.      |
    When I click on "Edit" in the page details
    And I enter value "(i) Sale Proceeds OR" into field "SaleProceedsrEstimateofCurrentFai__c"
    Then I softly see fields "TotalAmount__c" is in edit mode
    Then I softly see fields "FederalShare__c" is in edit mode
    Then I softly see fields "SellingandHandlingAllowance__c" is in edit mode
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | "Total Amount" is required in "2c. Reportable Residual Unused Supplies", if "1c" is checked in 'Report' section.                        |
      | "Percentage of Federal participation" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section. |
      | "Federal share" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section.                       |
      | "Selling and handling allowance" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section.      |
    When I click on "Edit" in the page details
    And I enter value "66" into field "TotalAmount__c"
    And I enter value "33" into field "PercentageofFederalParticipation__c"
    And I enter value "44" into field "FederalShare__c"
    And I enter value "11" into field "SellingandHandlingAllowance__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |

  @285156 @285161 @285162 @285163 @ValidateSF428BAddingfileisrequiredtypeSupplementalSheetSF428Srecipientequivalentisrequiredinall2optionsofAcquiredEquipmentwithcurrentfairmarketvalueoffieldwhen1bisselect1Reportsection @sprint-25-US-280119 @vaibhav @Forms @wip
  Scenario: Validate SF 428 B Adding file is required type Supplemental Sheet SF 428S or recipient equivalent" is required in" all 2 options of Acquired Equipment with current fair market value of field when 1b is select in 1 Report section
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    When I enter value "1234" into field "FederalGrantIdentifyingNumbe__c"
    When I enter value "Checked" into field "AcquiredEquipment__c"
    Then I softly see that "(i) Request transfer to Award" rendered in view mode only
    Then I softly see that "Federal Award Identifier" rendered in view mode only
    Then I softly see that "(ii) Request Federal Agency disposition instructions" rendered in view mode only
    Then I softly see that "(iii) Other (Provide detail in Block 3 or attach request)" rendered in view mode only
    Then I softly see fields "AcknowledgeEquipment__c" is in edit mode
    Then I softly see fields "RequestFederalAgencyDispositionInstr__c" is in edit mode
    When I enter value "Checked" into field "AcknowledgeEquipment__c"
    When I enter value "Checked" into field "RequestFederalAgencyDispositionInstr__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent" is required, If "1b " is checked in 'Report' section. |
    #285161
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I click on "Delete" icon for "2. Additional File for Comments" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I click on "Delete" icon for "1. Supplemental Sheet SF-428S or recipient equivalent" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see "No Records Found" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent" is required, If "1b " is checked in 'Report' section. |
    #285162
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    When I click on "Edit" in the page details
    When I enter value "Unchecked" into field "AcknowledgeEquipment__c"
    When I enter value "Unchecked" into field "RequestFederalAgencyDispositionInstr__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | One selection is required in "2b. Acquired Equipment with current fair market value of $5,000 or more", if "1b" is checked in 'Report' section. |
    #285163
    When I click on "Edit" in the page details
    When I enter value "Checked" into field "AcknowledgeEquipment__c"
    When I enter value "Checked" into field "RequestFederalAgencyDispositionInstr__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I click on "Delete" icon for "2. Additional File for Comments" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |

  @285271 @ValidateSF428BAddingfileisrequiredtypeAdditionalFileforCommentsisrequirediniiiotheroptionof2aFederallyOwnedPropertyfieldwhen1aisselectin11Reportsection @sprint-25-US-280119 @vaibhav @Forms @wip
  Scenario: Validate SF428 BAdding file is required type "Additional File for Comments", is required in (iii)other option of 2a. Federally Owned Property field when 1a is select in 1.1 Report section
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    When I enter value "1234" into field "FederalGrantIdentifyingNumbe__c"
    When I enter value "Checked" into field "FederallyownedProperty__c"
    Then I softly see "2a." inside page block detail
    Then I softly see "(i) Request transfer to Award" inside page block detail
    Then I softly see "Federal Award Identifier" inside page block detail
    Then I softly see "(ii) Request Federal Agency disposition instructions" inside page block detail
    Then I softly see "(iii) Other (Provide detail in Block 3 or attach request)" inside page block detail
    When I enter value "Checked" into field "Other__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Additional File for Comments", if 'Other' is checked in "2a. Federally-owned Property". |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    When I click modal button "Close"
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Additional File for Comments", if 'Other' is checked in "2a. Federally-owned Property". |

  @285300 @285303 @285304 @285305 @285306 @ValidateSF428BUsershouldnotseevalidationforAdditionalfileforcommentswhenfilesSupplementalSheetSF428Sequivalentrecipientisattacheweselect1st2ndoptionfrom2afieldif1aisselect @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SF428 B User should not see validation for Additional file for comments when files "Supplemental Sheet SF428S or equivalent recipient is attached if we select 1st 2nd option from 2a field if 1a is select
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    When I enter value "1234" into field "FederalGrantIdentifyingNumbe__c"
    When I enter value "Checked" into field "FederallyownedProperty__c"
    Then I softly see "2a." inside page block detail
    Then I softly see "(i) Request transfer to Award" inside page block detail
    Then I softly see "Federal Award Identifier" inside page block detail
    Then I softly see "(ii) Request Federal Agency disposition instructions" inside page block detail
    Then I softly see "(iii) Other (Provide detail in Block 3 or attach request)" inside page block detail
    Then I softly see that "(i) Acknowledge equipment acquired under this federal award will be retained for use as originally approved" rendered in view mode only
    Then I softly see that "(ii) Request Federal Agency disposition instructions" rendered in view mode only
    Then I softly see that "(ii) Request Federal Agency disposition instructions" rendered in view mode only
    Then I softly see that "Total Amount" rendered in view mode only
    Then I softly see that "(ii) Percentage of Federal participation" rendered in view mode only
    Then I softly see that "(iii) Federal Share" rendered in view mode only
    Then I softly see that "(iv) Selling and handling allowance" rendered in view mode only
    Then I softly see fields "RequestTransfertoAward__c" is in edit mode
    Then I softly see fields "FederalAwardIdentifier__c" is in edit mode
    Then I softly see fields "RequestFederalAgency__c" is in edit mode
    Then I softly see fields "Other__c" is in edit mode
    And I enter value "Checked" into field "RequestTransfertoAward__c"
    And I enter value "Test" into field "FederalAwardIdentifier__c"
    When I enter value "Checked" into field "RequestFederalAgency__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    When I click modal button "Close"
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #285303
    When I click on "Edit" in the page details
    When I enter value "Unchecked" into field "RequestFederalAgency__c"
    When I enter value "Unchecked" into field "RequestTransfertoAward__c"
    When I enter value "Checked" into field "Other__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I click on "Delete" icon for "1. Supplemental Sheet SF-428S or recipient equivalent" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see "No Records Found" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Additional File for Comments", if 'Other' is checked in "2a. Federally-owned Property". |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    When I click modal button "Close"
    And I wait for "6" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Additional File for Comments", if 'Other' is checked in "2a. Federally-owned Property". |
    #285304
    When I click on "Edit" in the page details
    When I enter value "Checked" into field "RequestTransfertoAward__c"
    And I enter value "11" into field "FederalAwardIdentifier__c"
    When I enter value "Unchecked" into field "RequestFederalAgency__c"
    When I enter value "Unchecked" into field "Other__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "3. Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #285305
    When I click on "Edit" in the page details
    When I enter value "Checked" into field "RequestTransfertoAward__c"
    And I enter value "11" into field "FederalAwardIdentifier__c"
    When I enter value "Checked" into field "RequestFederalAgency__c"
    When I enter value "Checked" into field "Other__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I click on "Delete" icon for "2. Additional File for Comments" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    And I wait for "6" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Additional File for Comments", if 'Other' is checked in "2a. Federally-owned Property". |
    #285306
    When I click on "Edit" in the page details
    When I enter value "Unchecked" into field "RequestTransfertoAward__c"
    When I enter value "Unchecked" into field "RequestFederalAgency__c"
    When I enter value "Checked" into field "Other__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I click on "Delete" icon for "1. Supplemental Sheet SF-428S or recipient equivalent" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Delete" icon for "3. Other" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see "No Records Found" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Additional File for Comments", if 'Other' is checked in "2a. Federally-owned Property". |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "3. Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Additional File for Comments", if 'Other' is checked in "2a. Federally-owned Property". |

  @285432 @285443 @285445 @285446 @ValidateSF428BUsershouldseevalidationwhenfilesSupplementalSheetSF428Sisnotattachedifweselect2ndoptionfrom2bfieldthengettingvalidationforSupplementalssheetif1bisselect @sprint-25-US-280119 @vaibhav @Forms @wip
  Scenario: Validate SF428 B User should see validation when files Supplemental Sheet SF428S is not attached & if we select 2nd option from "2b field then getting validation for Supplementals sheet if 1 b is select
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    When I enter value "1234" into field "FederalGrantIdentifyingNumbe__c"
    Then I softly see "a. Federally-owned Property (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2a below)" inside page block detail
    Then I softly see "b. Acquired Equipment with acquisition cost of $5,000 or more for which the awarding agency has reserved the right to transfer title (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2b below)" inside page block detail
    Then I softly see "c. Residual Unused Supplies with total aggregate fair market value exceeding $5,000 not needed for any other Federally sponsored programs or projects (Complete Section 2c below)" inside page block detail
    Then I softly see "d. None of the above" inside page block detail
    When I enter value "Checked" into field "AcquiredEquipment__c"
    Then I softly see that "(i) Request transfer to Award" rendered in view mode only
    Then I softly see that "Federal Award Identifier" rendered in view mode only
    Then I softly see that "(ii) Request Federal Agency disposition instructions" rendered in view mode only
    Then I softly see that "(iii) Other (Provide detail in Block 3 or attach request)" rendered in view mode only
    Then I softly see that "Total Amount" rendered in view mode only
    Then I softly see that "(ii) Percentage of Federal participation" rendered in view mode only
    Then I softly see that "(iii) Federal Share" rendered in view mode only
    Then I softly see that "(iv) Selling and handling allowance" rendered in view mode only
    Then I softly see fields "AcknowledgeEquipment__c" is in edit mode
    Then I softly see fields "RequestFederalAgencyDispositionInstr__c" is in edit mode
    And I enter value "Checked" into field "RequestFederalAgencyDispositionInstr__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "3. Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent" is required, If "1b " is checked in 'Report' section. |
    #285443
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I click on "Delete" icon for "1. Supplemental Sheet SF-428S or recipient equivalent" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent" is required, If "1b " is checked in 'Report' section. |
    #285445,285446
    When I click on "Edit" in the page details
    And I enter value "Unchecked" into field "RequestFederalAgencyDispositionInstr__c"
    And I enter value "Checked" into field "AcknowledgeEquipment__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    And I refresh the page
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent" is required, If "1b " is checked in 'Report' section. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I click on "Delete" icon for "1. Supplemental Sheet SF-428S or recipient equivalent" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    And I wait for "3" seconds
    Then I softly see value "2. Additional File for Comments" for title "Classification" inside table "---progressReport:-:sf428cFormAttachmentTableId---"
    Then I softly see value "3. Other" for title "Classification" inside table "---progressReport:-:sf428cFormAttachmentTableId---"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent" is required, If "1b " is checked in 'Report' section. |

  @285604 @ValidateSF428BUsershouldvalidateformwhenuserselect1a2bformfrom11sectionselectanyoneoptionfrom2aoneoptionfrom2bfieldselectrelatedfilesinfilessection @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SF428 BUser should validate form when user select 1a & 2b form from 1.1 section & select any one option from 2a & one option from 2b field & select related files in files section
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    When I enter value "1234" into field "FederalGrantIdentifyingNumbe__c"
    Then I softly see "a. Federally-owned Property (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2a below)" inside page block detail
    Then I softly see "b. Acquired Equipment with acquisition cost of $5,000 or more for which the awarding agency has reserved the right to transfer title (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2b below)" inside page block detail
    Then I softly see "c. Residual Unused Supplies with total aggregate fair market value exceeding $5,000 not needed for any other Federally sponsored programs or projects (Complete Section 2c below)" inside page block detail
    Then I softly see "d. None of the above" inside page block detail
    When I enter value "Checked" into field "FederallyownedProperty__c"
    When I enter value "Checked" into field "AcquiredEquipment__c"
    Then I softly see fields "RequestTransfertoAward__c" is in edit mode
    Then I softly see fields "FederalAwardIdentifier__c" is in edit mode
    Then I softly see fields "RequestFederalAgency__c" is in edit mode
    Then I softly see fields "Other__c" is in edit mode
    Then I softly see fields "AcknowledgeEquipment__c" is in edit mode
    Then I softly see fields "RequestFederalAgencyDispositionInstr__c" is in edit mode
    Then I softly see that "Total Amount" rendered in view mode only
    Then I softly see that "(ii) Percentage of Federal participation" rendered in view mode only
    Then I softly see that "(iii) Federal Share" rendered in view mode only
    Then I softly see that "(iv) Selling and handling allowance" rendered in view mode only
    And I enter value "Checked" into field "Other__c"
    And I enter value "Checked" into field "AcknowledgeEquipment__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "8" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    When I click on "Edit" in the page details
    When I enter value "Checked" into field "RequestTransfertoAward__c"
    When I enter value "Test" into field "FederalAwardIdentifier__c"
    When I enter value "Unchecked" into field "Other__c"
    When I enter value "Checked" into field "RequestFederalAgencyDispositionInstr__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I click on "Delete" icon for "2. Additional File for Comments" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    And I refresh the page
    And I wait for "8" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |

  @285605 @ValidateSF428BUsershouldvalidateformwhenuserselect1b2cformfrom11sectionselectanyoneoptionfrom2boneoptionfrom2cfieldselectrelatedfilesinfilessection @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SF428 B User should validate form when user select 1b 2c form from 1.1 section & select any one option from 2b & one option from 2c field & select related files in files section
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    When I enter value "1234" into field "FederalGrantIdentifyingNumbe__c"
    Then I softly see "a. Federally-owned Property (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2a below)" inside page block detail
    Then I softly see "b. Acquired Equipment with acquisition cost of $5,000 or more for which the awarding agency has reserved the right to transfer title (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2b below)" inside page block detail
    Then I softly see "c. Residual Unused Supplies with total aggregate fair market value exceeding $5,000 not needed for any other Federally sponsored programs or projects (Complete Section 2c below)" inside page block detail
    Then I softly see "d. None of the above" inside page block detail
    When I enter value "Checked" into field "AcquiredEquipment__c"
    When I enter value "Checked" into field "ResidualUnusedSupplies__c"
    Then I softly see that "(i) Request transfer to Award" rendered in view mode only
    Then I softly see that "Federal Award Identifier" rendered in view mode only
    Then I softly see that "(ii) Request Federal Agency disposition instructions" rendered in view mode only
    Then I softly see that "(iii) Other (Provide detail in Block 3 or attach request)" rendered in view mode only
    Then I softly see that "(iii) Other (Provide detail in Block 3 or attach request)" rendered in view mode only
    Then I softly see fields "AcknowledgeEquipment__c" is in edit mode
    Then I softly see fields "RequestFederalAgencyDispositionInstr__c" is in edit mode
    Then I softly see fields "SaleProceedsrEstimateofCurrentFai__c" is in edit mode
    Then I softly see fields "TotalAmount__c" is in edit mode
    Then I softly see fields "PercentageofFederalParticipation__c" is in edit mode
    Then I softly see fields "FederalShare__c" is in edit mode
    Then I softly see fields "SellingandHandlingAllowance__c" is in edit mode
    When I enter value "Checked" into field "RequestFederalAgencyDispositionInstr__c"
    When I enter value "(i) Sale Proceeds OR" into field "SaleProceedsrEstimateofCurrentFai__c"
    When I enter value "66" into field "TotalAmount__c"
    When I enter value "11" into field "PercentageofFederalParticipation__c"
    When I enter value "22" into field "FederalShare__c"
    When I enter value "44" into field "SellingandHandlingAllowance__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    When I click modal button "Close"
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    When I click on "Edit" in the page details
    When I enter value "Unchecked" into field "RequestFederalAgencyDispositionInstr__c"
    When I enter value "Checked" into field "AcknowledgeEquipment__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |

  @285606 @ValidateSF428BUsershouldvalidateformwhenuserselect1a1coptionfrom11sectionselectanyoneoptionfrom2aoneoptionfrom2cfieldselectrelatedfilesinfilessection @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SF428 B User should validate form when user select 1a & 1c option from 1.1 section & select any one option from 2a & one option from 2c field & select related files in files section
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    When I enter value "1234" into field "FederalGrantIdentifyingNumbe__c"
    Then I softly see "a. Federally-owned Property (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2a below)" inside page block detail
    Then I softly see "b. Acquired Equipment with acquisition cost of $5,000 or more for which the awarding agency has reserved the right to transfer title (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2b below)" inside page block detail
    Then I softly see "c. Residual Unused Supplies with total aggregate fair market value exceeding $5,000 not needed for any other Federally sponsored programs or projects (Complete Section 2c below)" inside page block detail
    Then I softly see "d. None of the above" inside page block detail
    When I enter value "Checked" into field "FederallyownedProperty__c"
    When I enter value "Checked" into field "ResidualUnusedSupplies__c"
    Then I softly see fields "RequestTransfertoAward__c" is in edit mode
    Then I softly see fields "RequestFederalAgency__c" is in edit mode
    Then I softly see fields "Other__c" is in edit mode
    When I enter value "Checked" into field "Other__c"
    Then I softly see that "Federal Award Identifier" rendered in view mode only
    When I enter value "(i) Sale Proceeds OR" into field "SaleProceedsrEstimateofCurrentFai__c"
    When I enter value "66" into field "TotalAmount__c"
    When I enter value "11" into field "PercentageofFederalParticipation__c"
    When I enter value "22" into field "FederalShare__c"
    When I enter value "44" into field "SellingandHandlingAllowance__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    When I click on "Edit" in the page details
    When I enter value "Unchecked" into field "Other__c"
    When I enter value "Checked" into field "RequestTransfertoAward__c"
    When I enter value "66" into field "FederalAwardIdentifier__c"
    When I enter value "Checked" into field "RequestFederalAgency__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I click on "Delete" icon for "2. Additional File for Comments" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see "No Records Found" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I refresh the page
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |

  @282676 @288908 @ValidateSF429eSPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonSF429form @sprint-26-US-282688 @vaibhav @Forms
  Scenario: Validate SF429 SPI user can able to save & validate form after entering correct & valid data on all fields present on SF-429 form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    # SF429-A Form
    And I click on "View" icon for "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I enter "SF429A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14k. NHPA" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Significant Change" from computer
    When I click modal button "Close"
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    # SF429-B Form
    And I click on "View" icon for "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF429B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14i. NHPA Description" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14h. Environmental Compliance Requirements" from computer
    When I click modal button "Close"
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    # SF429-C Form
    And I click on "View" icon for "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF429C_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14c. Proposed Use" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14g. Environmental Compliance Requirements" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14h. NHPA Description" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14i. Encumbered Parties" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Request Reasons" from computer
    When I click modal button "Close"
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    # SF429 Form
    And I click on "View" icon for "Real Property Status Report (Cover Page) - SF-429" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I enter "SF429_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    #288908
#    When I click on "Back" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name          | Progress Report |
      | Automation FO | Step 1          |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @282826 @288910 @ValidateSF429ASPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldpresentonSF429Aform @sprint-26-US-282688 @vaibhav @Forms
  Scenario: Validate SF429A SPI user can able to save & validate form after entering correct & valid data on all fields present on SF429A form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I enter "SF429A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14k. NHPA" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Significant Change" from computer
    When I click modal button "Close"
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #288910
#    When I click on "Back" in the page details
    And I close the tab
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name          | Progress Report |
      | Automation FO | Step 1          |
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"

  @282871 @ValidateSF429ASPIusercannotabletosavevalidateformafterenteringincorrectinvaliddataonallfieldspresentonSF429Aform @sprint-26-US-282688 @vaibhav @Forms
  Scenario: Validate SF429A SPI user can not able to save & validate form after entering incorrect invalid data on all fields present on SF429A form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I wait for "6" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Federal Grant or Other Identifying Number Assigned by Federal Agency (#2 on cover page) is required to save. |
      | Street1 is required to save.                                                                                 |
      | City is required to save.                                                                                    |
      | State is required to save.                                                                                   |
      | ZIP / Postal Code is required to save.                                                                       |
    And I enter "SF429A_Form_incorrect_data" values from "ProgressReport_Field_Values.xlsx"
    And I wait for "10" seconds
    When I click on "Save" in the page details
#    And I wait for "3" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | The Gross Amount cannot be less than zero.                                                                                                   |
      | The Usable Amount cannot be less than zero.                                                                                                  |
      | The Land Acreage Amount cannot be less than zero.                                                                                            |
      | Federal Share cannot be less than zero.                                                                                                      |
      | Non Federal Share cannot be less than zero.                                                                                                  |
      | Federal Percentage cannot be less than zero.                                                                                                 |
      | Non Federal Percentage cannot be less than zero.                                                                                             |
      | The Amount of Funds in "16 (i)" section cannot be less than zero.                                                                            |
      | The Amount in "16 (ii)" section cannot be less than zero.                                                                                    |
      | The Amount of funds in "16 (iii)" section cannot be less than zero.                                                                          |
      | Value in "Electric" cannot be less than zero.                                                                                                |
      | Value in "Btu" cannot be less than zero.                                                                                                     |
      | Value in "Petroleum" cannot be less than zero.                                                                                               |
      | Value in "Natural Gas" cannot be less than zero.                                                                                             |
      | Value in "Other" cannot be less than zero.                                                                                                   |
      #Below Is the Framework side logged bug Bug Id:- 321742 Once this resolved update the error message
      | If \"Other\" is selected in \"Real Property Ownership Type\", Description is required.                                                       |
      | If "Yes" is selected in section 14g, Describing the Instrument used is mandatory.                                                            |
      | If "Yes" is selected in section 14g, Date is mandatory.                                                                                      |
      | If "Yes" is selected in section 14g, Entering the Jurisdiction is mandatory.                                                                 |
      | If "Other" option is selected in section 17, Justification in specify is required.                                                           |
      | Unit type is required, if amount entered in "14c. Land Acreage Amount".                                                                      |
      | Unit type required, if amount entered in "14d. Gross and Usable Square Footage/Meters".                                                      |
      | Values can only be entered against the Electric (KWh) or Electric (Btu).                                                                     |
      | Please enter Zip code in the Zip + 4 codes format (e.g. 12345-1234) in the 'Zip / Postal code' field.                                        |
      | Adding file is required in "Files section" with classification "Environmental Compliance Requirements", if "Yes" option in "14j" is checked. |
      | Adding file is required in "Files section" with classification "NHPA", if "Yes" option in "14k" is checked.                                  |
      | Adding file is required in "Files section", if "Yes" option in "15" checked.                                                                 |

  @282918 @288917 @ValidateSF429BSPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonSF429Bform @sprint-26-US-282693 @vaibhav @Forms
  Scenario: Validate SF429B SPI user can able to save & validate form after entering correct & valid data on all fields present on SF429B form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I enter "SF429B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14i. NHPA Description" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14h. Environmental Compliance Requirements" from computer
    When I click modal button "Close"
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #288917
#    When I click on "Back" in the page details
    And I close the tab
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name          | Progress Report |
      | Automation FO | Step 1          |
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"

  @282920 @ValidateSF429BSPIusercannotabletosavevalidateformafterenteringincorrectinvaliddataonallfieldspresentonSF429Bform @sprint-26-US-282693 @vaibhav @Forms
  Scenario: Validate SF429B SPI user cannot able to save & validate form after entering incorrect & invalid data on all fields present on SF429B form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Federal Grant or Other Identifying Number Assigned by Federal Agency (#2 on cover page) is required to save. |
      | Street1 is required to save.                                                                                 |
      | City is required to save.                                                                                    |
      | State is required to save.                                                                                   |
      | ZIP / Postal Code is required to save.                                                                       |
    And I enter "SF429B_Form_incorrect_data" values from "ProgressReport_Field_Values.xlsx"
    And I wait for "3" seconds
    When I click on "Save" in the page details
#    And I wait for "3" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | If "Other" option is selected in "14k", Justification in specify is required.                                                                |
      | If "Other" option is selected in "14l", Justification in specify is required.                                                                |
      | If \"Other\" is selected in \"Real Property Ownership Type\", Description is required.                                                       |
      | Unit type is required, if amount entered in "14d. Land Acreage or Square Units".                                                             |
      | Unit type is required, if amount entered in "14e. Gross and Usable Square Footage/Meters".                                                   |
      | Values can only be entered against the Electric (KWh) or Electric (Btu) in section "14k"                                                     |
      | Values can only be entered against the Electric (KWh) or Electric (Btu) in section "14l"                                                     |
      | Please enter Zip code in the Zip + 4 codes format (e.g. 12345-1234) in the 'Zip / Postal code' field.                                        |
      | Federal Percentage cannot be less than zero.                                                                                                 |
      | Non Federal Percentage cannot be less than zero.                                                                                             |
      | The Land Acreage Amount cannot be less than zero.                                                                                            |
      | The Gross Amount cannot be less than zero.                                                                                                   |
      | The Usable Amount cannot be less than zero.                                                                                                  |
      | Federal Share cannot be less than zero.                                                                                                      |
      | Non Federal Share cannot be less than zero.                                                                                                  |
      | Value in "Electric" in "14k" cannot be less than zero.                                                                                       |
      | Value in "Btu" in "14k" cannot be less than zero.                                                                                            |
      | Value in "Petroleum" in "14k" cannot be less than zero.                                                                                      |
      | Value in "Natural Gas" in "14k" cannot be less than zero.                                                                                    |
      | Value in "Other" in "14k" cannot be less than zero.                                                                                          |
      | Value in "Electric" in "14l" cannot be less than zero.                                                                                       |
      | Value in "Btu" in "14l" cannot be less than zero.                                                                                            |
      | Value in "Petroleum" in "14l" cannot be less than zero.                                                                                      |
      | Value in "Natural Gas" in "14l" cannot be less than zero.                                                                                    |
      | Value in "Other" in "14l" cannot be less than zero.                                                                                          |
      | Adding file is required in "Files section" with classification "Environmental Compliance Requirements", if "Yes" option in "14h" is checked. |
      | Adding file is required in "Files section" with classification "NHPA", if "Yes" option in "14i" is checked.                                  |
    When I click on "Edit" in the page details
    And I enter value "200" into field "FederalSharePercentage__c"
    And I enter value "300" into field "Non_FederalSharePercentage__c"
    And I wait for "3" seconds
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Federal Share Percentage must be equal to or less than 100%.     |
      | Non-Federal Share Percentage must be equal to or less than 100%. |

  @282930 @288918 @ValidateSF429CSPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonSF429Cform @sprint-26-US-282693 @vaibhav @Forms
  Scenario: Validate SF429C SPI user can able to save & validate form after entering correct & valid data on all fields present on SF-429C form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I enter "SF429C_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14c. Proposed Use" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14g. Environmental Compliance Requirements" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14h. NHPA Description" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14i. Encumbered Parties" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Request Reasons" from computer
    When I click modal button "Close"
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #288918
#    When I click on "Back" in the page details
    And I close the tab
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name          | Progress Report |
      | Automation FO | Step 1          |
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"

  @282921 @ValidateSF429CSPIusercannotabletosavevalidateformafterenteringincorrectinvaliddataonallfieldpresentonSF429Cform @sprint-26-US-282693 @vaibhav @Forms
  Scenario: Validate SF429C SPI user cannot able to save & validate form after entering incorrect & invalid data on all fields present on SF-429C form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I wait for "6" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Federal Grant or Other Identifying Number Assigned by Federal Agency (#2 on cover page) is required to save. |
      | Street 1 is required to save.                                                                                |
      | City is required to save.                                                                                    |
      | State is required to save.                                                                                   |
      | Zip Code is required to save.                                                                                |
    And I enter "SF429C_Form_incorrect_data" values from "ProgressReport_Field_Values.xlsx"
    And I wait for "6" seconds
    When I click on "Save" in the page details
#    And I wait for "3" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Unit type is required, if amount entered in " 13c. Land Acreage or Square Units ".                                                           |
      | Unit type is required, if amount entered in " 13d. Gross and Usable Square Footage/Meters ".                                                 |
      | Federal Percentage cannot be less than zero.                                                                                                 |
      | Non Federal Percentage cannot be less than zero.                                                                                             |
      | The Land Acreage Amount cannot be less than zero.                                                                                            |
      | The Gross Amount cannot be less than zero.                                                                                                   |
      | The Usable Amount cannot be less than zero.                                                                                                  |
      | Federal Share cannot be less than zero.                                                                                                      |
      | Non Federal Share cannot be less than zero.                                                                                                  |
      | Adding file is required in "Files section" with classification "Environmental Compliance Requirements", if "Yes" option in "14g" is checked. |
      | Adding file is required in "Files section" with classification "NHPA", if "Yes" option in "14h" is checked.                                  |
      | Adding file is required in "Files section" with classification "Proposed Use", if "Yes" option in "14c" is checked.                          |
      | Adding file is required in "Files section" with classification "Encumbered Parties" ,if "Yes" option in "14i" is checked.                    |
      | Adding file is required in "Files section" with classification "Request Reason", if "Yes" option in "15" is checked.                         |
      | Please enter Zip code in the Zip + 4 codes format (e.g. 12345-1234) in the 'Zip / Postal code' field.                                        |
    When I click on "Edit" in the page details
    And I enter value "200" into field "FederalSharePercentage__c"
    And I enter value "300" into field "Non_FederalSharePercentage__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Federal Share Percentage must be equal to or less than 100%.     |
      | Non-Federal Share Percentage must be equal to or less than 100%. |

  @282701 @298878 @ValidateSF429SPIusercannotabletosaveallfieldsbutvalidationisgeneratedonvalidatebuttonafterenteringincorrectdatainallfieldspresentonSF429form @sprint-26-US-282688 @vaibhav @Forms
  Scenario: Validate SF429 SPI user cannot able to save all fields but validation is generated on validate button after entering incorrect data in all fields present on SF429 form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Real Property Status Report (Cover Page) - SF-429" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | 1. Federal Agency and Organizational Element to Which Report is Submitted is required to save.          |
      | 2. Federal Grant(s) or Other Identifying Number(s) Assigned by Federal Agency(ies) is required to save. |
      | Recipient Organization Name is required to save.                                                        |
      | Street1 is required to save.                                                                            |
      | City is required to save.                                                                               |
      | State is required to save.                                                                              |
      | ZIP / Postal Code is required to save.                                                                  |
      | First Name is required to save.                                                                         |
      | Last Name is required to save.                                                                          |
      | Email is required to save.                                                                              |
      | Phone is required to save.                                                                              |
      | First Name is required to save.                                                                         |
      | Last Name is required to save.                                                                          |
      | Title is required to save.                                                                              |
      | 11b. Signature of Authorized Certifying Official is required to save.                                   |
      | 11c. Telephone(area code,number, extension) of Authorized Certifying Official is required to save.      |
      | 11d. Email Address of Authorized Certifying Official is required to save.                               |
      | 11e. Date report submitted (MM/DD/YYYY) is required to save.                                            |
    And I enter values into fields
      | Value            | Field                                       |
      | 1234             | FederalAgencyandOrganizationalSF429__c |
      | Health           | FederalGrantIdentifyingNumberSF429__c  |
      | Automation Org   | RecipientOrganizationNameSF429__c      |
      | 123              | Street1SF428__c                        |
      | New York         | CitySF428__c                           |
      | NY: New York     | StateSf428__c                          |
      | 12345            | ZipPostalCodeSF428__c                  |
      | John             | FirstNameSF428__c                      |
      | Matthew          | LastNameSF428__c                       |
      | john@yopmail.com | EmailAddress__c                        |
      | 9786903473       | Telephone__c                           |
      | Checked          | AttachmentA__c                         |
      | Checked          | AttachmentB__c                         |
      | Checked          | AttachmentC__c                         |
      | John             | TypeorPrintedFirstName__c              |
      | Matthew          | TypeorPrintedLastName__c               |
      | Associate        | TypeorPrintedTitle__c                  |
      | John Matthew     | SubmittedBySF428__c                    |
      | 9786903473       | Telephone2__c                          |
      | auto@yopmail.com | EmailAddress2__c                       |
      | 0                | DateReportSubmittedSF428__c            |
    When I click on "Save" in the page details
    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Certify the Real Property Status Report (Cover Page)-SF-429 by checking the Acknowledgment Box before submitting to Grantor. |
      | Please enter Zip code in the Zip + 4 codes format (e.g. 12345-1234) in the 'Zip / Postal code' field.                        |
      | Request to Acquire, Improve or Furnish (SF-429-B) is required to be submitted as it is selected in field 8 'Attachment'.     |
      | Disposition Request (SF-429-C) is required to be submitted as it is selected in field 8 'Attachment'.                        |
      | General Reporting (SF-429-A) is required to be submitted as it is selected in field 8 'Attachment'.                          |
    #298878
#    When I click on "Back" in the page details
    And I close the tab
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name          | Progress Report |
      | Automation FO | Step 1          |
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"

  @298928 @298929 @282025 @ValidateSF429thatuserwillseeAttachmentsSectionAttachmentABCcheckbox @sprint-26-US-282688 @vaibhav @Forms
  Scenario: Validate SF 429 that user will see Attachments Section-Attachment A,B,C check box
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Real Property Status Report (Cover Page) - SF-429" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "SF429_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Request to Acquire, Improve or Furnish (SF-429-B) is required to be submitted as it is selected in field 8 'Attachment'. |
      | Disposition Request (SF-429-C) is required to be submitted as it is selected in field 8 'Attachment'.                    |
      | General Reporting (SF-429-A) is required to be submitted as it is selected in field 8 'Attachment'.                      |
    And I close the tab
    # SF429-A Form
    And I click on "View" icon for "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I enter "SF429A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14k. NHPA" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Significant Change" from computer
    When I click modal button "Close"
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    # SF429-B Form
    And I click on "View" icon for "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF429B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14i. NHPA Description" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14h. Environmental Compliance Requirements" from computer
    When I click modal button "Close"
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    # SF429-C Form
    And I click on "View" icon for "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF429C_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14c. Proposed Use" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14g. Environmental Compliance Requirements" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14h. NHPA Description" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14i. Encumbered Parties" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Request Reasons" from computer
    When I click modal button "Close"
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    # SF429 Form
    And I click on "View" icon for "Real Property Status Report (Cover Page) - SF-429" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    When I enter value "Unchecked" into field "AttachmentA__c"
    When I enter value "Unchecked" into field "AttachmentB__c"
    When I enter value "Unchecked" into field "AttachmentC__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Select the General Reporting (SF-429-A) as required form is filled.                      |
      | Select the Request to Acquire, Improve or Furnish (SF-429-B) as required form is filled. |
      | Select the Disposition Request (SF-429-C) as required form is filled.                    |

  @297940 @298087 @Validatesf429userwillseerecipientaccountandIdentifyingfieldvalidationsuponclickonsavebuttonifkeptblank @sprint-4-US-295000 @vaibhav @Forms
  Scenario: Validate sf 429 user will see recipient account and Identifying no field validations upon click on save button if kept blank
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Real Property Status Report (Cover Page) - SF-429" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "SF429_Form" values from "ProgressReport_Field_Values.xlsx"
    And I clear the value from field "RecipientAccountNumber__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | 5. Recipient Account or Identifying Number is required to save. |
    When I enter value "12345" into field "RecipientAccountNumber__c"
    When I enter value "Unchecked" into field "AcknowledgementSF428__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    #298087
    Then I softly see the following messages in the page details :
      | Certify the Real Property Status Report (Cover Page)-SF-429 by checking the Acknowledgment Box before submitting to Grantor. |

  @288253 @288898 @ValidateSF271SPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonSF271form @sprint-1-US-282698 @vaibhav @Forms
  Scenario: Validate SF271 SPI user can able to save & validate form after entering correct & valid data on all fields present on SF271 form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    Then I softly see the text containing "OMB Number: 4040–0011"
    Then I softly see the text containing "Expiration Date: 01/31/2025"
    And I click on "Edit" in the page details
    And I enter "SF271_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I edit the following rows inline in flex table with id "---progressReport:-:sf271FormTableId---" by clicking "Edit" :
      | Classification                                       | Programs | Functions | Activities |
      | a. Administrative expense                            | 12345    | 12345     | 12345      |
      | b. Preliminary expense                               | 12345    | 12345     | 12345      |
      | c. Land, structures, right-of-way                    | 12345    | 12345     | 12345      |
      | d. Architectural engineering basic fees              | 12345    | 12345     | 12345      |
      | e. Other architectural engineering fees              | 12345    | 12345     | 12345      |
      | f. Project inspection fees                           | 12345    | 12345     | 12345      |
      | g. Land development                                  | 12345    | 12345     | 12345      |
      | h. Relocation expense                                | 12345    | 12345     | 12345      |
      | i. Relocation payments to individuals and businesses | 12345    | 12345     | 12345      |
      | j. Demolition and removal                            | 12345    | 12345     | 12345      |
      | k. Construction and project improvement cost         | 12345    | 12345     | 12345      |
      | l. Equipment                                         | 12345    | 12345     | 12345      |
      | m. Miscellaneous cost                                | 12345    | 12345     | 12345      |
      | o. Deductions for program income                     | 12345    | 12345     | 12345      |
      | q. Federal share to date                             | 12345    | 12345     | 12345      |
      | r. Rehabilitation grants (100% reimbursement)        | 12345    | 12345     | 12345      |
      | t. Federal payments previously requested             | 12345    | 12345     | 12345      |
      | u. Amount requested for reimbursement                | 12345    | 12345     | 12345      |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #288898
#    When I click on "Back" in the page details
    And I close the tab
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name          | Progress Report |
      | Automation FO | Step 1          |
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"

  @288257 @ValidateSF271SPIusercannotabletosavevalidateformafterenteringincorrectinvaliddataonallfieldspresentonSF271form @sprint-1-US-282698 @vaibhav @Forms
  Scenario: Validate SF271 SPI user can not able to save & validate form after entering incorrect &in valid data on all fields present on SF-271 form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    Then I softly see the text containing "OMB Number: 4040–0011"
    Then I softly see the text containing "Expiration Date: 01/31/2025"
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | 1. Type of Request is required to save.                                                                        |
      | 2. Basis of Request is required to save.                                                                       |
      | 3. Federal Sponsoring Agency and Organizational Element to Which This Report Is Submitted is required to save. |
      | From is required to save.                                                                                      |
      | To is required to save.                                                                                        |
      | Street1 is required to save.                                                                                   |
      | City is required to save.                                                                                      |
      | State is required to save.                                                                                     |
      | ZIP / Postal Code is required to save.                                                                         |
      | Street1 is required to save.                                                                                   |
      | City is required to save.                                                                                      |
      | State is required to save.                                                                                     |
      | ZIP / Postal Code is required to save.                                                                         |
      | Signature of Authorized Certifying Official is required to save.                                               |
      | Submitted On : is required to save.                                                                            |
      | Signature of Authorized Certifying Official is required to save.                                               |
      | Date Request Submitted is required to save.                                                                    |
    And I enter "SF271_incorrect_data" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---progressReport:-:sf271FormTableId---" by clicking "Edit" :
      | Classification                                       | Programs | Functions | Activities |
      | a. Administrative expense                            | -12345   | -12345    | -12345     |
      | b. Preliminary expense                               | -12345   | -12345    | -12345     |
      | c. Land, structures, right-of-way                    | -12345   | -12345    | -12345     |
      | d. Architectural engineering basic fees              | -12345   | -12345    | -12345     |
      | e. Other architectural engineering fees              | -12345   | -12345    | -12345     |
      | f. Project inspection fees                           | -12345   | -12345    | -12345     |
      | g. Land development                                  | -12345   | -12345    | -12345     |
      | h. Relocation expense                                | -12345   | -12345    | -12345     |
      | i. Relocation payments to individuals and businesses | -12345   | -12345    | -12345     |
      | j. Demolition and removal                            | -12345   | -12345    | -12345     |
      | k. Construction and project improvement cost         | -12345   | -12345    | -12345     |
      | l. Equipment                                         | -12345   | -12345    | -12345     |
      | m. Miscellaneous cost                                | -12345   | -12345    | -12345     |
      | o. Deductions for program income                     | -12345   | -12345    | -12345     |
      | q. Federal share to date                             | -12345   | -12345    | -12345     |
      | r. Rehabilitation grants (100% reimbursement)        | -12345   | -12345    | -12345     |
      | t. Federal payments previously requested             | -12345   | -12345    | -12345     |
      | u. Amount requested for reimbursement                | -12345   | -12345    | -12345     |
    Then I softly see the following messages in the page details :
      | The amount cannot be less than zero. |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---progressReport:-:sf271FormTableId---" by clicking "Edit" :
      | Classification                                       | Programs | Functions | Activities |
      | a. Administrative expense                            | 12345    | 12345     | 12345      |
      | b. Preliminary expense                               | 12345    | 12345     | 12345      |
      | c. Land, structures, right-of-way                    | 12345    | 12345     | 12345      |
      | d. Architectural engineering basic fees              | 12345    | 12345     | 12345      |
      | e. Other architectural engineering fees              | 12345    | 12345     | 12345      |
      | f. Project inspection fees                           | 12345    | 12345     | 12345      |
      | g. Land development                                  | 12345    | 12345     | 12345      |
      | h. Relocation expense                                | 12345    | 12345     | 12345      |
      | i. Relocation payments to individuals and businesses | 12345    | 12345     | 12345      |
      | j. Demolition and removal                            | 12345    | 12345     | 12345      |
      | k. Construction and project improvement cost         | 12345    | 12345     | 12345      |
      | l. Equipment                                         | 12345    | 12345     | 12345      |
      | m. Miscellaneous cost                                | 12345    | 12345     | 12345      |
      | o. Deductions for program income                     | 12345    | 12345     | 12345      |
      | q. Federal share to date                             | 12345    | 12345     | 12345      |
      | r. Rehabilitation grants (100% reimbursement)        | 12345    | 12345     | 12345      |
      | t. Federal payments previously requested             | 45       | 12        | 23         |
      | u. Amount requested for reimbursement                | 35       | 13        | 12         |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Amount requested for reimbursement" should be same as the difference between the amounts of Line s and t. if different, adding file is required with classification "11.u.Amount requested for reimbursement. |
      | The Percentage cannot be less than zero.                                                                                                                                                                      |
      | Certify the Outlay Report and Request for Reimbursement for Construction Programs-SF-271 by checking the Acknowledgment Box before submitting to Grantor.                                                     |
      | Please enter Zip code in the Zip + 4 codes format (e.g. 12345-1234) in the 'Zip / Postal code' field.                                                                                                         |
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter value "Final" into field "TypeOfRequest__c"
    And I enter value "Cash" into field "BasisOfRequest__c"
    And I enter value "200" into field "ProgramPercentage__c"
    And I enter value "300" into field "FunctionPercentage__c"
    And I enter value "400" into field "ActivityPercentage__c"
    And I enter value "500" into field "TotalPercentage271__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Percentage must equal to 100 or less than 100 is required to save. |

  @286657 @286504 @286519 @286672 @ValidateEXEusercanseeallbelowformsunderGrantorprogressReportareflowfromInternalProgramtoAnnouncementwhenweareusingsameprogramforcreatingAnnouncement @sprint-1-US-278368 @vaibhav @Forms @Buglogged-339404
  Scenario: Validate EXE user can see all below forms under Grantor progress Report are flow from Internal Program to Announcement when we are using same program for creating Announcement
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    Then I can see row level action button "Preview" against "Grantor Progress Report Forms" in flex table with id "---program:-:businessFormTableId---"
    Then I can see row level action button "Edit" against "Grantor Progress Report Forms" in flex table with id "---program:-:businessFormTableId---"
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside table
    And I select value inside table "---program:-:previewPackageTableId---" is "All"
    Then I softly see total records count "Total Records: 13" in flex table "---program:-:previewPackageTableId---"
    And I perform quick search for "Community Initiative Progress Report" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Community Initiative Progress Report" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Progress Report" for title "Report Type" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "23" for title "Form Number" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Community Initiative Progress Report" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - SF-428" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration}" for title "Form Expiration" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - SF-428" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Annual Report - SF-428-A" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration1" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration1}" for title "Form Expiration" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Final Report - SF-428-B" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration2" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration2}" for title "Form Expiration" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration3" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration3}" for title "Form Expiration" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration4" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration4}" for title "Form Expiration" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report (Cover Page) - SF-429" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report (Cover Page) - SF-429" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration5" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration5}" for title "Form Expiration" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Real Property Status Report (Cover Page) - SF-429" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration6" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration6}" for title "Form Expiration" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration7" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration7}" for title "Form Expiration" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration8" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration8}" for title "Form Expiration" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Federal Financial Report - SF-425" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0014" for title "Form Number" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration9" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration9}" for title "Form Expiration" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Federal Financial Report - SF-425" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Federal Financial Report Attachment - SF-425A" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0014" for title "Form Number" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration10" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration10}" for title "Form Expiration" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Federal Financial Report Attachment - SF-425A" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040–0011" for title "Form Number" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration11" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration11}" for title "Form Expiration" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly do not see "Is Available" in flex table header "---program:-:previewPackageTableId---"
    And I refresh the page
    #286672,286519
    When I click on "Preview" icon for "Grantor Payment Request Forms" inside table
    And I perform quick search for "Request for Advance or Reimbursement - SF-270" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Request for Advance or Reimbursement - SF-270" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Payment Request Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0012" for title "Form Number" against the value "Request for Advance or Reimbursement - SF-270" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpirationPay" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpirationPay}" for title "Form Expiration" against the value "Request for Advance or Reimbursement - SF-270" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Request for Advance or Reimbursement - SF-270" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Request for Advance or Reimbursement - SF-270" inside table "---program:-:previewPackageTableId---"
    Then I softly do not see "Is Available" in flex table header "---program:-:previewPackageTableId---"
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click on remove for lookup from field "Program__c"
    And I enter values into fields
      | Value                      | Field      |
      | {SavedValue:ProgramEGMSID} | Program__c |
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Name" as "announcementName"
    And I navigate to "Setup" sub tab
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside table
    And I wait for "3" seconds
    And I select value inside table "---program:-:previewPackageTableId---" is "20"
    Then I softly see total records count "Total Records: 13" in flex table "---program:-:previewPackageTableId---"
    Then I softly see value "Community Initiative Progress Report" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Progress Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report (Cover Page) - SF-429" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    And I refresh the page
    #286672
    When I click on "Preview" icon for "Grantor Payment Request Forms" inside table
    Then I softly see value "Request for Advance or Reimbursement - SF-270" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Payment Request Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I delete the record "{SavedValue:announcementName}" from the object "announcement"

  @286659 @286678 @ValidateEXEusercanseeallbelowformsunderGrantorprogressReportareflowfromAnnouncementtoGrantwhenGrantiscreatedfromapplication @sprint-1-US-278368 @vaibhav @Forms
  Scenario: Validate EXE user can see all below forms under Grantor progress Report are flow from Announcement to Grant when Grant is created from application
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation EXE user"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside table
    And I select value inside table "---program:-:previewPackageTableId---" is "All"
    Then I softly see value "Community Initiative Progress Report" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Progress Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report (Cover Page) - SF-429" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see total records count "Total Records: 13" in flex table "---program:-:previewPackageTableId---"
    And I refresh the page
   #286678
    When I click on "Preview" icon for "Grantor Payment Request Forms" inside table
    Then I softly see value "Request for Advance or Reimbursement - SF-270" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Payment Request Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"

  @286663 @286680 @ValidatePOusercanseeallbelowformsareflowfromProgramtoGrantwhenDirectGrantiscreatedonGrantorprogressReport @sprint-1-US-278368 @vaibhav @Forms
  Scenario: Validate PO user can see all below forms are flow from Program to Grant when Direct Grant is created on Grantor progress Report
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Active"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click on remove for lookup from field "Program__c"
    And I enter values into fields
      | Value                      | Field           |
      | {SavedValue:ProgramEGMSID} | Program__c      |
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Files" sub tab
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside table
    And I select value inside table "---program:-:previewPackageTableId---" is "All"
    Then I softly see value "Community Initiative Progress Report" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Progress Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report (Cover Page) - SF-429" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see total records count "Total Records: 13" in flex table "---program:-:previewPackageTableId---"
    And I refresh the page
    #286680
    When I click on "Preview" icon for "Grantor Payment Request Forms" inside table
    Then I softly see value "Request for Advance or Reimbursement - SF-270" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Payment Request Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"

  @287721 @ValidateEXEusercanseebelow13formsonProgressReportunderFilesFormssectionofProgressReport @sprint-1-US-278368 @vaibhav @Forms @Buglogged-339404
  Scenario: Validate EXE user can see below 13 forms on Progress Report under Files & Forms section of Progress Report
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation EXE user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Community Initiative Progress Report" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Progress Report" for title "Report Type" against the value "Community Initiative Progress Report" inside table "---progressReport:-:formTableId---"
    Then I softly see value "false" for title "Mandatory" against the value "Community Initiative Progress Report" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" against the value "Federal Financial Report - SF-425" inside table "---progressReport:-:formTableId---"
    Then I softly see "cross" symbol against the value "Community Initiative Progress Report" in flex table with id "---progressReport:-:formTableId---"
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" against the value "Federal Financial Report Attachment - SF-425A" inside table "---progressReport:-:formTableId---"
    Then I softly see "cross" symbol against the value "Federal Financial Report Attachment - SF-425A" in flex table with id "---progressReport:-:formTableId---"
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---progressReport:-:formTableId---"
    Then I softly see "cross" symbol against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report (Cover Page) - SF-429" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---progressReport:-:formTableId---"
    Then I softly see "cross" symbol against the value "Real Property Status Report (Cover Page) - SF-429" in flex table with id "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---progressReport:-:formTableId---"
    Then I softly see "cross" symbol against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---progressReport:-:formTableId---"
    Then I softly see "cross" symbol against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---progressReport:-:formTableId---"
    Then I softly see "cross" symbol against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in flex table with id "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---progressReport:-:formTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---progressReport:-:formTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in flex table with id "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---progressReport:-:formTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - SF-428" inside table "---progressReport:-:formTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---progressReport:-:formTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"

  @286533 @286557 @ValidatePMusercanseebelow13formsonPreviewmodalofpackageswhenuserclickonviewicononGrantorProgressReportFormsunderBusinessFormssectiononsetuptabofAnnouncement @sprint-1-US-278368 @vaibhav @Forms @Buglogged-339404
  Scenario: Validate PM user can see below 13 forms on Preview modal of packages when user click on view icon on Grantor Progress Report Forms under Business Forms section on setup tab of Announcement
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    Then I can see row level action button "Preview" against "Grantor Progress Report Forms" in flex table with id "---program:-:businessFormTableId---"
    Then I can see row level action button "Edit" against "Grantor Progress Report Forms" in flex table with id "---program:-:businessFormTableId---"
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click on remove for lookup from field "Program__c"
    And I enter values into fields
      | Value                      | Field      |
      | {SavedValue:ProgramEGMSID} | Program__c |
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Name" as "announcementName"
    And I navigate to "Setup" sub tab
    Then I softly can see row level action button "Edit" against "Grantor Progress Report Forms" in flex table with id "---announcement:-:businessFormlistTableId---"
    Then I softly can see row level action button "Preview" against "Grantor Progress Report Forms" in flex table with id "---announcement:-:businessFormlistTableId---"
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside table
    And I select value inside table "---program:-:previewPackageTableId---" is "All"
    Then I softly see total records count "Total Records: 13" in flex table "---program:-:previewPackageTableId---"
    And I perform quick search for "Community Initiative Progress Report" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Community Initiative Progress Report" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Progress Report" for title "Report Type" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "23" for title "Form Number" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Community Initiative Progress Report" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - SF-428" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration}" for title "Form Expiration" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - SF-428" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Annual Report - SF-428-A" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration1" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration1}" for title "Form Expiration" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Final Report - SF-428-B" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration2" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration2}" for title "Form Expiration" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration3" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration3}" for title "Form Expiration" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration4" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration4}" for title "Form Expiration" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report (Cover Page) - SF-429" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report (Cover Page) - SF-429" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration5" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration5}" for title "Form Expiration" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Real Property Status Report (Cover Page) - SF-429" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration6" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration6}" for title "Form Expiration" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration7" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration7}" for title "Form Expiration" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration8" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration8}" for title "Form Expiration" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Federal Financial Report - SF-425" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0014" for title "Form Number" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration9" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration9}" for title "Form Expiration" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Federal Financial Report - SF-425" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Federal Financial Report Attachment - SF-425A" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0014" for title "Form Number" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration10" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration10}" for title "Form Expiration" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Federal Financial Report Attachment - SF-425A" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040–0011" for title "Form Number" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration11" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration11}" for title "Form Expiration" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly do not see "Is Available" in flex table header "---program:-:previewPackageTableId---"
    And I refresh the page
    #286557
    When I click on "Preview" icon for "Grantor Payment Request Forms" inside table
    And I perform quick search for "Request for Advance or Reimbursement - SF-270" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Request for Advance or Reimbursement - SF-270" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Payment Request Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0012" for title "Form Number" against the value "Request for Advance or Reimbursement - SF-270" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpirationPay" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpirationPay}" for title "Form Expiration" against the value "Request for Advance or Reimbursement - SF-270" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Request for Advance or Reimbursement - SF-270" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Request for Advance or Reimbursement - SF-270" inside table "---program:-:previewPackageTableId---"
    Then I softly do not see "Is Available" in flex table header "---program:-:previewPackageTableId---"
    Then I delete the record "{SavedValue:announcementName}" from the object "announcement"

  @286633 @ValidatePMusercanseebelow13formsonPreviewmodalofpackageswhenuserclickonviewicononGrantorProgressReportFormsunderBusinessFormssectiononFilestabofGrant @sprint-1-US-278368 @vaibhav @Forms @Buglogged-339404
  Scenario: Validate PM user can see below 13 forms on Preview modal of packages when user click on view icon on Grantor Progress Report Forms under Business Forms section on Files tab of Grant
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click on remove for lookup from field "Program__c"
    And I enter values into fields
      | Value                      | Field           |
      | {SavedValue:ProgramEGMSID} | Program__c      |
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Files" sub tab
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside table
    Then I softly can see row level action button "Edit" against "Grantor Progress Report Forms" in flex table with id "---subAwardFromFDM:-:grantPackagesTableId---"
    Then I softly can see row level action button "Preview" against "Grantor Progress Report Forms" in flex table with id "---subAwardFromFDM:-:grantPackagesTableId---"
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside table
    And I select value inside table "---program:-:previewPackageTableId---" is "All"
    Then I softly see total records count "Total Records: 13" in flex table "---program:-:previewPackageTableId---"
    And I perform quick search for "Community Initiative Progress Report" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Community Initiative Progress Report" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Progress Report" for title "Report Type" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "23" for title "Form Number" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Community Initiative Progress Report" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - SF-428" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration}" for title "Form Expiration" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - SF-428" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Annual Report - SF-428-A" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration1" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration1}" for title "Form Expiration" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Final Report - SF-428-B" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration2" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration2}" for title "Form Expiration" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration3" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration3}" for title "Form Expiration" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration4" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration4}" for title "Form Expiration" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report (Cover Page) - SF-429" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report (Cover Page) - SF-429" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration5" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration5}" for title "Form Expiration" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Real Property Status Report (Cover Page) - SF-429" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration6" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration6}" for title "Form Expiration" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration7" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration7}" for title "Form Expiration" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration8" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration8}" for title "Form Expiration" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Federal Financial Report - SF-425" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0014" for title "Form Number" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration9" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration9}" for title "Form Expiration" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Federal Financial Report - SF-425" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Federal Financial Report Attachment - SF-425A" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0014" for title "Form Number" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration10" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration10}" for title "Form Expiration" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Federal Financial Report Attachment - SF-425A" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040–0011" for title "Form Number" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration11" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration11}" for title "Form Expiration" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly see "cross" symbol against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly do not see "Is Available" in flex table header "---program:-:previewPackageTableId---"

  @340112 @ValidateSF429AthatUsershouldnotbeabletoenterfromdategreaterthanTodate @sprint-12-US-328869
  Scenario: Validate SF 429A that User should not be able to enter from date greater than To date
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I enter "SF429A_Form" values from "ProgressReport_Field_Values.xlsx"
    And I enter value "150" into field "PeriodStartDate__c"
    And I enter value "50" into field "PeriodEndDate__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14k. NHPA" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Significant Change" from computer
    When I click modal button "Close"
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | From date cannot be after To date in the "Period and type of Federal Interest" section.  |
      | To date cannot be before From date in the "Period and type of Federal Interest" section. |

  @329629 @Validateusershouldabletosubmitandapprovedprogressreportwithoutfillingdatainanyfieldinall13forms @sprint-11-US-328863 @vaibhav @Forms
  Scenario: Validate user should able to submit and approved progress report without filling data in any field in all 13 forms
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name          | Progress Report |
      | Automation FO | Step 1          |
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"

  @329603 @ValidateSF271validationshoulddisplayonvalidatebutton @sprint-11-US-328863 @vaibhav @Forms
  Scenario: Validate SF271 validation should display on validate button
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    Then I softly see the text containing "OMB Number: 4040–0011"
    Then I softly see the text containing "Expiration Date: 01/31/2025"
    And I click on "Edit" in the page details
    And I enter "SF271_Form" values from "ProgressReport_Field_Values.xlsx"
    And I enter value "1234" into field "ZipPostalCodeSF428__c"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I edit the following rows inline in flex table with id "---progressReport:-:sf271FormTableId---" by clicking "Edit" :
      | Classification                                       | Programs | Functions | Activities |
      | a. Administrative expense                            | 12345    | 12345     | 12345      |
      | b. Preliminary expense                               | 12345    | 12345     | 12345      |
      | c. Land, structures, right-of-way                    | 12345    | 12345     | 12345      |
      | d. Architectural engineering basic fees              | 12345    | 12345     | 12345      |
      | e. Other architectural engineering fees              | 12345    | 12345     | 12345      |
      | f. Project inspection fees                           | 12345    | 12345     | 12345      |
      | g. Land development                                  | 12345    | 12345     | 12345      |
      | h. Relocation expense                                | 12345    | 12345     | 12345      |
      | i. Relocation payments to individuals and businesses | 12345    | 12345     | 12345      |
      | j. Demolition and removal                            | 12345    | 12345     | 12345      |
      | k. Construction and project improvement cost         | 12345    | 12345     | 12345      |
      | l. Equipment                                         | 12345    | 12345     | 12345      |
      | m. Miscellaneous cost                                | 12345    | 12345     | 12345      |
      | o. Deductions for program income                     | 12345    | 12345     | 12345      |
      | q. Federal share to date                             | 12345    | 12345     | 12345      |
      | r. Rehabilitation grants (100% reimbursement)        | 12345    | 12345     | 12345      |
      | t. Federal payments previously requested             | 12345    | 12345     | 12345      |
      | u. Amount requested for reimbursement                | 12345    | 12345     | 12345      |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Please enter Zip code in the Zip + 4 codes format (e.g. 12345-1234) in the 'Zip / Postal code' field. |

  @339610 @Validateusershouldbeabletosubmitandapprovedprogressreportwithfillingalldataonall13forms @sprint-12-US-328869 @vaibhav @Forms  @EndToEndFlow
  Scenario: Validate user should be able to submit and approved progress report with filling all data on all 13 forms
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    # SF-425
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Federal Financial Report - SF-425" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "SF425_Form" values from "ProgressReport_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---progressReport:-:sf425TransactionTableID---" by clicking "Edit" :
      | Classification                                                          | Cumulative |
      | a. Cash Receipts                                                        | 1000       |
      | b. Cash Disbursements                                                   | 500        |
      | d. Total Federal funds authorized                                       | 1000       |
      | e. Federal share of expenditures                                        | 1000       |
      | f. Federal share of unliquated obligations                              | 500        |
      | i. Total recipient share required                                       | 1000       |
      | j. Recipient share of expenditures                                      | 500        |
      | l. Total Federal share of program income earned                         | 1000       |
      | m. Program income expended in accordance with the deduction alternative | 500        |
      | n. Program income expended in accordance with the addition alternative  | 200        |
    When I enter the following values into flex table with id "---progressReport:-:sf425IndirectExpenseTableId---" by clicking "Add" :
      | Type  | Rate | Period From | Period To | Base | Federal Share |
      | Fixed | 100  | 25          | 30        | 10   | 10            |
    When I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
#    When I click on "Back" in the page details
    And I close the tab
    # SF-425A
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "4" seconds
    And I click on "Edit" icon for "Federal Financial Report Attachment - SF-425A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "SF425A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---progressReport:-:sf425AGrantCoveredTableId---" by clicking "New" :
      | Federal Grant Number | Recipient Account Number | Cumulative Federal Cash Disbursement |
      | 6723457              | 89376289                 | 500                                  |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
     #Fill SF428-C Form
    And I click on "View" icon for "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF428C_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    And I wait for "9" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    #Fill SF428-B Form
    And I click on "View" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF428B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I wait for "8" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    #Fill SF428-A Form
    And I click on "View" icon for "Tangible Personal Property Report - Annual Report - SF-428-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF428A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428AFederallyOwnedTableId---"
    When I enter in modal "SF428A_Federal_Property" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1.a Individual item information" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1.b Consolidated Annual Report Attachments" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    When I click on "Validate" in the page details
    And I wait for "7" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    #Fill SF428-S
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF428S_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428SDetailIndividualTableId---"
    When I enter in modal "SF428S_Details_Individual" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    #SF 428 Form
    And I click on "View" icon for "Tangible Personal Property Report - SF-428" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I select "Tangible Personal Property Report - SF-428" from dropdown at forms
    When I click on "Edit" in the page details
    And I enter "SF428_Form" values from "ProgressReport_Field_Values.xlsx"
    And I enter value "Yes" into field "SupplementalSheet__c"
    When I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    # SF429-A Form
    And I click on "View" icon for "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF429A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14k. NHPA" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Significant Change" from computer
    When I click modal button "Close"
    And I wait for "6" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    # SF429-B Form
    And I click on "View" icon for "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF429B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14i. NHPA Description" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14h. Environmental Compliance Requirements" from computer
    When I click modal button "Close"
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    # SF429-C Form
    And I click on "View" icon for "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF429C_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14c. Proposed Use" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14g. Environmental Compliance Requirements" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14h. NHPA Description" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14i. Encumbered Parties" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Request Reasons" from computer
    When I click modal button "Close"
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    # SF429 Form
    And I click on "View" icon for "Real Property Status Report (Cover Page) - SF-429" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF429_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    #SF-271
    And I click on "View" icon for "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF271_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---progressReport:-:sf271FormTableId---" by clicking "Edit" :
      | Classification                                       | Programs | Functions | Activities |
      | a. Administrative expense                            | 12345    | 12345     | 12345      |
      | b. Preliminary expense                               | 12345    | 12345     | 12345      |
      | c. Land, structures, right-of-way                    | 12345    | 12345     | 12345      |
      | d. Architectural engineering basic fees              | 12345    | 12345     | 12345      |
      | e. Other architectural engineering fees              | 12345    | 12345     | 12345      |
      | f. Project inspection fees                           | 12345    | 12345     | 12345      |
      | g. Land development                                  | 12345    | 12345     | 12345      |
      | h. Relocation expense                                | 12345    | 12345     | 12345      |
      | i. Relocation payments to individuals and businesses | 12345    | 12345     | 12345      |
      | j. Demolition and removal                            | 12345    | 12345     | 12345      |
      | k. Construction and project improvement cost         | 12345    | 12345     | 12345      |
      | l. Equipment                                         | 12345    | 12345     | 12345      |
      | m. Miscellaneous cost                                | 12345    | 12345     | 12345      |
      | o. Deductions for program income                     | 12345    | 12345     | 12345      |
      | q. Federal share to date                             | 12345    | 12345     | 12345      |
      | r. Rehabilitation grants (100% reimbursement)        | 12345    | 12345     | 12345      |
      | t. Federal payments previously requested             | 12345    | 12345     | 12345      |
      | u. Amount requested for reimbursement                | 12345    | 12345     | 12345      |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    #Community Form
    And I click on "View" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
#    When I click on "Back" in the page details
    And I close the tab
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name          | Progress Report |
      | Automation FO | Step 1          |
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"

  @329635 @Validateusershouldabletosubmitandaprovedprogressreportwithfillingpartialdataforsomefieldsondifferentdifferentformsfromall13forms @sprint-11-US-328863 @vaibhav @Forms @EndToEndFlow
  Scenario: Validate user should able to submit and approved progress report with filling partial data for some fields on different different forms from all 13 forms
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    # SF-425
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Federal Financial Report - SF-425" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "SF425_Form" values from "ProgressReport_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---progressReport:-:sf425TransactionTableID---" by clicking "Edit" :
      | Classification                                                          | Cumulative |
      | a. Cash Receipts                                                        | 1000       |
      | b. Cash Disbursements                                                   | 500        |
      | d. Total Federal funds authorized                                       | 1000       |
      | e. Federal share of expenditures                                        | 1000       |
      | f. Federal share of unliquated obligations                              | 500        |
      | i. Total recipient share required                                       | 1000       |
      | j. Recipient share of expenditures                                      | 500        |
      | l. Total Federal share of program income earned                         | 1000       |
      | m. Program income expended in accordance with the deduction alternative | 500        |
      | n. Program income expended in accordance with the addition alternative  | 200        |
    When I enter the following values into flex table with id "---progressReport:-:sf425IndirectExpenseTableId---" by clicking "Add" :
      | Type  | Rate | Period From | Period To | Base | Federal Share |
      | Fixed | 100  | 25          | 30        | 10   | 10            |
    When I enter value "Unchecked" into field "AcknowledgementSF428__c"
    When I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Certify the Federal Financial Report (SF-425) by checking the Acknowledgment Box before submitting to Grantor. |
#    When I click on "Back" in the page details
    And I close the tab
    # SF-425A
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "4" seconds
    And I click on "Edit" icon for "Federal Financial Report Attachment - SF-425A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "SF425A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---progressReport:-:sf425AGrantCoveredTableId---" by clicking "New" :
      | Federal Grant Number | Recipient Account Number | Cumulative Federal Cash Disbursement |
      | 89376289             | 89376289                 | 250                                  |
    And I wait for "8" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | "Sum of Cumulative Federal Cash Disbursement" must be Equal to "10 b Cash Disbursement" in Transactions section of Federal Financial Report (SF-425). |
    And I close the tab
     #Fill SF428-C Form
    And I click on "View" icon for "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF428C_half_fill" values from "ProgressReport_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I close the tab
    #Fill SF428-B Form
    And I click on "View" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter value "12345" into field "FederalGrantIdentifyingNumbe__c"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I close the tab
    #Fill SF428-A Form
    And I click on "View" icon for "Tangible Personal Property Report - Annual Report - SF-428-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF428A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I close the tab
    #Fill SF428-S
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF428S_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428SDetailIndividualTableId---"
    When I enter in modal "SF428S_Details_Individual" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    #SF 428 Form
    And I click on "View" icon for "Tangible Personal Property Report - SF-42" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    When I click on "Edit" in the page details
    And I enter "SF428_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Select Supplement Sheet as Yes as required form is filled. |
    And I close the tab
    # SF429-A Form
    And I click on "View" icon for "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF429A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14k. NHPA" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Significant Change" from computer
    When I click modal button "Close"
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    # SF429-B Form
    And I click on "View" icon for "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF429B_half_fill" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I close the tab
    # SF429-C Form
    And I click on "View" icon for "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF429C_half_fill" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I close the tab
    # SF429 Form
    And I click on "View" icon for "Real Property Status Report (Cover Page) - SF-429" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF429_half_fill" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I close the tab
    #SF-271
    And I click on "View" icon for "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF271_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---progressReport:-:sf271FormTableId---" by clicking "Edit" :
      | Classification                                       | Programs | Functions | Activities |
      | a. Administrative expense                            | 12345    | 12345     | 12345      |
      | b. Preliminary expense                               | 12345    | 12345     | 12345      |
      | c. Land, structures, right-of-way                    | 12345    | 12345     | 12345      |
      | d. Architectural engineering basic fees              | 12345    | 12345     | 12345      |
      | e. Other architectural engineering fees              | 12345    | 12345     | 12345      |
      | f. Project inspection fees                           | 12345    | 12345     | 12345      |
      | g. Land development                                  | 12345    | 12345     | 12345      |
      | h. Relocation expense                                | 12345    | 12345     | 12345      |
      | i. Relocation payments to individuals and businesses | 12345    | 12345     | 12345      |
      | j. Demolition and removal                            | 12345    | 12345     | 12345      |
      | k. Construction and project improvement cost         | 12345    | 12345     | 12345      |
      | l. Equipment                                         | 12345    | 12345     | 12345      |
      | m. Miscellaneous cost                                | 12345    | 12345     | 12345      |
      | o. Deductions for program income                     | 12345    | 12345     | 12345      |
      | q. Federal share to date                             | 12345    | 12345     | 12345      |
      | r. Rehabilitation grants (100% reimbursement)        | 12345    | 12345     | 12345      |
      | t. Federal payments previously requested             | 12345    | 12345     | 12345      |
      | u. Amount requested for reimbursement                | 12345    | 12345     | 12345      |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    #Community Form
    And I click on "View" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "Comm_half_fill" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Fill all the required data in the form before submitting. |
#    When I click on "Back" in the page details
    And I close the tab
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name          | Progress Report |
      | Automation FO | Step 1          |
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"

  @329934 @ValidateusershouldbeabletoeditallformsontheprogressreportwhichisreparentedtonewawardafterFCamendmentrequestandapproveprogressreportsuccessfullyPreconditionPartiallyfilledsomeformsonProgressreportofInitialaward @sprint-11-US-328848 @vaibhav @Forms @EndToEndFlow
  Scenario: Validate user should be able to edit all forms on the progress report which is reparented to new award after FC amendment request and approve progress report successfully Pre-condition Partially filled some forms on Progress report of Initial award
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Community Initiative Progress Report" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report (Cover Page) - SF-429" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---progressReport:-:formTableId---"
    #Fill SF428-B Form
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter value "12345" into field "FederalGrantIdentifyingNumbe__c"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "6" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I close the tab
    #Fill SF428-A Form
    And I click on "View" icon for "Tangible Personal Property Report - Annual Report - SF-428-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF428A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I close the tab
    #Fill SF428-S
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF428S_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428SDetailIndividualTableId---"
    When I enter in modal "SF428S_Details_Individual" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    #SF 428 Form
    And I click on "View" icon for "Tangible Personal Property Report - SF-428" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    When I click on "Edit" in the page details
    And I enter "SF428_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Select Supplement Sheet as Yes as required form is filled. |
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Direct Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | FundingChangeJustification__c |
      | 2000                        | RequestedChangeInBudget__c    |
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
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 3000                 | 150        | 150            |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                     |
      | 4100  | RevisedCommitment__c |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "4" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    And I wait for "4" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "5" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    When I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Direct Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I softly see value "{SavedValue:progID}" for title "EGMS ID" inside table "---progressReport:-:recipientAwardProgressReportTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    When I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    #Fill SF428-C Form
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Community Initiative Progress Report" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report (Cover Page) - SF-429" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "SF428C_Form" values from "ProgressReport_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    When I click on "Validate" in the page details
    And I wait for "9" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #Fill SF428-A Form
    And I click on "View" icon for "Tangible Personal Property Report - Annual Report - SF-428-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF428A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    Then I softly see the following messages in the page details :
#      | Form saved successfully. |
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428AFederallyOwnedTableId---"
    When I enter in modal "SF428A_Federal_Property" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1.a Individual item information" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1.b Consolidated Annual Report Attachments" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    And I wait for "7" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    #SF-271
    And I click on "View" icon for "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF271_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---progressReport:-:sf271FormTableId---" by clicking "Edit" :
      | Classification                                       | Programs | Functions | Activities |
      | a. Administrative expense                            | 12345    | 12345     | 12345      |
      | b. Preliminary expense                               | 12345    | 12345     | 12345      |
      | c. Land, structures, right-of-way                    | 12345    | 12345     | 12345      |
      | d. Architectural engineering basic fees              | 12345    | 12345     | 12345      |
      | e. Other architectural engineering fees              | 12345    | 12345     | 12345      |
      | f. Project inspection fees                           | 12345    | 12345     | 12345      |
      | g. Land development                                  | 12345    | 12345     | 12345      |
      | h. Relocation expense                                | 12345    | 12345     | 12345      |
      | i. Relocation payments to individuals and businesses | 12345    | 12345     | 12345      |
      | j. Demolition and removal                            | 12345    | 12345     | 12345      |
      | k. Construction and project improvement cost         | 12345    | 12345     | 12345      |
      | l. Equipment                                         | 12345    | 12345     | 12345      |
      | m. Miscellaneous cost                                | 12345    | 12345     | 12345      |
      | o. Deductions for program income                     | 12345    | 12345     | 12345      |
      | q. Federal share to date                             | 12345    | 12345     | 12345      |
      | r. Rehabilitation grants (100% reimbursement)        | 12345    | 12345     | 12345      |
      | t. Federal payments previously requested             | 12345    | 12345     | 12345      |
      | u. Amount requested for reimbursement                | 12345    | 12345     | 12345      |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
#    When I click on "Back" in the page details
    And I close the tab
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name          | Progress Report |
      | Automation FO | Step 1          |
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
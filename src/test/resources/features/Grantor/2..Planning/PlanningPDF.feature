@programPDF @grantor-regression @grantor-parallel-regression @planning @regression @PDF @skipOnJenkins
Feature: Validate all scenarios for program for PDF

  @34616 @76118 @75992 @75821 @75830 @75831 @75836 @75832 @75840 @75841 @programFocusAreaAssociation
  Scenario Outline: Validate the association of Focus Area for the Internal Program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "<Title>" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    Then I softly see that "<Title>" has been added in flextable with Id "---program:-:focusAreaTableId---"
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
#    And I perform quick search for "Completeness" in "---program:-:programReviewPanel---" panel
    Then I softly see value "Completeness" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    Then I softly see value "{SavedValue:PM Username}" for title "Reviewer" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "pm.automation@yopmail.com" for title "Email" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "Test Automation Organization" for title "Organization Name" inside table "---program:-:reviewStepTableId---"
    And I refresh the page
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    Then I softly see value "Fiscal Review" for title "Form Name" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "Program Review" for title "Form Name" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "Compliance Review" for title "Form Name" inside table "---program:-:reviewStepTableId---"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) |
      | Fiscal Review | 25              |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Program Review | 25              |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Compliance Review | 50              |
    Then I softly see value "25.00%" for title "Form Weight (%)" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "25.00%" for title "Form Weight (%)" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "50.00%" for title "Form Weight (%)" inside table "---program:-:reviewStepTableId---"
    And I click on "Delete" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    Then I softly see the following messages in the page details :
      | Record deleted Successfully. |
    When I enter the following values into flex table with id "---program:-:reviewFormPanelId---" by clicking "New" :
      | Form Name         | Required? | Minimum Number of Reviews per Application |
      | Automation Review | Checked   | 1                                         |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    Then I softly see value "{SavedValue:PM Username}" for title "Reviewer" inside table "---program:-:addReviewersTableId---"
    Then I softly see value "pm.automation@yopmail.com" for title "Email" inside table "---program:-:addReviewersTableId---"
    Then I softly see value "Test Automation Organization" for title "Organization Name" inside table "---program:-:addReviewersTableId---"
    And I click on "Remove from Form" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:addReviewersTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Record removed successfully. |
    When I click on parallel lines menu bar with data target value "Review Forms"
    And I select "Download as PDF" from parallel lines dropdown of "Review Forms"
    And I wait for "3" seconds
    And I download the file
    And I wait for "3" seconds
    Then I softly see "Review Forms" on page "1" of "govgrants" pdf file
    Examples:
      | Title                           |
      | Automation Permanent Focus Area |

  @76943 @76944 @76948 @76947 @76984 @76985 @77098
  Scenario: To verify user able to modify review question in Strategic Alignment of Review Panel Categories in management review form for management review step in planning phase
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Strategic Alignment"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type |
      | 2              | Date |
      #76943 following 2 assertion belongs to this
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I softly see value "Date" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I refresh the page
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 3              | Test 2   | Yes/No | 0         |
      #76944 following 5 assertion belongs to this
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "3" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Test 2" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type    |
      | 2              | Written |
       #76948 following 2 assertion belongs to this
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "2" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---" without waiting for record
      #76947 following 2 assertion belongs to this
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I softly do not see value "2" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    #And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 5              | Test 5   | Yes/No | 0         |
      #76984 following 5 assertion belongs to this
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "5" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Test 5" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I click on parallel menu button in flex table title "Review Questions"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
      #76985 following 5 assertion belongs to this
    Then I softly see "Completeness" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    And I refresh the page
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 4              | Test 4   | Yes/No | 0         |
      #77098 following 5 assertion belongs to this
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Test 4" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"

  @34737 @76116 @76117 @76113 @76115 @75894 @75888 @75891 @programObjectiveAssociation
  Scenario Outline: Validate the Association of Objective to the Internal Program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    Then I softly see that "<Objective>" has been added in flextable with Id "---program:-:objectivesTableId---"
    And I wait for "3" seconds
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) |
      | Fiscal Review | 25              |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Program Review | 25              |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Compliance Review | 50              |
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:programReviewPanel---" by clicking "New" :
      | Section Order | Section Header    |
      | 4             | Automation Header |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    Then I softly see value "Automation Header" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:programReviewPanel---" by clicking "New" :
      | Section Order | Section Header    |
      | 4             | Automation Header |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    Then I softly see value "Automation Header" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    Then I softly see value "Schedule" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Environment" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Permits" for title "Section Header" inside table "---program:-:programReviewPanel---"
    When I enter the following values into flex table with id "---program:-:programReviewPanel---" by clicking "New" :
      | Section Order | Section Header    |
      | 3             | Automation Header |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    Then I softly see value "Automation Header" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I click on "Delete" icon for "Automation Header" inside flex table with id "---program:-:programReviewPanel---" without waiting for record
    And I click on "Delete" icon for "Schedule" inside flex table with id "---program:-:programReviewPanel---" without waiting for record
    And I click on "Delete" icon for "Environment" inside flex table with id "---program:-:programReviewPanel---" without waiting for record
    And I click on "Delete" icon for "Permits" inside flex table with id "---program:-:programReviewPanel---" without waiting for record
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review - Compliance Review: At least one section must be added to this form. |
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PO Username} |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I click on parallel menu button in flex table title "Reviewers"
    And I select "Download as PDF" from parallel lines dropdown of "Reviewers"
    And I wait for "3" seconds
    And I download the file
    And I wait for "5" seconds
    Then I softly see "Review Steps" on page "1" of "govgrants" pdf file
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @76922 @76921 @76937 @76936 @ValidatingReturnOnInvestmentQuestionValidatingStrategicAlignment  @skipOnJenkins
  Scenario Outline: To verify user allow to download PDF for review question in Return on Investment (ROI) of Review Panel Categories in management review form for management review step in planning phase
  | To verify user able to add new review question with success message in Return on Investment (ROI) of Review Panel Categories in management review form for management review step in planning phase
  | To verify user allow to download PDF for review question in Strategic Alignment of Review Panel Categories in management review form for management review step in plnning phase
  | To verify user able to add new review question with success message in Strategic Alignment of Review Panel Categories in management review form for management review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Return on Investment (ROI)"
    And I click on parallel lines menu bar with data target value "ProgramReviewPanelCategories"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I softly see "Return on Investment (ROI)" on page "1" of "govgrants" pdf file
    Then I softly see "Strategic Alignment" on page "1" of "govgrants" pdf file
    Then I softly see "Section Weight (%)" on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question" on page "1" of "govgrants" pdf file
    Then I softly see "Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max" on page "1" of "govgrants" pdf file
    Then I softly see "Score" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type    | Max Score |
      | 4              | Test     | Written | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I expand nested table containing column value "Strategic Alignment"
    And I click on parallel lines menu bar with data target value "ProgramReviewPanelCategories"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I softly see "Strategic Alignment" on page "1" of "govgrants" pdf file
    Then I softly see "Return on Investment (ROI)" on page "1" of "govgrants" pdf file
    Then I softly see "Section Weight (%)" on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question" on page "1" of "govgrants" pdf file
    Then I softly see "Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max" on page "1" of "govgrants" pdf file
    Then I softly see "Score" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type    | Max Score |
      | 3              | Test 1   | Written | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "3" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 1" for title "Question" against the value "3" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" against the value "3" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" against the value "3" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "3" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "3" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77118 @77116 @77122 @77120 @ValidatingAdditionModificationDeletionOfPermitsReview  @skipOnJenkins
  Scenario Outline: To verify user allow to download PDF for review question in Permits of Review Panel Categories in compliance review form for SME review step in planning phase
  | To verify user able to add new review question with success message in Permits of Review Panel Categories in compliance review form for SME review step in planning phase
  | To verify user able to modify review question in Permits of Review Panel Categories in compliance review form for SME review step in planning phase
  | To verify user able to delete review question with success message in Permits of Review Panel Categories in compliance review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Permits"
    And I click on parallel lines menu bar with data target value "ProgramReviewPanelCategories"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I softly see "Permits " on page "1" of "govgrants" pdf file
    Then I softly see "Environment" on page "1" of "govgrants" pdf file
    Then I softly see "Schedule" on page "1" of "govgrants" pdf file
    Then I softly see "Section Weight (%)" on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question" on page "1" of "govgrants" pdf file
    Then I softly see "Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max" on page "1" of "govgrants" pdf file
    Then I softly see "Score" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type    | Max Score |
      | 4              | Test     | Written | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type |
      | 4              | Date |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Date" for title "Type" against the value "3" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "4" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted Successfully. |
    Then I softly do not see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77124 @77123 @77170 @77171 @ValidatingPDFAdditionDeletionModificationInBudgetFiscalReviewForm  @skipOnJenkins
  Scenario Outline: To verify user allow to download PDF for review question in Budget of Review Panel Categories in Fiscal review form for SME review step in planning phase
  | To verify user able to add new review question with success message in Budget of Review Panel Categories in Fiscal review form for SME review step in planning phase
  | To verify user able to delete review question with success message in Budget of Review Panel Categories in Fiscal review form for SME review step in planning phase
  | To verify user able to modify review question in Budget of Review Panel Categories in Fiscal review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Budget"
    And I click on parallel lines menu bar with data target value "ProgramReviewPanelCategories"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I softly see "Budget" on page "1" of "govgrants" pdf file
    Then I softly see "Program Income" on page "1" of "govgrants" pdf file
    Then I softly see "Match" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max Score" on page "1" of "govgrants" pdf file
    Then I softly see "Section Weight (%) " on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type    | Max Score |
      | 7              | Test 7   | Written | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "7" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 7" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "7" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "7" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "7" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "7" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted Successfully. |
    Then I softly do not see value "7" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type |
      | 7              | Date |
    Then I softly see value "Date" for title "Type" against the value "7" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77173 @77176 @77174 @ValidatingPDFModificationDeletionInMatchFiscalReviewForm
  Scenario Outline:  To verify user allow to download PDF for review question in match of Review Panel Categories in Fiscal review form for SME review step in planning phase
  | To verify user able to modify review question in Match of Review Panel Categories in fiscal review form for SME review step in planning phase
  | To verify user able to delete review question with success message in Match of Review Panel Categories in fiscal review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Budget"
    And I click on parallel menu button in flex table title "Review Questions"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    And I wait for "5" seconds
    Then I softly see "Budget" on page "1" of "govgrants" pdf file
    Then I softly see "Program Income" on page "1" of "govgrants" pdf file
    Then I softly see "Match" on page "1" of "govgrants" pdf file
    Then I softly see "Section Weight (%)" on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question" on page "1" of "govgrants" pdf file
    Then I softly see "Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max" on page "1" of "govgrants" pdf file
    Then I softly see "Score" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type    | Max Score |
      | 7              | Test 7   | Written | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "7" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 7" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "7" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "7" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type |
      | 7              | Date |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Date" for title "Type" against the value "7" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "7" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "7" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77290 @77289 @77292 @77291  @PDFAdditionModificationDeletionInApproach
  Scenario Outline: To verify user allow to download PDF for review question in Approach of Review Panel Categories in Program review form for SME review step in planning phase
  | To verify user able to add new review question with success message in Approach of Review Panel Categories in Program review form for SME review step in planning phase
  | To verify user able to modify review question in Approach of Review Panel Categories in Program review form for SME review step in planning phase
  | To verify user able to delete review question with success message in Approach of Review Panel Categories in Program review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I expand nested table containing column value "Approach"
    And I click on parallel menu button in flex table title "Review Questions"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    And I wait for "8" seconds
    Then I softly see "Capability" on page "1" of "govgrants" pdf file
    Then I softly see "Approach" on page "1" of "govgrants" pdf file
    Then I softly see "Impact" on page "2" of "govgrants" pdf file
    Then I softly see "Section Weight (%)" on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question" on page "1" of "govgrants" pdf file
    Then I softly see "Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max" on page "1" of "govgrants" pdf file
    Then I softly see "Score" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    And I wait for "3" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type | Max Score |
      | 11             | Test 11  | Date | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "11" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 11" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Date" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "11" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "11" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type    |
      | 11             | Written |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I wait for "2" seconds
    Then I softly see value "Written" for title "Type" against the value "11" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "11" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "11" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77293 @77294 @77343 @AdditionPDFModificationInImpact
  Scenario Outline: To verify user able to add new review question with success message in Impact of Review Panel Categories in Program review form for SME review step in planning phase
  | To verify user allow to download PDF for review question in Impact of Review Panel Categories in Program review form for SME review step in planning phase
  | To verify user able to modify review question in Impact of Review Panel Categories in Program review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 4              | Test 4   | Yes/No | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 4" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on parallel menu button in flex table title "Review Questions"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    And I wait for "8" seconds
    Then I softly see "Capability" on page "1" of "govgrants" pdf file
    Then I softly see "Approach" on page "1" of "govgrants" pdf file
    Then I softly see "Impact" on page "2" of "govgrants" pdf file
    Then I softly see "Section Weight (%)" on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question" on page "1" of "govgrants" pdf file
    Then I softly see "Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max" on page "1" of "govgrants" pdf file
    Then I softly see "Score" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type |
      | 4              | Date |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Date" for title "Type" against the value "4" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |


  @77192 @validatingDownloadPDFForImpactInSMEReviewFormQuestions
  Scenario Outline:To verify user allow to download PDF for review question in Impact of Review Panel Categories in Program review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I expand nested table containing column value "Program Income"
    And I click on parallel menu button in flex table title "Review Questions"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I see "Review Questions" on page "1" of "govgrants" pdf file
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77199 @validatingDownloadPDFSMEReviewPanelCategory
  Scenario Outline:To verify user is able to download review panel category for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I click on parallel menu button in flex table title "Review Categories"
    And I select "Download as PDF" from parallel lines dropdown of "Review Categories"
    And I download the file
    Then I see "Review Categories" on page "1" of "govgrants" pdf file
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77199 @validatingDownloadPDFSMEReviewPanelCategory
  Scenario Outline:To verify user is able to download review panel category for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I click on parallel menu button in flex table title "Review Categories"
    And I select "Download as PDF" from parallel lines dropdown of "Review Categories"
    And I download the file
    Then I see "Review Categories" on page "1" of "govgrants" pdf file
    Examples:
      | Objective                      |
      | Automation Permanent Objective |


  @77346 @validatingDownloadPDFForProgramIncomeInSMEReviewFormQuestions
  Scenario Outline:To verify user allow to download PDF for review question in Program Income of Review Panel Categories in Fiscal review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I expand nested table containing column value "Impact"
    And I click on parallel menu button in flex table title "Review Questions"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @299539 @Verifyhesnapshotisgeneratedinsnapshothistorysectionwhenlastapproverclickundoaction @sprint-25-US-295138  @Undo @snapExecution
  Scenario: Verify the snapshot is generated in snapshot history section when last approver click undo action
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Undo" in page detail
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 3  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details
    And I pause execution for "5" seconds
    And I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Pending"
    Then I softly see snapshot with name containing "Internal Program - Undo Approval.pdf" as name
    And I click on hyperlink containing value "Internal Program - Undo Approval.pdf"
    And I click on "Download" button for snapshot view
    And I wait for "3" seconds
    When I download the file for snapshot
    And I wait for "3" seconds
    Then I softly see "{SavedValue:ProgramEGMSID}" on page "1" of "govgrants" pdf file
    Then I softly see "Submitted for Approval" on page "1" of "govgrants" pdf file
    Then I softly see "Test Automation Organization" on page "1" of "govgrants" pdf file

  @300299 @ExternalProgVerifythesnapshotisgeneratedinsnapshothistorysectionwhenlastapproverclickundoaction @sprint-5-US-299190  @Undo @snapExecution
  Scenario: External Prog_ Verify the snapshot is generated in snapshot history section when last approver click undo action
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details
    And I wait for "3" seconds
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "External NGO Program - Undo Approval.pdf" as name
    And I click on hyperlink containing value "External NGO Program - Undo Approval.pdf"
    And I click on "Download" button for snapshot view
    And I wait for "3" seconds
    When I download the file for snapshot
    And I wait for "3" seconds
    Then I softly see "{SavedValue:ProgramEGMSID}" on page "1" of "govgrants" pdf file
    Then I softly see "Submitted for Approval" on page "1" of "govgrants" pdf file
    Then I softly see "Test With Automation PM" on page "1" of "govgrants" pdf file


  @281733 @InternalProgramVerifyuserseealltablesdisplaycorrectlyindownloadedPDFforprogramafterUndo @sprint-25-US-280680  @Undo
  Scenario: Validate Internal Prog I see I can edit and update the filed when undo is in progress
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 3  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    And I wait for "2" seconds
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details
    And I "Reject" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Rejected"
    Then I cannot see top right button "Undo" in page detail
    And I click on "Download as PDF" in the page details
    And I wait for "7" seconds
    And I download the file
    And I wait for "3" seconds
    Then I softly see "{SavedValue:ProgramEGMSID}" on page "1" of "govgrants" pdf file
    Then I softly see following details in "govgrants" pdf file:
      | Detail   | Page Number |
      | Contacts | 1           |
    And I switch to parent tab
    When I refresh the page
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Internal Program - submit for approval.pdf" as name
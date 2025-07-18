@GranteeApplicationsGrantsGov
Feature: Validate all scenarios for Applications Grants Gov

  @480684 @ValidateOpportunitiesconvertedtoApplicationGrantsgovPOusercannavigatetoOpportunitydetailspagefromOpportunitiesConvertedtoApplicationlistview @P3_Grantee @PO_Grantee @GRegression2
  Scenario Outline: Validate Opportunities converted to Application Grants gov PO user can navigate to Opportunity details page from Opportunities Converted to Application list view
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:fundingOpportunitiesTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:fundingOpportunitiesTableId---" without waiting for record
    Then I softly see field "Status" as "Converted to Application"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    Then I softly see field "Status" as "Converted to Application"
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see field "Funding Organization" as "{SavedValue:FundingOrganization}"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    When I hovering mouse on help text icon inside page block detail "Days Left"
    Then I softly see "Days remaining until the application due date" shown as help text
    Then I softly can see top right button "Download as PDF" in page detail
    Then I softly can see top right button "Take Snapshot" in page detail
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    When I hovering mouse on help text icon inside page block detail "Expected Number of Awards"
    Then I softly see "The maximum number excepted is 999." shown as help text
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    Then I softly see field "Required Match(%)" inside page block
    Then I softly see field "Match Source" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Program Income Treatment Type"
    Then I softly see "• Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. • Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. • Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "sarah.pm@ggp.test8.qagrnteatm"
    And I click on back arrow
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see field "1. Have we previously received an award from this sponsoring agency?" inside page block
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    Then I softly see field "2. What is the estimated probability of receiving a grant award?" inside page block
    Then I softly see field "2a. Briefly explain." inside page block
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see field "3. Do we have the business and technical domain knowledge?" inside page block
    Then I softly see field "3a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "3a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "4. Do we have the required resources and skill sets to perform the work?" inside page block
    Then I softly see field "4a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "4a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "5. Do we have the necessary systems and financial tools?" inside page block
    Then I softly see field "5a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "5a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "6. Provide the estimated number of hours required to develop the application. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "6. Provide the estimated number of hours required to develop the application. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see field "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see field "8. Have other internal organizations within the Department qualified this lead?" inside page block
    Then I softly see field "8a. If yes, has an agreement been reached to which organization will be the lead?" inside page block
    Then I softly see field "9. Does this grant require a collaboration with other internal organizations within the Department?" inside page block
    Then I softly see field "9a. Please explain." inside page block
    Then I softly see "Financial Overview" page block displayed
    Then I softly see field "10. What is the expected funding request amount?" inside page block
    When I hovering mouse on help text icon inside page block detail "10. What is the expected funding request amount?"
    Then I softly see "Estimated Total Program Funding amount provided in the Financial Details." shown as help text
    Then I softly see field "10a. What is the stated award ceiling (if known)?" inside page block
    When I hovering mouse on help text icon inside page block detail "10a. What is the stated award ceiling (if known)?"
    Then I softly see "Maximum spending amount anticipated over the life of the project as provided in the Financial Details." shown as help text
    Then I softly see field "11. Is match required for this grant?" inside page block
    When I hovering mouse on help text icon inside page block detail "11. Is match required for this grant?"
    Then I softly see "Match Requirement setting as shown in the Financial Details" shown as help text
    Then I softly see field "11a. What is the match type." inside page block
    When I hovering mouse on help text icon inside page block detail "11a. What is the match type."
    Then I softly see "Cost Sharing or Matching Requirement selected in the Financial Details." shown as help text
    Then I softly see field "11b. If yes, identify the match sources." inside page block
    When I hovering mouse on help text icon inside page block detail "11b. If yes, identify the match sources."
    Then I softly see "Match Source as selected in the Financial Details." shown as help text
    Then I softly see field "11c. Required Match(%)" inside page block
    When I hovering mouse on help text icon inside page block detail "11c. Required Match(%)"
    Then I softly see "Required Match(%) as provided in the Financial Details." shown as help text
    Then I softly see field "12. Is program income anticipated?" inside page block
    When I hovering mouse on help text icon inside page block detail "12. Is program income anticipated?"
    Then I softly see "Is Program Income Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "12a. If yes, what is the program income treatment type?" inside page block
    When I hovering mouse on help text icon inside page block detail "12a. If yes, what is the program income treatment type?"
    Then I softly see "Program Income Treatment Type as selected in the Financial Details." shown as help text
    Then I softly see field "13. Is there a maintenance of effort required?" inside page block
    Then I softly see field "14. Does the grant require pass through funding to subrecipients?" inside page block
    Then I softly see field "15. Does the grant allow indirect costs?" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15. Does the grant allow indirect costs?"
    Then I softly see "Are Indirect Costs Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "16. Is there an administrative cost limit?" inside page block
    Then I softly see field "16a. If yes, what percent is the administrative cost limit?" inside page block
    Then I softly see field "17. How will the program be sustained, should funding end?" inside page block
    Then I softly see "Certifications and Other" page block displayed
    Then I softly see field "18. Describe any additional legal requirements or policy impact from receiving an award." inside page block
    Then I softly see field "19. Describe any additional organizational certifications required or compliance requirements created as a result of an award." inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"

    Examples:
      | User       |
      | GRANTEE PO |

  @480686 @ValidateOpportunitiesconvertedtoApplicationGrantsgovPOusercannavigatetoOpportunitydetailspagefromOpportunitiesConvertedtoApplicationlistview @P3_Grantee @FO_Grantee @GRegression2
  Scenario Outline: Validate Opportunities converted to Application Grants gov FO user can navigate to Opportunity details page from Opportunities Converted to Application list view
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:fundingOpportunitiesTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:fundingOpportunitiesTableId---" without waiting for record
    Then I softly see field "Status" as "Converted to Application"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    Then I softly see field "Status" as "Converted to Application"
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see field "Funding Organization" as "{SavedValue:FundingOrganization}"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    When I hovering mouse on help text icon inside page block detail "Days Left"
    Then I softly see "Days remaining until the application due date" shown as help text
    Then I softly can see top right button "Download as PDF" in page detail
    Then I softly can see top right button "Take Snapshot" in page detail
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    When I hovering mouse on help text icon inside page block detail "Expected Number of Awards"
    Then I softly see "The maximum number excepted is 999." shown as help text
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    Then I softly see field "Required Match(%)" inside page block
    Then I softly see field "Match Source" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Program Income Treatment Type"
    Then I softly see "• Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. • Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. • Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "sarah.pm@ggp.test8.qagrnteatm"
    And I click on back arrow
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see field "1. Have we previously received an award from this sponsoring agency?" inside page block
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    Then I softly see field "2. What is the estimated probability of receiving a grant award?" inside page block
    Then I softly see field "2a. Briefly explain." inside page block
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see field "3. Do we have the business and technical domain knowledge?" inside page block
    Then I softly see field "3a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "3a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "4. Do we have the required resources and skill sets to perform the work?" inside page block
    Then I softly see field "4a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "4a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "5. Do we have the necessary systems and financial tools?" inside page block
    Then I softly see field "5a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "5a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "6. Provide the estimated number of hours required to develop the application. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "6. Provide the estimated number of hours required to develop the application. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see field "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see field "8. Have other internal organizations within the Department qualified this lead?" inside page block
    Then I softly see field "8a. If yes, has an agreement been reached to which organization will be the lead?" inside page block
    Then I softly see field "9. Does this grant require a collaboration with other internal organizations within the Department?" inside page block
    Then I softly see field "9a. Please explain." inside page block
    Then I softly see "Financial Overview" page block displayed
    Then I softly see field "10. What is the expected funding request amount?" inside page block
    When I hovering mouse on help text icon inside page block detail "10. What is the expected funding request amount?"
    Then I softly see "Estimated Total Program Funding amount provided in the Financial Details." shown as help text
    Then I softly see field "10a. What is the stated award ceiling (if known)?" inside page block
    When I hovering mouse on help text icon inside page block detail "10a. What is the stated award ceiling (if known)?"
    Then I softly see "Maximum spending amount anticipated over the life of the project as provided in the Financial Details." shown as help text
    Then I softly see field "11. Is match required for this grant?" inside page block
    When I hovering mouse on help text icon inside page block detail "11. Is match required for this grant?"
    Then I softly see "Match Requirement setting as shown in the Financial Details" shown as help text
    Then I softly see field "11a. What is the match type." inside page block
    When I hovering mouse on help text icon inside page block detail "11a. What is the match type."
    Then I softly see "Cost Sharing or Matching Requirement selected in the Financial Details." shown as help text
    Then I softly see field "11b. If yes, identify the match sources." inside page block
    When I hovering mouse on help text icon inside page block detail "11b. If yes, identify the match sources."
    Then I softly see "Match Source as selected in the Financial Details." shown as help text
    Then I softly see field "11c. Required Match(%)" inside page block
    When I hovering mouse on help text icon inside page block detail "11c. Required Match(%)"
    Then I softly see "Required Match(%) as provided in the Financial Details." shown as help text
    Then I softly see field "12. Is program income anticipated?" inside page block
    When I hovering mouse on help text icon inside page block detail "12. Is program income anticipated?"
    Then I softly see "Is Program Income Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "12a. If yes, what is the program income treatment type?" inside page block
    When I hovering mouse on help text icon inside page block detail "12a. If yes, what is the program income treatment type?"
    Then I softly see "Program Income Treatment Type as selected in the Financial Details." shown as help text
    Then I softly see field "13. Is there a maintenance of effort required?" inside page block
    Then I softly see field "14. Does the grant require pass through funding to subrecipients?" inside page block
    Then I softly see field "15. Does the grant allow indirect costs?" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15. Does the grant allow indirect costs?"
    Then I softly see "Are Indirect Costs Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "16. Is there an administrative cost limit?" inside page block
    Then I softly see field "16a. If yes, what percent is the administrative cost limit?" inside page block
    Then I softly see field "17. How will the program be sustained, should funding end?" inside page block
    Then I softly see "Certifications and Other" page block displayed
    Then I softly see field "18. Describe any additional legal requirements or policy impact from receiving an award." inside page block
    Then I softly see field "19. Describe any additional organizational certifications required or compliance requirements created as a result of an award." inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"

    Examples:
      | User       |
      | GRANTEE FO |

  @480687 @ValidateOpportunitiesconvertedtoApplicationGrantsgovPOusercannavigatetoOpportunitydetailspagefromOpportunitiesConvertedtoApplicationlistview @P3_Grantee @FD_Grantee @GRegression2
  Scenario Outline: Validate Opportunities converted to Application Grants gov FD user can navigate to Opportunity details page from Opportunities Converted to Application list view
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:fundingOpportunitiesTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:fundingOpportunitiesTableId---" without waiting for record
    Then I softly see field "Status" as "Converted to Application"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    Then I softly see field "Status" as "Converted to Application"
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see field "Funding Organization" as "{SavedValue:FundingOrganization}"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    When I hovering mouse on help text icon inside page block detail "Days Left"
    Then I softly see "Days remaining until the application due date" shown as help text
    Then I softly can see top right button "Download as PDF" in page detail
    Then I softly can see top right button "Take Snapshot" in page detail
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    When I hovering mouse on help text icon inside page block detail "Expected Number of Awards"
    Then I softly see "The maximum number excepted is 999." shown as help text
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    Then I softly see field "Required Match(%)" inside page block
    Then I softly see field "Match Source" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Program Income Treatment Type"
    Then I softly see "• Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. • Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. • Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "sarah.pm@ggp.test8.qagrnteatm"
    And I click on back arrow
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see field "1. Have we previously received an award from this sponsoring agency?" inside page block
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    Then I softly see field "2. What is the estimated probability of receiving a grant award?" inside page block
    Then I softly see field "2a. Briefly explain." inside page block
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see field "3. Do we have the business and technical domain knowledge?" inside page block
    Then I softly see field "3a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "3a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "4. Do we have the required resources and skill sets to perform the work?" inside page block
    Then I softly see field "4a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "4a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "5. Do we have the necessary systems and financial tools?" inside page block
    Then I softly see field "5a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "5a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "6. Provide the estimated number of hours required to develop the application. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "6. Provide the estimated number of hours required to develop the application. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see field "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see field "8. Have other internal organizations within the Department qualified this lead?" inside page block
    Then I softly see field "8a. If yes, has an agreement been reached to which organization will be the lead?" inside page block
    Then I softly see field "9. Does this grant require a collaboration with other internal organizations within the Department?" inside page block
    Then I softly see field "9a. Please explain." inside page block
    Then I softly see "Financial Overview" page block displayed
    Then I softly see field "10. What is the expected funding request amount?" inside page block
    When I hovering mouse on help text icon inside page block detail "10. What is the expected funding request amount?"
    Then I softly see "Estimated Total Program Funding amount provided in the Financial Details." shown as help text
    Then I softly see field "10a. What is the stated award ceiling (if known)?" inside page block
    When I hovering mouse on help text icon inside page block detail "10a. What is the stated award ceiling (if known)?"
    Then I softly see "Maximum spending amount anticipated over the life of the project as provided in the Financial Details." shown as help text
    Then I softly see field "11. Is match required for this grant?" inside page block
    When I hovering mouse on help text icon inside page block detail "11. Is match required for this grant?"
    Then I softly see "Match Requirement setting as shown in the Financial Details" shown as help text
    Then I softly see field "11a. What is the match type." inside page block
    When I hovering mouse on help text icon inside page block detail "11a. What is the match type."
    Then I softly see "Cost Sharing or Matching Requirement selected in the Financial Details." shown as help text
    Then I softly see field "11b. If yes, identify the match sources." inside page block
    When I hovering mouse on help text icon inside page block detail "11b. If yes, identify the match sources."
    Then I softly see "Match Source as selected in the Financial Details." shown as help text
    Then I softly see field "11c. Required Match(%)" inside page block
    When I hovering mouse on help text icon inside page block detail "11c. Required Match(%)"
    Then I softly see "Required Match(%) as provided in the Financial Details." shown as help text
    Then I softly see field "12. Is program income anticipated?" inside page block
    When I hovering mouse on help text icon inside page block detail "12. Is program income anticipated?"
    Then I softly see "Is Program Income Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "12a. If yes, what is the program income treatment type?" inside page block
    When I hovering mouse on help text icon inside page block detail "12a. If yes, what is the program income treatment type?"
    Then I softly see "Program Income Treatment Type as selected in the Financial Details." shown as help text
    Then I softly see field "13. Is there a maintenance of effort required?" inside page block
    Then I softly see field "14. Does the grant require pass through funding to subrecipients?" inside page block
    Then I softly see field "15. Does the grant allow indirect costs?" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15. Does the grant allow indirect costs?"
    Then I softly see "Are Indirect Costs Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "16. Is there an administrative cost limit?" inside page block
    Then I softly see field "16a. If yes, what percent is the administrative cost limit?" inside page block
    Then I softly see field "17. How will the program be sustained, should funding end?" inside page block
    Then I softly see "Certifications and Other" page block displayed
    Then I softly see field "18. Describe any additional legal requirements or policy impact from receiving an award." inside page block
    Then I softly see field "19. Describe any additional organizational certifications required or compliance requirements created as a result of an award." inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"

    Examples:
      | User       |
      | GRANTEE FD |

  @480688 @ValidateOpportunitiesconvertedtoApplicationGrantsgovPOusercannavigatetoOpportunitydetailspagefromOpportunitiesConvertedtoApplicationlistview @P4_Grantee @AUDITOR_Grantee @GRegression2
  Scenario Outline: Validate Opportunities converted to Application Grants gov AUDITOR user can navigate to Opportunity details page from Opportunities Converted to Application list view
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:fundingOpportunitiesTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:fundingOpportunitiesTableId---" without waiting for record
    Then I softly see field "Status" as "Converted to Application"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    Then I softly see field "Status" as "Converted to Application"
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see field "Funding Organization" as "{SavedValue:FundingOrganization}"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    When I hovering mouse on help text icon inside page block detail "Days Left"
    Then I softly see "Days remaining until the application due date" shown as help text
    Then I softly can see top right button "Download as PDF" in page detail
    Then I softly can see top right button "Take Snapshot" in page detail
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    When I hovering mouse on help text icon inside page block detail "Expected Number of Awards"
    Then I softly see "The maximum number excepted is 999." shown as help text
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    Then I softly see field "Required Match(%)" inside page block
    Then I softly see field "Match Source" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Program Income Treatment Type"
    Then I softly see "• Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. • Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. • Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "sarah.pm@ggp.test8.qagrnteatm"
    And I click on back arrow
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see field "1. Have we previously received an award from this sponsoring agency?" inside page block
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    Then I softly see field "2. What is the estimated probability of receiving a grant award?" inside page block
    Then I softly see field "2a. Briefly explain." inside page block
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see field "3. Do we have the business and technical domain knowledge?" inside page block
    Then I softly see field "3a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "3a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "4. Do we have the required resources and skill sets to perform the work?" inside page block
    Then I softly see field "4a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "4a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "5. Do we have the necessary systems and financial tools?" inside page block
    Then I softly see field "5a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "5a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "6. Provide the estimated number of hours required to develop the application. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "6. Provide the estimated number of hours required to develop the application. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see field "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see field "8. Have other internal organizations within the Department qualified this lead?" inside page block
    Then I softly see field "8a. If yes, has an agreement been reached to which organization will be the lead?" inside page block
    Then I softly see field "9. Does this grant require a collaboration with other internal organizations within the Department?" inside page block
    Then I softly see field "9a. Please explain." inside page block
    Then I softly see "Financial Overview" page block displayed
    Then I softly see field "10. What is the expected funding request amount?" inside page block
    When I hovering mouse on help text icon inside page block detail "10. What is the expected funding request amount?"
    Then I softly see "Estimated Total Program Funding amount provided in the Financial Details." shown as help text
    Then I softly see field "10a. What is the stated award ceiling (if known)?" inside page block
    When I hovering mouse on help text icon inside page block detail "10a. What is the stated award ceiling (if known)?"
    Then I softly see "Maximum spending amount anticipated over the life of the project as provided in the Financial Details." shown as help text
    Then I softly see field "11. Is match required for this grant?" inside page block
    When I hovering mouse on help text icon inside page block detail "11. Is match required for this grant?"
    Then I softly see "Match Requirement setting as shown in the Financial Details" shown as help text
    Then I softly see field "11a. What is the match type." inside page block
    When I hovering mouse on help text icon inside page block detail "11a. What is the match type."
    Then I softly see "Cost Sharing or Matching Requirement selected in the Financial Details." shown as help text
    Then I softly see field "11b. If yes, identify the match sources." inside page block
    When I hovering mouse on help text icon inside page block detail "11b. If yes, identify the match sources."
    Then I softly see "Match Source as selected in the Financial Details." shown as help text
    Then I softly see field "11c. Required Match(%)" inside page block
    When I hovering mouse on help text icon inside page block detail "11c. Required Match(%)"
    Then I softly see "Required Match(%) as provided in the Financial Details." shown as help text
    Then I softly see field "12. Is program income anticipated?" inside page block
    When I hovering mouse on help text icon inside page block detail "12. Is program income anticipated?"
    Then I softly see "Is Program Income Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "12a. If yes, what is the program income treatment type?" inside page block
    When I hovering mouse on help text icon inside page block detail "12a. If yes, what is the program income treatment type?"
    Then I softly see "Program Income Treatment Type as selected in the Financial Details." shown as help text
    Then I softly see field "13. Is there a maintenance of effort required?" inside page block
    Then I softly see field "14. Does the grant require pass through funding to subrecipients?" inside page block
    Then I softly see field "15. Does the grant allow indirect costs?" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15. Does the grant allow indirect costs?"
    Then I softly see "Are Indirect Costs Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "16. Is there an administrative cost limit?" inside page block
    Then I softly see field "16a. If yes, what percent is the administrative cost limit?" inside page block
    Then I softly see field "17. How will the program be sustained, should funding end?" inside page block
    Then I softly see "Certifications and Other" page block displayed
    Then I softly see field "18. Describe any additional legal requirements or policy impact from receiving an award." inside page block
    Then I softly see field "19. Describe any additional organizational certifications required or compliance requirements created as a result of an award." inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"

    Examples:
      | User            |
      | GRANTEE AUDITOR |

  @480689 @ValidateOpportunitiesconvertedtoApplicationGrantsgovPOusercannavigatetoOpportunitydetailspagefromOpportunitiesConvertedtoApplicationlistview @P3_Grantee @ADMIN_Grantee @GRegression2
  Scenario Outline: Validate Opportunities converted to Application Grants gov ADMIN user can navigate to Opportunity details page from Opportunities Converted to Application list view
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:fundingOpportunitiesTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:fundingOpportunitiesTableId---" without waiting for record
    Then I softly see field "Status" as "Converted to Application"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    Then I softly see field "Status" as "Converted to Application"
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see field "Funding Organization" as "{SavedValue:FundingOrganization}"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    When I hovering mouse on help text icon inside page block detail "Days Left"
    Then I softly see "Days remaining until the application due date" shown as help text
    Then I softly can see top right button "Download as PDF" in page detail
    Then I softly can see top right button "Take Snapshot" in page detail
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    When I hovering mouse on help text icon inside page block detail "Expected Number of Awards"
    Then I softly see "The maximum number excepted is 999." shown as help text
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    Then I softly see field "Required Match(%)" inside page block
    Then I softly see field "Match Source" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Program Income Treatment Type"
    Then I softly see "• Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. • Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. • Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "sarah.pm@ggp.test8.qagrnteatm"
    And I click on back arrow
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see field "1. Have we previously received an award from this sponsoring agency?" inside page block
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    Then I softly see field "2. What is the estimated probability of receiving a grant award?" inside page block
    Then I softly see field "2a. Briefly explain." inside page block
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see field "3. Do we have the business and technical domain knowledge?" inside page block
    Then I softly see field "3a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "3a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "4. Do we have the required resources and skill sets to perform the work?" inside page block
    Then I softly see field "4a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "4a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "5. Do we have the necessary systems and financial tools?" inside page block
    Then I softly see field "5a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "5a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "6. Provide the estimated number of hours required to develop the application. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "6. Provide the estimated number of hours required to develop the application. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see field "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see field "8. Have other internal organizations within the Department qualified this lead?" inside page block
    Then I softly see field "8a. If yes, has an agreement been reached to which organization will be the lead?" inside page block
    Then I softly see field "9. Does this grant require a collaboration with other internal organizations within the Department?" inside page block
    Then I softly see field "9a. Please explain." inside page block
    Then I softly see "Financial Overview" page block displayed
    Then I softly see field "10. What is the expected funding request amount?" inside page block
    When I hovering mouse on help text icon inside page block detail "10. What is the expected funding request amount?"
    Then I softly see "Estimated Total Program Funding amount provided in the Financial Details." shown as help text
    Then I softly see field "10a. What is the stated award ceiling (if known)?" inside page block
    When I hovering mouse on help text icon inside page block detail "10a. What is the stated award ceiling (if known)?"
    Then I softly see "Maximum spending amount anticipated over the life of the project as provided in the Financial Details." shown as help text
    Then I softly see field "11. Is match required for this grant?" inside page block
    When I hovering mouse on help text icon inside page block detail "11. Is match required for this grant?"
    Then I softly see "Match Requirement setting as shown in the Financial Details" shown as help text
    Then I softly see field "11a. What is the match type." inside page block
    When I hovering mouse on help text icon inside page block detail "11a. What is the match type."
    Then I softly see "Cost Sharing or Matching Requirement selected in the Financial Details." shown as help text
    Then I softly see field "11b. If yes, identify the match sources." inside page block
    When I hovering mouse on help text icon inside page block detail "11b. If yes, identify the match sources."
    Then I softly see "Match Source as selected in the Financial Details." shown as help text
    Then I softly see field "11c. Required Match(%)" inside page block
    When I hovering mouse on help text icon inside page block detail "11c. Required Match(%)"
    Then I softly see "Required Match(%) as provided in the Financial Details." shown as help text
    Then I softly see field "12. Is program income anticipated?" inside page block
    When I hovering mouse on help text icon inside page block detail "12. Is program income anticipated?"
    Then I softly see "Is Program Income Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "12a. If yes, what is the program income treatment type?" inside page block
    When I hovering mouse on help text icon inside page block detail "12a. If yes, what is the program income treatment type?"
    Then I softly see "Program Income Treatment Type as selected in the Financial Details." shown as help text
    Then I softly see field "13. Is there a maintenance of effort required?" inside page block
    Then I softly see field "14. Does the grant require pass through funding to subrecipients?" inside page block
    Then I softly see field "15. Does the grant allow indirect costs?" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15. Does the grant allow indirect costs?"
    Then I softly see "Are Indirect Costs Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "16. Is there an administrative cost limit?" inside page block
    Then I softly see field "16a. If yes, what percent is the administrative cost limit?" inside page block
    Then I softly see field "17. How will the program be sustained, should funding end?" inside page block
    Then I softly see "Certifications and Other" page block displayed
    Then I softly see field "18. Describe any additional legal requirements or policy impact from receiving an award." inside page block
    Then I softly see field "19. Describe any additional organizational certifications required or compliance requirements created as a result of an award." inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"

    Examples:
      | User            |
      | GRANTEE ADMIN1  |

  @487233 @OpportunitiesNotconvertedGrantsgovVerifyEXEusercannotseeCreateApplicationbuttononApprovedOpportunity @P3_Grantee @EXE_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov) -  Verify EXE user cannot see Create Application button on Approved Opportunity
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Application" in page detail

    Examples:
      | UserName   | OwnerType   | UserType        |
      | Victor EXE | GRANTEE EXE | GRANTEE EXE     |

  @487234 @OpportunitiesNotconvertedGrantsgovVerifyFOusercannotseeCreateApplicationbuttononApprovedOpportunity @P3_Grantee @EXE_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov) -  Verify FO user cannot see Create Application button on Approved Opportunity
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Application" in page detail

    Examples:
      | UserName   | OwnerType   | UserType        |
      | Sarah PM   | GRANTEE PM  | GRANTEE FO      |

  @487235 @OpportunitiesNotconvertedGrantsgovVerifyFDusercannotseeCreateApplicationbuttononApprovedOpportunity @P3_Grantee @FD_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov) -  Verify FD user cannot see Create Application button on Approved Opportunity
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Application" in page detail

    Examples:
      | UserName   | OwnerType   | UserType        |
      | Sarah PM   | GRANTEE PM  | GRANTEE FD      |

  @487236 @OpportunitiesNotconvertedGrantsgovVerifyEXEusercannotseeCreateApplicationbuttononApprovedOpportunity @P3_Grantee @ADMIN_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov) -  Verify ADMIN user cannot see Create Application button on Approved Opportunity
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Application" in page detail

    Examples:
      | UserName   | OwnerType   | UserType        |
      | Grantee PO | GRANTEE PO  | GRANTEE ADMIN1  |

  @487237 @OpportunitiesNotconvertedGrantsgovVerifyAUDITORusercannotseeCreateApplicationbuttononApprovedOpportunity @P4_Grantee @AUDITOR_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov) -  Verify AUDITOR user cannot see Create Application button on Approved Opportunity
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Application" in page detail

    Examples:
      | UserName   | OwnerType   | UserType        |
      | Grantee PO | GRANTEE PO  | GRANTEE AUDITOR |

  @475755 @OpportunitiesNotconvertedGrantsgovVerifyEXEuserReviewereditaccessasNocanabletosubmitReview @P3_Grantee @EXE_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov)  - Verify EXE user (Reviewer edit access as = No)can able to submit Review
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | NO                   |
    When I enter the following values into flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" by clicking "New" :
      | Reviewer Name      | Role             | Description            | Due Date | Allow Record Editing |
      | Danielle FD Garcia | Program Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I click on "Send for Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:opportunityEGMSID}" in flex table with id "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    And I wait for "2" seconds
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:opportunityEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I wait for "2" seconds
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:opportunityEGMSID}" in flex table with id "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    And I wait for "2" seconds
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:opportunityEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I wait for "2" seconds
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see value "Submitted" for title "Status" against the value "Danielle FD Garcia" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"

    Examples:
      | UserName   | UserType    |
      | Victor EXE | GRANTEE EXE |

  @475754 @OpportunitiesNotconvertedGrantsgovVerifyPMuserReviewereditaccessasNocanabletosubmitReview @P3_Grantee @FO_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov)  - Verify PM user (Reviewer edit access as = No)can able to submit Review
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | NO                   |
    When I enter the following values into flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" by clicking "New" :
      | Reviewer Name      | Role             | Description            | Due Date | Allow Record Editing |
      | Danielle FD Garcia | Program Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I click on "Send for Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:opportunityEGMSID}" in flex table with id "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    And I wait for "2" seconds
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:opportunityEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I wait for "2" seconds
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:opportunityEGMSID}" in flex table with id "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    And I wait for "2" seconds
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:opportunityEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I wait for "2" seconds
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see value "Submitted" for title "Status" against the value "Danielle FD Garcia" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"

    Examples:
      | UserName   | UserType    |
      | Sarah PM   | GRANTEE PM  |

  @487232 @NotYetConvertedOpportunityGrantsgovVerifyPOusercancreateApplicationfromOpportunityifPreApplicationRequiredisselectedasNoonOpportunityrecord @P1_Grantee @GRegression1 @GranteeTBE
  Scenario: Not Yet Converted Opportunity (Grants.gov)  - Verify PO user can create Application from Opportunity if Pre-Application Required? is selected as No on Opportunity record
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-Sarah PM"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Application" in page detail
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values - backup.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"

   @481533 @validatepmusershouldabletoedittheformsincreated,submittedforreview,reviewed,revisioninprogressstate  @PM_Grantee @P1_Grantee @GRegression1
   Scenario: Validate PM user should able to edit the forms in Created , Submitted for review, reviewed, Revision in progress state
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Project Abstract Summary" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "Project_Abstract_Summary" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Project Abstract Summary" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "Project_Abstract_Summary" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I close the tab
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision In Progress"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    And I enter "Project_Abstract_Summary" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab

  @482055 @ValidateGrantsgovlobbingformOptionalPOusercansuccessfullysubmitheformtoGrantsgovafterenteringvaliddatainGrantsgovlobbingform
  Scenario: Validate Grants gov lobbing form Optional PO user can successfully submit the form to Grants.gov after entering valid data in Grants gov lobbing form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    And I wait for "2" seconds
    Then I softly see value "Grants.gov Lobbying Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see "check" symbol against the value "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see value "0.00%" for title "Percentage" against the value "Grants.gov Lobbying Form" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Please validate the Forms by clicking validate button. |
    Then I softly can see row level action button "View" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "Splitview" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "Preview" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "Edit" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see the header is "Grants.gov Lobbying Form" in the page details
    Then I softly see the field "Agency Owner :" as "Grants.gov" on forms
    Then I softly see the field "OMB Number :" as "4040-0013" on forms
    Then I softly see the field "Version :" as "1.1" on forms
    Then I softly see the field "OMB Expiration Date :" as "02/28/2025" on forms
    Then I softly see the text containing "When filling out the data within this form, please adhere to the character limits for each field as specified within the information icon for the field."
    Then I softly can see "Form" sub tab at view detail page
    Then I softly see "Certification Regarding Lobbying" page block displayed
    Then I softly see field with quotes "APPLICANT'S ORGANIZATION" inside page block
    Then I softly see "Organization" page block displayed with quotes
    Then I softly see "Printed Name And Title Of Authorized Representative" page block displayed
    Then I softly see "Signature And Date" page block displayed
    Then I softly see the text containing " Required to Save | "
    Then I softly see the text containing " Required to Submit"
    Then I softly see the text containing "Certification for Contracts, Grants, Loans, and Cooperative Agreements"
    Then I softly see the field "Certification for Contracts, Grants, Loans, and Cooperative Agreements" as "The undersigned certifies, to the best of his or her knowledge and belief, that:" on forms
    Then I softly see the field "Certification for Contracts, Grants, Loans, and Cooperative Agreements" as "(1) No Federal appropriated funds have been paid or will be paid, by or on behalf of the undersigned, to any person for influencing or attempting to influence an officer or employee of an agency, a Member of Congress, an officer or employee of Congress, or an employee of a Member of Congress in connection with the awarding of any Federal contract, the making of any Federal grant, the making of any Federal loan, the entering into of any cooperative agreement, and the extension, continuation, renewal, amendment, or modification of any Federal contract, grant, loan, or cooperative agreement." on forms
    Then I softly see the field "Certification for Contracts, Grants, Loans, and Cooperative Agreements" as "(2) If any funds other than Federal appropriated funds have been paid or will be paid to any person for influencing or attempting to influence an officer or employee of any agency" on forms
    Then I softly see the field "Certification for Contracts, Grants, Loans, and Cooperative Agreements" as "(3) The undersigned shall require that the language of this certification be included in the award documents for all subawards at all tiers (including subcontracts, subgrants, and contracts under grants, loans, and cooperative agreements)" on forms
    Then I softly see the field "Certification for Contracts, Grants, Loans, and Cooperative Agreements" as "Statement for Loan Guarantees and Loan Insurance" on forms
    Then I softly see the field "Certification for Contracts, Grants, Loans, and Cooperative Agreements" as "The undersigned states, to the best of his or her knowledge and belief, that:" on forms
    Then I softly see the field "Certification for Contracts, Grants, Loans, and Cooperative Agreements" as "If any funds have been paid or will be paid to any person for influencing or attempting to influence an officer or employee of any agency" on forms
    Then I softly see the field "Certification for Contracts, Grants, Loans, and Cooperative Agreements" as "Statement for Loan Guarantees and Loan Insurance" on forms
    Then I softly see field with quotes "APPLICANT'S ORGANIZATION" inside page block
    Then I softly see asterisk mark on "ApplicantsOrganization__c"
    When I hovering mouse on help text icon inside page block detail "ORGANIZATION"
    Then I softly see "This is the legal name of the organization that will undertake the assistance activity. This should normally be the name under which the organization has registered with the Business Partner Network. Max character limit for this field is 60." shown as help text
    Then I softly see field "Prefix" inside page block
    Then I softly do not see asterisk mark on "Prefix"
    When I hovering mouse on help text icon inside page block detail "Prefix"
    Then I softly see "This is the prefix (e.g., Mr., Mrs., Rev.) for the name of the Authorized Representative." shown as help text
    And I click on "Edit" in the page details
    Then I see only the following ordered options in dropdown field "AOR_Prefix__c" :
      | --None-- | Mr. | Mrs. | Miss | Ms. | Dr. | Rev. | Prof. |
    Then I softly see field "First Name" inside page block
    Then I softly see asterisk mark on "First Name"
    When I hovering mouse on help text icon inside page block detail "First Name"
    Then I softly see "This is the first (given) name of the Authorized Representative who is signing this form. Max character limit for this field is 35." shown as help text
    Then I softly see field "Middle Name" inside page block
    Then I softly do not see asterisk mark on "Middle Name"
    When I hovering mouse on help text icon inside page block detail "Middle Name"
    Then I softly see "This is the middle name of the Authorized Representative. Max character limit for this field is 25." shown as help text
    Then I softly see field "Last Name" inside page block
    Then I softly see asterisk mark on "Last Name"
    Then I softly see field "Suffix" inside page block
    Then I softly do not see asterisk mark on "Suffix"
    When I hovering mouse on help text icon inside page block detail "Suffix"
    Then I softly see "This is the suffix (e.g., Jr, Sr, PhD) for the name of the Authorized Representative." shown as help text
    Then I see only the following ordered options in dropdown field "AOR_Suffix__c" :
      | --None-- | Jr. | Sr. | M.D. | Ph.D |
    Then I softly see field "Title" inside page block
    Then I softly see asterisk mark on "Title"
    When I hovering mouse on help text icon inside page block detail "Title"
    Then I softly see "This is the title of the Authorized Representative who is signing this form. Max character limit for this field is 45." shown as help text
    Then I softly see field "SIGNATURE:" inside page block
    Then I softly do not see asterisk mark on "SIGNATURE:"
    When I hovering mouse on help text icon inside page block detail "SIGNATURE:"
    Then I softly see "It is the organization's responsibility to assure that only properly authorized individuals sign in this capacity and/or submit the application to Grants.gov. If this application is submitted through Grants.gov leave blank. If a hard copy is submitted, the AOR must sign this block." shown as help text
    Then I softly see field "DATE:" inside page block
    Then I softly do not see asterisk mark on "DATE:"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Cancel" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    When I click modal button "OK"
    Then I can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    And I enter "Lobbying_Form" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "1" seconds
    And I close the tab
    When I click on "Edit" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    When I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "100.00%" for title "Percentage" against the value "Grants.gov Lobbying Form" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see value "No" for title "Validated" against the value "Grants.gov Lobbying Form" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Please validate the Forms by clicking validate button. |
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Yes" for title "Validated" against the value "Grants.gov Lobbying Form" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "Edit" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I enter value "Department of Trust" into field "ApplicantsOrganization__c"
    When I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "No" for title "Validated" against the value "Grants.gov Lobbying Form" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "Validate" in the page details
    And I wait for "1" seconds
    Then I softly see the following messages in the page details contains:
      | Please validate the Forms by clicking validate button. |
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Yes" for title "Validated" against the value "Grants.gov Lobbying Form" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "Validate" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "View" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "Splitview" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "Preview" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly cannot see row level action button "Edit" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    And I close the tab
    And I wait for "1" seconds
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I save the field labeled "SIGNATURE:" as "SIGNATURE"
    Then I softly see field "SIGNATURE:" as "{SavedValue:SIGNATURE}"
    And I save the field labeled "DATE:" as "DATE"
    Then I softly see field "DATE:" as "{SavedValue:DATE}"
    And I close the tab
    When I navigate to "History" sub tab
    And I save the value from row "1" for column name "Tracking Number" as "TrackingNumber" from flex table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "S2SReceived" for title "Grants.Gov Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "SUCCESS" for title "Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "Success" for title "Response Status Details" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "{SavedValue:TrackingNumber}" for title "Tracking Number" against the value "SUCCESS" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "Sarah PM" for title "Last Modified By" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    And I save the value from row "1" for column name "Last Modified On" as "LastModifiedOn" from flex table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "{SavedValue:LastModifiedOn}" for title "Last Modified On" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    When I click on "Check Status" in the page details
    And I save the value from row "1" for column name "Tracking Number" as "TrackingNumber" from flex table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "Validated" for title "Grants.Gov Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "SUCCESS" for title "Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "Sarah PM" for title "Last Modified By" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    And I save the value from row "1" for column name "Last Modified On" as "LastModifiedOn" from flex table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "{SavedValue:LastModifiedOn}" for title "Last Modified On" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
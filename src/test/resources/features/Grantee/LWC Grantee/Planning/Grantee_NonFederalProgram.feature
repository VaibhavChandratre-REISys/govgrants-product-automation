@GranteeNonFederalProgram
Feature: Validate all scenarios for Non Federal Program

  @476976 @NonFederalprogramVerifyvalidationsdisplayedtoPOuseronNonFederalprogram @P3_Grantee @Po_Grantee @GRegression1
  Scenario Outline: Non-Federal program - Verify validations displayed to PO user on Non Federal program
    When I login to "Grantee" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    And I wait for "10" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly see "Create Non Federal Program" opens in overLay window
    Then I softly see field on modal "Program Name" inside page block
    Then I softly see field on modal "Abbreviation" inside page block
    Then I softly see field on modal "Type" inside page block
    Then I softly see field on modal "NGO Organization" inside page block
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Program Name is required.     |
      | To Save, Type is required.             |
      | To Save, NGO Organization is required. |
    When I enter "Grantee_nonFed" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Status" as "Created"
    Then I softly see fields "FederalProgramCFDA__c" is in edit mode
    Then I softly see fields "ProgramName__c" is in edit mode
    Then I softly see fields "Account__c" is in edit mode
    Then I softly see fields "Objectives__c" is in edit mode
    Then I softly see fields "AssistanceType__c" is in edit mode
    Then I softly see fields "UsesAndUseRestrictions__c" is in edit mode
    Then I softly see fields "CredentialsDocumentation__c" is in edit mode
    Then I softly see fields "ApplicantEligibility__c" is in edit mode
    Then I softly see fields "BeneficiaryEligibility__c" is in edit mode
    Then I softly see fields "PreapplicationCoordination__c" is in edit mode
    Then I softly see fields "ApplicationProcedures__c" is in edit mode
    Then I softly see fields "Deadlines__c" is in edit mode
    Then I softly see fields "AwardProcedure__c" is in edit mode
    Then I softly see fields "RangeofApprovalDisApprovalTime__c" is in edit mode
    Then I softly see fields "Appeals__c" is in edit mode
    Then I softly see fields "Renewals__c" is in edit mode
    Then I softly see fields "CriteriaforSelectingProposals__c" is in edit mode
    Then I softly see fields "RangeofApprovalDisApprovalTime__c" is in edit mode
    Then I softly see fields "Appeals__c" is in edit mode
    Then I softly see fields "Renewals__c" is in edit mode
    Then I softly see fields "CriteriaforSelectingProposals__c" is in edit mode
    Then I softly see fields "FormulaandMatchingRequirements__c" is in edit mode
    Then I softly see fields "LengthandTimePhasingofAssistance__c" is in edit mode
    Then I softly see fields "Reports__c" is in edit mode
    Then I softly see fields "Audits__c" is in edit mode
    Then I softly see fields "Records__c" is in edit mode
    Then I softly see fields "RegulationsGuidelinesAndLiterature__c" is in edit mode
    Then I softly see fields "AccountIdentification__c" is in edit mode
    Then I softly see fields "Obligations__c" is in edit mode
    Then I softly see fields "RangeandAverageofFinancialAssistanc__c" is in edit mode
    Then I softly see fields "ProgramAccomplishments__c" is in edit mode
    Then I softly see fields "RegionalOrLocalOffice__c" is in edit mode
    Then I softly see fields "HeadquartersOffice__c" is in edit mode
    Then I softly see fields "WebsiteAddress__c" is in edit mode
    When I clear the value from field "FederalProgramCFDA__c"
    When I clear the value from field "ProgramName__c"
    And I click on remove for lookup from field "Account__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Program Number is required in the Overview tab under the Information section.       |
      | To Save, Program Name is required in the Overview tab under the Information section.         |
      | To Save, Funding Organization is required in the Overview tab under the Information section. |
      | To Save, Program Objectives is required in the Overview tab under the Information section.   |
    And I click on "Cancel" in the page details
    Then I softly can see top right button "Activate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on "Activate" in the page details
    Then I softly see the following messages in the page details contains:
      | To Submit , Applicant Eligibility is required in the Overview tab under the Eligibility Requirements section. |
    Examples:
      | User       |
      | GRANTEE PO |

  @476963 @NonFederalprogramVerifyvalidationsdisplayedtoPOuseronNonFederalprogram @PM_Grantee @P3_Grantee @GRegression1
  Scenario Outline: Non-Federal program - Verify validations displayed to PM user on Non Federal program
    When I login to "Grantee" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    And I wait for "10" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly see "Create Non Federal Program" opens in overLay window
    Then I softly see field on modal "Program Name" inside page block
    Then I softly see field on modal "Abbreviation" inside page block
    Then I softly see field on modal "Type" inside page block
    Then I softly see field on modal "NGO Organization" inside page block
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Program Name is required.     |
      | To Save, Type is required.             |
      | To Save, NGO Organization is required. |
    When I enter "Grantee_nonFed" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Status" as "Created"
    Then I softly see fields "FederalProgramCFDA__c" is in edit mode
    Then I softly see fields "ProgramName__c" is in edit mode
    Then I softly see fields "Account__c" is in edit mode
    Then I softly see fields "Objectives__c" is in edit mode
    Then I softly see fields "AssistanceType__c" is in edit mode
    Then I softly see fields "UsesAndUseRestrictions__c" is in edit mode
    Then I softly see fields "CredentialsDocumentation__c" is in edit mode
    Then I softly see fields "ApplicantEligibility__c" is in edit mode
    Then I softly see fields "BeneficiaryEligibility__c" is in edit mode
    Then I softly see fields "PreapplicationCoordination__c" is in edit mode
    Then I softly see fields "ApplicationProcedures__c" is in edit mode
    Then I softly see fields "Deadlines__c" is in edit mode
    Then I softly see fields "AwardProcedure__c" is in edit mode
    Then I softly see fields "RangeofApprovalDisApprovalTime__c" is in edit mode
    Then I softly see fields "Appeals__c" is in edit mode
    Then I softly see fields "Renewals__c" is in edit mode
    Then I softly see fields "CriteriaforSelectingProposals__c" is in edit mode
    Then I softly see fields "RangeofApprovalDisApprovalTime__c" is in edit mode
    Then I softly see fields "Appeals__c" is in edit mode
    Then I softly see fields "Renewals__c" is in edit mode
    Then I softly see fields "CriteriaforSelectingProposals__c" is in edit mode
    Then I softly see fields "FormulaandMatchingRequirements__c" is in edit mode
    Then I softly see fields "LengthandTimePhasingofAssistance__c" is in edit mode
    Then I softly see fields "Reports__c" is in edit mode
    Then I softly see fields "Audits__c" is in edit mode
    Then I softly see fields "Records__c" is in edit mode
    Then I softly see fields "RegulationsGuidelinesAndLiterature__c" is in edit mode
    Then I softly see fields "AccountIdentification__c" is in edit mode
    Then I softly see fields "Obligations__c" is in edit mode
    Then I softly see fields "RangeandAverageofFinancialAssistanc__c" is in edit mode
    Then I softly see fields "ProgramAccomplishments__c" is in edit mode
    Then I softly see fields "RegionalOrLocalOffice__c" is in edit mode
    Then I softly see fields "HeadquartersOffice__c" is in edit mode
    Then I softly see fields "WebsiteAddress__c" is in edit mode
    When I clear the value from field "FederalProgramCFDA__c"
    When I clear the value from field "ProgramName__c"
    And I click on remove for lookup from field "Account__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Program Number is required in the Overview tab under the Information section.       |
      | To Save, Program Name is required in the Overview tab under the Information section.         |
      | To Save, Funding Organization is required in the Overview tab under the Information section. |
      | To Save, Program Objectives is required in the Overview tab under the Information section.   |
    And I click on "Cancel" in the page details
    Then I softly can see top right button "Activate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on "Activate" in the page details
    Then I softly see the following messages in the page details contains:
      | To Submit , Applicant Eligibility is required in the Overview tab under the Eligibility Requirements section. |
    Examples:
      | User       |
      | GRANTEE PM |

  @476633 @ValidateNon-FederalprogramAdminusercannotcreateNonFederalprogram  @ADMIN_Grantee @P3_Grantee @GRegression3
  Scenario Outline: Validate Non-Federal program Admin user cannot create Non Federal program
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:nonFederalProgramsTableId---"
    Examples:
      | userType        |
      | GRANTEE ADMIN   |

  @476634 @ValidateNon-FederalprogramAdminusercannotcreateNonFederalprogram @FO_Grantee @P3_Grantee @GRegression3
  Scenario Outline: Validate Non-Federal program Admin user cannot create Non Federal program
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:nonFederalProgramsTableId---"
    Examples:
      | userType        |
      | GRANTEE FO      |

  @476635 @ValidateNon-FederalprogramAdminusercannotcreateNonFederalprogram @FD_Grantee @P3_Grantee @GRegression3
  Scenario Outline: Validate Non-Federal program FD user cannot create Non Federal program
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:nonFederalProgramsTableId---"
    Examples:
      | userType        |
      | GRANTEE FD      |

  @476636 @ValidateNon-FederalprogramAdminusercannotcreateNonFederalprogram @EXE_Grantee @P3_Grantee @GRegression3
  Scenario Outline: Validate Non-Federal program EXE user cannot create Non Federal program
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:nonFederalProgramsTableId---"
    Examples:
      | userType        |
      | GRANTEE EXE     |

  @476637 @ValidateNon-FederalprogramAdminusercannotcreateNonFederalprogram @AUDITOR_Grantee @P4_Grantee @GRegression3
  Scenario Outline: Validate Non-Federal program Admin user cannot create Non Federal program
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:nonFederalProgramsTableId---"
    Examples:
      | userType        |
      | GRANTEE AUDITOR |
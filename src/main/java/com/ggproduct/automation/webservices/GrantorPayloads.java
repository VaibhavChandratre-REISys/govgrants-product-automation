package com.ggproduct.automation.webservices;

import com.google.gson.JsonArray;
import com.google.gson.JsonNull;
import com.google.gson.JsonObject;
import com.helperPackage.register.EnvironmentFactory;
import com.helperPackage.register.I;

import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;
import java.util.Map;


public class GrantorPayloads {

    public JsonObject applicationReview(String applicationName, String announcementName, String filter) {
        JsonObject defaultJson = defaultPayloadApplicationReview(applicationName, announcementName);

        String user = "";

        if (filter.toLowerCase().contains("user")) {
            user = filter.split("-")[1].split("user")[0].trim();
            updateAppOwnerAndContact(defaultJson, user);
            filter = filter.split("-")[0];
        } else {
            filter = filter.toUpperCase();
        }
        switch (filter) {
            case "APPLICATION":
                break;
            case "BUDGETCATEGORY":
                break;
            case "BUDGETCATEGORY_NO_FOCUSAREA":
                return updateBudgetCategorNoFocusAreas(defaultJson);
            case "SECOND_BUDGET_CATEGORY":
                return updateBudgetCategoryForTwoFocusAreas(defaultJson);
            case "FIRST_BUDGET_CATEGORY":
                return updateBudgetCategoryForFirstFocusAreas(defaultJson);
            case "FIRST_BUDGET_CATEGORY_NO_FOCUS_AREA":
                return updateBudgetCategoryForFirstFocusAreasNoFocusArea(defaultJson);
            case "TWO_BUD_CAT_FIFTEEN_HUNDRED_AMT":
                return updateBudgetCategoryForTwoFocusAreasFifteenHundredAmt(defaultJson);
            case "SECOND_BUDGET_CAT_DETAILS_BUD_YES":
                return updateBudgetCategoryForTwoFocusAreasDetailsBudgetYes(defaultJson);
            case "BUDGET_CAT_DETAILS_BUD_YES":
                return updateBudgetCategoryForOneFocusAreasDetailsBudgetYes(defaultJson);
            case "KYECONTACTS":
                break;
            case "KEYOUTCOME":
                break;
            default:
                return defaultJson;
        }
        return defaultJson;
    }

    private JsonObject updateBudgetCategoryForOneFocusAreasDetailsBudgetYes(JsonObject defaultJson) {
        JsonArray budgetCategoryArray = new JsonArray();
        JsonObject budgetCategory1 = new JsonObject();
        budgetCategory1.addProperty("Title", "Construction");
        budgetCategory1.addProperty("Narrative", "Construction");
        budgetCategory1.addProperty("BudgetRequest", 1000);
        budgetCategory1.addProperty("CashMatch", 100);
        budgetCategory1.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory1.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory1.addProperty("ServiceAreaTitle", "Automation Permanent Focus Area");
        budgetCategoryArray.add(budgetCategory1);
        defaultJson.add("BuildUpItems", budgetCategoryArray);
        return defaultJson;
    }

    private JsonObject updateBudgetCategoryForTwoFocusAreasDetailsBudgetYes(JsonObject defaultJson) {
        JsonArray budgetCategoryArray = new JsonArray();
//        JsonObject budgetCategory2 = defaultJson.getAsJsonArray("BudgetCategory").get(0).getAsJsonObject();

        JsonObject budgetCategory1 = new JsonObject();
        budgetCategory1.addProperty("Title", "Construction");
        budgetCategory1.addProperty("Narrative", "Construction");
        budgetCategory1.addProperty("BudgetRequest", 500);
        budgetCategory1.addProperty("CashMatch", 100);
        budgetCategory1.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory1.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory1.addProperty("ServiceAreaTitle", "Automation Permanent Focus Area");
        budgetCategoryArray.add(budgetCategory1);

        JsonObject budgetCategory2 = new JsonObject();
        budgetCategory2.addProperty("Title", "Construction");
        budgetCategory2.addProperty("Narrative", "Construction");
        budgetCategory2.addProperty("BudgetRequest", 500);
        budgetCategory2.addProperty("CashMatch", 100);
        budgetCategory2.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory2.addProperty("ServiceAreaTitle", "Automation Permanent Focus Area2");
        budgetCategoryArray.add(budgetCategory2);
        defaultJson.add("BuildUpItems", budgetCategoryArray);
        return defaultJson;
    }

    private JsonObject updateBudgetCategoryForFirstFocusAreasNoFocusArea(JsonObject defaultJson) {
        JsonArray budgetCategoryArray = new JsonArray();
        JsonObject budgetCategory2 = defaultJson.getAsJsonArray("BudgetCategory").get(0).getAsJsonObject();

        JsonObject budgetCategory1 = new JsonObject();
        budgetCategory1.addProperty("BudgetCategory", "Construction");
        budgetCategory1.addProperty("BudgetRequest", 1000);
        budgetCategory1.addProperty("CashMatch", 100);
        budgetCategory1.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory1.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory1.addProperty("ServiceAreaTitle", "Standard Focus Area");
        budgetCategoryArray.add(budgetCategory1);
        defaultJson.add("BudgetCategory", budgetCategoryArray);
        return defaultJson;
    }

    private JsonObject updateBudgetCategoryForTwoFocusAreasFifteenHundredAmt(JsonObject json) {
        JsonArray budgetCategoryArray = new JsonArray();
        JsonObject budgetCategory2 = json.getAsJsonArray("BudgetCategory").get(0).getAsJsonObject();

        JsonObject budgetCategory1 = new JsonObject();
        budgetCategory1.addProperty("BudgetCategory", "Construction");
        budgetCategory1.addProperty("BudgetRequest", 1500);
        budgetCategory1.addProperty("CashMatch", 100);
        budgetCategory1.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory1.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory1.addProperty("ServiceAreaTitle", "Automation Permanent Focus Area");
        budgetCategoryArray.add(budgetCategory1);

        budgetCategory2.addProperty("BudgetCategory", "Construction");
        budgetCategory2.addProperty("BudgetRequest", 1500);
        budgetCategory2.addProperty("CashMatch", 100);
        budgetCategory2.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory2.addProperty("ServiceAreaTitle", "Automation Permanent Focus Area2");
        budgetCategoryArray.add(budgetCategory2);
        json.add("BudgetCategory", budgetCategoryArray);
        return json;
    }

    private JsonObject updateBudgetCategorNoFocusAreas(JsonObject json) {
        JsonArray budgetCategoryArray = new JsonArray();
        JsonObject budgetCategory2 = json.getAsJsonArray("BudgetCategory").get(0).getAsJsonObject();

        JsonObject budgetCategory1 = new JsonObject();
        budgetCategory1.addProperty("BudgetCategory", "Construction");
        budgetCategory1.addProperty("BudgetRequest", 1000);
        budgetCategory1.addProperty("CashMatch", 100);
        budgetCategory1.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory1.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory1.addProperty("ServiceAreaTitle", "Standard Focus Area");
        budgetCategoryArray.add(budgetCategory1);
        json.add("BudgetCategory", budgetCategoryArray);
        return json;
    }

    private JsonObject updateBudgetCategoryForFirstFocusAreas(JsonObject defaultJson) {
        JsonArray budgetCategoryArray = new JsonArray();
        JsonObject budgetCategory2 = defaultJson.getAsJsonArray("BudgetCategory").get(0).getAsJsonObject();

        JsonObject budgetCategory1 = new JsonObject();
        budgetCategory1.addProperty("BudgetCategory", "Construction");
        budgetCategory1.addProperty("BudgetRequest", 500);
        budgetCategory1.addProperty("CashMatch", 100);
        budgetCategory1.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory1.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory1.addProperty("ServiceAreaTitle", "Automation Permanent Focus Area");
        budgetCategoryArray.add(budgetCategory1);
        defaultJson.add("BudgetCategory", budgetCategoryArray);
        return defaultJson;
    }

    private JsonObject updateBudgetCategoryForTwoFocusAreas(JsonObject json) {
        JsonArray budgetCategoryArray = new JsonArray();
        JsonObject budgetCategory2 = json.getAsJsonArray("BudgetCategory").get(0).getAsJsonObject();

        JsonObject budgetCategory1 = new JsonObject();
        budgetCategory1.addProperty("BudgetCategory", "Construction");
        budgetCategory1.addProperty("BudgetRequest", 500);
        budgetCategory1.addProperty("CashMatch", 100);
        budgetCategory1.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory1.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory1.addProperty("ServiceAreaTitle", "Automation Permanent Focus Area");
        budgetCategoryArray.add(budgetCategory1);

        budgetCategory2.addProperty("BudgetCategory", "Construction");
        budgetCategory2.addProperty("BudgetRequest", 500);
        budgetCategory2.addProperty("CashMatch", 100);
        budgetCategory2.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory2.addProperty("ServiceAreaTitle", "Automation Permanent Focus Area2");
        budgetCategoryArray.add(budgetCategory2);
        json.add("BudgetCategory", budgetCategoryArray);
        return json;
    }

    private void updateAppOwnerAndContact(JsonObject json, String user) {
        JsonObject jsonObject = json.getAsJsonArray("Application").get(0).getAsJsonObject();
        JsonArray aappOwner = new JsonArray();
        jsonObject.addProperty("OwnerId", ProjectWebServices.getIdOf("User", user));
        aappOwner.add(jsonObject);
        json.add("Application", aappOwner);

        JsonObject jsonObject1 = json.getAsJsonArray("KeyContact").get(0).getAsJsonObject();
        JsonArray keyContact = new JsonArray();
        jsonObject1.addProperty("Contact", ProjectWebServices.getIdOf("Contact", user)); // Automation SPI id
        keyContact.add(jsonObject1);
        json.add("KeyContact", keyContact);
    }

    public JsonObject defaultPayloadApplicationReview(String applicationName, String announcementName) {

        String ownerName = "Automation SPI3";
        String contactName = "Automation SPI3";
        String kpiName = "Automation Permanent KPI";

        JsonObject parent = new JsonObject();

        JsonObject application = new JsonObject();
        JsonArray applicationArray = new JsonArray();
        application.addProperty("Title", applicationName);
        application.addProperty("AddressLine1", "3 Capitol Hill Blvd");
        application.addProperty("City", "Montana");
        application.addProperty("County", "RI");
        application.addProperty("State", "UT");
        application.addProperty("ZipCode", "02908");
        application.addProperty("ProjectAbstract", "Test");
        application.addProperty("Justification", "this is Justification");
        application.addProperty("Announcement", ProjectWebServices.getIdOf("Announcement__c", announcementName));
        application.add("PreApplication", JsonNull.INSTANCE);
        application.addProperty("RecordTypeId", ProjectWebServices.getRecordTypeId("Application__c", "Grantor"));
        application.addProperty("OwnerId", ProjectWebServices.getIdOf("User", ownerName));
        application.addProperty("ApproachMethodology", "Approch methodology test");
        application.addProperty("Capacity", "Capacity test");
        application.addProperty("Qualifications", "Qualifications test");
        applicationArray.add(application);
        parent.add("Application", applicationArray);

        JsonObject budgetCategory = new JsonObject();
        JsonArray budgetCategoryArray = new JsonArray();
        budgetCategory.addProperty("BudgetCategory", "Construction");
        budgetCategory.addProperty("BudgetRequest", 1000);
        budgetCategory.addProperty("CashMatch", 100);
        budgetCategory.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory.addProperty("ServiceAreaTitle", "Automation Permanent Focus Area");
        budgetCategoryArray.add(budgetCategory);
        parent.add("BudgetCategory", budgetCategoryArray);

        JsonObject keyContacts = new JsonObject();
        JsonArray keyContactsArray = new JsonArray();
        keyContacts.addProperty("ProjectRole", "Project Director/Manager");
        keyContacts.addProperty("Contact", ProjectWebServices.getIdOf("Contact", contactName)); // Automation SPI id
        keyContacts.addProperty("IsKeyContact", true);
        keyContactsArray.add(keyContacts);
        parent.add("KeyContact", keyContactsArray);

        JsonObject keyOutcome = new JsonObject();
        JsonArray keyOutcomeArray = new JsonArray();
        keyOutcome.addProperty("MasterKPI", ProjectWebServices.getIdOf("MasterKPI__c", kpiName)); // KPI id
        keyOutcome.addProperty("Target", "10");
        keyOutcomeArray.add(keyOutcome);
        parent.add("KeyOutcome", keyOutcomeArray);

        return parent;
    }

    private JsonObject getIdsOfUsers(List<String> users) {
        JsonObject idsApi = new JsonObject();
        JsonArray usersArray = new JsonArray();
        for (String user : users) {
            usersArray.add(user);
        }
        idsApi.add("User", usersArray);
        return idsApi;
    }

    public JsonObject defaultRequestPayroleForApprovedDFM() {
        Map<String, String> map = ProjectWebServices.getMultipleIds(getIdsOfUsers(Arrays.asList("Automation EXE", "Automation FO", "Automation PM")));
        JsonObject parent = new JsonObject();

        JsonArray reviewStepsArray = new JsonArray();
        JsonObject complianceReview = new JsonObject();
        complianceReview.addProperty("Reviewer", map.get("Automation EXE"));
        complianceReview.addProperty("FormName", "Compliance Review");
        complianceReview.addProperty("DueInDays", 7);

        JsonObject programReview = new JsonObject();
        programReview.addProperty("Reviewer", map.get("Automation PM"));
        programReview.addProperty("FormName", "Program Review");
        programReview.addProperty("DueInDays", 7);

        JsonObject fiscalReview = new JsonObject();
        fiscalReview.addProperty("Reviewer", map.get("Automation FO"));
        fiscalReview.addProperty("FormName", "Fiscal Review");
        fiscalReview.addProperty("DueInDays", 7);

        JsonObject managementReview = new JsonObject();
        managementReview.addProperty("Reviewer", map.get("Automation FO"));
        managementReview.addProperty("FormName", "Management Review");
        managementReview.addProperty("DueInDays", 7);

        JsonObject preScreen = new JsonObject();
        preScreen.addProperty("Reviewer", map.get("Automation FO"));
        preScreen.addProperty("FormName", "Pre-Screen");
        preScreen.addProperty("DueInDays", 7);

        reviewStepsArray.add(complianceReview);
        reviewStepsArray.add(programReview);
        reviewStepsArray.add(fiscalReview);
        reviewStepsArray.add(managementReview);
        reviewStepsArray.add(preScreen);

        parent.add("ReviewSteps", reviewStepsArray);

        JsonObject FDM = new JsonObject();
        JsonArray FDMArray = new JsonArray();
        FDM.addProperty("SubawardAbbreviation", "AWD");
        FDM.addProperty("RecommendedForAward", "Yes");
        FDM.addProperty("RecommendedAmount", 1000);
        FDM.addProperty("TotalCommitmentAmount",1000);
        FDMArray.add(FDM);

        parent.add("FDM", FDMArray);

        return parent;
    }

    public JsonObject getIdsForCreateAwardFromFDM(String annName) {

        JsonObject ids = new JsonObject();

        JsonArray fdmA = new JsonArray();
        fdmA.add(annName);
        ids.add("ReviewStep__c", fdmA);

        JsonArray user = new JsonArray();
        user.add("Automation PM");
        ids.add("User", user);

        JsonArray service_area = new JsonArray();
        service_area.add("Automation Permanent Focus Area");
        ids.add("ServiceArea__c", service_area);

        JsonArray strategic_plan = new JsonArray();
        strategic_plan.add("Automation Permanent Strategic Plan");
        ids.add("StrategicPlan__c", strategic_plan);

        JsonArray kpi = new JsonArray();
        kpi.add("Automation Permanent KPI for Regression");
        ids.add("MasterKPI__c", kpi);

        JsonArray contact = new JsonArray();
        contact.add("Automation SPI3");
        ids.add("Contact", contact);

        return ids;
    }

    public JsonObject defaultPayloadCreateAwardFromFDM(String announcementName) {
        JsonObject parent = new JsonObject();
        Map<String, String> map = ProjectWebServices.getMultipleIds(getIdsForCreateAwardFromFDM(announcementName));

        JsonObject grant = new JsonObject();
        JsonArray grantArray = new JsonArray();
        grant.addProperty("FDM", map.get(announcementName));
        grant.addProperty("RecordTypeId", ProjectWebServices.getRecordTypeId("Grant__c", "Grantor"));
        grant.addProperty("OwnerId", map.get("Automation PM"));
        grantArray.add(grant);
        parent.add("Grant", grantArray);

        JsonObject award = new JsonObject();
        JsonArray awardArray = new JsonArray();
        award.addProperty("GrantAwardDescription", "Award Created From Automation API");
        award.addProperty("BudgetPeriodEndDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(150, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        award.addProperty("PM", ProjectWebServices.getIdOf("User", "Automation PM"));
        award.addProperty("FO", ProjectWebServices.getIdOf("User", "Automation FO"));
        award.addProperty("EXE", ProjectWebServices.getIdOf("User", "Automation EXE"));
        awardArray.add(award);
        parent.add("Award", awardArray);

        JsonObject awardFundingAccount = new JsonObject();
        JsonArray awardFundingAccountArray = new JsonArray();
        awardFundingAccount.addProperty("PreEncumbranceAmount", "1000");
        awardFundingAccountArray.add(awardFundingAccount);
        parent.add("AwardFundingAccount", awardFundingAccountArray);

//        JsonObject awardBudgetCategory = new JsonObject();
//        JsonArray awardBudgetCategoryArray = new JsonArray();
//        awardBudgetCategory.addProperty("BudgetCategory", "Construction");
//        awardBudgetCategory.addProperty("AwardedBudget", "1000");
//        awardBudgetCategory.addProperty("CashMatch", "100");
//        awardBudgetCategory.add("OtherLeverage", JsonNull.INSTANCE);
//        awardBudgetCategoryArray.add(awardBudgetCategory);
//        parent.add("AwardBudgetCategory", awardBudgetCategoryArray);

        JsonObject awardServiceArea = new JsonObject();
        JsonArray awardServiceAreaArray = new JsonArray();
        awardServiceArea.addProperty("ServiceArea", map.get("Automation Permanent Focus Area"));
        awardServiceArea.addProperty("GATStartDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(50, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceArea.addProperty("GATEndDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(150, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaArray.add(awardServiceArea);
        parent.add("AwardServiceArea", awardServiceAreaArray);

        JsonObject kpiGoalsObjectives = new JsonObject();
        JsonArray kpiGoalsObjectivesArrays = new JsonArray();
        kpiGoalsObjectives.addProperty("StrategicPlan", map.get("Automation Permanent Strategic Plan"));
        kpiGoalsObjectivesArrays.add(kpiGoalsObjectives);
        parent.add("KPIGoalsObjectives", kpiGoalsObjectivesArrays);

        JsonObject keyOutcome = new JsonObject();
        JsonArray keyOutcomeArray = new JsonArray();
        keyOutcome.addProperty("MasterKPI", map.get("Automation Permanent KPI"));
        keyOutcome.addProperty("Target", "10");
        keyOutcomeArray.add(keyOutcome);
        parent.add("KeyOutcome", keyOutcomeArray);

        JsonObject keyContacts = new JsonObject();
        JsonArray keyContactsArray = new JsonArray();
        keyContacts.addProperty("ProjectRole", "Project Director/Manager");
        keyContacts.addProperty("Contact", map.get("Automation SPI3"));
        keyContacts.addProperty("IsKeyContact", true);
        keyContactsArray.add(keyContacts);
        parent.add("KeyContacts", keyContactsArray);

        return parent;
    }

    /**
     * @return
     */
    public JsonObject defaultPayloadActivateAwardFromFDM() {
        JsonObject parent = new JsonObject();
        JsonArray termConditionSchedule = new JsonArray();

        JsonObject paymentRequest = new JsonObject();
        paymentRequest.addProperty("SubmissionTitle", "Payment Request Schedule");
        paymentRequest.addProperty("CalReportingStartDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(50, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        paymentRequest.addProperty("CalReportingEndDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(150, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        paymentRequest.addProperty("Frequency", "Bi-Monthly");
        paymentRequest.addProperty("ScheduleBase", "Reporting Period");
        paymentRequest.addProperty("SubmissionType", "Payment Request");

        termConditionSchedule.add(paymentRequest);

        JsonObject progressReport = new JsonObject();
        progressReport.addProperty("SubmissionTitle", "Progress Report Schedule");
        progressReport.addProperty("CalReportingStartDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(50, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReport.addProperty("CalReportingEndDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(150, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReport.addProperty("Frequency", "Bi-Monthly");
        progressReport.addProperty("ScheduleBase", "Reporting Period");
        progressReport.addProperty("SubmissionType", "Progress Report");
        termConditionSchedule.add(progressReport);

        parent.add("TermConditionSchedule", termConditionSchedule);

        return parent;
    }


    /**
     * @param annType
     * @param annName
     * @param filter
     * @return This method include switch cases. If we wants to change the some parameter from the default payload returned by method
     * @see #getDefaultPayloadPublishAnn(String, String) then we can simply create our own method having parameter(this parameter would be json object return
     * by method getDefaultPayloadPublishAnn(String,String)) and then we can create out own swtich case and call that method under this switch case. And pass
     * this switch cases from feature step....
     * e.g take a look at BUDGETPERIODDATES case below...
     */
    public JsonObject publishAnnPayload(String annType, String annName, String filter) {
        JsonObject json = getDefaultPayloadPublishAnn(annType, annName);
        String user = "";

        if (filter.toLowerCase().contains("user")) {
            user = filter.split("-")[1].split("user")[0].trim();
            updateAnnouncementOwner(json, user);
            filter = filter.split("-")[0];
        } else {
            filter = filter.toUpperCase();
        }

        switch (filter) {
            case "BUDGETPERIODDATES":
                return updateBudgetPeridDateForAnnouncement(json);
            case "DETAILE_BUDGET_YES":
                return updateDetailebudgetYesForAnnouncement(json);
            case "NO_RISK_ASSESSMENT":
                return updateRiskAssesmentAsNoForAnnouncement(json);
            case "PRE_APPLICATION_YES":
                return updatePreApplicationAsYesForAnnouncement(json);
            case "PRE_APPLICATION_YES_WITH_IND_ORG":
                return updatePreApplicationAsYesForAnnouncementWithIndOrg(json);
            case "PRE_APPLICATION_NEGOTIATION_YES":
                return updatePreApplicationAndNegotiationAsYesForAnnouncement(json);
            case "PRE_APP_YES_NEGO_YES_FOCUS_AREA_NO":
                return updatePreApplicationAndNegotiationAsYesAndFocusAreaNoForAnnouncement(json);
            case "FOCUS_AREA_NO":
                return updateFocusAreaForAnnouncement(json, "No");
            case "NEGOTIATION":
                return negotiationYesForAnnouncement(json);
            case "NEGOTIATION_YES_FOCUS_NO":
                return negotiationYesFocusNoForAnnouncement(json);
            case "NEGOTIATION_NO":
                return negotiationNoForAnnouncement(json);
            case "PRE_APP_YES_FOCUS_AREA_NO":
                return preAppYesFocusAreaNoAnnouncement(json);
            case "BY_APPLICANT_FOCUS_AREA_NO":
                return byApplicantFocusAreaNo(json);
            case "BY_APPLICANT":
                return byApplicant(json);
            case "BY_APPLICANT_FOCUS_AREA":
                return byApplicantFocusArea(json);
            case "GOALS_YES":
                return goalsYesForAnnouncement(json);
            case "PRE_APP_GOALS_YES":
                return preAppYesGoalsYesForAnnouncement(json);
            case "PRE_APP_YES_PROGRAM_INCOME_NO":
                return preAppYesProgramIncomeNoForAnnouncement(json);
            case "TODAY_APP_DUE_DATE":
                return todayAppDueDateAnnouncement(json);
            case "APPLICATION_PAST_DUE_DATE":
                return pastAppDueDateAnnouncement(json);
            case "TODAY_PREAPP_DUE_DATE":
                return todayPreAppDueDateAnnouncement(json);
            case "PRE_APPLICATION_YES_AND_NO_MATCH":
                json = updatePreApplicationAsYesForAnnouncement(json);
                return updateMachRequiredToNoAnnouncement(json);
            case "SUB_MATCH_YES_RISK_YES_EXPENSE_YES_ADVANCE_NO":
                return subMatchYesRequiredMatch10RiskYesExpenseYesAdvacnceYesAnnouncement(json);
            case "BY_APPLICANT_NEGOTIATION_NO":
                return byApplicantNegotiationNo(json);
            case "BY_APPLICANT_FOCUS_NO_NEGOTIATION_NO":
                return byApplicantFocusNoNegotiationNo(json);
            case "BY_APPLICANT_FOCUS_AREA_NO_NEGOTIATION_NO":
                return byApplicantFocusAreaNoNegotiationsNo(json);
            case "BY_APPLICANT_FOCUS_AREA_NO_NEGOTIATION_YES":
                return byApplicantFocusAreaNoNegotiationsYes(json);
            case "BY_APPLICANT_FOCUS_AREA_NEGOTIATION_NO":
                return byApplicantFocusAreaNegotiationsNo(json);
            case "BY_APPLICANT_FOCUS_AREA_NEGOTIATION_YES":
                return byApplicantFocusAreaNegotiationsYes(json);
            case "BY_APPLICANT_FOCUS_AREA_RISK_ASSESSMENT_NO":
                return byApplicantFocusAreaRiskAssessmentNo(json);
            case "BY_APPLICANT_RISK_ASSESSMENT_NO":
                return byApplicantRiskAssessmentNo(json);
            case "BY_APPLICANT_FOCUS_AREA_NO_RISKASSESSMENT_NO":
                return byApplicantFocusAreaNoRiskAssessmentNo(json);
            case "NO_RISK_ASSESSMENT_FOCUS_AREA_NO":
                return updateRiskAssesmentAsNoForAnnouncementFocusAreaNo(json);
            case "INVITED_APPLICANT_IND_ORG":
                return invitedIndUserOrganization(json);
            case "INVITED_APPLICANT_IND_ORG_SPI_ORG":
                return invitedIndUserSPIUerOrganization(json);
            case "INVITED_APPLICANT_IND_ORG_FOCUS_AREA_NO":
                return invitedIndUserOrganizationFocusAreaNo(json);
            case "INVITED_APPLICANT_IND_ORG_BY_APPLICANT":
                return invitedIndUserOrganizationbyApplicant(json);
            case "INVITED_APPLICANT_IND_ORG_BY_APPLICANT_RISK_NO":
                return invitedIndUserOrganizationbyApplicantRiskNo(json);
            case "INVITED_APPLICANT_IND_ORG_BY_APPLICANT_FOCUS_AREA_NO":
                return invitedIndUserOrganizationbyApplicantFocusAreaNo(json);
            case "INVITED_APPLICANT_IND_ORG_BY_APPLICANT_FOCUS_AREA":
                return invitedIndUserOrganizationbyApplicantFocusArea(json);
            case "INVITED_APP_IND_ORG_BY_APP_FOCUS_AREA_RISK_NO":
                return invitedIndUserOrganizationbyApplicantFocusAreaRiskNo(json);
            case "INVITED_APPLICANT_IND_ORGPRE_PRE_APPLICATION_NEGOTIATION":
                return invitedIndUserOrganizationPreApplicationAndNegotiationAsYes(json);
            case "SECOND_FOCUS_AREA_APPLICANT_IND_ORG_PRE_APPLICATION":
                return invitedIndUserOrganizationSecondFocusAreaPreApplicationYes(json);
            case "INVITED_APP_IND_ORG_BY_APP_TWO_FOCUS_AREA_RISK_NO":
                return invitedIndUserOrganizationbyAppTwoFocusAreaRiskNo(json);
            case "SECOND_FOCUS_AREA":
                return updateAnnouncementWithSecondFocusArea(json);
            case "SECOND_FOCUS_AREA_RISK_ASS_NO":
                return updateAnnouncementWithSecondFocusAreaRiskNo(json);
            case "SECOND_FOCUS_AREA_BY_APPL_RISK_ASS_NO":
                return updateAnnouncementWithSecondFocusAreaByappRiskNo(json);
            case "SECOND_FOCUS_AREA_BY_APPL_NEGO_NO_RISK_ASS_NO":
                return updateAnnouncementWithSecondFocusAreaByappRiskNoNegoNo(json);
            case "THREE_FOCUS_AREA_BY_APPL_RISK_ASS_NO":
                return updateAnnouncementWithThreeFocusAreaByappRiskNo(json);
            case "SECOND_FOCUS_AREA_BY_APPLICANT_FOCUS_AREA_RISK_ASS_NO":
                return updateAnnouncementWithSecondFocusAreaByappFocusAreaRiskNo(json);
            case "SECOND_FOCUS_AREA_BY_APPLICANT_DET_YES_FOCUS_AREA_RISK_ASS_NO":
                return updateAnnouncementWithSecondFocusAreaByappDetYesFocusAreaRiskNo(json);
            case "THREE_FOCUS_BY_APP_FOCUS_AREA_RISK_NO_PROGRAM_INCOME_NO_SUB_MATCH_NO":
                return updateAnnouncementWithSecondFocusAreaByappFocusAreaRiskNoNOIncomeSubMatchNo(json);
            case "SECOND_FOCUS_AREA_DETAILS_BUDGET_YES_RISK_NO":
                return updateAnnouncementWithSecondFocusAreaDetailBudgetYes(json);
            case "THREE_FOCUS_BY_APP_DETAILS_BUDGET_YES_RISK_NO":
                return updateAnnouncementWithThreeFocusAreaByappDetailsYesRiskNo(json);
            case "PROGRAM_FOR_PREAPP_SUPP_DOC_YES":
                return updateAnnouncementWithProgramSuppDocYes(json);
            case "PROGRAM_FOR_APP_SUPP_DOC_YES":
                return updateApplicationWithProgramSuppDocYes(json);
            case "BY_APPLICANT_DETAILS_BUDGET_YES_RISK_NO":
                return updateAnnouncementWithByAppDetailBudgetYes(json);
            default:
                return json;
        }
    }

    private JsonObject invitedIndUserOrganizationbyApplicantRiskNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("InvitedApplicant").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        pre.add(jsonObject);
        json.add("InvitedApplicant", pre);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        jsonObject1.addProperty("Allocationlevel","By Applicant");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject invitedIndUserOrganizationbyAppTwoFocusAreaRiskNo(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel", "By Applicant and Focus Area");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        JsonObject invApp = new JsonObject();
        JsonArray invAppA = new JsonArray();
        invApp.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        invApp.addProperty("AllocatedAmount", 500);
        invAppA.add(invApp);
        json.add("InvitedApplicant", invAppA);
        return json;
    }

    private JsonObject invitedIndUserOrganizationbyApplicantFocusAreaRiskNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("InvitedApplicant").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        pre.add(jsonObject);
        json.add("InvitedApplicant", pre);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel", "By Applicant and Focus Area");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject updateAnnouncementWithByAppDetailBudgetYes(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel","By Applicant");
        jsonObject.addProperty("IsNegotiationsAllowed","Yes");
        jsonObject.addProperty("RiskAssessment_Required", "No");
        jsonObject.addProperty("DetailedBudgetingRequired", "Yes");
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject updateAnnouncementWithProgramSuppDocYes(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Program", ProjectWebServices.getIdOf("Program__c", "Automation Permanent PreApp Supp Doc Yes"));
        jsonObject.addProperty("PreApplicationNeeded", "Yes");
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject updateApplicationWithProgramSuppDocYes(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Program", ProjectWebServices.getIdOf("Program__c", "Automation Permanent App Supp Doc Yes"));
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject invitedIndUserSPIUerOrganization(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "SAN DIEGO ELECTRICAL TRAINING TRUST"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        pre.add(jsonObject);
        json.add("InvitedApplicant", pre);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel","N/A");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject updateAnnouncementWithThreeFocusAreaByappDetailsYesRiskNo(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        JsonObject serviceAreaC = new JsonObject();
        serviceAreaC.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Test Focus Area1"));
        serviceArea.add(serviceAreaC);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel", "By Applicant");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        jsonObject1.addProperty("DetailedBudgetingRequired", "Yes");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject updateAnnouncementWithSecondFocusAreaByappRiskNoNegoNo(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel", "By Applicant");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        jsonObject1.addProperty("IsNegotiationsAllowed", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject updateAnnouncementWithSecondFocusAreaDetailBudgetYes(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        jsonObject1.addProperty("DetailedBudgetingRequired", "Yes");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject byApplicantFocusNoNegotiationNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray nego = new JsonArray();
        jsonObject.addProperty("Allocationlevel", "By Applicant");
        jsonObject.addProperty("FocusAreaRequired", "No");
        jsonObject.addProperty("IsNegotiationsAllowed", "No");
        nego.add(jsonObject);
        json.add("Announcement", nego);
        return json;

    }

    private JsonObject updateAnnouncementWithSecondFocusAreaByappFocusAreaRiskNoNOIncomeSubMatchNo(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        JsonObject serviceAreaC = new JsonObject();
        serviceAreaC.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Test Focus Area1"));
        serviceArea.add(serviceAreaC);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel", "By Applicant and Focus Area");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        jsonObject1.addProperty("IsProgramIncomeAnticipated", "No");
        jsonObject1.addProperty("IsMatchRequired", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject updateAnnouncementWithThreeFocusAreaByappRiskNo(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        JsonObject serviceAreaC = new JsonObject();
        serviceAreaC.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Test Focus Area1"));
        serviceArea.add(serviceAreaC);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel", "By Applicant");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject negotiationYesFocusNoForAnnouncement(JsonObject json) {
        JsonObject negotiation = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        negotiation.addProperty("IsNegotiationsAllowed", "Yes");
        negotiation.addProperty("FocusAreaRequired", "no");
        pre.add(negotiation);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject updatePreApplicationAsYesForAnnouncementWithIndOrg(JsonObject json) {
        JsonObject pre_application = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        pre_application.addProperty("PreApplicationNeeded", "Yes");
        pre.add(pre_application);
        pre_application.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        pre.add(pre_application);
        json.add("InvitedApplicant", pre);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject updateAnnouncementWithSecondFocusAreaRiskNo(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject updateAnnouncementWithSecondFocusArea(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        json.add("AnnouncementServiceArea", serviceArea);
        return json;
    }

    private JsonObject invitedIndUserOrganizationSecondFocusAreaPreApplicationYes(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("InvitedApplicant").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        pre.add(jsonObject);
        json.add("InvitedApplicant", pre);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("PreApplicationNeeded", "Yes");
        jsonObject1.addProperty("FocusAreaRequired", "Yes");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        json.add("AnnouncementServiceArea", serviceArea);
        return json;
    }

    private JsonObject updateAnnouncementWithSecondFocusAreaByappRiskNo(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel","By Applicant");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        JsonObject invApp = new JsonObject();
        JsonArray invAppA = new JsonArray();
        invApp.addProperty("Organization", ProjectWebServices.getIdOf("Account", "SAN DIEGO ELECTRICAL TRAINING TRUST"));
        invApp.addProperty("AllocatedAmount", 1000);
        invAppA.add(invApp);
        json.add("InvitedApplicant", invAppA);
        return json;
    }

    private JsonObject updateAnnouncementWithSecondFocusAreaByappFocusAreaRiskNo(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel", "By Applicant and Focus Area");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        JsonObject invApp = new JsonObject();
        JsonArray invAppA = new JsonArray();
        invApp.addProperty("Organization", ProjectWebServices.getIdOf("Account", "SAN DIEGO ELECTRICAL TRAINING TRUST"));
        invApp.addProperty("AllocatedAmount", 500);
        invAppA.add(invApp);
        json.add("InvitedApplicant", invAppA);
        return json;
    }

    private JsonObject updateAnnouncementWithSecondFocusAreaByappDetYesFocusAreaRiskNo(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel", "By Applicant and Focus Area");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        jsonObject1.addProperty("DetailedBudgetingRequired", "Yes");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        JsonObject invApp = new JsonObject();
        JsonArray invAppA = new JsonArray();
        invApp.addProperty("Organization", ProjectWebServices.getIdOf("Account", "SAN DIEGO ELECTRICAL TRAINING TRUST"));
        invApp.addProperty("AllocatedAmount", 500);
        invAppA.add(invApp);
        json.add("InvitedApplicant", invAppA);
        return json;
    }

    private JsonObject invitedIndUserOrganization(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        pre.add(jsonObject);
        json.add("InvitedApplicant", pre);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel","N/A");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject invitedIndUserOrganizationFocusAreaNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("InvitedApplicant").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        pre.add(jsonObject);
        json.add("InvitedApplicant", pre);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("FocusAreaRequired", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject invitedIndUserOrganizationbyApplicant(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("InvitedApplicant").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        pre.add(jsonObject);
        json.add("InvitedApplicant", pre);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel","By Applicant");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject invitedIndUserOrganizationbyApplicantFocusAreaNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("InvitedApplicant").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        pre.add(jsonObject);
        json.add("InvitedApplicant", pre);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel", "By Applicant");
        jsonObject1.addProperty("FocusAreaRequired", "No");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject invitedIndUserOrganizationbyApplicantFocusArea(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("InvitedApplicant").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        pre.add(jsonObject);
        json.add("InvitedApplicant", pre);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel", "By Applicant and Focus Area");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject invitedIndUserOrganizationPreApplicationAndNegotiationAsYes(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("InvitedApplicant").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        pre.add(jsonObject);
        json.add("InvitedApplicant", pre);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("PreApplicationNeeded", "Yes");
        jsonObject1.addProperty("IsNegotiationsAllowed", "Yes");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject updateRiskAssesmentAsNoForAnnouncementFocusAreaNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("FocusAreaRequired", "No");
        jsonObject.addProperty("RiskAssessment_Required", "No");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject byApplicantFocusAreaNoRiskAssessmentNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel", "By Applicant");
        jsonObject.addProperty("FocusAreaRequired", "No");
        jsonObject.addProperty("RiskAssessment_Required", "No");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject byApplicantRiskAssessmentNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel","By Applicant");
        jsonObject.addProperty("IsNegotiationsAllowed","Yes");
        jsonObject.addProperty("RiskAssessment_Required", "No");
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject byApplicantFocusAreaRiskAssessmentNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel","By Applicant and Focus Area");
        jsonObject.addProperty("IsNegotiationsAllowed","Yes");
        jsonObject.addProperty("RiskAssessment_Required", "No");
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject byApplicantFocusAreaNegotiationsYes(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel","By Applicant and Focus Area");
        jsonObject.addProperty("IsNegotiationsAllowed","Yes");
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private void updateAnnouncementOwner(JsonObject json, String user) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray annOwner = new JsonArray();
        jsonObject.addProperty("OwnerId",ProjectWebServices.getIdOf("User",user));
        annOwner.add(jsonObject);
        json.add("Announcement",annOwner);
    }

    private JsonObject byApplicantFocusAreaNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel", "By Applicant");
        jsonObject.addProperty("FocusAreaRequired", "No");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject byApplicant(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel", "By Applicant");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject byApplicantFocusAreaNegotiationsNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel","By Applicant and Focus Area");
        jsonObject.addProperty("IsNegotiationsAllowed","No");
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject byApplicantFocusArea(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel", "By Applicant and Focus Area");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject byApplicantFocusAreaNegotiationYes(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel","By Applicant and Focus Area");
        jsonObject.addProperty("IsNegotiationsAllowed","Yes");
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject byApplicantNegotiationNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray nego = new JsonArray();
        jsonObject.addProperty("Allocationlevel","By Applicant");
        jsonObject.addProperty("IsNegotiationsAllowed","No");
        nego.add(jsonObject);
        json.add("Announcement",nego);
        return json;
    }

    private JsonObject byApplicantFocusAreaNoNegotiationsNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray nego = new JsonArray();
        jsonObject.addProperty("Allocationlevel","By Applicant");
        jsonObject.addProperty("FocusAreaRequired","No");
        jsonObject.addProperty("IsNegotiationsAllowed","No");
        nego.add(jsonObject);
        json.add("Announcement",nego);
        return json;
    }

    private JsonObject byApplicantFocusAreaNoNegotiationsYes(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray nego = new JsonArray();
        jsonObject.addProperty("Allocationlevel","By Applicant");
        jsonObject.addProperty("FocusAreaRequired","No");
        jsonObject.addProperty("IsNegotiationsAllowed","Yes");
        nego.add(jsonObject);
        json.add("Announcement",nego);
        return json;
    }

    private JsonObject updatePreApplicationAndNegotiationAsYesForAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationNeeded", "Yes");
        jsonObject.addProperty("IsNegotiationsAllowed", "Yes");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject updatePreApplicationAndNegotiationAsYesAndFocusAreaNoForAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationNeeded","Yes");
        jsonObject.addProperty("IsNegotiationsAllowed","Yes");
        jsonObject.addProperty("FocusAreaRequired","No");
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject updatePreApplicationAsYesNegotiationYesForAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationNeeded", "Yes");
        jsonObject.addProperty("IsNegotiationsAllowed", "Yes");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;

    }

    private JsonObject updateMachRequiredToNoAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("IsMatchRequired", "No");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject todayPreAppDueDateAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationNeeded", "Yes");
        jsonObject.addProperty("PreApplicationDueDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        jsonObject.addProperty("ApplicationDueDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject pastAppDueDateAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationDueDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(-1, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        jsonObject.addProperty("ApplicationDueDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(-1, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject todayAppDueDateAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationDueDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        jsonObject.addProperty("ApplicationDueDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject preAppYesProgramIncomeNoForAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationNeeded", "Yes");
        jsonObject.addProperty("IsProgramIncomeAnticipated", "No");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject preAppYesGoalsYesForAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationNeeded", "Yes");
        jsonObject.addProperty("IsGoalsRequired", "Yes");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject preAppYesFocusAreaNoAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationNeeded", "Yes");
        jsonObject.addProperty("FocusAreaRequired", "No");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject subMatchYesRequiredMatch10RiskYesExpenseYesAdvacnceYesAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("IsMatchRequired", "Yes");
        jsonObject.addProperty("GranteeMatch", 10);
        jsonObject.addProperty("RiskAssessment_Required", "Yes");
        jsonObject.addProperty("AreExpensesBuildIUpLevel", "Yes");
        jsonObject.addProperty("IsAdvancePermitted", "No");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject goalsYesForAnnouncement(JsonObject json) {
        JsonObject goals = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        goals.addProperty("IsGoalsRequired", "Yes");
        pre.add(goals);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject negotiationYesForAnnouncement(JsonObject json) {
        JsonObject negotiation = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        negotiation.addProperty("IsNegotiationsAllowed", "Yes");
        pre.add(negotiation);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject negotiationNoForAnnouncement(JsonObject json) {
        JsonObject negotiation = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        negotiation.addProperty("IsNegotiationsAllowed", "No");
        pre.add(negotiation);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject updateFocusAreaForAnnouncement(JsonObject json, String no) {
        JsonObject pre_application = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        pre_application.addProperty("FocusAreaRequired", no);
        pre.add(pre_application);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject updatePreApplicationAsYesForAnnouncement(JsonObject json) {
        JsonObject pre_application = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        pre_application.addProperty("PreApplicationNeeded", "Yes");
        pre.add(pre_application);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject updateRiskAssesmentAsNoForAnnouncement(JsonObject json) {
        JsonObject risk_assessment = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray risk = new JsonArray();
        risk_assessment.addProperty("RiskAssessment_Required", "No");
        risk.add(risk_assessment);
        json.add("Announcement", risk);
        return json;
    }

    private JsonObject updateDetailebudgetYesForAnnouncement(JsonObject json) {
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray data = new JsonArray();
        jsonObject1.addProperty("DetailedBudgetingRequired", "Yes");
        data.add(jsonObject1);
        json.add("Announcement", data);
        return json;
    }

    private JsonObject updateBudgetPeridDateForAnnouncement(JsonObject json) {

        JsonObject bperiod = json.getAsJsonArray("BudgetPeriod").get(0).getAsJsonObject();
        JsonArray bperiodA = new JsonArray();

        bperiod.addProperty("BudgetStartDate",
                I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(11, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        bperiodA.add(bperiod);
        json.add("BudgetPeriod", bperiodA);
        return json;
    }

    /**
     * @param annType Formula, Competitive Directed
     * @param annName any name
     * @return JsonObject
     * This method return the default request payload for publishing the announcement
     */
    public JsonObject getDefaultPayloadPublishAnn(String annType, String annName) {

        String program = "Automation Permanent Internal Program";
        JsonObject parent = new JsonObject();

        JsonObject ann = new JsonObject();
        JsonArray annA = new JsonArray();

        ann.addProperty("name", annName);
        ann.addProperty("AnnouncementType", annType);
        ann.addProperty("Program", ProjectWebServices.getIdOf("Program__c", program));
        ann.addProperty("BudgetType", "Construction");
        ann.addProperty("MaxApplicationsAllowed", 500);
        ann.addProperty("IsMatchRequired", "Yes");
        ann.addProperty("GranteeMatch", 10);
        ann.addProperty("IsProgramIncomeAnticipated", "Yes");
        ann.addProperty("LaverageAllowed", "Yes");
        ann.addProperty("PreApplicationNeeded", "No");
        ann.addProperty("PreApplicationDueDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(10, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        ann.addProperty("ApplicationDueDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(10, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        ann.addProperty("FocusAreaRequired", "Yes");
        ann.addProperty("IsGoalsRequired", "Yes");
        ann.addProperty("Allocationlevel", "N/A");
        ann.addProperty("KPIsRequired", "Yes");
        ann.addProperty("WBSRequired", "No");
        ann.addProperty("RiskAssessment_Required", "Yes");
        ann.addProperty("AreExpensesBuildIUpLevel", "No");
        ann.addProperty("IsAdvancePermitted", "No");
        ann.addProperty("IsNegotiationsAllowed", "Yes");
        ann.addProperty("EligibleApplicantTypes", "04;05");
        ann.addProperty("DetailedBudgetingRequired", "No");
        ann.addProperty("AwardFloor", 1000);
        ann.addProperty("AwardCeiling", 10000);
        ann.addProperty("EstimatedFundingAmount", 10000);
        ann.addProperty("OwnerId", ProjectWebServices.getIdOf("User", "Automation PM"));
        ann.addProperty("RecordTypeId", ProjectWebServices.getRecordTypeId("Announcement__c", "Grantor"));

        annA.add(ann);
        parent.add("Announcement", annA);

        JsonObject serviceArea = new JsonObject();
        JsonArray serviceAreaA = new JsonArray();
        serviceArea.add("ServiceArea", JsonNull.INSTANCE);
        //   serviceArea.addProperty("ServiceArea",ProjectWebServices.getIdOf("ServiceArea__c","Automation Permanent Focus Area"));
        serviceAreaA.add(serviceArea);
        parent.add("AnnouncementServiceArea", serviceAreaA);

        JsonObject awardFundingAccount = new JsonObject();
        JsonArray awardFundingAccountArray = new JsonArray();
        awardFundingAccount.addProperty("FundingAccount", ProjectWebServices.getIdOf("FundingAccount__c", I.amPerforming().propertiesFileOperationsTo()
                .getValue("fundingAccount")));
        awardFundingAccount.addProperty("PreEncumbranceAmount", "1000");
        awardFundingAccountArray.add(awardFundingAccount);
        parent.add("AwardFundingAccount", awardFundingAccountArray);

        JsonObject kpiGoalsObjectives = new JsonObject();
        JsonArray kpiGoalsObjectivesArrays = new JsonArray();
        kpiGoalsObjectives.add("StrategicPlan", JsonNull.INSTANCE);
        kpiGoalsObjectivesArrays.add(kpiGoalsObjectives);
        parent.add("KPIGoalsObjectives", kpiGoalsObjectivesArrays);


        JsonObject keyOutcome = new JsonObject();
        JsonArray keyOutcomeArray = new JsonArray();
        keyOutcome.add("MasterKPI", JsonNull.INSTANCE);
        keyOutcomeArray.add(keyOutcome);
        parent.add("KeyOutcome", keyOutcomeArray);


        JsonObject budgetPeriod = new JsonObject();
        JsonArray budgetPeriodArray = new JsonArray();

        budgetPeriod.addProperty("BudgetStartDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(50, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        budgetPeriod.addProperty("BudgetEndDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(150, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        budgetPeriodArray.add(budgetPeriod);
        parent.add("BudgetPeriod", budgetPeriodArray);

        JsonObject invApp = new JsonObject();
        JsonArray invAppA = new JsonArray();
        invApp.addProperty("Organization", ProjectWebServices.getIdOf("Account", "SAN DIEGO ELECTRICAL TRAINING TRUST"));
        invApp.addProperty("AllocatedAmount", 1000);
        invAppA.add(invApp);
        parent.add("InvitedApplicant", invAppA);

        return parent;
    }

    public JsonObject PayloadCreateAwardFromFDM(String announcementName, String... Type) {
        String user = "";
        JsonObject json;

        json = defaultPayloadCreateAwardFromFDM(announcementName);

        if (Type.length > 0) {
            if (Type[0].toLowerCase().contains("user") && (Type[0].contains("Automation"))) {
                user = Type[0].split("user")[0].trim();
                updateAwardOwner(json, user);
            }
        }
                return json;
        }

    /**
     * @param grantName
     * @param filter
     * @return This method include switch cases. If we wants to change the some parameter from the default payload returned by method
     * //     * @see #defaultPayloadCreateStandaloneAward(String, String) then we can simply create our own method having parameter(this parameter would be json object return
     * by method defaultPayloadCreateStandaloneAward(String)) and then we can create out own swtich case and call that method under this switch case. And pass
     * this switch cases from feature step....
     */
    public JsonObject payloadForCreateStandaloneAward(String grantName, String filter, String... Type) {
        String user = "";
        JsonObject json;
        boolean Typeflag = Type.length > 0;
        if (Typeflag) {
            json = defaultPayloadCreateStandaloneAward(grantName, Type[0]);
        } else {
            json = defaultPayloadCreateStandaloneAward(grantName);
        }

        if (filter.toLowerCase().contains("user")) {
            if (filter.contains("-Automation")) {
                user = filter.split("-")[1].split("user")[0].trim();
                updateAwardOwner(json, user);
                filter = filter.split("-")[0];
            } else {
                user = filter.replace("user", "").trim();
                filter = "USER";
            }
        } else {
            filter = filter.toUpperCase();
        }

        switch (filter) {
            case "NO_RISK_ASSESSMENT":
                return payloadForCreateStandAloneWithNORiskAssement(json);
            case "YES_RISK_ASSESSMENT":
                return payloadForCreateStandAloneWithYesRiskAssement(json);
            case "NO_ADVANCE_PERMISSION":
                return payloadForPaymentRequestToCreateStandaloneAward(json);
            case "IS_BUILDUP_FUNCTIONALITY_YES":
                return createAwardWtithBuildUpFunctionalityYes(json);
            case "NO_PROGRAM_INCOME_ANTICIPATE":
                return createAwardWtithNoProgramIncomeAnticipate(json);
            case  "NO_BUDGETRedirectionThreshhold":
                return createAwarForWithNoBudgetRedirectionThreshhold(json);
            case "AMENDMENT_REQUEST":
                return createAwarForAmendmentRequest(json);
            case "AMENDMENT_REQUEST_BUILDUP_MATCH_YES":
                return createAwardForAmendmentRequestWithBuildUpAndMatchAsYes(json);
            case "AMENDMENT_REQUEST_RISK_ASSESMENT_YES":
                return createAwarForAmendmentRequestWithoutRiskAssessment(json);
            case "PROGRESS_REPORT_NOT_APPLICABLE":
                return notapplicableProgressReportAward(json);
            case "PROGRESS_REPORT_MONTHLY":
                return monthyProgressReportAward(json);
            case "PROGRESS_REPORT_QUARTERLY":
                return quarterlyProgressReportAward(json);
            case "PROGRESS_REPORT_SEMI_ANNUALLY":
                return semiAnnuallyProgressReportAward(json);
            case "NO_OBJECTIVE":
                return noObjectives(json);
            case "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO":
                return advancePermissibleYesnofocusarea(json);
            case "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO_BUILDUP_YES_PROJECT_END_DATE":
                return advancePermissibleYesnofocusareaBuildUpYes(json);
            case "ADVANCE_YES_FOCUS_NO_PROGRAM_ANTICIPATED_NO":
                return advancePermissibleYesnofocusareaProgramAnticipatedNo(json);
            case "AMENDMENT_REQUEST_ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO":
                return createAwarForAmendmentRequestAdvanceYesFocusNo(json);
            case "ADVANCE_PERMIS_YES_FOCUS_AREA_NO_SUB_ORG_IND":
                return advancePermissibleYesnofocusareaSubrecipientInd(json);
            case "ADVANCE_PERMIS_YES_FOCUS_AREA_NO_BUILDUP_YES":
                return advancePermissibleYesnofocusareaDetailsBuildUpYes(json);
            case "SUBRECIPIENT_ORG_IND_USER":
                return createAwarForIndUser(json);
            case "SUBRECIPIENT_ORG_SPI_USER":
                return createAwarForSPIUser(json);
            case "AWARD_NO_SUPPORTINGDOC_PROGRAM":
                return awardWithNoSupportingDocProgram(json);
            case "SECOND_FOCUS_AREA":
                if (Typeflag)
                return createAwarForSecondFocusArea(json, Type[0]);
                else
                    return createAwarForSecondFocusArea(json);
            case "SECOND_FOCUS_AREA_BUDGET_CATEGORY":
                if (Typeflag)
                    return createAwarForSecondFocusAreaandBudgetCategory(json, Type[0]);
                else
                    return createAwarForSecondFocusAreaandBudgetCategory(json);
            case "THREE_FOCUS_AREA_NO_BUDGET_CATEGORY_THIRD_FOCUS":
                if (Typeflag)
                    return createAwarForThreeFocusAreaandBudgetCategory(json, Type[0]);
                else
                    return createAwarForThreeFocusAreaandBudgetCategory(json);
            case "THREE_FOCUS_AREA_NO_BUDGET_CATEGORY_THIRD_FOCUS_BuildUpYes":
                if (Typeflag)
                    return createAwarForThreeFocusAreaandBudgetCategoryBuildUpYes(json, Type[0]);
                else
                    return createAwarForThreeFocusAreaandBudgetCategoryBuildUpYes(json);
            case "THREE_FOCUS_AREA_NO_BUD_CAT_THIRD_FOCUS_BUILD_UP_IND_ORG":
                if (Typeflag)
                    return createAwarForThreeFocusAreaandBudgetCategoryBuildUpYesIndOrg(json, Type[0]);
                else
                    return createAwarForThreeFocusAreaandBudgetCategoryBuildUpYesIndOrg(json);
            case "SECOND_BUD_CAT_SECOND_FOCUS_BUILD_UP_IND_ORG":
                if (Typeflag)
                    return createAwarForSecondFocusAreaandBudgetCategoryBuildUpYesIndOrg(json, Type[0]);
                else
                    return createAwarForSecondFocusAreaandBudgetCategoryBuildUpYesIndOrg(json);
            case "THREE_FOCUS_AREA_BUDGET_CATEGORY":
                if (Typeflag)
                    return createAwarForThreeFocusAreaWithBudgetCategory(json, Type[0]);
                else
                    return createAwarForThreeFocusAreaWithBudgetCategory(json);
            case "SECOND_FOCUS_AREA_BUD_CAT_BUILDUP_YES":
                if (Typeflag)
                    return createAwarForSecondFocusAreaandBudgetCategoryBuildUpYes(json, Type[0]);
                else
                    return createAwarForSecondFocusAreaandBudgetCategoryBuildUpYes(json);
            case "SECOND_FOCUS_TOTAL_COMMIT_TWO_THOUSAND":
                if (Typeflag)
                    return createAwarForSecondFocusAreaTotalCommitment(json, Type[0]);
                else
                    return createAwarForSecondFocusAreaTotalCommitment(json);
            case "SECOND_FOCUS_NEW_OBLI_TWO_THOUSAND":
                if (Typeflag)
                    return createAwarForSecondFocusAreaNewObligation(json, Type[0]);
                else
                    return createAwarForSecondFocusAreaNewObligation(json);
            case "SECOND_FOCUS_BUD_CAT_TOTAL_COMM":
                if (Typeflag)
                    return createAwarForSecondFocusAreaBudCatTotalCommitment(json, Type[0]);
                else
                    return createAwarForSecondFocusAreaBudCatTotalCommitment(json);
            case "SECOND_FOCUS_AREA_BUD_CAT_SUB_ORG_IND":
                if (Typeflag)
                    return createAwarForSecondFocusAreaandBudgetCategorySubrecipientIndProfile(json, Type[0]);
                else
                    return createAwarForSecondFocusAreaandBudgetCategorySubrecipientIndProfile(json);
            case "USER":
                return createStandaloneAwardUsingUser(json, user);
            default:
                return json;
        }
    }

    private JsonObject createAwarForSecondFocusAreaNewObligation(JsonObject json, String... Type) {
        JsonObject award = json.getAsJsonArray("Award").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        award.addProperty("NewObligation", "2000");
        award.addProperty("TotalCommitment", "2000");
        newA.add(award);
        json.add("Award", newA);

        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        json.add("AwardServiceArea", awardServiceAreaArray);

        JsonObject awardFundingAccount = new JsonObject();
        JsonArray awardFundingAccountArray = new JsonArray();
        awardFundingAccount.addProperty("FundingAccount", ProjectWebServices.getIdOf("FundingAccount__c", I.amPerforming().propertiesFileOperationsTo()
                .getValue("fundingAccount")));
        awardFundingAccount.addProperty("PreEncumbranceAmount", "2000");
        awardFundingAccountArray.add(awardFundingAccount);
        json.add("AwardFundingAccount", awardFundingAccountArray);

        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 500);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItemsA.add(buildUpItems);
        JsonObject buildUpItems2 = new JsonObject();
        buildUpItems2.addProperty("BudgetCategory", "Construction");
        buildUpItems2.addProperty("Title", "Construction");
        buildUpItems2.addProperty("Narrative", "Test Build-up");
        buildUpItems2.addProperty("AwardedBudget", 500);
        buildUpItems2.addProperty("CashMatch", 100);
        buildUpItems2.addProperty("NonCashMatch", 100);
        buildUpItems2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems2.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItemsA.add(buildUpItems2);
        json.add("BuildUpItems", buildUpItemsA);
        return json;
    }

    private JsonObject advancePermissibleYesnofocusareaDetailsBuildUpYes(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("FocusAreaRequired", "No");
        grant.addProperty("IsAdvancePermitted", "Yes");
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        newA.add(grant);
        json.add("Grant", newA);
        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 1000);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Standard Focus Area");
        buildUpItemsA.add(buildUpItems);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject awardWithNoSupportingDocProgram(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("Program", ProjectWebServices.getIdOf("Program__c", "Automation Permanent No Supporting Doc Program"));
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }




    private JsonObject createAwarForSecondFocusAreaandBudgetCategoryBuildUpYesIndOrg(JsonObject json, String... Type) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("InternalOrganization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        newA.add(grant);
        json.add("Grant", newA);

        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        json.add("AwardServiceArea", awardServiceAreaArray);

        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 500);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItemsA.add(buildUpItems);
        JsonObject buildUpItems2 = new JsonObject();
        buildUpItems2.addProperty("BudgetCategory", "Construction");
        buildUpItems2.addProperty("Title", "Construction");
        buildUpItems2.addProperty("Narrative", "Test Build-up");
        buildUpItems2.addProperty("AwardedBudget", 500);
        buildUpItems2.addProperty("CashMatch", 100);
        buildUpItems2.addProperty("NonCashMatch", 100);
        buildUpItems2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems2.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItemsA.add(buildUpItems2);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject advancePermissibleYesnofocusareaBuildUpYes(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("FocusAreaRequired", "No");
        grant.addProperty("IsAdvancePermitted", "Yes");
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("ProjectPeriodEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(4000, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        newA.add(grant);
        json.add("Grant", newA);
        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 1000);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Standard Focus Area");
        buildUpItemsA.add(buildUpItems);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject createAwarForThreeFocusAreaandBudgetCategoryBuildUpYes(JsonObject json, String... Type) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        newA.add(grant);
        json.add("Grant", newA);

        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaC = new JsonObject();
        awardServiceAreaC.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Test Focus Area1"));
        awardServiceAreaC.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaC.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        awardServiceAreaArray.add(awardServiceAreaC);
        json.add("AwardServiceArea", awardServiceAreaArray);

        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 500);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItemsA.add(buildUpItems);
        JsonObject buildUpItems2 = new JsonObject();
        buildUpItems2.addProperty("BudgetCategory", "Construction");
        buildUpItems2.addProperty("Title", "Construction");
        buildUpItems2.addProperty("Narrative", "Test Build-up");
        buildUpItems2.addProperty("AwardedBudget", 500);
        buildUpItems2.addProperty("CashMatch", 100);
        buildUpItems2.addProperty("NonCashMatch", 100);
        buildUpItems2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems2.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItemsA.add(buildUpItems2);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject createAwarForThreeFocusAreaandBudgetCategoryBuildUpYesIndOrg(JsonObject json, String... Type) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("InternalOrganization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        newA.add(grant);
        json.add("Grant", newA);

        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaC = new JsonObject();
        awardServiceAreaC.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Test Focus Area1"));
        awardServiceAreaC.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaC.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        awardServiceAreaArray.add(awardServiceAreaC);
        json.add("AwardServiceArea", awardServiceAreaArray);

        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 500);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItemsA.add(buildUpItems);
        JsonObject buildUpItems2 = new JsonObject();
        buildUpItems2.addProperty("BudgetCategory", "Construction");
        buildUpItems2.addProperty("Title", "Construction");
        buildUpItems2.addProperty("Narrative", "Test Build-up");
        buildUpItems2.addProperty("AwardedBudget", 500);
        buildUpItems2.addProperty("CashMatch", 100);
        buildUpItems2.addProperty("NonCashMatch", 100);
        buildUpItems2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems2.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItemsA.add(buildUpItems2);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject createAwarForThreeFocusAreaWithBudgetCategory(JsonObject json, String... Type) {
        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaC = new JsonObject();
        awardServiceAreaC.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Test Focus Area1"));
        awardServiceAreaC.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaC.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                    awardServiceAreaC.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        awardServiceAreaArray.add(awardServiceAreaC);
        json.add("AwardServiceArea", awardServiceAreaArray);

        JsonObject awardFundingAccount = new JsonObject();
        JsonArray awardFundingAccountArray = new JsonArray();
        awardFundingAccount.addProperty("FundingAccount", ProjectWebServices.getIdOf("FundingAccount__c", I.amPerforming().propertiesFileOperationsTo()
                .getValue("fundingAccount")));
        awardFundingAccount.addProperty("PreEncumbranceAmount", "1500");
        awardFundingAccountArray.add(awardFundingAccount);
        json.add("AwardFundingAccount", awardFundingAccountArray);

        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 500);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        JsonObject buildUpItems2 = new JsonObject();
        buildUpItems2.addProperty("BudgetCategory", "Construction");
        buildUpItems2.addProperty("Title", "Construction");
        buildUpItems2.addProperty("Narrative", "Test Build-up");
        buildUpItems2.addProperty("AwardedBudget", 500);
        buildUpItems2.addProperty("CashMatch", 100);
        buildUpItems2.addProperty("NonCashMatch", 100);
        buildUpItems2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems2.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItemsA.add(buildUpItems2);
        json.add("BuildUpItems", buildUpItemsA);
        JsonObject buildUpItems3 = new JsonObject();
        buildUpItems3.addProperty("BudgetCategory", "Construction");
        buildUpItems3.addProperty("Title", "Construction");
        buildUpItems3.addProperty("Narrative", "Test Build-up");
        buildUpItems3.addProperty("AwardedBudget", 500);
        buildUpItems3.addProperty("CashMatch", 100);
        buildUpItems3.addProperty("NonCashMatch", 100);
        buildUpItems3.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems3.addProperty("ServiceAreaName", "Test Focus Area1");
        buildUpItemsA.add(buildUpItems3);
        json.add("BuildUpItems", buildUpItemsA);
        buildUpItemsA.add(buildUpItems);

        return json;
    }

    private JsonObject createAwarForThreeFocusAreaandBudgetCategory(JsonObject json, String... Type) {
        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaC = new JsonObject();
        awardServiceAreaC.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Test Focus Area1"));
        awardServiceAreaC.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaC.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        awardServiceAreaArray.add(awardServiceAreaC);
        json.add("AwardServiceArea", awardServiceAreaArray);

        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 500);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItemsA.add(buildUpItems);
        JsonObject buildUpItems2 = new JsonObject();
        buildUpItems2.addProperty("BudgetCategory", "Construction");
        buildUpItems2.addProperty("Title", "Construction");
        buildUpItems2.addProperty("Narrative", "Test Build-up");
        buildUpItems2.addProperty("AwardedBudget", 500);
        buildUpItems2.addProperty("CashMatch", 100);
        buildUpItems2.addProperty("NonCashMatch", 100);
        buildUpItems2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems2.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItemsA.add(buildUpItems2);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject createAwarForSecondFocusAreaTotalCommitment(JsonObject json, String... Type) {
        JsonObject award = json.getAsJsonArray("Award").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        award.addProperty("TotalCommitment", "2000");
        newA.add(award);
        json.add("Award", newA);

        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        json.add("AwardServiceArea", awardServiceAreaArray);
        return json;
    }

    private JsonObject createAwarForSecondFocusAreaandBudgetCategoryBuildUpYes(JsonObject json, String... Type) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        newA.add(grant);
        json.add("Grant", newA);

        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        json.add("AwardServiceArea", awardServiceAreaArray);

        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 500);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItemsA.add(buildUpItems);
        JsonObject buildUpItems2 = new JsonObject();
        buildUpItems2.addProperty("BudgetCategory", "Construction");
        buildUpItems2.addProperty("Title", "Construction");
        buildUpItems2.addProperty("Narrative", "Test Build-up");
        buildUpItems2.addProperty("AwardedBudget", 500);
        buildUpItems2.addProperty("CashMatch", 100);
        buildUpItems2.addProperty("NonCashMatch", 100);
        buildUpItems2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems2.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItemsA.add(buildUpItems2);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject createAwarForSecondFocusAreaBudCatTotalCommitment(JsonObject json, String... Type) {
        JsonObject award = json.getAsJsonArray("Award").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        award.addProperty("TotalCommitment", "2000");
        newA.add(award);
        json.add("Award", newA);

        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        json.add("AwardServiceArea", awardServiceAreaArray);

        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 500);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItemsA.add(buildUpItems);
        JsonObject buildUpItems2 = new JsonObject();
        buildUpItems2.addProperty("BudgetCategory", "Construction");
        buildUpItems2.addProperty("Title", "Construction");
        buildUpItems2.addProperty("Narrative", "Test Build-up");
        buildUpItems2.addProperty("AwardedBudget", 500);
        buildUpItems2.addProperty("CashMatch", 100);
        buildUpItems2.addProperty("NonCashMatch", 100);
        buildUpItems2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems2.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItemsA.add(buildUpItems2);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject createAwarForSecondFocusArea(JsonObject json, String... Type) {
        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        json.add("AwardServiceArea", awardServiceAreaArray);
        return json;
    }

    private JsonObject advancePermissibleYesnofocusareaSubrecipientInd(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("FocusAreaRequired", "No");
        grant.addProperty("IsAdvancePermitted", "Yes");
        grant.addProperty("InternalOrganization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        newA.add(grant);
        json.add("Grant", newA);
        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 1000);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Standard Focus Area");
        buildUpItemsA.add(buildUpItems);
        json.add("BuildUpItems", buildUpItemsA);
        return json;
    }

    private JsonObject createAwarForSecondFocusAreaandBudgetCategorySubrecipientIndProfile(JsonObject json, String... Type) {
            JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
            JsonArray newA = new JsonArray();
            grant.addProperty("InternalOrganization", ProjectWebServices.getIdOf("Account", "Automation IND"));
            newA.add(grant);
            json.add("Grant", newA);
        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        json.add("AwardServiceArea", awardServiceAreaArray);

        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 500);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItemsA.add(buildUpItems);
        JsonObject buildUpItems2 = new JsonObject();
        buildUpItems2.addProperty("BudgetCategory", "Construction");
        buildUpItems2.addProperty("Title", "Construction");
        buildUpItems2.addProperty("Narrative", "Test Build-up");
        buildUpItems2.addProperty("AwardedBudget", 500);
        buildUpItems2.addProperty("CashMatch", 100);
        buildUpItems2.addProperty("NonCashMatch", 100);
        buildUpItems2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems2.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItemsA.add(buildUpItems2);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject createAwarForSecondFocusAreaandBudgetCategory(JsonObject json, String... Type) {
        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        json.add("AwardServiceArea", awardServiceAreaArray);

        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 500);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItemsA.add(buildUpItems);
        JsonObject buildUpItems2 = new JsonObject();
        buildUpItems2.addProperty("BudgetCategory", "Construction");
        buildUpItems2.addProperty("Title", "Construction");
        buildUpItems2.addProperty("Narrative", "Test Build-up");
        buildUpItems2.addProperty("AwardedBudget", 500);
        buildUpItems2.addProperty("CashMatch", 100);
        buildUpItems2.addProperty("NonCashMatch", 100);
        buildUpItems2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems2.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItemsA.add(buildUpItems2);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject createAwarForIndUser(JsonObject json) {
            JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
            JsonArray newA = new JsonArray();
            grant.addProperty("InternalOrganization", ProjectWebServices.getIdOf("Account", "Automation IND"));
            newA.add(grant);
            json.add("Grant", newA);
        return json;
    }

    private JsonObject createAwarForSPIUser(JsonObject json) {

            JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
            JsonArray newA = new JsonArray();
            grant.addProperty("InternalOrganization", ProjectWebServices.getIdOf("Account", "Framework Defect Retest"));
            newA.add(grant);
            json.add("Grant", newA);
        return json;
    }

    private JsonObject createAwarForAmendmentRequestAdvanceYesFocusNo(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required", "No");
        grant.addProperty("IsMatchRequired", "No");
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("WBSRequired", "No");
        grant.addProperty("FocusAreaRequired", "No");
        grant.addProperty("IsAdvancePermitted", "Yes");
        newA.add(grant);
        json.add("Grant", newA);
        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 1000);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Standard Focus Area");
        buildUpItemsA.add(buildUpItems);
        json.add("BuildUpItems", buildUpItemsA);
        return json;
    }

    private void updateAwardOwner(JsonObject json, String user) {
        JsonObject jsonObject = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray grantOwner = new JsonArray();
        jsonObject.addProperty("OwnerId", ProjectWebServices.getIdOf("User", user));
        grantOwner.add(jsonObject);
        json.add("Grant", grantOwner);
    }

    private JsonObject advancePermissibleYesnofocusareaProgramAnticipatedNo(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("FocusAreaRequired", "No");
        grant.addProperty("IsAdvancePermitted", "Yes");
        grant.addProperty("IsProgramIncomeAnticipated", "No");
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }

    private JsonObject advancePermissibleYesnofocusarea(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("FocusAreaRequired", "No");
        grant.addProperty("IsAdvancePermitted", "Yes");
        newA.add(grant);
        json.add("Grant", newA);
        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 1000);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Standard Focus Area");
        buildUpItemsA.add(buildUpItems);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject noObjectives(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("IsGoalsRequired", "No");
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("WBSRequired", "No");
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }

    private JsonObject createStandaloneAwardUsingUser(JsonObject json, String user) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("OwnerId", ProjectWebServices.getIdOf("User", user));
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }


    private JsonObject semiAnnuallyProgressReportAward(JsonObject json) {
        JsonObject paymentRequestSchedule = json.getAsJsonArray("PaymentRequestSchedule").get(1).getAsJsonObject();
        JsonArray array = json.getAsJsonArray("PaymentRequestSchedule");
        paymentRequestSchedule.addProperty("Frequency", "Semi-Annually");
        json.add("PaymentRequestSchedule", array);
        return json;
    }

    private JsonObject quarterlyProgressReportAward(JsonObject json) {
        JsonObject paymentRequestSchedule = json.getAsJsonArray("PaymentRequestSchedule").get(1).getAsJsonObject();
        JsonArray array = json.getAsJsonArray("PaymentRequestSchedule");
        paymentRequestSchedule.addProperty("Frequency", "Quarterly");
        json.add("PaymentRequestSchedule", array);
        return json;
    }

    private JsonObject monthyProgressReportAward(JsonObject json) {
        JsonObject paymentRequestSchedule = json.getAsJsonArray("PaymentRequestSchedule").get(1).getAsJsonObject();
        JsonArray array = json.getAsJsonArray("PaymentRequestSchedule");
        paymentRequestSchedule.addProperty("Frequency", "Monthly");
        json.add("PaymentRequestSchedule", array);
        return json;
    }

    private JsonObject notapplicableProgressReportAward(JsonObject json) {
        JsonObject paymentRequestSchedule = json.getAsJsonArray("PaymentRequestSchedule").get(1).getAsJsonObject();
        JsonArray array = json.getAsJsonArray("PaymentRequestSchedule");
        paymentRequestSchedule.addProperty("Frequency", "Not-Applicable");
        json.add("PaymentRequestSchedule", array);
        return json;
    }

    private JsonObject createAwarForAmendmentRequest(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required", "No");
        grant.addProperty("IsMatchRequired", "No");
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("WBSRequired", "No");
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }

    private JsonObject createAwarForAmendmentRequestWithoutRiskAssessment(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("RiskAssessment_Required", "Yes");
        grant.addProperty("IsMatchRequired", "No");
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("WBSRequired", "No");
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }

    private JsonObject createAwardForAmendmentRequestWithBuildUpAndMatchAsYes(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required", "No");
        grant.addProperty("IsMatchRequired", "Yes");
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("WBSRequired", "No");
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }

    private JsonObject createAwardWtithNoProgramIncomeAnticipate(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required", "No");
        grant.addProperty("IsAdvancePermitted", "No");
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("WBSRequired", "No");
        grant.addProperty("IsProgramIncomeAnticipated", "No");
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }


    private JsonObject createAwarForWithNoBudgetRedirectionThreshhold(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("RiskAssessment_Required", "No");
        grant.addProperty("BudgetRedirectionThreshhold", "No");
        grant.addProperty("WBSRequired", "No");
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }

    private JsonObject createAwardWtithBuildUpFunctionalityYes(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required", "Yes");
        grant.addProperty("IsProgramIncomeAnticipated", "No");
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("WBSRequired", "No");
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }

    private JsonObject payloadForPaymentRequestToCreateStandaloneAward(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required", "No");
        grant.addProperty("IsAdvancePermitted", "No");
        grant.addProperty("IsBuildUpFunctionality", "No");
        grant.addProperty("WBSRequired", "No");
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }

    private JsonObject payloadForCreateStandAloneWithNORiskAssement(JsonObject defaultPayload) {
        JsonObject grant = defaultPayload.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required", "No");
        newA.add(grant);
        defaultPayload.add("Grant", newA);
        return defaultPayload;
    }

    private JsonObject payloadForCreateStandAloneWithYesRiskAssement(JsonObject defaultPayload) {
        JsonObject grant = defaultPayload.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required", "Yes");
        newA.add(grant);
        defaultPayload.add("Grant", newA);
        return defaultPayload;
    }


    /**
     * @param grantName
     * @return this method will return json object of detault request payload for creating the standalone award...
     * @see GrantorWebServices#getIdOf(String, String)
     * @see GrantorWebServices#getRecordTypeId(String, String)
     */
    public JsonObject defaultPayloadCreateStandaloneAward(String grantName, String... Type) {
        JsonObject parent = new JsonObject();

        JsonObject grant = new JsonObject();
        JsonArray grantA = new JsonArray();

        grant.addProperty("ProjectTitle", grantName);
        grant.addProperty("GrantAbbreviation", "1234");
        grant.addProperty("GrantNumber", "31231232");
        grant.addProperty("ProjectPeriodStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grant.addProperty("ProjectPeriodEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grant.addProperty("BudgetCategoryPackage", "Construction");
        grant.addProperty("GrantDescription", "API Testing For Award Activation From Direct Grant");
        grant.addProperty("ExternalOrganization", ProjectWebServices.getIdOf("Account", "Test Automation Organization"));
        grant.addProperty("InternalOrganization", ProjectWebServices.getIdOf("Account", "SAN DIEGO ELECTRICAL TRAINING TRUST"));
        grant.addProperty("Program", ProjectWebServices.getIdOf("Program__c", "Automation Permanent Internal Program"));
        grant.addProperty("DoesGrantAllowIndirect", "Yes");
        grant.addProperty("IsMatchRequired", "Yes");
        grant.addProperty("MaintenanceOfEffort", "Yes");
        grant.addProperty("LaverageAllowed", "Yes");
        grant.addProperty("IsProgramIncomeAnticipated", "Yes");
        grant.addProperty("IsAdvancePermitted", "No");
        grant.addProperty("FocusAreaRequired", "Yes");
        grant.addProperty("IsGoalsRequired", "Yes");
        grant.addProperty("KPIsRequired", "Yes");
        grant.addProperty("RiskAssessment_Required", "No");
        grant.addProperty("WBSRequired", "No");
        grant.addProperty("IsBuildUpFunctionality", "No");
        grant.addProperty("AreExpensesBuildIUpLevel", "Yes");
        grant.addProperty("GranteeMatch", 10);
        grant.addProperty("BudgetCloseoutrequestRequired", "Yes");
        grant.addProperty("CostSharing", "Cash Match");
        if (Type[0].contains("Formula")) {
            if (Type[0].equals("Formula_By_Applicant")) {
                grant.addProperty("GrantType", "Formula");
                grant.addProperty("Allocationlevel", "By Applicant");
            } else if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                grant.addProperty("GrantType", "Formula");
                grant.addProperty("AllocationLevel", "By Applicant and Focus Area");
            } else if (Type[0].equals("Formula_By_Applicant_Focus_Area_No")) {
                grant.addProperty("GrantType", "Formula");
                grant.addProperty("AllocationLevel", "By Applicant");
                grant.addProperty("FocusAreaRequired", "No");
            }
        } else if (Type[0].contains("Directed")) {
            grant.addProperty("GrantType", "Directed");
            grant.addProperty("AllocationLevel", "N/A");
        } else {
            grant.addProperty("GrantType", "Competitive");
            grant.addProperty("AllocationLevel", "N/A");
        }
        grant.addProperty("RecordTypeId", ProjectWebServices.getRecordTypeId("Grant__c", "Grantor"));
        grant.addProperty("OwnerId", ProjectWebServices.getIdOf("User", "Automation PM"));
        grantA.add(grant);
        parent.add("Grant", grantA);

        JsonObject award = new JsonObject();
        JsonArray awardArray = new JsonArray();
        award.addProperty("GrantAwardDescription", "Award Created From Automation API");
        award.addProperty("BudgetPeriodEndDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        award.addProperty("PM", ProjectWebServices.getIdOf("User", "Automation PM"));
        award.addProperty("FO", ProjectWebServices.getIdOf("User", "Automation FO"));
        award.addProperty("EXE", ProjectWebServices.getIdOf("User", "Automation EXE"));
        awardArray.add(award);
        award.addProperty("NewObligation", "1000");
        award.addProperty("TotalCommitment", "1000");
        parent.add("Award", awardArray);

        JsonObject awardFundingAccount = new JsonObject();
        JsonArray awardFundingAccountArray = new JsonArray();
        awardFundingAccount.addProperty("FundingAccount", ProjectWebServices.getIdOf("FundingAccount__c", I.amPerforming().propertiesFileOperationsTo()
                .getValue("fundingAccount")));
        awardFundingAccount.addProperty("PreEncumbranceAmount", "1000");
        awardFundingAccountArray.add(awardFundingAccount);
        parent.add("AwardFundingAccount", awardFundingAccountArray);

        JsonObject buildUpItems = new JsonObject();
        JsonArray buildUpItemsA = new JsonArray();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 1000);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItemsA.add(buildUpItems);
        parent.add("BuildUpItems", buildUpItemsA);

        JsonObject paymentRequestSchedule = new JsonObject();
        JsonArray schdeuleArray = new JsonArray();
        paymentRequestSchedule.addProperty("SubmissionTitle", "Grant API Test");
        paymentRequestSchedule.addProperty("CalReportingStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        paymentRequestSchedule.addProperty("CalReportingEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        paymentRequestSchedule.addProperty("Frequency", "Annually");
        paymentRequestSchedule.addProperty("ScheduleBase", "Calendar");
        paymentRequestSchedule.addProperty("SubmissionType", "Payment Request");
        schdeuleArray.add(paymentRequestSchedule);

        JsonObject progressReportSchedule = new JsonObject();
        progressReportSchedule.addProperty("SubmissionTitle", grantName);
        progressReportSchedule.addProperty("CalReportingStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReportSchedule.addProperty("CalReportingEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReportSchedule.addProperty("Frequency", "Annually");
        progressReportSchedule.addProperty("ScheduleBase", "Calendar");
        progressReportSchedule.addProperty("SubmissionType", "Progress Report");
        schdeuleArray.add(progressReportSchedule);

        parent.add("PaymentRequestSchedule", schdeuleArray);

        JsonObject awardServiceArea = new JsonObject();
        JsonArray awardServiceAreaArray = new JsonArray();
        awardServiceArea.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceArea.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceArea.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaArray.add(awardServiceArea);
        if (Type[0].contains("Formula")) {
            if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                awardServiceArea.addProperty("NewObligationPay", "1000");
            }
        }
        parent.add("AwardServiceArea", awardServiceAreaArray);

        JsonObject kpiGoalsObjectives = new JsonObject();
        JsonArray kpiGoalsObjectivesArrays = new JsonArray();
        kpiGoalsObjectives.addProperty("StrategicPlan", ProjectWebServices.getIdOf("StrategicPlan__c", "Automation Permanent Strategic Plan"));
        kpiGoalsObjectivesArrays.add(kpiGoalsObjectives);
        parent.add("KPIGoalsObjectives", kpiGoalsObjectivesArrays);

        JsonObject keyOutcome = new JsonObject();
        JsonArray keyOutcomeArray = new JsonArray();
        keyOutcome.addProperty("MasterKPI", ProjectWebServices.getIdOf("MasterKPI__c", "Automation Permanent KPI")); // KPI id
        keyOutcome.addProperty("Target", "10");
        keyOutcomeArray.add(keyOutcome);
        parent.add("KeyOutcome", keyOutcomeArray);

        // Add key contacts
        JsonObject keyContacts = new JsonObject();
        JsonArray keyContactsArray = new JsonArray();
        keyContacts.addProperty("ProjectRole", "Project Director/Manager");
        keyContacts.addProperty("Contact", ProjectWebServices.getIdOf("Contact", "Automation SPI3")); // Automation SPI id
        keyContacts.addProperty("IsKeyContact", true);
        keyContactsArray.add(keyContacts);
        parent.add("KeyContacts", keyContactsArray);

        return parent;
    }

    public JsonObject defaultPayloadReviewApplication() {
        Map<String, String> map = ProjectWebServices.getMultipleIds(getIdsOfUsers(Arrays.asList("Automation EXE", "Automation FO", "Automation PM")));
        JsonObject parent = new JsonObject();

        JsonArray reviewStepsArray = new JsonArray();
        JsonObject complianceReview = new JsonObject();
        complianceReview.addProperty("Reviewer", map.get("Automation EXE"));
        complianceReview.addProperty("FormName", "Compliance Review");
        complianceReview.addProperty("DueInDays", 7);

        JsonObject programReview = new JsonObject();
        programReview.addProperty("Reviewer", map.get("Automation PM"));
        programReview.addProperty("FormName", "Program Review");
        programReview.addProperty("DueInDays", 7);

        JsonObject fiscalReview = new JsonObject();
        fiscalReview.addProperty("Reviewer", map.get("Automation FO"));
        fiscalReview.addProperty("FormName", "Fiscal Review");
        fiscalReview.addProperty("DueInDays", 7);

        JsonObject managementReview = new JsonObject();
        managementReview.addProperty("Reviewer", map.get("Automation FO"));
        managementReview.addProperty("FormName", "Management Review");
        managementReview.addProperty("DueInDays", 7);

        JsonObject preScreen = new JsonObject();
        preScreen.addProperty("Reviewer", map.get("Automation FO"));
        preScreen.addProperty("FormName", "Pre-Screen");
        preScreen.addProperty("DueInDays", 7);

        reviewStepsArray.add(complianceReview);
        reviewStepsArray.add(programReview);
        reviewStepsArray.add(fiscalReview);
        reviewStepsArray.add(managementReview);
        reviewStepsArray.add(preScreen);

        parent.add("ReviewSteps", reviewStepsArray);

        JsonObject FDM = new JsonObject();
        JsonArray FDMArray = new JsonArray();
        FDM.addProperty("SubawardAbbreviation", "AWD");
        FDM.addProperty("RecommendedForAward", "Yes");
        FDM.addProperty("RecommendedAmount", 1000);
        FDMArray.add(FDM);

        parent.add("FDM", FDMArray);

        return parent;
    }

    public JsonObject UpdateLeadSettingsAPI(String oppoNumber) {
        JsonObject json = getDefaultUpdateLeadSettings(oppoNumber);
        return json;
    }

    private JsonObject getDefaultUpdateLeadSettings(String oppoNumber) {
        JsonObject parent = new JsonObject();
        parent.addProperty("OpportunityNumber", oppoNumber);
        return parent;
    }

    /**
     * @param oppTitle
     * @param filter
     * @param isManual
     * @param oppoNo   this switch cases from feature step....
     */
    public JsonObject payloadForQualifiedLead(String isManual, String oppTitle, String oppoNo, String filter) {
        String user = "";
        JsonObject json;
        json = defaultPayloadToQualifiedLead(isManual, oppTitle, oppoNo);

        if (filter.toLowerCase().contains("user")) {
            if (filter.contains("-")) {
                user = filter.split("-")[1].split("user")[0].trim();
                updateQualifiedLeadOwner(json, user);
                filter = filter.split("-")[0];
            } else {
                user = filter.replace("user", "").trim();
                filter = "USER";
            }
        } else {
            filter = filter.toUpperCase();
        }

        switch (filter) {
            case "COSTSHARING_NO":
                return payloadForLeadCostSharingNo(json);
            default:
                return json;
        }
    }

    private void updateQualifiedLeadOwner(JsonObject json, String user) {
        JsonObject lead = json.getAsJsonArray("LeadData").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        lead.addProperty("ownerId", ProjectWebServices.getIdOf("User", user));
        newA.add(lead);
        json.add("LeadData", newA);
    }

    /**
     * @param oppTitle
     * @return this method will return json object of detault request payload for creating the standalone award...
     * @see GrantorWebServices#getIdOf(String, String)
     * @see GrantorWebServices#getRecordTypeId(String, String)
     */
    private JsonObject defaultPayloadToQualifiedLead(String isManual, String oppTitle, String oppoNo) {
        JsonObject finalJson = new JsonObject();
        JsonArray leadDataArray = new JsonArray();
        JsonObject leadData = new JsonObject();
        leadData.addProperty("OpportunityNumber", oppoNo);
        if(isManual.equalsIgnoreCase("Grants.Gov")){
            leadData.addProperty("isGrantsgovLead", true);
        } else{
            leadData.addProperty("isGrantsgovLead", false);
        }
        leadData.addProperty("isDraftOrApprovedOpportunity", "Draft");
        leadData.addProperty("opportunityTitle", oppTitle);
        leadData.addProperty("applicationDueDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(200, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        leadData.addProperty("fundingOrganization", ProjectWebServices.getIdOf("Account", "Department of Education"));

        // Creating the eligibleApplicants array
        JsonArray eligibleApplicants = new JsonArray();
        eligibleApplicants.add("For profit organizations other than small businesses");
        eligibleApplicants.add("Individuals");
        leadData.add("eligibleApplicants", eligibleApplicants);

        leadData.addProperty("leadDescription", "Automation Test Description");
        leadData.addProperty("costSharingMatching", "Yes");

        // Creating the relatedPrograms array
        JsonArray relatedProgramsArray = new JsonArray();
        relatedProgramsArray.add("Automation Permanent NGO Program");
        leadData.add("relatedPrograms", relatedProgramsArray);

        // Creating the categoryFundingActivity array
        JsonArray categoryActivityArray = new JsonArray();
        categoryActivityArray.add("Community Development");
        leadData.add("categoryFundingActivity", categoryActivityArray);

        // Creating the fundingInstrumentType array
        JsonArray fundingInstrumentArray = new JsonArray();
        fundingInstrumentArray.add("Cooperative Agreement");
        leadData.add("fundingInstrumentType", fundingInstrumentArray);

        leadData.addProperty("opportunityCategory", "Earmark");
        leadData.addProperty("archiveDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(110, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        leadData.addProperty("ownerId", ProjectWebServices.getIdOf("User", "Sarah PM"));
        leadData.addProperty("estimatedTotalProgramFunding", 10000);
        leadData.addProperty("awardFloor", 1000);
        leadData.addProperty("awardCeiling", 10000);
        leadData.addProperty("relevance", "3 - Medium");
        leadData.addProperty("impact", "3 - Medium");
        leadData.addProperty("justification", "Automation Test");
        leadData.addProperty("CostSharingOrMatchingRequirement", "Yes");
        leadData.addProperty("AdditionalEligibilityInformation", "Automation Test");
        leadData.addProperty("LinkToAdditionalInformation", "https://example.com/additional-info");
        leadData.addProperty("ExpectedNumberOfAwards", 10);
        leadData.addProperty("GrantorContactInfo", "Automation Grantor Contact details");
        leadData.addProperty("DescribeOtherOpportunityCategory", "Automation Test");

        leadDataArray.add(leadData);
        finalJson.add("LeadData", leadDataArray);

        return finalJson;
    }

    private JsonObject payloadForLeadCostSharingNo(JsonObject json) {
        JsonObject costSharing = json.getAsJsonArray("LeadData").get(0).getAsJsonObject();
        JsonArray cost = new JsonArray();
        costSharing.addProperty("costSharingMatching", "No");
        costSharing.addProperty("CostSharingOrMatchingRequirement", "No");
        cost.add(costSharing);
        json.add("LeadData", cost);
        return json;
    }

    public JsonObject payloadForCreatedOrApprovedOpportunity(String state, String oppoNo, String filter) {
        JsonObject defaultJson = defaultCreatedOrApprovedOpportunity(state, oppoNo);

        filter = filter.toUpperCase();

        switch (filter) {
            case "PRE_APPLICATION_YES":
                return updatePreApplicationAsYesForOpportunity(defaultJson);
            case "PRE_APP_YES_NO_CONST_NO_SETTING":
                return updatePreApplicationAsYesWithNoConstructionForOpportunity(defaultJson);
            default:
                return defaultJson;
        }
    }

    private JsonObject defaultCreatedOrApprovedOpportunity(String state, String oppoNo) {
        JsonObject opportunityData = new JsonObject();
        opportunityData.addProperty("OpportunityNumber", oppoNo);
        opportunityData.addProperty("isDraftOrApprovedOpportunity", state);
        opportunityData.addProperty("budgetType", "Construction");
        opportunityData.addProperty("projectPeriodStartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(210, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        opportunityData.addProperty("projectPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(365, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        opportunityData.addProperty("isPreApplicationRequired", "No");
        opportunityData.addProperty("preApplicationDueDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(100, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        opportunityData.addProperty("letterOfIntentRequired", "Yes");
        opportunityData.addProperty("letterOfIntentDueDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(50, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        opportunityData.addProperty("applicationDueDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(200, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        opportunityData.addProperty("IsProgramIncomeAllowed", "Yes");
        opportunityData.addProperty("LinkAdditionalInformation", "www.google.com");
        opportunityData.addProperty("GrantorContactInformation", "Automation Test Information");
        opportunityData.addProperty("AdditionalInformationEligibility", "Added Eligibility Details");
        opportunityData.addProperty("programIncomeTreatmentType", "Additive");
        opportunityData.addProperty("indirectCostsAllowed", "Yes");
        opportunityData.addProperty("IsLeverageAllowed", "Yes");
        opportunityData.addProperty("MatchSource", "External Source");
        opportunityData.addProperty("q1_receivedAward", "Yes");
        opportunityData.addProperty("q1a_pastFundingDescription", "Automation Test");
        opportunityData.addProperty("q2_probabilityOfWinning", "25");
        opportunityData.addProperty("q2a_BrieflyExplain", "Automation Test");
        opportunityData.addProperty("q3_domainKnowledge", "Yes");
        opportunityData.addProperty("q3a_explainDomainKnowledge", "Automation Test");
        opportunityData.addProperty("q4_requiredResources", "Yes");
        opportunityData.addProperty("q4a_explainResources", "Automation Test");
        opportunityData.addProperty("q5_financialTools", "Yes");
        opportunityData.addProperty("q5a_explainFinancialTools", "test");
        opportunityData.addProperty("q6_applicationEffort", "Estimated 9 hrs");
        opportunityData.addProperty("q7_fteRequired", "8");
        opportunityData.addProperty("q8_qualifiedByOthers", "No");
        opportunityData.addProperty("q8a_leadOrgAgreement", "Yes");
        opportunityData.addProperty("q9_requiresCollaboration", "Yes");
        opportunityData.addProperty("q9a_explainCollaboration", "Automation Test");
        opportunityData.addProperty("q14_DoesTheGranteRequirePass", "Yes");
        opportunityData.addProperty("q14a_PercentOfFunding", 10);
        opportunityData.addProperty("q16_AdminCostLimit", "Yes");
        opportunityData.addProperty("q16a_PercentOfAdminCostLimit", 10);
        opportunityData.addProperty("q18_LegalRequirements", "Automation Test");
        opportunityData.addProperty("q19_OrgCertificationInfo", "Automation Test");
        opportunityData.addProperty("q17_sustainabilityPlan", "Automation Test");
        opportunityData.addProperty("CostSharingOrMatchingRequirement", "Cash and Non-Cash Match");
        opportunityData.addProperty("requiredMatch", "10");
        opportunityData.addProperty("isMatchRequired", "Yes");
        opportunityData.addProperty("AnticipatedAwardDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(105, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        opportunityData.addProperty("HowProgramWillSustain", "Automation Test");
        opportunityData.addProperty("MaximumIndirectCostRate", "10");
        opportunityData.addProperty("RateForOrgnizationUse", "Federally approved indirect rate");
        opportunityData.addProperty("q13_MaintenanceEffortRequire", "Yes");
        opportunityData.addProperty("ExpectedNumberofAwards", 10);
        opportunityData.addProperty("q13_aStatutoryMaintenanceOfEffort", "Automation Test");
        opportunityData.addProperty("FundingOrgGrantsSystem", "spaceX private");
        opportunityData.addProperty("LastUpdateDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(1, DateTimeFormatter.ofPattern("yyyy-MM-dd")));

        // Creating the OpportunityData array and adding the OpportunityData object
        JsonArray opportunityDataArray = new JsonArray();
        opportunityDataArray.add(opportunityData);

        // Creating the approvers object
        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        approver.addProperty("Announcement", "Step1");
        approvers.add(approver);

        // Creating the final JSON object
        JsonObject finalJson = new JsonObject();
        finalJson.add("OpportunityData", opportunityDataArray);
        finalJson.add("approvers", approvers);

        return finalJson;
    }

    private JsonObject updatePreApplicationAsYesWithNoConstructionForOpportunity(JsonObject defaultJson) {
        JsonObject pre_application = defaultJson.getAsJsonArray("OpportunityData").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        pre_application.addProperty("isPreApplicationRequired", "Yes");
        pre_application.addProperty("budgetType", "Non-Construction");
        pre_application.addProperty("IsProgramIncomeAllowed", "No");
        pre_application.addProperty("indirectCostsAllowed", "No");
        pre_application.addProperty("IsLeverageAllowed", "No");
        pre_application.addProperty("isMatchRequired", "No");
        pre.add(pre_application);
        defaultJson.add("OpportunityData", pre);
        return defaultJson;
    }

    private JsonObject updatePreApplicationAsYesForOpportunity(JsonObject defaultJson) {
        JsonObject pre_application = defaultJson.getAsJsonArray("OpportunityData").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        pre_application.addProperty("isPreApplicationRequired", "Yes");
        pre.add(pre_application);
        defaultJson.add("OpportunityData", pre);
        return defaultJson;
    }

    public JsonObject payloadForPreApplicationCreatedAndAccepted(String module,String preAppTitle, String state, String oppoNo, String filter) {
        String user = "";
        JsonObject json;
        json = defaultPayloadToPreApplication(preAppTitle, state, oppoNo);

        if (filter.toLowerCase().contains("user")) {
            if (filter.contains("-")) {
                user = filter.split("-")[1].split("user")[0].trim();
                updatePreAppAppOwner(json, user);
                filter = filter.split("-")[0];
            } else {
                user = filter.replace("user", "").trim();
                filter = "USER";
            }
        } else {
            filter = filter.toUpperCase();
        }

        switch (filter) {
            case "PROGRAM_INCOME_DEDUCTIVE":
                return payloadForCreateProgramIncome(json);
            case "DAVID_FO_APPROVER":
                return payloadForDavidFoApprover(json, module);
            default:
                return json;
        }
    }

    private JsonObject payloadForDavidFoApprover(JsonObject json, String module) {
        JsonObject preAPPData = json.getAsJsonArray("preAppAndAppData").get(0).getAsJsonObject();
        JsonArray topLevelApprovers = new JsonArray();
        JsonObject topLevelApprover = new JsonObject();
        topLevelApprover.addProperty("name", ProjectWebServices.getIdOf("User", "David FO"));
        if(module.equalsIgnoreCase("Pre-application")){
            topLevelApprover.addProperty("preApplication", "Step1");
        }else{
            topLevelApprover.addProperty("application", "Step1");
        }
        topLevelApprovers.add(topLevelApprover);
        preAPPData.add("approvers", topLevelApprovers);
        JsonArray preAPPDataDataArray = new JsonArray();
        preAPPDataDataArray.add(preAPPData);
        json.add("preAppAndAppData", preAPPDataDataArray);
        return json;
    }

    private void updatePreAppAppOwner(JsonObject json, String user) {
        JsonObject preApp = json.getAsJsonArray("preAppAndAppData").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        preApp.addProperty("OwnerId", ProjectWebServices.getIdOf("User", user));
        newA.add(preApp);
        json.add("preAppAndAppData", newA);
    }

    private JsonObject defaultPayloadToPreApplication(String preAppTitle, String state, String oppoNo) {

        JsonObject opportunityData = new JsonObject();
        opportunityData.addProperty("OpportunityNumber", oppoNo);
        opportunityData.addProperty("isStatusCreatedOrAccepted", state);
        opportunityData.addProperty("UEI", ProjectWebServices.getIdOf("DUNS__c", "YRNMVN96JC17"));
        opportunityData.addProperty("OwnerId", ProjectWebServices.getIdOf("User", "Sarah PM"));
        opportunityData.addProperty("preAppTitle", preAppTitle);
        opportunityData.addProperty("ProjectDirector", ProjectWebServices.getIdOf("Contact", "Victor EXE"));
        opportunityData.addProperty("ProgramIncome", "Additive");
        opportunityData.addProperty("ProjectAbstract", "Automation Test Abstraction");
        opportunityData.addProperty("InternalOrgId",  ProjectWebServices.getIdOf("Account", "Department of Product"));
        opportunityData.addProperty("AORContact",  ProjectWebServices.getIdOf("Contact", "Victor EXE"));
        opportunityData.addProperty("MaximumIndirectCostRate", 10);

        opportunityData.addProperty("City", "Memphis");
        opportunityData.addProperty("Addressline1", "4159 Mapleview Drive");
        opportunityData.addProperty("Zip4", "38110");
        opportunityData.addProperty("Country", "USA");
        opportunityData.addProperty("State", "TN");
        opportunityData.addProperty("CongressionalDistrict1", "123");
        opportunityData.addProperty("MaintainenceOfEffertsRequired", "Yes");
        opportunityData.addProperty("BudgetLevel", "Detailed Line Item Budget");
        opportunityData.addProperty("FundingOrgContact", "Automation Test");
        opportunityData.addProperty("RequiredMatch", 10);
        opportunityData.addProperty("1_IT_Requirements", true);
        opportunityData.addProperty("1a_IT_Requirements_Comment", "Automation Test");
        opportunityData.addProperty("2_Space_Requirements", true);
        opportunityData.addProperty("2a_Space_Requirements_Comment", "Automation Test");
        opportunityData.addProperty("3_State_Specific_Forms", false);
        opportunityData.addProperty("3a_State_Specific_Forms_Comment", "Automation Test");
        opportunityData.addProperty("4_Training_Certification_Requirements", false);
        opportunityData.addProperty("4a_Training_Requirements_Comment", "Automation Test");
        opportunityData.addProperty("5_Special_Award_Conditions", "Automation Test");

        // Adding Focus Areas
        JsonArray focusAreas = new JsonArray();
        focusAreas.add("Automation Permanent Focus Area");
//        focusAreas.add("Automation Permanent Focus Area2");
        opportunityData.add("focusAreas", focusAreas);

        // Adding BP Name
        JsonArray bpName = new JsonArray();
        bpName.add("BP01");
       //bpName.add("BP02");
        opportunityData.add("bpName", bpName);

        // Adding Build-up Items
        JsonArray buildUpItems = new JsonArray();
        JsonObject buildUpItem = new JsonObject();
        buildUpItem.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItem.addProperty("BudgetCatName", "Construction");
        JsonArray buildUpBudgetPeriod = new JsonArray();
        buildUpBudgetPeriod.add("BP01");
        //buildUpBudgetPeriod.add("BP02");
        buildUpItem.add("budgetPeriod", buildUpBudgetPeriod);
        buildUpItem.addProperty("Title", "Construction");
        buildUpItem.addProperty("Narrative", "Test Build-up");
        buildUpItem.addProperty("awardBudget", 5000);
        buildUpItem.addProperty("CashMatch", 500);
        buildUpItem.addProperty("NonCashMatch", 500);
        buildUpItems.add(buildUpItem);

//        JsonObject buildUpItem1 = new JsonObject();
//        buildUpItem1.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
//        buildUpItem1.addProperty("BudgetCatName", "Construction");
////        JsonArray buildUpBudgetPeriod1 = new JsonArray();
//        buildUpBudgetPeriod.add("BP01");
//        //buildUpBudgetPeriod.add("BP02");
//        buildUpItem1.add("budgetPeriod", buildUpBudgetPeriod);
//        buildUpItem1.addProperty("Title", "Construction");
//        buildUpItem1.addProperty("Narrative", "Test Build-up");
//        buildUpItem1.addProperty("awardBudget", 5000);
//        buildUpItem1.addProperty("CashMatch", 500);
//        buildUpItem1.addProperty("NonCashMatch", 500);
//        buildUpItems.add(buildUpItem1);

        opportunityData.add("buildUpItems", buildUpItems);

        // Adding PreAppBudgetCats
        JsonArray preAppBudgetCats = new JsonArray();
        JsonObject preAppBudgetCat = new JsonObject();
        JsonArray preAppBudgetPeriod = new JsonArray();
        preAppBudgetPeriod.add("BP01");
        preAppBudgetCat.add("budgetPeriod", preAppBudgetPeriod);
        preAppBudgetCat.addProperty("BudgetCatName", "Construction");
        preAppBudgetCat.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        preAppBudgetCat.addProperty("AwardBudget", 1000);
        preAppBudgetCat.addProperty("CashMatch", 100);
        preAppBudgetCat.addProperty("NonCashMatch", 100);
        preAppBudgetCat.addProperty("OtherLeverage", 100);
        preAppBudgetCats.add(preAppBudgetCat);
        opportunityData.add("PreAppBudgetCats", preAppBudgetCats);

        // Adding Contacts
        JsonArray contacts = new JsonArray();
        JsonObject contact = new JsonObject();
        contact.addProperty("Name",ProjectWebServices.getIdOf("Contact", "Victor EXE"));
        contact.addProperty("ProjectRole", "Project Director/PI");
        contact.addProperty("IsKeyContact", true);
        contacts.add(contact);
        opportunityData.add("contacts", contacts);


        JsonArray indirectRateTable = new JsonArray();
        JsonObject rate1 = new JsonObject();
        rate1.addProperty("Title", "New Indirect rate Demo");
        rate1.addProperty("DateFrom", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(5, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        rate1.addProperty("DateTo", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(10, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        rate1.addProperty("ApprovedIndirectCostRate", 20);
        rate1.addProperty("IndirectCostRateType", "Final");

        JsonObject rate2 = new JsonObject();
        rate2.addProperty("Title", "Test Rate 1");
        rate2.addProperty("DateFrom", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(5, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        rate2.addProperty("DateTo", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(10, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        rate2.addProperty("ApprovedIndirectCostRate", 10);
        rate2.addProperty("IndirectCostRateType", "Final");
        indirectRateTable.add(rate1);
        indirectRateTable.add(rate2);
        // Adding IndirectRateTable to the main JSON object
        opportunityData.add("IndirectRateTable", indirectRateTable);

        JsonArray externalProgArray = new JsonArray();
        JsonObject externalProg = new JsonObject();
        externalProg.addProperty("Title", "Automation Permanent NGO Program");
        externalProg.addProperty("IsPrimaryProgram", true);
        externalProgArray.add(externalProg);
        opportunityData.add("externalProgramNames", externalProgArray);

        // Creating the ProgramIncomeTable
        JsonArray programIncomeTable = new JsonArray();
        JsonObject income2 = new JsonObject();
        income2.addProperty("BudgetPeriod", "BP01");
        income2.addProperty("FocusArea", "Automation Permanent Focus Area");
        income2.addProperty("ProjectedProgramIncome", 1000);
        income2.addProperty("ProgramIncomeDetails", "Automation Test");
        programIncomeTable.add(income2);
        // Adding ProgramIncomeTable to the main JSON object
        opportunityData.add("ProgramIncomeTable", programIncomeTable);

        // Creating the Approvers object
        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        approver.addProperty("preApplication", "Step1");
        approver.addProperty("application", "Step1");
        approvers.add(approver);
        opportunityData.add("approvers", approvers);

        // Creating the OpportunityData array and adding the OpportunityData object
        JsonArray opportunityDataArray = new JsonArray();
        opportunityDataArray.add(opportunityData);

        // Creating the final JSON object
        JsonObject finalJson = new JsonObject();
        finalJson.add("preAppAndAppData", opportunityDataArray);

        return finalJson;
    }

    private JsonObject payloadForCreateProgramIncome(JsonObject json) {
        JsonObject pre_application = json.getAsJsonArray("preAppAndAppData").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        pre_application.addProperty("ProgramIncome", "Deductive");
        pre.add(pre_application);
        json.add("preAppAndAppData", pre);
        return json;
    }

    public JsonObject payloadForawardFromApplicationForOpportunityForTitle(String state, String oppoNo, String appTitle, String filter) {
        String user = "";
        JsonObject json;

        json = defaultPayloadawardFromApplicationForOpportunityForTitle(state, oppoNo, appTitle);

        if (filter.toLowerCase().contains("user")) {
            if (filter.contains("-")) {
                user = filter.split("-")[1].split("user")[0].trim();
                updateGranteeAwardOwner(json, user);
                filter = filter.split("-")[0];
            } else {
                user = filter.replace("user", "").trim();
                filter = "USER";
            }
        } else {
            filter = filter.toUpperCase();
        }

        switch (filter) {
            case "PROGRAM_INCOME_DEDUCTI":
                return payloadForCreateGrantProgramIncome(json);
            case "USER":
                return createStandaloneGranteeAwardUsingUser(json, user);
            default:
                return json;
        }
    }

    private void updateGranteeAwardOwner(JsonObject json, String user) {
        JsonObject jsonObject = json.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
        JsonArray grantOwner = new JsonArray();
        jsonObject.addProperty("OwnerId", ProjectWebServices.getIdOf("User", user));
        grantOwner.add(jsonObject);
        json.add("GrantAwardData", grantOwner);
    }

    private JsonObject defaultPayloadawardFromApplicationForOpportunityForTitle(String state, String oppoNo, String appTitle) {
        JsonObject grantDetails = new JsonObject();

        // Basic grant details
        grantDetails.addProperty("isDirectGrant", false);

        JsonArray appToAwardArray = new JsonArray();
        JsonObject appToAward = new JsonObject();
        appToAward.addProperty("OpportunityNumber", oppoNo);
        appToAward.addProperty("isDecesionAwarded", true);
        appToAward.addProperty("DecisionComment", "Allowed to create Award" );
        appToAwardArray.add(appToAward);
        grantDetails.add("AppAwardData", appToAwardArray);

        grantDetails.addProperty("grantTitle", appTitle);
        grantDetails.addProperty("grantAbbreviation", "GA");
        grantDetails.addProperty("OwnerId", ProjectWebServices.getIdOf("User", "Sarah PM"));
        grantDetails.addProperty("grantNumber", "GT1234");
        grantDetails.addProperty("projectPeriodStartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grantDetails.addProperty("projectPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grantDetails.addProperty("budgetType", "Construction");
        grantDetails.addProperty("fundingOrganization", ProjectWebServices.getIdOf("Account", "Department of Education"));
        grantDetails.addProperty("InternalOrganization", ProjectWebServices.getIdOf("Account", "Department of Product"));
        grantDetails.addProperty("allowIndirectCosts", "Yes");
        grantDetails.addProperty("GrantDescription", "Automation Test");
        grantDetails.addProperty("totalAnticipatedAmount", 100000);
        grantDetails.addProperty("grantType", "Project Grant");
        grantDetails.addProperty("maintenanceOfEffortRequired", "Yes");
        grantDetails.addProperty("matchRequired", "Yes");
        grantDetails.addProperty("costSharing", "Cash Match");
        grantDetails.addProperty("requiredMatchPercentage", 10);
        grantDetails.addProperty("isLeverageAllowed", "Yes");
        grantDetails.addProperty("BudgetCloseoutrequestRequired", "Yes");
        grantDetails.addProperty("programIncomeAllowed", "Yes");
        grantDetails.addProperty("ueiNumber", ProjectWebServices.getIdOf("DUNS__c", "YRNMVN96JC17"));
        grantDetails.addProperty("ownerId", ProjectWebServices.getIdOf("User", "Sarah PM"));
        grantDetails.addProperty("grantAwardDescription", "Automation Test");
        grantDetails.addProperty("AwardIssueDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grantDetails.addProperty("AmendmentNumber", 10);
        grantDetails.addProperty("MaintenanceOfEffortAmount", 100);
        grantDetails.addProperty("TermsandConditionsLink", "www.google.com");
        grantDetails.addProperty("MaintenanceOfEffortStatutoryReference", "www.google.com");
        grantDetails.addProperty("FunderPaymentSystem", "spaceX");
        grantDetails.addProperty("FunderPaymentAccountNumber", "ABC12121");
        grantDetails.addProperty("BudgetPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grantDetails.addProperty("MaximumIndirectCostRate", 10);
        grantDetails.addProperty("ProgramIncome", "Additive");
        grantDetails.addProperty("CongressionalDistrict", "123");
        grantDetails.addProperty("AwdStatusSubmittedOrApproved", state);

        // Creating the final JSON object
        JsonObject finalJson = new JsonObject();
        JsonArray grantDataArray = new JsonArray();
        grantDataArray.add(grantDetails);
        finalJson.add("GrantAwardData", grantDataArray);

        return finalJson;
    }

    public JsonObject payloadForAdhocCloseoutCreatedAndApproved(String grantTitle, String status, String filter) {
        JsonObject defaultJson = defaultAdhocCloseoutCreatedAndApproved(grantTitle, status);

        filter = filter.toUpperCase();

        switch (filter) {
            case "UPDATE_CLOSEOUT_TYPE":
                return updateCloseoutFields(defaultJson);
            default:
                return defaultJson;
        }
    }

    private JsonObject defaultAdhocCloseoutCreatedAndApproved(String grantTitle, String status) {
        JsonObject closeoutDetails = new JsonObject();

        // Basic grant closeout details
        closeoutDetails.addProperty("GrantTitle", grantTitle);
        closeoutDetails.addProperty("CloseoutType", "Early Completion");
        closeoutDetails.addProperty("Reason", "Automation Test");
        closeoutDetails.addProperty("CloseoutEffectiveDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        closeoutDetails.addProperty("CloseoutDueDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(4015, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        closeoutDetails.addProperty("OverrideJustification", "Automation Test");
        if(status.equalsIgnoreCase("Submitted to Grantor")) {
            closeoutDetails.addProperty("SubmittedtoGrantor", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(1, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        }else if(status.equalsIgnoreCase("Completed")) {
            closeoutDetails.addProperty("SubmittedtoGrantor", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(1, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            closeoutDetails.addProperty("GrantorCloseoutDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(1, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        }

        // Yes/No fields
        closeoutDetails.addProperty("ReviewExpenditures", "Yes");
        closeoutDetails.addProperty("Ensurejournalentriescompleted", "Yes");
        closeoutDetails.addProperty("IdentifyAllOutstandingInvoices", "Yes");
        closeoutDetails.addProperty("IdentifyOutstandinginvoices", "Yes");
        closeoutDetails.addProperty("PayrollExpenses", "Yes");
        closeoutDetails.addProperty("ConfirmIndirectExpensesHaveBeenPost", "Yes");
        closeoutDetails.addProperty("ReviewAndUpdatePersonnelAllocations", "Yes");
        closeoutDetails.addProperty("ReviewedPurchaseOrdersIfClosed", "Yes");
        closeoutDetails.addProperty("RemoveGATsFromVariousSundrySystems", "Yes");
        closeoutDetails.addProperty("EnsureCostSharingcommitmentsmet", "Yes");
        closeoutDetails.addProperty("AllProgressReportingRequirements", "Yes");
        closeoutDetails.addProperty("AllFinancialReportingRequirements", "Yes");
        closeoutDetails.addProperty("FinalFFRforAllFunds", "Yes");
        closeoutDetails.addProperty("EnsureCostSharingCommitmentsAreMet", "Yes");
        closeoutDetails.addProperty("IsThereAnUnspentBalance", "Yes");
        closeoutDetails.addProperty("PleaseExplainUnspentBalance", "Automation Test");
        closeoutDetails.addProperty("AdvancePayments", "Yes");
        closeoutDetails.addProperty("HaveTheRealPropertyStatus", "Yes");
        closeoutDetails.addProperty("HastheTangiblePersonalProperty", "Yes");
        closeoutDetails.addProperty("ConfirmAllAuditConcernsMonitoring", "Yes");
        closeoutDetails.addProperty("HaveAllFederalMonitoringFindings", "Yes");
        closeoutDetails.addProperty("HaveAllApplicableFederalGrant", "Yes");

        // Closeout status
        closeoutDetails.addProperty("isCreatedOrApprovedCloseout", status);

        // Adding approvers as an array
        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        approver.addProperty("closeout", "Step1");
        approvers.add(approver);
        closeoutDetails.add("approvers", approvers);

        // Creating the OpportunityData array and adding the OpportunityData object
        JsonArray closeoutDataArray = new JsonArray();
        closeoutDataArray.add(closeoutDetails);

        // Creating the final JSON object
        JsonObject finalJson = new JsonObject();
        finalJson.add("closeoutData", closeoutDataArray);

        return finalJson;
    }


    private JsonObject updateCloseoutFields(JsonObject defaultJson) {
        JsonObject closeout = defaultJson.getAsJsonArray("closeoutData").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        closeout.addProperty("CloseoutType", "Termination");
        closeout.addProperty("Ensurejournalentriescompleted", "No");
        closeout.addProperty("IdentifyAllOutstandingInvoices", "No");
        pre.add(closeout);
        defaultJson.add("closeoutData", pre);
        return defaultJson;
    }

    public JsonObject payloadForScheduleCloseoutCreatedAndApproved(String grantTitle, String status, String filter) {
        JsonObject defaultJson = defaultScheduleCloseoutCreatedAndApproved(grantTitle, status);

        filter = filter.toUpperCase();

        switch (filter) {
            case "APPLICATION":
                break;
            default:
                return defaultJson;
        }
        return defaultJson;
    }

    private JsonObject defaultScheduleCloseoutCreatedAndApproved(String grantTitle, String status) {
        JsonObject closeoutDetails = new JsonObject();

        // Grant closeout details
        closeoutDetails.addProperty("grantTitle", grantTitle);
        closeoutDetails.addProperty("justification", "Automation Test");
        closeoutDetails.addProperty("closeoutDueDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        closeoutDetails.addProperty("closeoutEffectiveDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3620, DateTimeFormatter.ofPattern("yyyy-MM-dd")));

        // Yes/No fields
        closeoutDetails.addProperty("reviewExpenditure", "Yes");
        closeoutDetails.addProperty("journalEntries", "Yes");
        closeoutDetails.addProperty("outstandingPayment", "Yes");
        closeoutDetails.addProperty("personalAllocation", "Yes");
        closeoutDetails.addProperty("reviewPurchaseOrders", "Yes");
        closeoutDetails.addProperty("removeGAT", "Yes");
        closeoutDetails.addProperty("costSharingCommitment", "Yes");
        closeoutDetails.addProperty("progressReportReq", "Yes");
        closeoutDetails.addProperty("financialReportReq", "Yes");
        closeoutDetails.addProperty("finalFunds", "Yes");
        closeoutDetails.addProperty("costSharingCommitment_2", "Yes");
        closeoutDetails.addProperty("unspentBalance", "Yes");
        closeoutDetails.addProperty("expUnspentBal", "Yes");
        closeoutDetails.addProperty("advPayment", "Yes");
        closeoutDetails.addProperty("realPropertyStatus", "Yes");
        closeoutDetails.addProperty("tangibleProperty", "Yes");
        closeoutDetails.addProperty("auditConcern", "Yes");
        closeoutDetails.addProperty("federalMonitoring", "Yes");
        closeoutDetails.addProperty("federalGrant", "Yes");
        closeoutDetails.addProperty("isCreatedOrApprovedCloseout", status);
        closeoutDetails.addProperty("reason", "Automation Test");

        // Additional fields
        closeoutDetails.addProperty("outstandingInvoices", "Yes");
        closeoutDetails.addProperty("payRoll", "Yes");
        closeoutDetails.addProperty("confirmIndirect", "Yes");

        // Approvers
        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        approver.addProperty("closeout", "Step1");
        approvers.add(approver);
        closeoutDetails.add("approvers", approvers);

        // Creating the OpportunityData array and adding the OpportunityData object
        JsonArray closeoutDataArray = new JsonArray();
        closeoutDataArray.add(closeoutDetails);

        // Creating the final JSON object
        JsonObject finalJson = new JsonObject();
        finalJson.add("closeoutData", closeoutDataArray);

        // Return the final JSON object
        return finalJson;
    }

    public JsonObject payloadForStandaloneAwardCreatedAndActivated(String grantTitle, String state, String filter) {
        String user = "";
        JsonObject json;

        json = defaultPayloadCreateStandaloneAwardForGrantee(grantTitle, state);

        if (filter.toLowerCase().contains("user")) {
            if (filter.contains("-")) {
                user = filter.split("-")[1].split("user")[0].trim();
                updateGranteeDirectAwardOwner(json, user);
                filter = filter.split("-")[0];
            } else {
                user = filter.replace("user", "").trim();
                filter = "USER";
            }
        } else {
            filter = filter.toUpperCase();
        }

        switch (filter) {
            case "PROGRAM_INCOME_DEDUCTI":
                return payloadForCreateGrantProgramIncome(json);
            case "SCHEDULE_PROJ_START_END_DATE":
                return payloadForScheduleStartEndDate(json);
            case "INDIRECT_COST_NO":
                return payloadForIndirectCostNo(json);
            case "ALL_SETTING_NO":
                return payloadForAllSettingsNo(json);
            case "CASH_MATCH_NON_CASH_MATCH":
                return payloadForCashMatchAndNonCashMatch(json);
            case "USER":
                return createStandaloneGranteeAwardUsingUser(json, user);
            default:
                return json;
        }
    }

    private JsonObject payloadForCashMatchAndNonCashMatch(JsonObject json) {
        JsonObject grants = json.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        grants.addProperty("costSharing", "Cash and Non-Cash Match");
        pre.add(grants);
        json.add("GrantAwardData", pre);
        return json;
    }

    private JsonObject payloadForAllSettingsNo(JsonObject json) {
        JsonObject grants = json.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        grants.addProperty("allowIndirectCosts", "No");
        grants.addProperty("matchRequired", "No");
        grants.addProperty("maintenanceOfEffortRequired", "No");
        grants.addProperty("isLeverageAllowed", "No");
        grants.addProperty("BudgetCloseoutrequestRequired", "No");
        grants.addProperty("programIncomeAllowed", "No");
        pre.add(grants);
        json.add("GrantAwardData", pre);
        return json;
    }

    private JsonObject payloadForIndirectCostNo(JsonObject json) {
        JsonObject grants = json.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        grants.addProperty("allowIndirectCosts", "No");
        pre.add(grants);
        json.add("GrantAwardData", pre);
        return json;
    }

    private JsonObject payloadForScheduleStartEndDate(JsonObject json) {
        JsonObject grants = json.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        grants.addProperty("projectPeriodStartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grants.addProperty("projectPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(380, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grants.addProperty("BudgetPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(380, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        pre.add(grants);
        json.add("GrantAwardData", pre);
        return json;
    }

    private JsonObject payloadForSecondFocusWithBudget(JsonObject json) {
        JsonObject grantAwardData = json.getAsJsonArray("AwardChildData").get(0).getAsJsonObject();

        JsonArray focusAreas = new JsonArray();
        JsonObject focusArea1 = new JsonObject();
        focusArea1.addProperty("Title", "Automation Permanent Focus Area");
        focusArea1.addProperty("StartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusArea1.addProperty("EndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusAreas.add(focusArea1);
        grantAwardData.add("focusAreas", focusAreas);

        JsonArray buildUpItems = new JsonArray();
        JsonObject buildUpItem = new JsonObject();
        buildUpItem.addProperty("BudgetCategory", "Construction");
        buildUpItem.addProperty("Title", "Construction");
        buildUpItem.addProperty("Narrative", "Test Build-up");
        buildUpItem.addProperty("awardBudget", 5000);
        buildUpItem.addProperty("CashMatch", 500);
        buildUpItem.addProperty("OtherLeverage", 200);
        buildUpItem.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItems.add(buildUpItem);
        grantAwardData.add("buildUpItems", buildUpItems);

        JsonObject focusArea2 = new JsonObject();
        focusArea2.addProperty("Title","Automation Permanent Focus Area2");
        focusArea2.addProperty("StartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusArea2.addProperty("EndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusAreas.add(focusArea2);
        grantAwardData.add("focusAreas", focusAreas);

        // Adding build-up items
        JsonArray buildUpItems1 = new JsonArray();
        JsonObject buildUpItem1 = new JsonObject();
        buildUpItem1.addProperty("BudgetCategory", "Construction");
        buildUpItem1.addProperty("Title", "Construction");
        buildUpItem1.addProperty("Narrative", "Test Build-up");
        buildUpItem1.addProperty("awardBudget", 5000);
        buildUpItem1.addProperty("CashMatch", 500);
        buildUpItem1.addProperty("OtherLeverage", 200);
        buildUpItem1.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItems1.add(buildUpItem1);
        grantAwardData.add("buildUpItems", buildUpItems1);

        JsonArray grantAwardDataArray = new JsonArray();
        grantAwardDataArray.add(grantAwardData);
        json.add("AwardChildData", grantAwardDataArray);
        return json;
    }

    private void updateGranteeDirectAwardOwner(JsonObject json, String user) {
        JsonObject jsonObject = json.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
        JsonArray grantOwner = new JsonArray();
        jsonObject.addProperty("ownerId", ProjectWebServices.getIdOf("User", user));
        grantOwner.add(jsonObject);
        json.add("GrantAwardData", grantOwner);
    }

    private void updateGranteeAmendmentAwardOwner(JsonObject json, String user) {
        JsonObject jsonObject = json.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
        JsonArray grantOwner = new JsonArray();
        jsonObject.addProperty("ownerId", ProjectWebServices.getIdOf("User", user));
        grantOwner.add(jsonObject);
        json.add("GrantAwardData", grantOwner);
    }

    private JsonObject createStandaloneGranteeAwardUsingUser(JsonObject json, String user) {
        JsonObject grant = json.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("OwnerId", ProjectWebServices.getIdOf("User", user));
        newA.add(grant);
        json.add("GrantAwardData", newA);
        return json;
    }

    private JsonObject defaultPayloadCreateStandaloneAwardForGrantee(String grantTitle, String state) {
        JsonObject grantDetails = new JsonObject();

        // Basic grant details
        grantDetails.addProperty("isDirectGrant", true);
        grantDetails.addProperty("grantTitle", grantTitle);
        grantDetails.addProperty("grantAbbreviation", "GA");
        grantDetails.addProperty("grantNumber", "GT1234");
        grantDetails.addProperty("projectPeriodStartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grantDetails.addProperty("projectPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grantDetails.addProperty("budgetType", "Construction");
        grantDetails.addProperty("fundingOrganization", ProjectWebServices.getIdOf("Account", "Department of Education"));
        grantDetails.addProperty("InternalOrganization", ProjectWebServices.getIdOf("Account", "Department of Product"));
        grantDetails.addProperty("allowIndirectCosts", "Yes");
        grantDetails.addProperty("GrantDescription", "Automation Test");
        grantDetails.addProperty("totalAnticipatedAmount", 100000);
        grantDetails.addProperty("grantType", "Project Grant");
        grantDetails.addProperty("maintenanceOfEffortRequired", "Yes");
        grantDetails.addProperty("matchRequired", "Yes");
        grantDetails.addProperty("costSharing", "Cash Match");
        grantDetails.addProperty("requiredMatchPercentage", 10);
        grantDetails.addProperty("isLeverageAllowed", "Yes");
        grantDetails.addProperty("BudgetCloseoutrequestRequired", "Yes");
        grantDetails.addProperty("programIncomeAllowed", "Yes");
        grantDetails.addProperty("ueiNumber", ProjectWebServices.getIdOf("DUNS__c", "YRNMVN96JC17"));
        grantDetails.addProperty("ownerId", ProjectWebServices.getIdOf("User", "Sarah PM"));
        grantDetails.addProperty("grantAwardDescription", "Automation Test");
        grantDetails.addProperty("AwardIssueDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grantDetails.addProperty("AmendmentNumber", 10);
        grantDetails.addProperty("MaintenanceOfEffortAmount", 100);
        grantDetails.addProperty("TermsandConditionsLink", "www.google.com");
        grantDetails.addProperty("MaintenanceOfEffortStatutoryReference", "www.google.com");
        grantDetails.addProperty("FunderPaymentSystem", "spaceX");
        grantDetails.addProperty("FunderPaymentAccountNumber", "ABC12121");
        grantDetails.addProperty("BudgetPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grantDetails.addProperty("MaximumIndirectCostRate", 10);
        grantDetails.addProperty("ProgramIncome", "Additive");
        grantDetails.addProperty("CongressionalDistrict", "123");
        grantDetails.addProperty("AwdStatusSubmittedOrApproved", state);

        // Creating the final JSON object
        JsonObject finalJson = new JsonObject();
        JsonArray grantDataArray = new JsonArray();
        grantDataArray.add(grantDetails);
        finalJson.add("GrantAwardData", grantDataArray);

        return finalJson;
    }

    private JsonObject payloadForCreateGrantProgramIncome(JsonObject json) {
        JsonObject grants = json.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        grants.addProperty("ProgramIncome", "Deductive");
        pre.add(grants);
        json.add("GrantAwardData", pre);
        return json;
    }

    public JsonObject payloadForActivateTheAward(String grantTitle) {
        JsonObject defaultJson = defaultCreateActivateTheAward(grantTitle);
        return defaultJson;
    }

    private JsonObject defaultCreateActivateTheAward(String grantTitle) {
        JsonObject activeGrant = new JsonObject();
        activeGrant.addProperty("awardTitle", grantTitle);
        activeGrant.addProperty("isapproved", "Approved");
        return activeGrant;
    }

    public JsonObject payloadForCreateTheProgressReportCreatedAndApproved(String status, String type, String title, String filter) {
        JsonObject defaultJson = defaultCreateTheProgressReportCreatedAndApproved(status, type, title);

        filter = filter.toUpperCase();

        switch (filter) {
            case "FINAL_PROGRESS_YES":
                return updatePogressYes(defaultJson);
            default:
                return defaultJson;
        }
    }

    private JsonObject defaultCreateTheProgressReportCreatedAndApproved(String status, String type, String title) {
        JsonObject progressReportDetails = new JsonObject();

        // Basic progress report details
        progressReportDetails.addProperty("AwardTitle", title);
        if(type.equalsIgnoreCase("Progress Report")) {
            progressReportDetails.addProperty("ReportType", "Program");
        }else{
            progressReportDetails.addProperty("ReportType", "Fiscal");
        }
        progressReportDetails.addProperty("OwnerID", ProjectWebServices.getIdOf("User", "Sarah PM"));
        progressReportDetails.addProperty("ReportDueDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReportDetails.addProperty("KeyAccomplishments", "Automation Test Key Accomplishments");
        progressReportDetails.addProperty("Obstacles", "Automation Test Obstacles");
        progressReportDetails.addProperty("Plans", "Automation Test Plans");
        progressReportDetails.addProperty("SubmittedtoGrantor", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(1, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReportDetails.addProperty("isCreatedOrApprovedProgressReport", status);
        progressReportDetails.addProperty("isFinalReport", false);

        // Adding approvers as an array
        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        approver.addProperty("progressreport", "Step1");
        approvers.add(approver);
        progressReportDetails.add("approvers", approvers);

        // Creating the progress report data array and adding the progress report object
        JsonArray progressReportDataArray = new JsonArray();
        progressReportDataArray.add(progressReportDetails);

        // Creating the final JSON object
        JsonObject finalJson = new JsonObject();
        finalJson.add("progressReportData", progressReportDataArray);

        return finalJson;
    }

    private JsonObject updatePogressYes(JsonObject defaultJson) {
        JsonObject progressReportDetails = defaultJson.getAsJsonArray("progressReportData").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        progressReportDetails.addProperty("isFinalReport", true);
        progressReportDetails.addProperty("Plans", "Automation Test Executions");
        pre.add(progressReportDetails);
        defaultJson.add("progressReportData", pre);
        return defaultJson;
    }

    public JsonObject payloadForCreateTheScheduleProgressReportCreatedAndApproved(String type, String grantTitle, String filter) {
        JsonObject defaultJson = defaultCreateTheScheduleProgressReportCreatedAndApproved(type, grantTitle);

        filter = filter.toUpperCase();

        switch (filter) {
            case "FINAL_PROGRESS_YES":
                return updatePogressYes(defaultJson);
            default:
                return defaultJson;
        }
    }

    private JsonObject defaultCreateTheScheduleProgressReportCreatedAndApproved(String type, String grantTitle) {
        JsonObject reportDetails = new JsonObject();

        // Basic report details
        reportDetails.addProperty("awardName", grantTitle);
        reportDetails.addProperty("reportType", type);
        reportDetails.addProperty("reportCreationDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd"))); // Use current date for report creation

        // Adding approvers as an array
        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        approver.addProperty("monitoring", "Step1");
        approvers.add(approver);
        reportDetails.add("approvers", approvers);

        // Creating the reportData array and adding the reportDetails object
        JsonArray reportDataArray = new JsonArray();
        reportDataArray.add(reportDetails);

        // Creating the final JSON object
        JsonObject finalJson = new JsonObject();
        finalJson.add("reportData", reportDataArray);

        // Return the final JSON object
        return finalJson;
    }

    public JsonObject payloadForUpdateTheScheduleProgressReportCreatedAndApproved(String type, String state, String grantTitle, String filter) {
        JsonObject defaultJson = defaultUpdateTheScheduleProgressReportCreatedAndApproved(type, state, grantTitle);

        filter = filter.toUpperCase();

        switch (filter) {
            case "FINAL_PROGRESS_YES":
                return updateSchedulePogressYes(defaultJson);
            default:
                return defaultJson;
        }
    }

    private JsonObject defaultUpdateTheScheduleProgressReportCreatedAndApproved(String type, String state, String grantTitle) {
        JsonObject reportData = new JsonObject();
        reportData.addProperty("reportName", grantTitle);
        reportData.addProperty("keyAccomp", "Automation Test Key");
        reportData.addProperty("obstacles", "Automation Test Obstacles");
        reportData.addProperty("plans", "Automation Test Plans");
        reportData.addProperty("isFinalReport", false);
        reportData.addProperty("isSumittedToGrantorOrApproved", state);
        reportData.addProperty("Types", type);
        reportData.addProperty("EGMSID", "PR--GT-GA-00240-001");

        // Approvers
        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        approver.addProperty("monitoring", "Step1");
        approvers.add(approver);
        reportData.add("approvers", approvers);

        // Creating the reportData array and adding the reportData object
        JsonArray reportDataArray = new JsonArray();
        reportDataArray.add(reportData);

        // Creating the final JSON object
        JsonObject finalJson = new JsonObject();
        finalJson.add("reportData", reportDataArray);

        return finalJson;
    }

    private JsonObject updateSchedulePogressYes(JsonObject defaultJson) {
        JsonObject progressReportDetails = defaultJson.getAsJsonArray("reportData").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        progressReportDetails.addProperty("isFinalReport", true);
        progressReportDetails.addProperty("plans", "Automation Test Executions");
        pre.add(progressReportDetails);
        defaultJson.add("reportData", pre);
        return defaultJson;
    }

    public JsonObject payloadForCreateTheAmendmentRequestWithType(String state, String type, String grantTitle, String filter) {
        String user = "";
        JsonObject defaultJson;
        defaultJson = defaultCreateCreateTheAmendmentRequestWithType(state, type, grantTitle);

        if (filter.toLowerCase().contains("user")) {
            if (filter.contains("-")) {
                user = filter.split("-")[1].split("user")[0].trim();
                updateGranteeAmendmentAwardOwner(defaultJson, user);
                filter = filter.split("-")[0];
            } else {
                user = filter.replace("user", "").trim();
                filter = "USER";
            }
        } else {
            filter = filter.toUpperCase();
        }

        switch (filter) {
            case "BUDGET_REDIRECTION":
                return updateBudgetRedirection(defaultJson);
            case "CARRY_FORWARD":
                return updateCarryForward(defaultJson, type, grantTitle, state);
            case "BUDGET_PERIOD_CHANGE_GRANTEE_PO":
                return updateBudgetPeriodChange(defaultJson, type, grantTitle, state);
            case "NON_CASH_MATCH_BUDGET":
                return updateNonCashMatchBudget(defaultJson);
            case "NO_BUDGET":
                return updateNonBudget(defaultJson, type, grantTitle, state);
            case "GRANTEE_FO_APPROVER":
                return payloadForGranteeFOAmendmentApprover(defaultJson);
            case "STEP_FOUR_APPROVER":
                return payloadForGranteeStepFourApprover(defaultJson);
            default:
                return defaultJson;
        }
    }

    private JsonObject updateBudgetPeriodChange(JsonObject defaultJson, String type, String grantTitle, String state) {
        JsonObject grantAwardData = new JsonObject();
        grantAwardData.addProperty("InitiatedBy", "Grantee");
        grantAwardData.addProperty("PleaseselectAmendmentRequestType", type);
        grantAwardData.addProperty("AwardTitle", grantTitle);
        grantAwardData.addProperty("Justification", "Automation Test");
        grantAwardData.addProperty("Impact", "Automation Test Impact");
        grantAwardData.addProperty("ownerId", ProjectWebServices.getIdOf("User", "Grantee PO"));
        grantAwardData.addProperty("isStatusCreatedOrApproved", state);
        grantAwardData.addProperty("MaximumIndirectCostRate", 10);
        grantAwardData.addProperty("NewAwardTitle", state);
        grantAwardData.addProperty("NewAwardDescription", "Automation Test");
        grantAwardData.addProperty("BudgetRedirectionThreshold", 10);
        grantAwardData.addProperty("Addressline", "Rei System");
        grantAwardData.addProperty("Address", "Baner");
        grantAwardData.addProperty("City", "Alaska");
        grantAwardData.addProperty("County", "Alaska");
        grantAwardData.addProperty("State", "MA");
        grantAwardData.addProperty("CongressionalDistrict", "345");
        grantAwardData.addProperty("ZipCode", "45678");
        grantAwardData.addProperty("Country", "USA");
        grantAwardData.addProperty("NewBudgetPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3670, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grantAwardData.addProperty("RequestedChangeinAwardBudget", 2000);
        grantAwardData.addProperty("ProposedBudgetPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3670, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grantAwardData.addProperty("4DigitZipCodeExtension", "3456");
        grantAwardData.addProperty("OtherChangeDescription", "Automation Test");
        grantAwardData.addProperty("PurposeSummary", "Automation Test");
        grantAwardData.addProperty("OtherAmendmentTypeDetails", "Automation Test");
        grantAwardData.addProperty("GeneralCondition", false);

        // Focus Areas
        JsonArray focusAreas = new JsonArray();
        JsonObject focusArea = new JsonObject();
        focusArea.addProperty("Title", "Automation Permanent Focus Area");
        focusArea.addProperty("StartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusArea.addProperty("EndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3670, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusAreas.add(focusArea);
        grantAwardData.add("focusAreas", focusAreas);

        // Indirect Rates
        JsonArray indirectRates = new JsonArray();
        JsonObject indirectRate = new JsonObject();
        indirectRate.addProperty("title", "New Indirect rate1");
        indirectRate.addProperty("effectiveFrom", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("effectiveUntil", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(50, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("indirectCostRates", 10);
        indirectRate.addProperty("indirectCostRateType", "Final");
        indirectRates.add(indirectRate);
        grantAwardData.add("indirectRates", indirectRates);

        // Approvers
        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Sarah PM"));
        approver.addProperty("amendmentRequest", "Step1");
        approvers.add(approver);
        grantAwardData.add("approvers", approvers);

        // Creating the GrantAwardData array and adding the GrantAwardData object
        JsonArray grantAwardDataArray = new JsonArray();
        grantAwardDataArray.add(grantAwardData);

        // Creating the final JSON object
        JsonObject finalJson = new JsonObject();
        finalJson.add("GrantAwardData", grantAwardDataArray);

        return finalJson;
    }

    private JsonObject payloadForGranteeStepFourApprover(JsonObject defaultJson) {
        JsonObject preAPPData = defaultJson.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
        JsonArray topLevelApprovers = new JsonArray();
        JsonObject topLevelApprover = new JsonObject();
        topLevelApprover.addProperty("name", ProjectWebServices.getIdOf("User", "Sarah PM"));
        topLevelApprover.addProperty("amendmentRequest", "Step1");
        topLevelApprovers.add(topLevelApprover);

        JsonObject topLevelApprover1 = new JsonObject();
        topLevelApprover1.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        topLevelApprover1.addProperty("amendmentRequest", "Step2");
        topLevelApprovers.add(topLevelApprover1);

        JsonObject topLevelApprover2 = new JsonObject();
        topLevelApprover2.addProperty("name", ProjectWebServices.getIdOf("User", "Grantee PO"));
        topLevelApprover2.addProperty("amendmentRequest", "Step3");
        topLevelApprovers.add(topLevelApprover2);

        JsonObject topLevelApprover3 = new JsonObject();
        topLevelApprover3.addProperty("name", ProjectWebServices.getIdOf("User", "David FO"));
        topLevelApprover3.addProperty("amendmentRequest", "Step4");
        topLevelApprovers.add(topLevelApprover3);

        preAPPData.add("approvers", topLevelApprovers);
        JsonArray preAPPDataDataArray = new JsonArray();
        preAPPDataDataArray.add(preAPPData);
        defaultJson.add("GrantAwardData", preAPPDataDataArray);
        return defaultJson;
    }

    private JsonObject payloadForGranteeFOAmendmentApprover(JsonObject defaultJson) {
        JsonObject preAPPData = defaultJson.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
        JsonArray topLevelApprovers = new JsonArray();
        JsonObject topLevelApprover = new JsonObject();
        topLevelApprover.addProperty("name", ProjectWebServices.getIdOf("User", "David FO"));
        topLevelApprover.addProperty("amendmentRequest", "Step1");
        topLevelApprovers.add(topLevelApprover);
        preAPPData.add("approvers", topLevelApprovers);
        JsonArray preAPPDataDataArray = new JsonArray();
        preAPPDataDataArray.add(preAPPData);
        defaultJson.add("GrantAwardData", preAPPDataDataArray);
        return defaultJson;
    }

    private JsonObject updateNonBudget(JsonObject defaultJson, String type, String grantTitle, String state) {
        JsonObject grantAwardData = new JsonObject();
        grantAwardData.addProperty("InitiatedBy", "Grantee");
        grantAwardData.addProperty("PleaseselectAmendmentRequestType", type);
        grantAwardData.addProperty("AwardTitle", grantTitle);
        grantAwardData.addProperty("Justification", "Automation Test");
        grantAwardData.addProperty("Impact", "Automation Test Impact");
        grantAwardData.addProperty("ownerId", ProjectWebServices.getIdOf("User", "Grantee PO"));
        grantAwardData.addProperty("isStatusCreatedOrApproved", state);
        grantAwardData.addProperty("MaximumIndirectCostRate", 10);
        grantAwardData.addProperty("NewAwardTitle", state);
        grantAwardData.addProperty("NewAwardDescription", "Automation Test");
        grantAwardData.addProperty("BudgetRedirectionThreshold", 10);
        grantAwardData.addProperty("Addressline", "Rei System");
        grantAwardData.addProperty("Address", "Baner");
        grantAwardData.addProperty("City", "Alaska");
        grantAwardData.addProperty("County", "Alaska");
        grantAwardData.addProperty("State", "MA");
        grantAwardData.addProperty("CongressionalDistrict", "345");
        grantAwardData.addProperty("ZipCode", "45678");
        grantAwardData.addProperty("Country", "USA");
        grantAwardData.addProperty("NewBudgetPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3670, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grantAwardData.addProperty("RequestedChangeinAwardBudget", 2000);
        grantAwardData.addProperty("ProposedBudgetPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3670, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grantAwardData.addProperty("4DigitZipCodeExtension", "3456");
        grantAwardData.addProperty("OtherChangeDescription", "Automation Test");
        grantAwardData.addProperty("PurposeSummary", "Automation Test");
        grantAwardData.addProperty("OtherAmendmentTypeDetails", "Automation Test");
        grantAwardData.addProperty("GeneralCondition", false);

        // Focus Areas
        JsonArray focusAreas = new JsonArray();
        JsonObject focusArea = new JsonObject();
        focusArea.addProperty("Title", "Automation Permanent Focus Area");
        focusArea.addProperty("StartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusArea.addProperty("EndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3670, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusAreas.add(focusArea);
        grantAwardData.add("focusAreas", focusAreas);

        // Indirect Rates
        JsonArray indirectRates = new JsonArray();
        JsonObject indirectRate = new JsonObject();
        indirectRate.addProperty("title", "New Indirect rate1");
        indirectRate.addProperty("effectiveFrom", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("effectiveUntil", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(50, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("indirectCostRates", 10);
        indirectRate.addProperty("indirectCostRateType", "Final");
        indirectRates.add(indirectRate);
        grantAwardData.add("indirectRates", indirectRates);

        // Approvers
        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Sarah PM"));
        approver.addProperty("amendmentRequest", "Step1");
        approvers.add(approver);
        grantAwardData.add("approvers", approvers);

        // Creating the GrantAwardData array and adding the GrantAwardData object
        JsonArray grantAwardDataArray = new JsonArray();
        grantAwardDataArray.add(grantAwardData);

        defaultJson.add("GrantAwardData", grantAwardDataArray);

        return defaultJson;

    }

    private JsonObject updateNonCashMatchBudget(JsonObject defaultJson) {
        JsonObject grantAwardData = defaultJson.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
        JsonArray buildUpItems = new JsonArray();
        JsonObject buildUpItem = new JsonObject();
        buildUpItem.addProperty("BudgetCategory", "Construction");
        buildUpItem.addProperty("Title", "Construction Test");
        buildUpItem.addProperty("Narrative", "Test Build-up");
        buildUpItem.addProperty("awardBudget", 4500);
        buildUpItem.addProperty("CashMatch", 450);
        buildUpItem.addProperty("NonCashMatch", 450);
        buildUpItem.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItems.add(buildUpItem);
        grantAwardData.add("BuildUpItems", buildUpItems);
        JsonArray grantAwardDataArray = new JsonArray();
        grantAwardDataArray.add(grantAwardData);
        defaultJson.add("GrantAwardData", grantAwardDataArray);
        return defaultJson;
    }

    private JsonObject updateCarryForward(JsonObject defaultJson, String type, String grantTitle, String state) {
        JsonObject grantAwardData = new JsonObject();
        grantAwardData.addProperty("InitiatedBy", "Grantee");
        grantAwardData.addProperty("PleaseselectAmendmentRequestType", type);
        grantAwardData.addProperty("AwardTitle", grantTitle);
        grantAwardData.addProperty("Justification", "Automation Test");
        grantAwardData.addProperty("Impact", "Automation Test Impact");
        grantAwardData.addProperty("ownerId", ProjectWebServices.getIdOf("User", "Sarah PM"));
        grantAwardData.addProperty("isStatusCreatedOrApproved", state);
        grantAwardData.addProperty("MaximumIndirectCostRate", 10);
        grantAwardData.addProperty("NewAwardTitle", "Approved");
        grantAwardData.addProperty("NewAwardDescription", "Automation Test");
        grantAwardData.addProperty("BudgetRedirectionThreshold", 10);
        grantAwardData.addProperty("Addressline", "Rei System");
        grantAwardData.addProperty("Address", "Baner");
        grantAwardData.addProperty("City", "Alaska");
        grantAwardData.addProperty("County", "Alaska");
        grantAwardData.addProperty("State", "MA");
        grantAwardData.addProperty("CongressionalDistrict", "345");
        grantAwardData.addProperty("ZipCode", "45678");
        grantAwardData.addProperty("Country", "USA");
        grantAwardData.addProperty("NewBudgetPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3670, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grantAwardData.addProperty("RequestedChangeinAwardBudget", 2000);
        grantAwardData.addProperty("ProposedBudgetPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3670, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grantAwardData.addProperty("4DigitZipCodeExtension", "3456");
        grantAwardData.addProperty("OtherChangeDescription", "Automation Test");
        grantAwardData.addProperty("PurposeSummary", "Automation Test");
        grantAwardData.addProperty("OtherAmendmentTypeDetails", "Automation Test");
        grantAwardData.addProperty("GeneralCondition", false);


        JsonArray carryForwards = new JsonArray();
        JsonObject carryForward = new JsonObject();
        carryForward.addProperty("BudgetCategoryName", "Construction");
        carryForward.addProperty("CarryForward", 700);
        carryForward.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        carryForwards.add(carryForward);
        grantAwardData.add("budgetCategories", carryForwards);

        JsonArray buildUpItems = new JsonArray();
        JsonObject buildUpItem1 = new JsonObject();
        buildUpItem1.addProperty("BudgetCategory", "Construction");
        buildUpItem1.addProperty("Title", "Construction");
        buildUpItem1.addProperty("Narrative", "Test Build-up");
        buildUpItem1.addProperty("awardBudget", 700);
        buildUpItem1.addProperty("CashMatch", 70);
        buildUpItem1.addProperty("OtherLeverage", 70);
        buildUpItem1.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItems.add(buildUpItem1);
        grantAwardData.add("BuildUpItems", buildUpItems);


        // Indirect Rates
        JsonArray indirectRates = new JsonArray();
        JsonObject indirectRate = new JsonObject();
        indirectRate.addProperty("title", "New Indirect rate1");
        indirectRate.addProperty("effectiveFrom", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("effectiveUntil", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(50, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("indirectCostRates", 10);
        indirectRate.addProperty("indirectCostRateType", "Final");
        indirectRates.add(indirectRate);
        grantAwardData.add("indirectRates", indirectRates);

        // Approvers
        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Sarah PM"));
        approver.addProperty("amendmentRequest", "Step1");
        approvers.add(approver);
        grantAwardData.add("approvers", approvers);

        // Creating the GrantAwardData array and adding the GrantAwardData object
        JsonArray grantAwardDataArray = new JsonArray();
        grantAwardDataArray.add(grantAwardData);

        defaultJson.add("GrantAwardData", grantAwardDataArray);

        return defaultJson;
    }

    private JsonObject updateBudgetRedirection(JsonObject defaultJson) {
        JsonObject grantAwardData = defaultJson.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
        JsonArray buildUpItems = new JsonArray();
        JsonObject buildUpItem = new JsonObject();
        buildUpItem.addProperty("BudgetCategory", "Construction");
        buildUpItem.addProperty("Title", "Construction");
        buildUpItem.addProperty("Narrative", "Test Build-up");
        buildUpItem.addProperty("awardBudget", 900);
        buildUpItem.addProperty("CashMatch", 90);
        buildUpItem.addProperty("OtherLeverage", 90);
        buildUpItem.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItems.add(buildUpItem);

        JsonObject buildUpItem1 = new JsonObject();
        buildUpItem1.addProperty("BudgetCategory", "Site work");
        buildUpItem1.addProperty("Title", "Site work");
        buildUpItem1.addProperty("Narrative", "Test Build-up");
        buildUpItem1.addProperty("awardBudget", 100);
        buildUpItem1.addProperty("CashMatch", 10);
        buildUpItem1.addProperty("OtherLeverage", 10);
        buildUpItem1.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItems.add(buildUpItem1);
        grantAwardData.add("BuildUpItems", buildUpItems);
        JsonArray grantAwardDataArray = new JsonArray();
        grantAwardDataArray.add(grantAwardData);
        defaultJson.add("GrantAwardData", grantAwardDataArray);
        return defaultJson;
    }

    private JsonObject defaultCreateCreateTheAmendmentRequestWithType(String state, String type, String grantTitle) {
        JsonObject grantAwardData = new JsonObject();
        grantAwardData.addProperty("InitiatedBy", "Grantee");
        grantAwardData.addProperty("PleaseselectAmendmentRequestType", type);
        grantAwardData.addProperty("AwardTitle", grantTitle);
        grantAwardData.addProperty("Justification", "Automation Test");
        grantAwardData.addProperty("Impact", "Automation Test Impact");
        grantAwardData.addProperty("ownerId", ProjectWebServices.getIdOf("User", "Sarah PM"));
        grantAwardData.addProperty("isStatusCreatedOrApproved", state);
        grantAwardData.addProperty("MaximumIndirectCostRate", 10);
        grantAwardData.addProperty("NewAwardTitle", state);
        grantAwardData.addProperty("NewAwardDescription", "Automation Test");
        grantAwardData.addProperty("BudgetRedirectionThreshold", 10);
        grantAwardData.addProperty("Addressline", "Rei System");
        grantAwardData.addProperty("Address", "Baner");
        grantAwardData.addProperty("City", "Alaska");
        grantAwardData.addProperty("County", "Alaska");
        grantAwardData.addProperty("State", "MA");
        grantAwardData.addProperty("CongressionalDistrict", "345");
        grantAwardData.addProperty("ZipCode", "45678");
        grantAwardData.addProperty("Country", "USA");
        grantAwardData.addProperty("NewBudgetPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3670, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grantAwardData.addProperty("RequestedChangeinAwardBudget", 2000);
        grantAwardData.addProperty("ProposedBudgetPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3670, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grantAwardData.addProperty("4DigitZipCodeExtension", "3456");
        grantAwardData.addProperty("OtherChangeDescription", "Automation Test");
        grantAwardData.addProperty("PurposeSummary", "Automation Test");
        grantAwardData.addProperty("OtherAmendmentTypeDetails", "Automation Test");
        grantAwardData.addProperty("GeneralCondition", false);

//        // Contacts
//        JsonArray contacts = new JsonArray();
//        JsonObject contact = new JsonObject();
//        contact.addProperty("Name", "Sarah PM");
//        contact.addProperty("ProjectRole", "Grants Management Officer");
//        contact.addProperty("IsKeyContact", true);
//        contacts.add(contact);
//        grantAwardData.add("contacts", contacts);

        // Focus Areas
        JsonArray focusAreas = new JsonArray();
        JsonObject focusArea = new JsonObject();
        focusArea.addProperty("Title", "Automation Permanent Focus Area");
        focusArea.addProperty("StartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusArea.addProperty("EndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3670, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusAreas.add(focusArea);
        grantAwardData.add("focusAreas", focusAreas);

        // Build-up Items
        JsonArray buildUpItems = new JsonArray();
        JsonObject buildUpItem = new JsonObject();
        buildUpItem.addProperty("BudgetCategory", "Construction");
        buildUpItem.addProperty("Title", "Construction");
        buildUpItem.addProperty("Narrative", "Test Build-up");
        buildUpItem.addProperty("awardBudget", 2000);
        buildUpItem.addProperty("CashMatch", 200);
        buildUpItem.addProperty("OtherLeverage", 200);
        buildUpItem.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItems.add(buildUpItem);
        grantAwardData.add("BuildUpItems", buildUpItems);


        // Indirect Rates
        JsonArray indirectRates = new JsonArray();
        JsonObject indirectRate = new JsonObject();
        indirectRate.addProperty("title", "New Indirect rate1");
        indirectRate.addProperty("effectiveFrom", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("effectiveUntil", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(50, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("indirectCostRates", 10);
        indirectRate.addProperty("indirectCostRateType", "Final");
        indirectRates.add(indirectRate);
        grantAwardData.add("indirectRates", indirectRates);

        // Objectives
//        JsonArray objectives = new JsonArray();
//        objectives.add("Automation Permanent Objective");
//        grantAwardData.add("objectives", objectives);

        // KPIs
//        JsonArray kpis = new JsonArray();
//        JsonObject kpi1 = new JsonObject();
//        kpi1.addProperty("Title", "Automation Runtime KPI");
//        kpi1.addProperty("Target", 10);
//        kpi1.addProperty("CurrentValue", 2);
//        kpi1.addProperty("CurrentValueAsOf", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
//        kpis.add(kpi1);
//        grantAwardData.add("kpis", kpis);

//        // Special Conditions
//        JsonArray specialCondition = new JsonArray();
//        JsonObject condition1 = new JsonObject();
//        condition1.addProperty("title", "Terms");
//        condition1.addProperty("description", "Automation Test");
//        condition1.addProperty("sequence", 1);
//        condition1.addProperty("EffectiveFromDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
//        condition1.addProperty("EffectiveEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3670, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
//        specialCondition.add(condition1);

//        JsonObject condition2 = new JsonObject();
//        condition2.addProperty("title", "Terms");
//        condition2.addProperty("description", "Automation Test");
//        condition2.addProperty("sequence", 2);
//        condition2.addProperty("EffectiveFromDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
//        condition2.addProperty("EffectiveEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3670, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
//        specialCondition.add(condition2);
//        grantAwardData.add("specialCondition", specialCondition);

        // Approvers
        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Sarah PM"));
        approver.addProperty("amendmentRequest", "Step1");
        approvers.add(approver);
        grantAwardData.add("approvers", approvers);

        // Creating the GrantAwardData array and adding the GrantAwardData object
        JsonArray grantAwardDataArray = new JsonArray();
        grantAwardDataArray.add(grantAwardData);

        // Creating the final JSON object
        JsonObject finalJson = new JsonObject();
        finalJson.add("GrantAwardData", grantAwardDataArray);

        return finalJson;
    }

    public JsonObject payloadupdatedAwardFromApplicationForTitle(String appTitle, String filter) {
        String user = "";
        JsonObject json;

        json = defaultPayloadupdatedAwardFromApplicationForTitle(appTitle);

        if (filter.toLowerCase().contains("user")) {
            if (filter.contains("-Automation")) {
                user = filter.split("-")[1].split("user")[0].trim();
                updateAwardOwner(json, user);
                filter = filter.split("-")[0];
            } else {
                user = filter.replace("user", "").trim();
                filter = "USER";
            }
        } else {
            filter = filter.toUpperCase();
        }

        switch (filter) {
            case "PROGRAM_INCOME_DEDUCTIVE":
                return payloadForCreateGrantProgramIncome(json);
            case "STEP_FOUR_APPROVER":
                return payloadForStepFourApprover(json);
            case "USER":
                return createStandaloneGranteeAwardUsingUser(json, user);
            default:
                return json;
        }
    }

    private JsonObject payloadForStepFourApprover(JsonObject json) {
        JsonObject grantAwardData = json.getAsJsonArray("AwardChildData").get(0).getAsJsonObject();
        JsonArray topLevelApprovers = new JsonArray();
        JsonObject topLevelApprover = new JsonObject();
        topLevelApprover.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        topLevelApprover.addProperty("Award", "Step1");
        topLevelApprovers.add(topLevelApprover);

        JsonObject topLevelApprover1 = new JsonObject();
        topLevelApprover1.addProperty("name", ProjectWebServices.getIdOf("User", "Sarah PM"));
        topLevelApprover1.addProperty("Award", "Step2");
        topLevelApprovers.add(topLevelApprover1);

        JsonObject topLevelApprover2 = new JsonObject();
        topLevelApprover2.addProperty("name", ProjectWebServices.getIdOf("User", "David FO"));
        topLevelApprover2.addProperty("Award", "Step3");
        topLevelApprovers.add(topLevelApprover2);

        JsonObject topLevelApprover3 = new JsonObject();
        topLevelApprover3.addProperty("name", ProjectWebServices.getIdOf("User", "Grantee PO"));
        topLevelApprover3.addProperty("Award", "Step4");
        topLevelApprovers.add(topLevelApprover3);
        grantAwardData.add("approvers", topLevelApprovers);
        JsonArray grantAwardDataArray = new JsonArray();
        grantAwardDataArray.add(grantAwardData);
        json.add("AwardChildData", grantAwardDataArray);
        return json;
    }

    private JsonObject defaultPayloadupdatedAwardFromApplicationForTitle(String appTitle) {
        JsonObject grantDetails = new JsonObject();
        grantDetails.addProperty("AwardTitle", appTitle);

        // Adding external program names
//        JsonArray externalProgramNames = new JsonArray();
//        JsonObject externalProgram1 = new JsonObject();
//        externalProgram1.addProperty("IsPrimaryProgram", true);
//        externalProgram1.addProperty("Title", "Automation Permanent NGO Program");
//        externalProgramNames.add(externalProgram1);
//        grantDetails.add("externalProgramNames", externalProgramNames);

        // Adding contacts
//        JsonArray contacts = new JsonArray();
//        JsonObject contact = new JsonObject();
//        contact.addProperty("Name", ProjectWebServices.getIdOf("Contact", "Victor EXE"));
//        contact.addProperty("ProjectRole", "Project Director/PI");
//        contact.addProperty("IsKeyContact", true);
//        contacts.add(contact);
//        grantDetails.add("contacts", contacts);

        // Adding focus areas
//        JsonArray focusAreas = new JsonArray();
//        JsonObject focusArea1 = new JsonObject();
//        focusArea1.addProperty("Title", "Automation Permanent Focus Area");
//        focusArea1.addProperty("StartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
//        focusArea1.addProperty("EndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
//        focusAreas.add(focusArea1);

//        JsonObject focusArea2 = new JsonObject();
//        focusArea2.addProperty("Title", "Automation Permanent Focus Area2");
//        focusArea2.addProperty("StartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
//        focusArea2.addProperty("EndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
//        focusAreas.add(focusArea2);
//        grantDetails.add("focusAreas", focusAreas);

        // Adding build-up items
        JsonArray buildUpItems = new JsonArray();
        JsonObject buildUpItem = new JsonObject();
        buildUpItem.addProperty("BudgetCategory", "Construction");
        buildUpItem.addProperty("Title", "Construction");
        buildUpItem.addProperty("Narrative", "Test Build-up");
        buildUpItem.addProperty("awardBudget", 1000);
        buildUpItem.addProperty("CashMatch", 100);
        buildUpItem.addProperty("OtherLeverage", 100);
        buildUpItem.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItems.add(buildUpItem);
        grantDetails.add("buildUpItems", buildUpItems);

        // Adding build-up items
        JsonObject buildUpItem1 = new JsonObject();
        buildUpItem1.addProperty("BudgetCategory", "Construction");
        buildUpItem1.addProperty("Title", "Construction");
        buildUpItem1.addProperty("Narrative", "Test Build-up");
        buildUpItem1.addProperty("awardBudget", 1000);
        buildUpItem1.addProperty("CashMatch", 100);
        buildUpItem1.addProperty("OtherLeverage", 100);
        buildUpItem1.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItems.add(buildUpItem1);
        grantDetails.add("buildUpItems", buildUpItems);

        // Adding indirect rates
        JsonArray indirectRates = new JsonArray();
        JsonObject indirectRate = new JsonObject();
        indirectRate.addProperty("title", "New Indirect rate1");
        indirectRate.addProperty("effectiveFrom", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(5, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("effectiveUntil", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(10, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("indirectCostRates", 10);
        indirectRate.addProperty("indirectCostRateType", "Final");
        indirectRates.add(indirectRate);
        grantDetails.add("indirectRates", indirectRates);

        // Adding program income
        JsonArray programIncome = new JsonArray();
        JsonObject programIncome1 = new JsonObject();
        programIncome1.addProperty("serviceAreaName", "Automation Permanent Focus Area");
        programIncome1.addProperty("projectedProgramIncome", 200);
        programIncome1.addProperty("programIncomeJustification", "Automation Test");
        programIncome.add(programIncome1);

        JsonObject programIncome2 = new JsonObject();
        programIncome2.addProperty("serviceAreaName", "Automation Permanent Focus Area2");
        programIncome2.addProperty("projectedProgramIncome", 100);
        programIncome2.addProperty("programIncomeJustification", "Automation Test 2");
        programIncome.add(programIncome2);
        grantDetails.add("programIncome", programIncome);

        // Adding reports schedule
        JsonArray reportsSchedule = new JsonArray();
        JsonObject report1 = new JsonObject();
        report1.addProperty("reportType", "Progress Report");
        report1.addProperty("Description", "Automation Test");
        report1.addProperty("scheduleBase", "Calendar");
        report1.addProperty("ReportingPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(365, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        report1.addProperty("Frequency", "Monthly");
        reportsSchedule.add(report1);

        JsonObject report2 = new JsonObject();
        report2.addProperty("reportType", "Financial Report");
        report2.addProperty("Description", "Automation Test");
        report2.addProperty("scheduleBase", "Reporting Period");
        report2.addProperty("ReportingPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(365, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        report2.addProperty("Frequency", "Monthly");
        reportsSchedule.add(report2);
        grantDetails.add("reportsSchedule", reportsSchedule);

        // Adding objectives
        JsonArray objectives = new JsonArray();
        objectives.add("Automation Permanent Objective");
        grantDetails.add("objectives", objectives);

        // Adding KPIs
        JsonArray kpis = new JsonArray();
        JsonObject kpi1 = new JsonObject();
        kpi1.addProperty("Title", "Automation Runtime KPI");
        kpi1.addProperty("Target", 10);
        kpi1.addProperty("CurrentValue", 2);
        kpi1.addProperty("CurrentValueAsOf", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        kpis.add(kpi1);
        grantDetails.add("kpis", kpis);

        // Adding special conditions
        JsonArray specialConditions = new JsonArray();
        JsonObject condition1 = new JsonObject();
        condition1.addProperty("title", "Terms");
        condition1.addProperty("description", "Automation Test");
        condition1.addProperty("sequence", 1);
        condition1.addProperty("EffectiveFromDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        condition1.addProperty("EffectiveEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        specialConditions.add(condition1);

        JsonObject condition2 = new JsonObject();
        condition2.addProperty("title", "test test");
        condition2.addProperty("description", "some info more like");
        condition2.addProperty("sequence", 2);
        condition2.addProperty("EffectiveFromDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        condition2.addProperty("EffectiveEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        specialConditions.add(condition2);
        grantDetails.add("specialCondition", specialConditions);

        // Adding approvers
        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        approver.addProperty("Award", "Step1");
        approvers.add(approver);
        grantDetails.add("approvers", approvers);

        // Creating the final JSON object
        JsonObject finalJson = new JsonObject();
        JsonArray grantDataArray = new JsonArray();
        grantDataArray.add(grantDetails);
        finalJson.add("AwardChildData", grantDataArray);
        return finalJson;
    }

    public JsonObject payloadupdatedDirectGrantAwardForTitle(String appTitle, String filter) {
        String user = "";
        JsonObject json;
        json = defaultPayloadupdatedDirectGrantAwardForTitle(appTitle);
            filter = filter.toUpperCase();
        switch (filter) {
            case "SECOND_FOCUS_WITH_BUDGET":
                return payloadForSecondFocusWithBudget(json);
            case "PROGRESS_FINANCIAL_SCHEDULES":
                return payloadForProgressAndFinancialSchedulesDate(json);
            case "SPECIAL_CONDITIONS_NO":
                return payloadForSpecialConditionsNo(json, appTitle);
            case "ADDED_APPROVER_FOR_AMENDMENT":
                return payloadForAddedApproverForAmendment(json, appTitle);
            case "GRANTEE_PO_APPROVER":
                return payloadForGranteePOApprover(json);
            case "GRANTEE_PM_APPROVER":
                return payloadForGranteePMApprover(json);
            case "NON_CASH_MATCH_BUDGET":
                return payloadForNonCashMatchBudget(json);
            default:
                return json;
        }
    }

    private JsonObject payloadForGranteePMApprover(JsonObject json) {
        JsonObject preAPPData = json.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
        JsonArray topLevelApprovers = new JsonArray();
        JsonObject topLevelApprover = new JsonObject();
        topLevelApprover.addProperty("name", ProjectWebServices.getIdOf("User", "Sarah PM"));
        topLevelApprover.addProperty("Award", "Step1");
        topLevelApprovers.add(topLevelApprover);
        preAPPData.add("approvers", topLevelApprovers);
        JsonArray preAPPDataDataArray = new JsonArray();
        preAPPDataDataArray.add(preAPPData);
        json.add("GrantAwardData", preAPPDataDataArray);
        return json;
    }

    private JsonObject payloadForNonCashMatchBudget(JsonObject json) {
        JsonObject grantAwardData = json.getAsJsonArray("AwardChildData").get(0).getAsJsonObject();
        JsonArray buildUpItems = new JsonArray();
        JsonObject buildUpItem1 = new JsonObject();
        buildUpItem1.addProperty("BudgetCategory", "Construction");
        buildUpItem1.addProperty("Title", "Construction");
        buildUpItem1.addProperty("Narrative", "Test Build-up");
        buildUpItem1.addProperty("awardBudget", 5000);
        buildUpItem1.addProperty("CashMatch", 500);
        buildUpItem1.addProperty("NonCashMatch", 500);
        buildUpItem1.addProperty("OtherLeverage", 200);
        buildUpItem1.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItems.add(buildUpItem1);
        grantAwardData.add("buildUpItems", buildUpItems);

        JsonArray grantAwardDataArray = new JsonArray();
        grantAwardDataArray.add(grantAwardData);
        json.add("AwardChildData", grantAwardDataArray);
        return json;
    }

    private JsonObject payloadForGranteePOApprover(JsonObject json) {
        JsonObject preAPPData = json.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
        JsonArray topLevelApprovers = new JsonArray();
        JsonObject topLevelApprover = new JsonObject();
        topLevelApprover.addProperty("name", ProjectWebServices.getIdOf("User", "Grantee PO"));
        topLevelApprover.addProperty("Award", "Step1");
        topLevelApprovers.add(topLevelApprover);
        preAPPData.add("approvers", topLevelApprovers);
        JsonArray preAPPDataDataArray = new JsonArray();
        preAPPDataDataArray.add(preAPPData);
        json.add("GrantAwardData", preAPPDataDataArray);
        return json;
    }

    private JsonObject payloadForAddedApproverForAmendment(JsonObject json, String appTitle) {
        JsonObject preAPPData = json.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
        JsonArray topLevelApprovers = new JsonArray();
        JsonObject topLevelApprover = new JsonObject();
        topLevelApprover.addProperty("name", ProjectWebServices.getIdOf("User", "Sarah PM"));
        topLevelApprover.addProperty("Award", "Step1");
        topLevelApprover.addProperty("amendmentRequest", "Step1");
        topLevelApprovers.add(topLevelApprover);

        JsonObject topLevelApprover1 = new JsonObject();
        topLevelApprover1.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        topLevelApprover1.addProperty("Award", "Step2");
        topLevelApprover1.addProperty("amendmentRequest", "Step2");
        topLevelApprovers.add(topLevelApprover1);
        preAPPData.add("approvers", topLevelApprovers);
        JsonArray preAPPDataDataArray = new JsonArray();
        preAPPDataDataArray.add(preAPPData);
        json.add("GrantAwardData", preAPPDataDataArray);
        return json;
    }

    private JsonObject payloadForSpecialConditionsNo(JsonObject json, String appTitle) {
        JsonObject grantDetails = new JsonObject();
        grantDetails.addProperty("AwardTitle", appTitle);

        // Adding external program names
        JsonArray externalProgramNames = new JsonArray();
        JsonObject externalProgram1 = new JsonObject();
        externalProgram1.addProperty("IsPrimaryProgram", true);
        externalProgram1.addProperty("Title", "Automation Permanent NGO Program");
        externalProgramNames.add(externalProgram1);
        grantDetails.add("externalProgramNames", externalProgramNames);

        // Adding contacts
        JsonArray contacts = new JsonArray();
        JsonObject contact = new JsonObject();
        contact.addProperty("Name", ProjectWebServices.getIdOf("Contact", "Victor EXE"));
        contact.addProperty("ProjectRole", "Project Director/PI");
        contact.addProperty("IsKeyContact", true);
        contacts.add(contact);
        grantDetails.add("contacts", contacts);

        // Adding focus areas
        JsonArray focusAreas = new JsonArray();
        JsonObject focusArea1 = new JsonObject();
        focusArea1.addProperty("Title", "Automation Permanent Focus Area");
        focusArea1.addProperty("StartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusArea1.addProperty("EndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusAreas.add(focusArea1);
        grantDetails.add("focusAreas", focusAreas);

        // Adding build-up items
        JsonArray buildUpItems = new JsonArray();
        JsonObject buildUpItem = new JsonObject();
        buildUpItem.addProperty("BudgetCategory", "Construction");
        buildUpItem.addProperty("Title", "Construction");
        buildUpItem.addProperty("Narrative", "Test Build-up");
        buildUpItem.addProperty("awardBudget", 5000);
        buildUpItem.addProperty("CashMatch", 500);
        buildUpItem.addProperty("OtherLeverage", 200);
        buildUpItem.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItems.add(buildUpItem);
        grantDetails.add("buildUpItems", buildUpItems);

        // Adding indirect rates
        JsonArray indirectRates = new JsonArray();
        JsonObject indirectRate = new JsonObject();
        indirectRate.addProperty("title", "New Indirect rate1");
        indirectRate.addProperty("effectiveFrom", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(5, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("effectiveUntil", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(10, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("indirectCostRates", 10);
        indirectRate.addProperty("indirectCostRateType", "Final");
        indirectRates.add(indirectRate);
        grantDetails.add("indirectRates", indirectRates);

        // Adding program income
        JsonArray programIncome = new JsonArray();
        JsonObject programIncome1 = new JsonObject();
        programIncome1.addProperty("serviceAreaName", "Automation Permanent Focus Area");
        programIncome1.addProperty("projectedProgramIncome", 200);
        programIncome1.addProperty("programIncomeJustification", "Automation Test");
        programIncome.add(programIncome1);
        grantDetails.add("programIncome", programIncome);

        // Adding reports schedule
        JsonArray reportsSchedule = new JsonArray();
        JsonObject report1 = new JsonObject();
        report1.addProperty("reportType", "Progress Report");
        report1.addProperty("Description", "Automation Test");
        report1.addProperty("scheduleBase", "Calendar");
        report1.addProperty("ReportingPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(380, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        report1.addProperty("Frequency", "Monthly");
        reportsSchedule.add(report1);

        JsonObject report2 = new JsonObject();
        report2.addProperty("reportType", "Financial Report");
        report2.addProperty("Description", "Automation Test");
        report2.addProperty("scheduleBase", "Reporting Period");
        report2.addProperty("ReportingPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(380, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        report2.addProperty("Frequency", "Monthly");
        reportsSchedule.add(report2);
        grantDetails.add("reportsSchedule", reportsSchedule);

        // Adding objectives
        JsonArray objectives = new JsonArray();
        objectives.add("Automation Permanent Objective");
        grantDetails.add("objectives", objectives);

        // Adding KPIs
        JsonArray kpis = new JsonArray();
        JsonObject kpi1 = new JsonObject();
        kpi1.addProperty("Title", "Automation Runtime KPI");
        kpi1.addProperty("Target", 10);
        kpi1.addProperty("CurrentValue", 2);
        kpi1.addProperty("CurrentValueAsOf", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        kpis.add(kpi1);
        grantDetails.add("kpis", kpis);

        // Adding approvers
        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        approver.addProperty("Award", "Step1");
        approvers.add(approver);
        grantDetails.add("approvers", approvers);

        // Creating the final JSON object
        JsonObject finalJson = new JsonObject();
        JsonArray grantDataArray = new JsonArray();
        grantDataArray.add(grantDetails);
        json.add("AwardChildData", grantDataArray);
        return json;
    }

    private JsonObject payloadForProgressAndFinancialSchedulesDate(JsonObject json) {
        JsonArray focusAreas = new JsonArray();
        JsonObject focusArea2 = new JsonObject();
        focusArea2.addProperty("Title", "Automation Permanent Focus Area");
        focusArea2.addProperty("StartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusArea2.addProperty("EndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(380, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusAreas.add(focusArea2);
        json.add("focusAreas", focusAreas);

        JsonArray specialConditions = new JsonArray();
        JsonObject condition1 = new JsonObject();
        condition1.addProperty("title", "Terms");
        condition1.addProperty("description", "Automation Test");
        condition1.addProperty("sequence", 1);
        condition1.addProperty("EffectiveFromDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        condition1.addProperty("EffectiveEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(380, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        specialConditions.add(condition1);
        json.add("specialCondition", specialConditions);
        return json;
    }

    private JsonObject defaultPayloadupdatedDirectGrantAwardForTitle(String appTitle) {
        JsonObject grantDetails = new JsonObject();
        grantDetails.addProperty("AwardTitle", appTitle);

        // Adding external program names
        JsonArray externalProgramNames = new JsonArray();
        JsonObject externalProgram1 = new JsonObject();
        externalProgram1.addProperty("IsPrimaryProgram", true);
        externalProgram1.addProperty("Title", "Automation Permanent NGO Program");
        externalProgramNames.add(externalProgram1);
        grantDetails.add("externalProgramNames", externalProgramNames);

        // Adding contacts
        JsonArray contacts = new JsonArray();
        JsonObject contact = new JsonObject();
        contact.addProperty("Name", ProjectWebServices.getIdOf("Contact", "Victor EXE"));
        contact.addProperty("ProjectRole", "Project Director/PI");
        contact.addProperty("IsKeyContact", true);
        contacts.add(contact);
        grantDetails.add("contacts", contacts);

        // Adding focus areas
        JsonArray focusAreas = new JsonArray();
        JsonObject focusArea1 = new JsonObject();
        focusArea1.addProperty("Title", "Automation Permanent Focus Area");
        focusArea1.addProperty("StartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusArea1.addProperty("EndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusAreas.add(focusArea1);
        grantDetails.add("focusAreas", focusAreas);

        // Adding build-up items
        JsonArray buildUpItems = new JsonArray();
        JsonObject buildUpItem = new JsonObject();
        buildUpItem.addProperty("BudgetCategory", "Construction");
        buildUpItem.addProperty("Title", "Construction");
        buildUpItem.addProperty("Narrative", "Test Build-up");
        buildUpItem.addProperty("awardBudget", 5000);
        buildUpItem.addProperty("CashMatch", 500);
        buildUpItem.addProperty("OtherLeverage", 200);
        buildUpItem.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItems.add(buildUpItem);
        grantDetails.add("buildUpItems", buildUpItems);

        // Adding indirect rates
        JsonArray indirectRates = new JsonArray();
        JsonObject indirectRate = new JsonObject();
        indirectRate.addProperty("title", "New Indirect rate1");
        indirectRate.addProperty("effectiveFrom", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(5, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("effectiveUntil", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(10, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("indirectCostRates", 10);
        indirectRate.addProperty("indirectCostRateType", "Final");
        indirectRates.add(indirectRate);
        grantDetails.add("indirectRates", indirectRates);

        // Adding program income
        JsonArray programIncome = new JsonArray();
        JsonObject programIncome1 = new JsonObject();
        programIncome1.addProperty("serviceAreaName", "Automation Permanent Focus Area");
        programIncome1.addProperty("projectedProgramIncome", 200);
        programIncome1.addProperty("programIncomeJustification", "Automation Test");
        programIncome.add(programIncome1);
        grantDetails.add("programIncome", programIncome);

//        JsonObject programIncome2 = new JsonObject();
//        programIncome2.addProperty("serviceAreaName", "Automation Permanent Focus Area2");
//        programIncome2.addProperty("projectedProgramIncome", 100);
//        programIncome2.addProperty("programIncomeJustification", "Automation Test 2");
//        programIncome.add(programIncome2);
//        grantDetails.add("programIncome", programIncome);

        // Adding reports schedule
        JsonArray reportsSchedule = new JsonArray();
        JsonObject report1 = new JsonObject();
        report1.addProperty("reportType", "Progress Report");
        report1.addProperty("Description", "Automation Test");
        report1.addProperty("scheduleBase", "Calendar");
        report1.addProperty("ReportingPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(380, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        report1.addProperty("Frequency", "Monthly");
        reportsSchedule.add(report1);

        JsonObject report2 = new JsonObject();
        report2.addProperty("reportType", "Financial Report");
        report2.addProperty("Description", "Automation Test");
        report2.addProperty("scheduleBase", "Reporting Period");
        report2.addProperty("ReportingPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(380, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        report2.addProperty("Frequency", "Monthly");
        reportsSchedule.add(report2);
        grantDetails.add("reportsSchedule", reportsSchedule);

        // Adding objectives
        JsonArray objectives = new JsonArray();
        objectives.add("Automation Permanent Objective");
        grantDetails.add("objectives", objectives);

        // Adding KPIs
        JsonArray kpis = new JsonArray();
        JsonObject kpi1 = new JsonObject();
        kpi1.addProperty("Title", "Automation Runtime KPI");
        kpi1.addProperty("Target", 10);
        kpi1.addProperty("CurrentValue", 2);
        kpi1.addProperty("CurrentValueAsOf", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        kpis.add(kpi1);
        grantDetails.add("kpis", kpis);

        // Adding special conditions
        JsonArray specialConditions = new JsonArray();
        JsonObject condition1 = new JsonObject();
        condition1.addProperty("title", "Terms");
        condition1.addProperty("description", "Automation Test");
        condition1.addProperty("sequence", 1);
        condition1.addProperty("EffectiveFromDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        condition1.addProperty("EffectiveEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        specialConditions.add(condition1);

//        JsonObject condition2 = new JsonObject();
//        condition2.addProperty("title", "Terms1");
//        condition2.addProperty("description", "Automation Terms");
//        condition2.addProperty("sequence", 2);
//        condition2.addProperty("EffectiveFromDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
//        condition2.addProperty("EffectiveEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
//        specialConditions.add(condition2);
        grantDetails.add("specialCondition", specialConditions);

        // Adding approvers
        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        approver.addProperty("Award", "Step1");
        approvers.add(approver);
        grantDetails.add("approvers", approvers);

        // Creating the final JSON object
        JsonObject finalJson = new JsonObject();
        JsonArray grantDataArray = new JsonArray();
        grantDataArray.add(grantDetails);
        finalJson.add("AwardChildData", grantDataArray);
        return finalJson;
    }
}
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
            case "PLUMBING_CASE":
                return updatePlumbingCase(defaultJson, announcementName, applicationName);
            default:
                return defaultJson;
        }
        return defaultJson;
    }

    private JsonObject updatePlumbingCase(JsonObject defaultJson, String announcementName, String applicationName) {
        String ownerName = "Automation SPI3";
        String contactName = "Automation SPI3";
        String kpiName = "Automation Runtime KPI";

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
        budgetCategory.addProperty("BudgetRequest", 2000);
        budgetCategory.addProperty("CashMatch", 200);
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
        FDM.addProperty("TotalCommitmentAmount", 1000);
        FDMArray.add(FDM);

        parent.add("FDM", FDMArray);

        return parent;
    }

    public JsonObject defaultRequestPayroleForApprovedDFMForPlumbingcases() {
        Map<String, String> map = ProjectWebServices.getMultipleIds(getIdsOfUsers(Arrays.asList("Victor EXE", "David FO", "Sarah PM")));
        JsonObject parent = new JsonObject();

        JsonArray reviewStepsArray = new JsonArray();
        JsonObject complianceReview = new JsonObject();
        complianceReview.addProperty("Reviewer", map.get("Victor EXE"));
        complianceReview.addProperty("FormName", "Compliance Review");
        complianceReview.addProperty("DueInDays", 7);

        JsonObject programReview = new JsonObject();
        programReview.addProperty("Reviewer", map.get("Sarah PM"));
        programReview.addProperty("FormName", "Program Review");
        programReview.addProperty("DueInDays", 7);

        JsonObject fiscalReview = new JsonObject();
        fiscalReview.addProperty("Reviewer", map.get("David FO"));
        fiscalReview.addProperty("FormName", "Fiscal Review");
        fiscalReview.addProperty("DueInDays", 7);

        JsonObject managementReview = new JsonObject();
        managementReview.addProperty("Reviewer", map.get("Sarah PM"));
        managementReview.addProperty("FormName", "Management Review");
        managementReview.addProperty("DueInDays", 7);

        JsonObject preScreen = new JsonObject();
        preScreen.addProperty("Reviewer", map.get("Sarah PM"));
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
        FDM.addProperty("RecommendedAmount", 2000);
        FDM.addProperty("TotalCommitmentAmount", 2000);
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

    public JsonObject getIdsForCreateAwardFromFDMForPlumbingcases(String annName) {

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
        strategic_plan.add("PN_ETE Strategic Plan");
        ids.add("StrategicPlan__c", strategic_plan);

        JsonArray kpi = new JsonArray();
        kpi.add("Automation Runtime KPI");
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
        award.addProperty("BudgetRedirectionThreshhold", 10);
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

    public JsonObject defaultPayloadCreateAwardFromFDMForPlumbingCases(String announcementName) {
        JsonObject parent = new JsonObject();
        Map<String, String> map = ProjectWebServices.getMultipleIds(getIdsForCreateAwardFromFDMForPlumbingcases(announcementName));


        JsonObject grant = new JsonObject();
        JsonArray grantArray = new JsonArray();
        grant.addProperty("FDM", map.get(announcementName));
        grant.addProperty("RecordTypeId", ProjectWebServices.getRecordTypeId("Grant__c", "Grantor"));
        grant.addProperty("OwnerId", map.get("Sarah PM"));
        grantArray.add(grant);
        parent.add("Grant", grantArray);

        JsonObject award = new JsonObject();
        JsonArray awardArray = new JsonArray();
        award.addProperty("GrantAwardDescription", "Award Created From Automation API");
        award.addProperty("BudgetPeriodEndDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(150, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        award.addProperty("BudgetRedirectionThreshhold", 10);
        award.addProperty("PM", ProjectWebServices.getIdOf("User", "Sarah PM"));
        award.addProperty("FO", ProjectWebServices.getIdOf("User", "David FO"));
        award.addProperty("EXE", ProjectWebServices.getIdOf("User", "Victor EXE"));
        awardArray.add(award);
        parent.add("Award", awardArray);

        JsonObject awardFundingAccount = new JsonObject();
        JsonArray awardFundingAccountArray = new JsonArray();
        awardFundingAccount.addProperty("PreEncumbranceAmount", "2000");
        awardFundingAccountArray.add(awardFundingAccount);
        parent.add("AwardFundingAccount", awardFundingAccountArray);


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
        kpiGoalsObjectives.addProperty("StrategicPlan", map.get("PN_ETE Strategic Plan"));
        kpiGoalsObjectivesArrays.add(kpiGoalsObjectives);
        parent.add("KPIGoalsObjectives", kpiGoalsObjectivesArrays);

        JsonObject keyOutcome = new JsonObject();
        JsonArray keyOutcomeArray = new JsonArray();
        keyOutcome.addProperty("MasterKPI", map.get("Automation Runtime KPI"));
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
            case "INVITED_APP_IND_ORG_BY_AP_TWO_FOCUS_AREA_RISK_NO":
                return invitedIndUserOrganizationbyApplicantTwoFocusAreaRiskNo(json);
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
            case "PLUMBING_CASE":
                return updateAnnouncementForPlumbingCase(json, annType, annName);
            case "PRE_APPLICATION_NEGOTIATION_YES_MULTIPLE_FOCUS_AREA":
                return updatePreApplicationAndNegotiationAsYesMultipleFAForAnnouncement(json);
            default:
                return json;
        }
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
    public JsonObject publishAnnPayloadForPlumbingCases(String annType, String annName, String filter) {
        JsonObject json = getDefaultPayloadPublishAnnForPlumbingCases(annType, annName);
        String user = "";

        if (filter.toLowerCase().contains("user")) {
            user = filter.split("-")[1].split("user")[0].trim();
            updateAnnouncementOwner(json, user);
            filter = filter.split("-")[0];
        } else {
            filter = filter.toUpperCase();
        }

        switch (filter) {
            case "PLUMBING_CASE":
                return updateAnnouncementForPlumbingCase(json, annType, annName);
            default:
                return json;
        }
    }

    private JsonObject updateAnnouncementForPlumbingCase(JsonObject json, String annType, String annName) {
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
        ann.addProperty("AwardFloor", 2000);
        ann.addProperty("AwardCeiling", 10000);
        ann.addProperty("EstimatedFundingAmount", 10000);
        ann.addProperty("OwnerId", ProjectWebServices.getIdOf("User", "Sarah PM"));
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
                .getValue("fundingAccountId")));
        awardFundingAccount.addProperty("PreEncumbranceAmount", "2000");
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

        return json;
    }

    private JsonObject invitedIndUserOrganizationbyApplicantTwoFocusAreaRiskNo(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel", "By Applicant");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        JsonObject invApp = new JsonObject();
        JsonArray invAppA = new JsonArray();
        invApp.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        invApp.addProperty("AllocatedAmount", 1000);
        invAppA.add(invApp);
        json.add("InvitedApplicant", invAppA);
        return json;
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
        jsonObject1.addProperty("Allocationlevel", "By Applicant");
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
        jsonObject.addProperty("Allocationlevel", "By Applicant");
        jsonObject.addProperty("IsNegotiationsAllowed", "Yes");
        jsonObject.addProperty("RiskAssessment_Required", "No");
        jsonObject.addProperty("DetailedBudgetingRequired", "Yes");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject updateAnnouncementWithProgramSuppDocYes(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Program", ProjectWebServices.getIdOf("Program__c", "Automation Permanent PreApp Supp Doc Yes"));
        jsonObject.addProperty("PreApplicationNeeded", "Yes");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject updateApplicationWithProgramSuppDocYes(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Program", ProjectWebServices.getIdOf("Program__c", "Automation Permanent App Supp Doc Yes"));
        pre.add(jsonObject);
        json.add("Announcement", pre);
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
        jsonObject1.addProperty("Allocationlevel", "N/A");
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

    private JsonObject updatePreApplicationAndNegotiationAsYesMultipleFAForAnnouncement(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaA = new JsonObject();
        serviceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        serviceArea.add(serviceAreaA);
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        JsonObject serviceAreaC = new JsonObject();
        serviceAreaC.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area3"));
        serviceArea.add(serviceAreaC);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("PreApplicationNeeded", "Yes");
        jsonObject1.addProperty("Allocationlevel", "N/A");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        jsonObject1.addProperty("IsNegotiationsAllowed", "Yes");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
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
        jsonObject1.addProperty("Allocationlevel", "By Applicant");
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
        jsonObject1.addProperty("Allocationlevel", "N/A");
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
        jsonObject1.addProperty("Allocationlevel", "By Applicant");
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
        jsonObject.addProperty("Allocationlevel", "By Applicant");
        jsonObject.addProperty("IsNegotiationsAllowed", "Yes");
        jsonObject.addProperty("RiskAssessment_Required", "No");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject byApplicantFocusAreaRiskAssessmentNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel", "By Applicant and Focus Area");
        jsonObject.addProperty("IsNegotiationsAllowed", "Yes");
        jsonObject.addProperty("RiskAssessment_Required", "No");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject byApplicantFocusAreaNegotiationsYes(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel", "By Applicant and Focus Area");
        jsonObject.addProperty("IsNegotiationsAllowed", "Yes");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private void updateAnnouncementOwner(JsonObject json, String user) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray annOwner = new JsonArray();
        jsonObject.addProperty("OwnerId", ProjectWebServices.getIdOf("User", user));
        annOwner.add(jsonObject);
        json.add("Announcement", annOwner);
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
        jsonObject.addProperty("Allocationlevel", "By Applicant and Focus Area");
        jsonObject.addProperty("IsNegotiationsAllowed", "No");
        pre.add(jsonObject);
        json.add("Announcement", pre);
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
        jsonObject.addProperty("Allocationlevel", "By Applicant and Focus Area");
        jsonObject.addProperty("IsNegotiationsAllowed", "Yes");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject byApplicantNegotiationNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray nego = new JsonArray();
        jsonObject.addProperty("Allocationlevel", "By Applicant");
        jsonObject.addProperty("IsNegotiationsAllowed", "No");
        nego.add(jsonObject);
        json.add("Announcement", nego);
        return json;
    }

    private JsonObject byApplicantFocusAreaNoNegotiationsNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray nego = new JsonArray();
        jsonObject.addProperty("Allocationlevel", "By Applicant");
        jsonObject.addProperty("FocusAreaRequired", "No");
        jsonObject.addProperty("IsNegotiationsAllowed", "No");
        nego.add(jsonObject);
        json.add("Announcement", nego);
        return json;
    }

    private JsonObject byApplicantFocusAreaNoNegotiationsYes(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray nego = new JsonArray();
        jsonObject.addProperty("Allocationlevel", "By Applicant");
        jsonObject.addProperty("FocusAreaRequired", "No");
        jsonObject.addProperty("IsNegotiationsAllowed", "Yes");
        nego.add(jsonObject);
        json.add("Announcement", nego);
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
        jsonObject.addProperty("PreApplicationNeeded", "Yes");
        jsonObject.addProperty("IsNegotiationsAllowed", "Yes");
        jsonObject.addProperty("FocusAreaRequired", "No");
        pre.add(jsonObject);
        json.add("Announcement", pre);
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

    /**
     * @param annType Formula, Competitive Directed
     * @param annName any name
     * @return JsonObject
     * This method return the default request payload for publishing the announcement
     */
    public JsonObject getDefaultPayloadPublishAnnForPlumbingCases(String annType, String annName) {

        String program = "Automation Permanent Internal Program for Department of Product";
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
        ann.addProperty("AwardFloor", 2000);
        ann.addProperty("AwardCeiling", 10000);
        ann.addProperty("EstimatedFundingAmount", 10000);
        ann.addProperty("OwnerId", ProjectWebServices.getIdOf("User", "Sarah PM"));
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
                .getValue("fundingAccountId")));
        awardFundingAccount.addProperty("PreEncumbranceAmount", "2000");
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
            case "SUBRECIPIENTMATCH_FIFTY_PERCENT":
                return payloadForSubrecipientMatchFiftyPercent(json);
            case "YES_RISK_ASSESSMENT":
                return payloadForCreateStandAloneWithYesRiskAssement(json);
            case "NO_ADVANCE_PERMISSION":
                return payloadForPaymentRequestToCreateStandaloneAward(json);
            case "IS_BUILDUP_FUNCTIONALITY_YES":
                return createAwardWtithBuildUpFunctionalityYes(json);
            case "NO_PROGRAM_INCOME_ANTICIPATE":
                return createAwardWtithNoProgramIncomeAnticipate(json);
            case "NO_BUDGETRedirectionThreshhold":
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
            case "BUDGE_REDIRECTION_FIFTEEN_PERCENT":
                return createAwardWithBudgetRedirectionFifteen(json);
            case "BUDGE_REDIRECTION_POINT_FIVE_PERCENT":
                return createAwardWithBudgetRedirectionPointFivePercent(json);
            case "BR_NINETY_NINE_POINT_FIVE_PERCENT":
                return createAwardWithBudgetRedirectionNinetyNinePointFivePercent(json);
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

    private JsonObject createAwardWithBudgetRedirectionPointFivePercent(JsonObject json) {
        JsonObject award = json.getAsJsonArray("Award").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        award.addProperty("BudgetRedirectionThreshhold", 0.5);
        newA.add(award);
        json.add("Award", newA);
        return json;
    }

    private JsonObject createAwardWithBudgetRedirectionNinetyNinePointFivePercent(JsonObject json) {
        JsonObject award = json.getAsJsonArray("Award").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        award.addProperty("BudgetRedirectionThreshhold", 99.5);
        newA.add(award);
        json.add("Award", newA);
        return json;
    }

    private JsonObject createAwardWithBudgetRedirectionFifteen(JsonObject json) {
        JsonObject award = json.getAsJsonArray("Award").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        award.addProperty("BudgetRedirectionThreshhold", 15);
        newA.add(award);
        json.add("Award", newA);
        return json;
    }

    private JsonObject payloadForSubrecipientMatchFiftyPercent(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("IsMatchRequired", "Yes");
        grant.addProperty("GranteeMatch", 50);
        newA.add(grant);
        json.add("Grant", newA);
        return json;
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
        grant.addProperty("KPIsRequired", "No");
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
        grant.addProperty("IsMatchRequired", "Yes");
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
        award.addProperty("BudgetRedirectionThreshhold", 10);
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
        if (isManual.equalsIgnoreCase("Grants.Gov")) {
            leadData.addProperty("isGrantsgovLead", true);
        } else {
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
            case "PRE_APP_YES_NGO_BUDGET_TYPE":
                return updatePreApplicationAsYesWithNGOBudgetType(defaultJson);
            default:
                return defaultJson;
        }
    }

    private JsonObject updatePreApplicationAsYesWithNGOBudgetType(JsonObject defaultJson) {
        JsonObject pre_application = defaultJson.getAsJsonArray("OpportunityData").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        pre_application.addProperty("isPreApplicationRequired", "Yes");
        pre_application.addProperty("budgetType", "NGO");
        pre.add(pre_application);
        defaultJson.add("OpportunityData", pre);
        return defaultJson;
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

    public JsonObject payloadForPreApplicationCreatedAndAccepted(String module, String preAppTitle, String state, String oppoNo, String filter) {
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
            case "SUMMARY_BUDGET":
                return payloadForSummaryBudget(json);
            case "LINE_ITEM_BUDGET":
                return payloadForLineItemBudget(json);
            case "DAVID_FO_APPROVER":
                return payloadForDavidFoApprover(json, module);
            case "TWO_STEP_APPROVER":
                return payloadForTwoStepApprover(json, module);
            case "TWO_STEP_APPROVER_PO_OWNER":
                return payloadForTwoStepApproverPOOwner(json, module);
            case "PREAPPLICATION_FOUR_FOCUS_AREA":
                return payloadForPreApplicationFourFocusArea(json);
            default:
                return json;
        }
    }

    private JsonObject payloadForTwoStepApproverPOOwner(JsonObject json, String module) {
        JsonObject preAPPData = json.getAsJsonArray("preAppAndAppData").get(0).getAsJsonObject();
        JsonObject preAPPData1 = json.getAsJsonArray("preAppAndAppData").get(0).getAsJsonObject();
        preAPPData1.addProperty("OwnerId", ProjectWebServices.getIdOf("User", "Grantee PO"));

        JsonArray topLevelApprovers = new JsonArray();
        JsonObject topLevelApprover = new JsonObject();
        topLevelApprover.addProperty("name", ProjectWebServices.getIdOf("User", "Sarah PM"));
        if (module.equalsIgnoreCase("Pre-application")) {
            topLevelApprover.addProperty("preApplication", "Step1");
        } else {
            topLevelApprover.addProperty("application", "Step1");
        }
        topLevelApprovers.add(topLevelApprover);

        JsonObject topLevelApprover2 = new JsonObject();
        topLevelApprover2.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        if (module.equalsIgnoreCase("Pre-application")) {
            topLevelApprover2.addProperty("preApplication", "Step2");
        } else {
            topLevelApprover2.addProperty("application", "Step2");
        }
        topLevelApprovers.add(topLevelApprover2);

        preAPPData.add("approvers", topLevelApprovers);
        JsonArray preAPPDataDataArray = new JsonArray();
        preAPPDataDataArray.add(preAPPData);
        preAPPDataDataArray.add(preAPPData1);
        json.add("preAppAndAppData", preAPPDataDataArray);
        return json;
    }

    private JsonObject payloadForLineItemBudget(JsonObject json) {
        JsonObject pre_application = json.getAsJsonArray("preAppAndAppData").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        pre_application.addProperty("BudgetLevel", "Line Item Budget");
        pre.add(pre_application);
        json.add("preAppAndAppData", pre);
        return json;
    }

    private JsonObject payloadForPreApplicationFourFocusArea(JsonObject json) {
        JsonObject pre_application = json.getAsJsonArray("preAppAndAppData").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        JsonArray focusAreas = new JsonArray();
        focusAreas.add("Automation Permanent Focus Area2");
        focusAreas.add("Automation Permanent Focus Area3");
        focusAreas.add("Automation Permanent Focus Area4");
        pre_application.add("focusAreas", focusAreas);
        json.add("preAppAndAppData", pre);
        return json;
    }

    private JsonObject payloadForSummaryBudget(JsonObject json) {
        JsonObject pre_application = json.getAsJsonArray("preAppAndAppData").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        pre_application.addProperty("BudgetLevel", "Summary Budget");
        pre.add(pre_application);
        json.add("preAppAndAppData", pre);
        return json;
    }

    private JsonObject payloadForTwoStepApprover(JsonObject json, String module) {
        JsonObject preAPPData = json.getAsJsonArray("preAppAndAppData").get(0).getAsJsonObject();
        JsonArray topLevelApprovers = new JsonArray();
        JsonObject topLevelApprover = new JsonObject();
        topLevelApprover.addProperty("name", ProjectWebServices.getIdOf("User", "Grantee PO"));
        if (module.equalsIgnoreCase("Pre-application")) {
            topLevelApprover.addProperty("preApplication", "Step1");
        } else {
            topLevelApprover.addProperty("application", "Step1");
        }
        topLevelApprovers.add(topLevelApprover);

        JsonObject topLevelApprover2 = new JsonObject();
        topLevelApprover2.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        if (module.equalsIgnoreCase("Pre-application")) {
            topLevelApprover2.addProperty("preApplication", "Step2");
        } else {
            topLevelApprover2.addProperty("application", "Step2");
        }
        topLevelApprovers.add(topLevelApprover2);

        preAPPData.add("approvers", topLevelApprovers);
        JsonArray preAPPDataDataArray = new JsonArray();
        preAPPDataDataArray.add(preAPPData);
        json.add("preAppAndAppData", preAPPDataDataArray);
        return json;
    }

    private JsonObject payloadForDavidFoApprover(JsonObject json, String module) {
        JsonObject preAPPData = json.getAsJsonArray("preAppAndAppData").get(0).getAsJsonObject();
        JsonArray topLevelApprovers = new JsonArray();
        JsonObject topLevelApprover = new JsonObject();
        topLevelApprover.addProperty("name", ProjectWebServices.getIdOf("User", "David FO"));
        if (module.equalsIgnoreCase("Pre-application")) {
            topLevelApprover.addProperty("preApplication", "Step1");
        } else {
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
        opportunityData.addProperty("InternalOrgId", ProjectWebServices.getIdOf("Account", "Department of Product"));
        opportunityData.addProperty("AORContact", ProjectWebServices.getIdOf("Contact", "Victor EXE"));
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
//   Below Budget Period Data only added for WHCA Grantee Org once execution done comment this
        JsonArray bpDatesArray = new JsonArray();
        JsonObject bpDates = new JsonObject();
        bpDates.addProperty("StartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(210, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        bpDates.addProperty("EndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(365, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        bpDatesArray.add(bpDates);
        opportunityData.add("BudgetPeriodTable", bpDatesArray);

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
        contact.addProperty("Name", ProjectWebServices.getIdOf("Contact", "Victor EXE"));
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
        appToAward.addProperty("DecisionComment", "Allowed to create Award");
        appToAwardArray.add(appToAward);
        grantDetails.add("AppAwardData", appToAwardArray);

        grantDetails.addProperty("grantTitle", appTitle);
        grantDetails.addProperty("grantAbbreviation", "GA");
        grantDetails.addProperty("OwnerId", ProjectWebServices.getIdOf("User", "Sarah PM"));
        grantDetails.addProperty("grantNumber", "GT1234");
//        grantDetails.addProperty("projectPeriodStartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
//        grantDetails.addProperty("projectPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
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
//        grantDetails.addProperty("BudgetPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
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
        if (status.equalsIgnoreCase("Submitted to Grantor")) {
            closeoutDetails.addProperty("SubmittedtoGrantor", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(1, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        } else if (status.equalsIgnoreCase("Completed")) {
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
            case "CASH_MATCH_NON_CASH_MATCH_PO_OWNER":
                return payloadForCashMatchAndNonCashMatch(json, grantTitle, state);
            case "NON_CASH_MATCH":
                return payloadForNonCashMatch(json);
            case "NON_CONSTRUCTION":
                return payloadForNonConstruction(json);
            case "USER":
                return createStandaloneGranteeAwardUsingUser(json, user);
            default:
                return json;
        }
    }

    private JsonObject payloadForNonCashMatch(JsonObject json) {
        JsonObject grants = json.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        grants.addProperty("costSharing", "Non-Cash Match");
        pre.add(grants);
        json.add("GrantAwardData", pre);
        return json;
    }

    private JsonObject payloadForNonConstruction(JsonObject json) {
        JsonObject grants = json.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        grants.addProperty("budgetType", "Non-Construction");
        pre.add(grants);
        json.add("GrantAwardData", pre);
        return json;
    }

    private JsonObject payloadForCashMatchAndNonCashMatch(JsonObject json, String grantTitle, String state) {
        JsonObject grantDetails = json.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
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
        grantDetails.addProperty("costSharing", "Cash and Non-Cash Match");
        grantDetails.addProperty("requiredMatchPercentage", 10);
        grantDetails.addProperty("isLeverageAllowed", "Yes");
        grantDetails.addProperty("BudgetCloseoutrequestRequired", "Yes");
        grantDetails.addProperty("programIncomeAllowed", "Yes");
        grantDetails.addProperty("ueiNumber", ProjectWebServices.getIdOf("DUNS__c", "YRNMVN96JC17"));
        grantDetails.addProperty("ownerId", ProjectWebServices.getIdOf("User", "Grantee PO"));
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
        JsonArray grantDataArray = new JsonArray();
        grantDataArray.add(grantDetails);
        json.add("GrantAwardData", grantDataArray);

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
        focusArea2.addProperty("Title", "Automation Permanent Focus Area2");
        focusArea2.addProperty("StartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusArea2.addProperty("EndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusAreas.add(focusArea2);
        grantAwardData.add("focusAreas", focusAreas);

        // Adding build-up items
        JsonObject buildUpItem1 = new JsonObject();
        buildUpItem1.addProperty("BudgetCategory", "Construction");
        buildUpItem1.addProperty("Title", "Construction");
        buildUpItem1.addProperty("Narrative", "Test Build-up");
        buildUpItem1.addProperty("awardBudget", 5000);
        buildUpItem1.addProperty("CashMatch", 500);
        buildUpItem1.addProperty("OtherLeverage", 200);
        buildUpItem1.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItems.add(buildUpItem1);
        grantAwardData.add("buildUpItems", buildUpItems);

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
            case "NA_APPROVER":
                return updateNoApprover(defaultJson, title, type, status);
            case "NA_APPROVER_EXE_OWNER":
                return updateNoApproverWithEXEOwner(defaultJson, title, type, status);
            case "PO_OWNER":
                return updatePOOwner(defaultJson, title, type, status);
            default:
                return defaultJson;
        }
    }

    private JsonObject updatePOOwner(JsonObject defaultJson, String title, String type, String status) {
        JsonObject progressReportDetails = new JsonObject();
        // Basic progress report details
        progressReportDetails.addProperty("AwardTitle", title);
        if (type.equalsIgnoreCase("Progress Report")) {
            progressReportDetails.addProperty("ReportType", "Program");
        } else {
            progressReportDetails.addProperty("ReportType", "Fiscal");
        }
        progressReportDetails.addProperty("OwnerID", ProjectWebServices.getIdOf("User", "Grantee PO"));
        progressReportDetails.addProperty("ReportDueDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReportDetails.addProperty("KeyAccomplishments", "Automation Test Key Accomplishments");
        progressReportDetails.addProperty("Obstacles", "Automation Test Obstacles");
        progressReportDetails.addProperty("Plans", "Automation Test Plans");
        progressReportDetails.addProperty("SubmittedtoGrantor", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(1, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReportDetails.addProperty("isCreatedOrApprovedProgressReport", status);
        progressReportDetails.addProperty("isFinalReport", false);
        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        approver.addProperty("progressreport", "Step1");
        approvers.add(approver);
        progressReportDetails.add("approvers", approvers);
        // Creating the progress report data array and adding the progress report object
        JsonArray progressReportDataArray = new JsonArray();
        progressReportDataArray.add(progressReportDetails);
        defaultJson.add("progressReportData", progressReportDataArray);
        return defaultJson;
    }


    private JsonObject updateNoApproverWithEXEOwner(JsonObject defaultJson, String title, String type, String status) {
        JsonObject progressReportDetails = new JsonObject();

        // Basic progress report details
        progressReportDetails.addProperty("AwardTitle", title);
        if (type.equalsIgnoreCase("Progress Report")) {
            progressReportDetails.addProperty("ReportType", "Program");
        } else {
            progressReportDetails.addProperty("ReportType", "Fiscal");
        }
        progressReportDetails.addProperty("OwnerID", ProjectWebServices.getIdOf("User", "Victor EXE"));
        progressReportDetails.addProperty("ReportDueDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReportDetails.addProperty("KeyAccomplishments", "Automation Test Key Accomplishments");
        progressReportDetails.addProperty("Obstacles", "Automation Test Obstacles");
        progressReportDetails.addProperty("Plans", "Automation Test Plans");
        progressReportDetails.addProperty("SubmittedtoGrantor", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(1, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReportDetails.addProperty("isCreatedOrApprovedProgressReport", status);
        progressReportDetails.addProperty("isFinalReport", false);

        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        approver.addProperty("progressreport", "NA");
        approvers.add(approver);
        progressReportDetails.add("approvers", approvers);

        // Creating the progress report data array and adding the progress report object
        JsonArray progressReportDataArray = new JsonArray();
        progressReportDataArray.add(progressReportDetails);

        defaultJson.add("progressReportData", progressReportDataArray);

        return defaultJson;
    }

    private JsonObject updateNoApprover(JsonObject defaultJson, String title, String type, String status) {
        JsonObject progressReportDetails = new JsonObject();

        // Basic progress report details
        progressReportDetails.addProperty("AwardTitle", title);
        if (type.equalsIgnoreCase("Progress Report")) {
            progressReportDetails.addProperty("ReportType", "Program");
        } else {
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

        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        approver.addProperty("progressreport", "NA");
        approvers.add(approver);
        progressReportDetails.add("approvers", approvers);

        // Creating the progress report data array and adding the progress report object
        JsonArray progressReportDataArray = new JsonArray();
        progressReportDataArray.add(progressReportDetails);

        defaultJson.add("progressReportData", progressReportDataArray);

        return defaultJson;
    }

    private JsonObject defaultCreateTheProgressReportCreatedAndApproved(String status, String type, String title) {
        JsonObject progressReportDetails = new JsonObject();

        // Basic progress report details
        progressReportDetails.addProperty("AwardTitle", title);
        if (type.equalsIgnoreCase("Progress Report")) {
            progressReportDetails.addProperty("ReportType", "Program");
        } else {
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
            case "CARRY_FORWARD_STEP_FOUR_APPROVER_FD_OWNER":
                return updateCarryForwardStepFourApprover(defaultJson, type, grantTitle, state);
            case "CARRY_FORWARD_STEP_FOUR_APPROVER_FO_OWNER":
                return updateCarryForwardStepFourApproverFOOwner(defaultJson, type, grantTitle, state);
            case "CARRY_FORWARD_PO_OWNER":
                return updateCarryForwardPoOwner(defaultJson, type, grantTitle, state);
            case "BUDGET_PERIOD_CHANGE_GRANTEE_PO":
                return updateBudgetPeriodChange(defaultJson, type, grantTitle, state);
            case "BUDGET_PERIOD_CHANGE_GRANTEE_ADMIN":
                return updateBudgetPeriodChangeforADMIN(defaultJson, type, grantTitle, state);
            case "BUDGET_PERIOD_CHANGE_DAVID_FO":
                return updateBudgetPeriodChangeDavidFO(defaultJson, type, grantTitle, state);
            case "NON_CASH_MATCH_BUDGET":
                return updateNonCashMatchBudget(defaultJson);
            case "NO_BUDGET":
                return updateNonBudget(defaultJson, type, grantTitle, state);
            case "GRANTEE_FO_APPROVER":
                return payloadForGranteeFOAmendmentApprover(defaultJson);
            case "STEP_FOUR_APPROVER":
                return payloadForGranteeStepFourApprover(defaultJson);
            case "KEY_PERSONNEL_CHANGE":
                return updateKeyPersonnelChange(defaultJson, type, grantTitle, state);
            case "PERIODIC_FD_APPROVER_EXE_OWNER":
                return updatePeriodicFDApproverEXEOwner(defaultJson, type, grantTitle, state);
            case "PERIODIC_FD_APPROVER_PO_OWNER":
                return updatePeriodicFDApproverPOOwner(defaultJson, type, grantTitle, state);
            case "FUNDING_CHANGE_PO_OWNER":
                return updateFundingChangePOOwner(defaultJson, type, grantTitle, state);
            default:
                return defaultJson;
        }
    }

    private JsonObject updateFundingChangePOOwner(JsonObject defaultJson, String type, String grantTitle, String state) {
        JsonObject grantAwardData = new JsonObject();
        grantAwardData.addProperty("InitiatedBy", "Grantee");
        grantAwardData.addProperty("PleaseselectAmendmentRequestType", type);
        grantAwardData.addProperty("AwardTitle", grantTitle);
        grantAwardData.addProperty("Justification", "Automation Test");
        grantAwardData.addProperty("Impact", "Automation Test Impact");
        grantAwardData.addProperty("ownerId", ProjectWebServices.getIdOf("User", "Grantee PO"));
        grantAwardData.addProperty("isStatusCreatedOrApproved", state);
        grantAwardData.addProperty("MaximumIndirectCostRate", 10);
        grantAwardData.addProperty("NewAwardTitle", grantTitle);
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
        if (!type.equalsIgnoreCase("Funding Change")) {
            JsonArray focusAreas = new JsonArray();
            JsonObject focusArea = new JsonObject();
            focusArea.addProperty("Title", "Automation Permanent Focus Area");
            focusArea.addProperty("StartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            focusArea.addProperty("EndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3670, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            focusAreas.add(focusArea);
            grantAwardData.add("focusAreas", focusAreas);
        }

        // Build-up Items
        JsonArray buildUpItems = new JsonArray();
        JsonObject buildUpItem = new JsonObject();
        buildUpItem.addProperty("BudgetCategory", "Construction");
        buildUpItem.addProperty("Title", "Construction");
        buildUpItem.addProperty("Narrative", "Test Build-up");
        buildUpItem.addProperty("awardBudget", 7000);
        buildUpItem.addProperty("CashMatch", 700);
        buildUpItem.addProperty("OtherLeverage", 700);
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

        return defaultJson;
    }

    private JsonObject updatePeriodicFDApproverPOOwner(JsonObject defaultJson, String type, String grantTitle, String state) {
        JsonObject grantAwardData = new JsonObject();
        grantAwardData.addProperty("InitiatedBy", "Grantee");
        grantAwardData.addProperty("PleaseselectAmendmentRequestType", type);
        grantAwardData.addProperty("AwardTitle", grantTitle);
        grantAwardData.addProperty("Justification", "Automation Test");
        grantAwardData.addProperty("Impact", "Automation Test Impact");
        grantAwardData.addProperty("ownerId", ProjectWebServices.getIdOf("User", "Grantee PO"));
        grantAwardData.addProperty("isStatusCreatedOrApproved", state);
        grantAwardData.addProperty("MaximumIndirectCostRate", 10);
        grantAwardData.addProperty("NewAwardTitle", grantTitle);
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
        grantAwardData.addProperty("RequestedChangeinAwardBudget", 7000);
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
        focusArea.addProperty("StartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3651, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
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

        // Approvers
        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Danielle FD Garcia"));
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

    private JsonObject updatePeriodicFDApproverEXEOwner(JsonObject defaultJson, String type, String grantTitle, String state) {
        JsonObject grantAwardData = new JsonObject();
        grantAwardData.addProperty("InitiatedBy", "Grantee");
        grantAwardData.addProperty("PleaseselectAmendmentRequestType", type);
        grantAwardData.addProperty("AwardTitle", grantTitle);
        grantAwardData.addProperty("Justification", "Automation Test");
        grantAwardData.addProperty("Impact", "Automation Test Impact");
        grantAwardData.addProperty("ownerId", ProjectWebServices.getIdOf("User", "Victor EXE"));
        grantAwardData.addProperty("isStatusCreatedOrApproved", state);
        grantAwardData.addProperty("MaximumIndirectCostRate", 10);
        grantAwardData.addProperty("NewAwardTitle", grantTitle);
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
        grantAwardData.addProperty("RequestedChangeinAwardBudget", 7000);
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
        focusArea.addProperty("StartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3651, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
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


        // Approvers
        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Danielle FD Garcia"));
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

    private JsonObject updateCarryForwardStepFourApprover(JsonObject defaultJson, String type, String grantTitle, String state) {
        JsonObject grantAwardData = new JsonObject();
        grantAwardData.addProperty("InitiatedBy", "Grantee");
        grantAwardData.addProperty("PleaseselectAmendmentRequestType", type);
        grantAwardData.addProperty("AwardTitle", grantTitle);
        grantAwardData.addProperty("Justification", "Automation Test");
        grantAwardData.addProperty("Impact", "Automation Test Impact");
        grantAwardData.addProperty("ownerId", ProjectWebServices.getIdOf("User", "Danielle FD Garcia"));
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

        JsonObject approver1 = new JsonObject();
        approver1.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        approver1.addProperty("amendmentRequest", "Step2");
        approvers.add(approver1);

        JsonObject approver2 = new JsonObject();
        approver2.addProperty("name", ProjectWebServices.getIdOf("User", "Grantee PO"));
        approver2.addProperty("amendmentRequest", "Step3");
        approvers.add(approver2);

        JsonObject approver3 = new JsonObject();
        approver3.addProperty("name", ProjectWebServices.getIdOf("User", "David FO"));
        approver3.addProperty("amendmentRequest", "Step4");
        approvers.add(approver3);

        grantAwardData.add("approvers", approvers);

        // Creating the GrantAwardData array and adding the GrantAwardData object
        JsonArray grantAwardDataArray = new JsonArray();
        grantAwardDataArray.add(grantAwardData);

        defaultJson.add("GrantAwardData", grantAwardDataArray);

        return defaultJson;
    }

    private JsonObject updateCarryForwardStepFourApproverFOOwner(JsonObject defaultJson, String type, String grantTitle, String state) {
        JsonObject grantAwardData = new JsonObject();
        grantAwardData.addProperty("InitiatedBy", "Grantee");
        grantAwardData.addProperty("PleaseselectAmendmentRequestType", type);
        grantAwardData.addProperty("AwardTitle", grantTitle);
        grantAwardData.addProperty("Justification", "Automation Test");
        grantAwardData.addProperty("Impact", "Automation Test Impact");
        grantAwardData.addProperty("ownerId", ProjectWebServices.getIdOf("User", "David FO"));
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

        JsonObject approver1 = new JsonObject();
        approver1.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        approver1.addProperty("amendmentRequest", "Step2");
        approvers.add(approver1);

        JsonObject approver2 = new JsonObject();
        approver2.addProperty("name", ProjectWebServices.getIdOf("User", "Grantee PO"));
        approver2.addProperty("amendmentRequest", "Step3");
        approvers.add(approver2);

        JsonObject approver3 = new JsonObject();
        approver3.addProperty("name", ProjectWebServices.getIdOf("User", "Danielle FD Garcia"));
        approver3.addProperty("amendmentRequest", "Step4");
        approvers.add(approver3);

        grantAwardData.add("approvers", approvers);

        // Creating the GrantAwardData array and adding the GrantAwardData object
        JsonArray grantAwardDataArray = new JsonArray();
        grantAwardDataArray.add(grantAwardData);

        defaultJson.add("GrantAwardData", grantAwardDataArray);

        return defaultJson;
    }

    private JsonObject updateCarryForwardPoOwner(JsonObject defaultJson, String type, String grantTitle, String state) {
        JsonObject grantAwardData = new JsonObject();
        grantAwardData.addProperty("InitiatedBy", "Grantee");
        grantAwardData.addProperty("PleaseselectAmendmentRequestType", type);
        grantAwardData.addProperty("AwardTitle", grantTitle);
        grantAwardData.addProperty("Justification", "Automation Test");
        grantAwardData.addProperty("Impact", "Automation Test Impact");
        grantAwardData.addProperty("ownerId", ProjectWebServices.getIdOf("User", "Grantee PO"));
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

    private JsonObject updateBudgetPeriodChangeDavidFO(JsonObject defaultJson, String type, String grantTitle, String state) {
        JsonObject grantAwardData = new JsonObject();
        grantAwardData.addProperty("InitiatedBy", "Grantee");
        grantAwardData.addProperty("PleaseselectAmendmentRequestType", type);
        grantAwardData.addProperty("AwardTitle", grantTitle);
        grantAwardData.addProperty("Justification", "Automation Test");
        grantAwardData.addProperty("Impact", "Automation Test Impact");
        grantAwardData.addProperty("ownerId", ProjectWebServices.getIdOf("User", "David FO"));
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
        indirectRate.addProperty("title", "New Indirect rate2");
        indirectRate.addProperty("effectiveFrom", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("effectiveUntil", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(50, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("indirectCostRates", 10);
        indirectRate.addProperty("indirectCostRateType", "Final");
        indirectRates.add(indirectRate);
        grantAwardData.add("indirectRates", indirectRates);

        // Special Conditions
        JsonArray specialCondition = new JsonArray();
        JsonObject condition1 = new JsonObject();
        condition1.addProperty("title", "TermsAmendment");
        condition1.addProperty("description", "Automation Test");
        condition1.addProperty("sequence", 1);
        condition1.addProperty("EffectiveFromDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        condition1.addProperty("EffectiveEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3670, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        specialCondition.add(condition1);
        grantAwardData.add("specialCondition", specialCondition);

        // Approvers
        JsonArray approvers = new JsonArray();
        JsonObject approver = new JsonObject();
        approver.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
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

    private JsonObject updateKeyPersonnelChange(JsonObject defaultJson, String type, String grantTitle, String state) {
        JsonObject grantAwardData = new JsonObject();
        grantAwardData.addProperty("InitiatedBy", "Grantee");
        grantAwardData.addProperty("PleaseselectAmendmentRequestType", type);
        grantAwardData.addProperty("AwardTitle", grantTitle);
        grantAwardData.addProperty("Justification", "Automation Test");
        grantAwardData.addProperty("Impact", "Automation Test Impact");
        grantAwardData.addProperty("ownerId", ProjectWebServices.getIdOf("User", "Sarah PM"));
        grantAwardData.addProperty("isStatusCreatedOrApproved", state);
        grantAwardData.addProperty("MaximumIndirectCostRate", 10);
        grantAwardData.addProperty("NewAwardTitle", grantTitle);
        grantAwardData.addProperty("NewAwardDescription", "Automation Test");
        grantAwardData.addProperty("NewBudgetPeriodEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(365, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grantAwardData.addProperty("BudgetRedirectionThreshold", 10);
        grantAwardData.addProperty("Addressline", "Rei System");
        grantAwardData.addProperty("Address", "Baner");
        grantAwardData.addProperty("City", "Alaska");
        grantAwardData.addProperty("County", "Alaska");
        grantAwardData.addProperty("State", "MA");
        grantAwardData.addProperty("CongressionalDistrict", "345");
        grantAwardData.addProperty("ZipCode", "45678");
        grantAwardData.addProperty("Country", "USA");
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

        defaultJson.add("GrantAwardData", grantAwardDataArray);

        return defaultJson;
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
        indirectRate.addProperty("title", "New Indirect rate2");
        indirectRate.addProperty("effectiveFrom", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("effectiveUntil", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(50, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("indirectCostRates", 10);
        indirectRate.addProperty("indirectCostRateType", "Final");
        indirectRates.add(indirectRate);
        grantAwardData.add("indirectRates", indirectRates);

        // Special Conditions
        JsonArray specialCondition = new JsonArray();
        JsonObject condition1 = new JsonObject();
        condition1.addProperty("title", "TermsAmendment");
        condition1.addProperty("description", "Automation Test");
        condition1.addProperty("sequence", 1);
        condition1.addProperty("EffectiveFromDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        condition1.addProperty("EffectiveEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3670, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        specialCondition.add(condition1);
        grantAwardData.add("specialCondition", specialCondition);

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


    private JsonObject updateBudgetPeriodChangeforADMIN(JsonObject defaultJson, String type, String grantTitle, String state) {
        JsonObject grantAwardData = new JsonObject();
        grantAwardData.addProperty("InitiatedBy", "Grantee");
        grantAwardData.addProperty("PleaseselectAmendmentRequestType", type);
        grantAwardData.addProperty("AwardTitle", grantTitle);
        grantAwardData.addProperty("Justification", "Automation Test");
        grantAwardData.addProperty("Impact", "Automation Test Impact");
        grantAwardData.addProperty("ownerId", ProjectWebServices.getIdOf("User", "DEMO ADMIN"));
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
        indirectRate.addProperty("title", "New Indirect rate2");
        indirectRate.addProperty("effectiveFrom", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("effectiveUntil", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(50, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("indirectCostRates", 10);
        indirectRate.addProperty("indirectCostRateType", "Final");
        indirectRates.add(indirectRate);
        grantAwardData.add("indirectRates", indirectRates);

        // Special Conditions
        JsonArray specialCondition = new JsonArray();
        JsonObject condition1 = new JsonObject();
        condition1.addProperty("title", "TermsAmendment");
        condition1.addProperty("description", "Automation Test");
        condition1.addProperty("sequence", 1);
        condition1.addProperty("EffectiveFromDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        condition1.addProperty("EffectiveEndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3670, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        specialCondition.add(condition1);
        grantAwardData.add("specialCondition", specialCondition);

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
        grantAwardData.addProperty("NewAwardTitle", grantTitle);
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
        if (!type.equalsIgnoreCase("Funding Change")) {
            JsonArray focusAreas = new JsonArray();
            JsonObject focusArea = new JsonObject();
            focusArea.addProperty("Title", "Automation Permanent Focus Area");
            focusArea.addProperty("StartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            focusArea.addProperty("EndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3670, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            focusAreas.add(focusArea);
            grantAwardData.add("focusAreas", focusAreas);
        }

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
            case "STEP_THREE_APPROVER":
                return payloadForStepThreeApprover(json);
            case "USER":
                return createStandaloneGranteeAwardUsingUser(json, user);
            default:
                return json;
        }
    }

    private JsonObject payloadForStepThreeApprover(JsonObject json) {
        JsonObject grantAwardData = json.getAsJsonArray("AwardChildData").get(0).getAsJsonObject();
        JsonArray topLevelApprovers = new JsonArray();
        JsonObject topLevelApprover = new JsonObject();
        topLevelApprover.addProperty("name", ProjectWebServices.getIdOf("User", "Sarah PM"));
        topLevelApprover.addProperty("Award", "Step1");
        topLevelApprovers.add(topLevelApprover);

        JsonObject topLevelApprover1 = new JsonObject();
        topLevelApprover1.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        topLevelApprover1.addProperty("Award", "Step2");
        topLevelApprovers.add(topLevelApprover1);

        JsonObject topLevelApprover2 = new JsonObject();
        topLevelApprover2.addProperty("name", ProjectWebServices.getIdOf("User", "David FO"));
        topLevelApprover2.addProperty("Award", "Step3");
        topLevelApprovers.add(topLevelApprover2);

        grantAwardData.add("approvers", topLevelApprovers);
        JsonArray grantAwardDataArray = new JsonArray();
        grantAwardDataArray.add(grantAwardData);
        json.add("AwardChildData", grantAwardDataArray);
        return json;
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
            case "THREE_FOCUS_WITH_BUDGET":
                return payloadForThreeFocusWithBudget(json);
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
            case "STEP_THREE_APPROVER":
                return payloadForGranteeStepThreeApproverApprover(json);
            case "STEP_TWO_AMENDMENT":
                return payloadForGranteeStepTwoForAmendment(json);
            default:
                return json;
        }
    }

    private JsonObject payloadForThreeFocusWithBudget(JsonObject json) {
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
        focusArea2.addProperty("Title", "Automation Permanent Focus Area2");
        focusArea2.addProperty("StartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusArea2.addProperty("EndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusAreas.add(focusArea2);
        grantAwardData.add("focusAreas", focusAreas);

        // Adding build-up items
        JsonObject buildUpItem1 = new JsonObject();
        buildUpItem1.addProperty("BudgetCategory", "Construction");
        buildUpItem1.addProperty("Title", "Construction");
        buildUpItem1.addProperty("Narrative", "Test Build-up");
        buildUpItem1.addProperty("awardBudget", 5000);
        buildUpItem1.addProperty("CashMatch", 500);
        buildUpItem1.addProperty("OtherLeverage", 200);
        buildUpItem1.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItems.add(buildUpItem1);

        JsonObject focusArea3 = new JsonObject();
        focusArea3.addProperty("Title", "Test Focus Area1");
        focusArea3.addProperty("StartDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(15, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusArea3.addProperty("EndDate", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        focusAreas.add(focusArea3);
        grantAwardData.add("focusAreas", focusAreas);

        // Adding build-up items
        JsonObject buildUpItem2 = new JsonObject();
        buildUpItem2.addProperty("BudgetCategory", "Construction");
        buildUpItem2.addProperty("Title", "Construction");
        buildUpItem2.addProperty("Narrative", "Test Build-up");
        buildUpItem2.addProperty("awardBudget", 5000);
        buildUpItem2.addProperty("CashMatch", 500);
        buildUpItem2.addProperty("OtherLeverage", 200);
        buildUpItem2.addProperty("ServiceAreaName", "Test Focus Area1");
        buildUpItems.add(buildUpItem2);
        grantAwardData.add("buildUpItems", buildUpItems);

        JsonArray grantAwardDataArray = new JsonArray();
        grantAwardDataArray.add(grantAwardData);
        json.add("AwardChildData", grantAwardDataArray);
        return json;
    }

    private JsonObject payloadForGranteeStepTwoForAmendment(JsonObject json) {
        JsonObject preAPPData = json.getAsJsonArray("AwardChildData").get(0).getAsJsonObject();
        JsonArray topLevelApprovers = new JsonArray();
        JsonObject topLevelApprover = new JsonObject();
        topLevelApprover.addProperty("name", ProjectWebServices.getIdOf("User", "Sarah PM"));
        topLevelApprover.addProperty("Award", "Step1");
        topLevelApprover.addProperty("AmendmentRequest", "Step1");
        topLevelApprovers.add(topLevelApprover);

        JsonObject topLevelApprover1 = new JsonObject();
        topLevelApprover1.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        topLevelApprover1.addProperty("AmendmentRequest", "Step2");
        topLevelApprovers.add(topLevelApprover1);

        preAPPData.add("approvers", topLevelApprovers);
        JsonArray preAPPDataDataArray = new JsonArray();
        preAPPDataDataArray.add(preAPPData);
        json.add("AwardChildData", preAPPDataDataArray);
        return json;
    }

    private JsonObject payloadForGranteeStepThreeApproverApprover(JsonObject json) {
        JsonObject preAPPData = json.getAsJsonArray("GrantAwardData").get(0).getAsJsonObject();
        JsonArray topLevelApprovers = new JsonArray();
        JsonObject topLevelApprover = new JsonObject();
        topLevelApprover.addProperty("name", ProjectWebServices.getIdOf("User", "Sarah PM"));
        topLevelApprover.addProperty("Award", "Step1");
        topLevelApprovers.add(topLevelApprover);

        JsonObject topLevelApprover1 = new JsonObject();
        topLevelApprover1.addProperty("name", ProjectWebServices.getIdOf("User", "Victor EXE"));
        topLevelApprover1.addProperty("Award", "Step1");
        topLevelApprovers.add(topLevelApprover1);

        JsonObject topLevelApprover2 = new JsonObject();
        topLevelApprover2.addProperty("name", ProjectWebServices.getIdOf("User", "David FO"));
        topLevelApprover2.addProperty("Award", "Step1");
        topLevelApprovers.add(topLevelApprover2);

        preAPPData.add("approvers", topLevelApprovers);
        JsonArray preAPPDataDataArray = new JsonArray();
        preAPPDataDataArray.add(preAPPData);
        json.add("GrantAwardData", preAPPDataDataArray);
        return json;
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
        JsonObject preAPPData = json.getAsJsonArray("AwardChildData").get(0).getAsJsonObject();
        JsonArray topLevelApprovers = new JsonArray();
        JsonObject topLevelApprover = new JsonObject();
        topLevelApprover.addProperty("name", ProjectWebServices.getIdOf("User", "Grantee PO"));
        topLevelApprover.addProperty("Award", "Step1");
        topLevelApprovers.add(topLevelApprover);
        preAPPData.add("approvers", topLevelApprovers);
        JsonArray preAPPDataDataArray = new JsonArray();
        preAPPDataDataArray.add(preAPPData);
        json.add("AwardChildData", preAPPDataDataArray);
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
        indirectRate.addProperty("effectiveFrom", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(25, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        indirectRate.addProperty("effectiveUntil", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(40, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
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

    public JsonObject payloadProgramCreationForTitle(String title, String recordType, String status, String filter) {
        String user = "";
        JsonObject json;
        json = defaultPayloadProgramCreationForTitle(title, recordType, status);
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
            default:
                return json;
        }
    }

    private JsonObject defaultPayloadProgramCreationForTitle(String title, String recordType, String status) {

        JsonObject request = new JsonObject();

        JsonArray graphs = new JsonArray();
        JsonObject graph = new JsonObject();

        graph.addProperty("graphId", "ProgramGraph");

        JsonArray compositeRequest = new JsonArray();

        JsonObject program = new JsonObject();
        program.addProperty("method", "POST");
        program.addProperty("url", "/services/data/v66.0/sobjects/Program__c");
        program.addProperty("referenceId", "ProgramRef1");

        JsonObject programBody = new JsonObject();
        programBody.addProperty("ProgramName__c", title);
        programBody.addProperty("IsGoalsRequired__c", "Yes");
        programBody.addProperty("RecordTypeId", ProjectWebServices.getRecordTypeId("Program__c", recordType));
        programBody.addProperty("KPIsRequired__c", "Yes");
        programBody.addProperty("Type__c", "Project Grants");
        programBody.addProperty("Status__c", status);
        programBody.addProperty("WebsiteAddress__c", "www.solicitation.com");
        if (recordType.equalsIgnoreCase("Internal Program")) {
            programBody.addProperty("PrimaryFundingOrganization__c", ProjectWebServices.getIdOf("Account", I.amPerforming().propertiesFileOperationsTo().getValue("grantorAutomationOrg")));
            programBody.addProperty("Account__c", ProjectWebServices.getIdOf("Account", I.amPerforming().propertiesFileOperationsTo().getValue("grantorAutomationOrg")));
        } else {
            programBody.addProperty("PrimaryFundingOrganization__c", ProjectWebServices.getIdOf("Account", I.amPerforming().propertiesFileOperationsTo().getValue("externalAutomationOrg")));
            programBody.addProperty("Account__c", ProjectWebServices.getIdOf("Account", I.amPerforming().propertiesFileOperationsTo().getValue("externalAutomationOrg")));
        }
        programBody.addProperty("OwnerId", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("PM Username")));
        programBody.addProperty("Abbreviation__c", "GOV");
        programBody.addProperty("FocusAreaRequired__c", "Yes");
        programBody.addProperty("Objectives__c", "Automation Objectives");
        programBody.addProperty("AuthorizedSignatory__c", ProjectWebServices.getIdOf("Contact", I.amPerforming().propertiesFileOperationsTo().getValue("EXE Username")));

        program.add("body", programBody);
        compositeRequest.add(program);


        // -------- KeyContacts__c --------
        JsonObject contact = new JsonObject();
        contact.addProperty("method", "POST");
        contact.addProperty("url", "/services/data/v66.0/sobjects/KeyContacts__c");
        contact.addProperty("referenceId", "ContactRef1");

        JsonObject contactBody = new JsonObject();
        contactBody.addProperty("Program__c", "@{ProgramRef1.id}");
        contactBody.addProperty("Contact__c", ProjectWebServices.getIdOf("Contact", I.amPerforming().propertiesFileOperationsTo().getValue("EXE Username")));

        contact.add("body", contactBody);
        compositeRequest.add(contact);


        // -------- Peer Reviewer --------
        JsonObject peerReview = new JsonObject();
        peerReview.addProperty("method", "POST");
        peerReview.addProperty("url", "/services/data/v66.0/sobjects/RolesAndResponsibilities__c");
        peerReview.addProperty("referenceId", "PeerReviewRef1");

        JsonObject peerBody = new JsonObject();
        peerBody.addProperty("Program__c", "@{ProgramRef1.id}");
        peerBody.addProperty("Name__c", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("FO Username")));
        peerBody.addProperty("Responsibility__c", "Test Automation responsibility");
        peerBody.addProperty("ReviewerRole__c", "Program Reviewer");
        peerBody.addProperty("DueDate__c", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(7, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        peerBody.addProperty("Status__c", "Created");
        peerBody.addProperty("BusinessRole__c", "Program Reviewer");

        peerReview.add("body", peerBody);
        compositeRequest.add(peerReview);


        // -------- Approver Step1 --------
        JsonObject approver1 = new JsonObject();
        approver1.addProperty("method", "POST");
        approver1.addProperty("url", "/services/data/v66.0/sobjects/RolesAndResponsibilities__c");
        approver1.addProperty("referenceId", "ApproverRef1");

        JsonObject approverBody1 = new JsonObject();
        approverBody1.addProperty("Program__c", "@{ProgramRef1.id}");
        approverBody1.addProperty("Name__c", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("PM Username")));
        approverBody1.addProperty("ProgramRole__c", "Step1");
        approverBody1.addProperty("BusinessRole__c", "Step1");
        approverBody1.addProperty("CustomApp__c", "Grantor");
        approverBody1.addProperty("RecordApiName__c", "Program__c");
        approverBody1.addProperty("RoleApiName__c", "ProgramRole__c");

        approver1.add("body", approverBody1);
        compositeRequest.add(approver1);


        // -------- Approver Step2 --------
        JsonObject approver2 = new JsonObject();
        approver2.addProperty("method", "POST");
        approver2.addProperty("url", "/services/data/v66.0/sobjects/RolesAndResponsibilities__c");
        approver2.addProperty("referenceId", "ApproverRef2");

        JsonObject approverBody2 = new JsonObject();
        approverBody2.addProperty("Program__c", "@{ProgramRef1.id}");
        approverBody2.addProperty("Name__c", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("EXE Username")));
        approverBody2.addProperty("ProgramRole__c", "Step2");
        approverBody2.addProperty("BusinessRole__c", "Step2");
        approverBody2.addProperty("CustomApp__c", "Grantor");
        approverBody2.addProperty("RecordApiName__c", "Program__c");
        approverBody2.addProperty("RoleApiName__c", "ProgramRole__c");

        approver2.add("body", approverBody2);
        compositeRequest.add(approver2);


        // -------- Service Area --------
        JsonObject serviceArea = new JsonObject();
        serviceArea.addProperty("method", "POST");
        serviceArea.addProperty("url", "/services/data/v66.0/sobjects/ProgramServiceArea__c");
        serviceArea.addProperty("referenceId", "ServiceAreaRef2");

        JsonObject serviceBody = new JsonObject();
        serviceBody.addProperty("Program__c", "@{ProgramRef1.id}");
        serviceBody.addProperty("ServiceArea__c", ProjectWebServices.getIdOf("ServiceArea__c", I.amPerforming().propertiesFileOperationsTo().getValue("focusArea")));

        serviceArea.add("body", serviceBody);
        compositeRequest.add(serviceArea);


        // -------- KPI Goals --------
        JsonObject kpiGoal = new JsonObject();
        kpiGoal.addProperty("method", "POST");
        kpiGoal.addProperty("url", "/services/data/v66.0/sobjects/KPIGoalsObjectives__c");
        kpiGoal.addProperty("referenceId", "KPIGoalRef1");

        JsonObject kpiBody = new JsonObject();
        kpiBody.addProperty("Program__c", "@{ProgramRef1.id}");
        kpiBody.addProperty("StrategicPlan__c", ProjectWebServices.getIdOf("StrategicPlan__c", I.amPerforming().propertiesFileOperationsTo().getValue("strategicPlanObjective")));

        kpiGoal.add("body", kpiBody);
        compositeRequest.add(kpiGoal);


        // -------- Key Outcome --------
        JsonObject keyOutcome = new JsonObject();
        keyOutcome.addProperty("method", "POST");
        keyOutcome.addProperty("url", "/services/data/v66.0/sobjects/KeyOutcome__c");
        keyOutcome.addProperty("referenceId", "KeyOutcomeRef1");

        JsonObject outcomeBody = new JsonObject();
        outcomeBody.addProperty("Program__c", "@{ProgramRef1.id}");
        outcomeBody.addProperty("MasterKPI__c", ProjectWebServices.getIdOf("MasterKPI__c", I.amPerforming().propertiesFileOperationsTo().getValue("KPITitle")));

        keyOutcome.add("body", outcomeBody);
        compositeRequest.add(keyOutcome);


        // -------- File Upload --------
        JsonObject file = new JsonObject();
        file.addProperty("method", "POST");
        file.addProperty("url", "/services/data/v66.0/sobjects/ContentVersion");
        file.addProperty("referenceId", "FileRef1");

        JsonObject fileBody = new JsonObject();
        fileBody.addProperty("Title", "Other Artifacts");
        fileBody.addProperty("PathOnClient", "Attachment.pdf");
        fileBody.addProperty("GNT__Classification__c", "Other Artifacts");
        fileBody.addProperty("Description", "Automation Test File");
        fileBody.addProperty("VersionData", "VGVzdCBQZGY=");
        fileBody.addProperty("FirstPublishLocationId", "@{ProgramRef1.id}");

        file.add("body", fileBody);
        compositeRequest.add(file);

        graph.add("compositeRequest", compositeRequest);
        graphs.add(graph);
        request.add("graphs", graphs);

        return request;
    }

    /**
     * Builds Amendment Request payload based on inputs and filter.
     *
     * @param amendmentType the Amendment Type (RecordType)
     * @param award         the Award Salesforce ID
     * @param status        the Amendment Request status
     * @param filter        payload modifier (e.g., "default")
     * @return JsonObject request payload
     */
    public JsonObject payloadAmendmentRequestCreation(String amendmentType, String recordType, String award, String status, String filter) {
        JsonObject json = defaultPayloadAmendmentRequest(amendmentType, recordType, award, status);
        switch (filter.toUpperCase()) {
            default:
                return json;
        }
    }

    /**
     * Creates default Amendment Request payload with status-based fields
     * and optional role assignment for "Created" status.
     *
     * @param amendmentType the Amendment Type (RecordType)
     * @param award         the Award Salesforce ID
     * @param status        the Amendment Request status
     * @return JsonObject structured composite API payload
     */
    public JsonObject defaultPayloadAmendmentRequest(String amendmentType, String recordType, String award, String status) {
        JsonObject request = new JsonObject();
        JsonArray graphs = new JsonArray();
        JsonObject graph = new JsonObject();
        graph.addProperty("graphId", "AmendmentRequestGraph");
        JsonArray compositeRequest = new JsonArray();
        JsonObject amendment = new JsonObject();
        amendment.addProperty("method", "POST");
        amendment.addProperty("url", "/services/data/v66.0/sobjects/AmendmentRequest__c");
        amendment.addProperty("referenceId", "AmendmentRequest1");
        JsonObject body = new JsonObject();
        body.addProperty("Status__c", status);
        body.addProperty("Award__c", ProjectWebServices.getIdOf("Award__c", award));
        body.addProperty("AmendmentType__c", amendmentType);
        switch (status.toLowerCase()) {

            case "created":
                body.addProperty("OwnerId", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("PM Username")));
                body.addProperty("RecordTypeId", ProjectWebServices.getRecordTypeId("AmendmentRequest__c", recordType));
                body.addProperty("PurposeRTA__c", "test");
                body.addProperty("Impact__c", "test");
                body.addProperty("Justification__c", "test");
                body.addProperty("BudgetPeriodComments__c", "test");
                body.addProperty("FundingChangeJustification__c", "test");
                body.addProperty("ScopeofWorkChangeDescription__c", "test");
                body.addProperty("NewBudgetPeriodEndDate__c", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3800, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
                if(amendmentType.equalsIgnoreCase("Periodic Renewal")) {
                    body.addProperty("RequestedChangeInBudget__c", 2000);
                }else {
                    body.addProperty("RequestedChangeInBudget__c", 1000);
                }
                body.addProperty("RevisedCommitment__c", 4000);
                body.addProperty("GrantAwardDescription__c", "Change on Amendment Level");
                body.addProperty("GrantAwardName__c", award);
                body.addProperty("Interceptor__c", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("PM Username")));
                body.addProperty("TncComments__c", "Automation test");
                body.addProperty("Addressline1__c", "Street 1");
                body.addProperty("Addressline2__c", "Joint Road");
                body.addProperty("City__c", "Cal");
                body.addProperty("County__c", "New County");
                body.addProperty("State__c", "AK");
                body.addProperty("CongressionalDistrict__c", "123");
                body.addProperty("Zip4__c", "12345");
                body.addProperty("Country__c", "USA");
                body.addProperty("ZipCode4Extension__c", "1234");
                body.addProperty("ProposedBudgetEndDate__c", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3800, DateTimeFormatter.ofPattern("yyyy-MM-dd")));


                // -------- BudgetSummaryFocusArea --------
                JsonArray budgetSummaryFocusArea = new JsonArray();
                JsonObject focus1 = new JsonObject();
                focus1.addProperty("Title", "Automation Permanent Focus Area");
                if(amendmentType.equalsIgnoreCase("Periodic Renewal")) {
                    focus1.addProperty("GATStartDate__c", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3651, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
                    focus1.addProperty("GATEndDate__c", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3800, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
                } else {
                    focus1.addProperty("NewObligation__c", 500);
                }
                JsonObject focus2 = new JsonObject();
                focus2.addProperty("Title", "Automation Permanent Focus Area2");
                if(amendmentType.equalsIgnoreCase("Periodic Renewal")) {
                    focus2.addProperty("GATStartDate__c", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3651, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
                    focus2.addProperty("GATEndDate__c", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3800, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
                } else {
                    focus2.addProperty("NewObligation__c", 500);
                }
                budgetSummaryFocusArea.add(focus1);
                budgetSummaryFocusArea.add(focus2);
                request.add("BudgetSummaryFocusArea", budgetSummaryFocusArea);

                // -------- FundingAccount --------
                JsonArray fundingAccount = new JsonArray();
                JsonObject funding = new JsonObject();
                funding.addProperty("Title", I.amPerforming().propertiesFileOperationsTo().getValue("fundingAccount"));
                funding.addProperty("ActualEncumbrance__c", 2000);
                fundingAccount.add(funding);
                request.add("FundingAccount", fundingAccount);

                break;

            case "sent to subrecipient":
                body.addProperty("Justification__c", "Automation justification");
                body.addProperty("BudgetPeriodComments__c", "Automation comments");

                // -------- Budget Detailed Ref 1 --------
                JsonObject budgetDetailed1 = new JsonObject();

                budgetDetailed1.addProperty("method", "POST");
                budgetDetailed1.addProperty("url", "/services/data/v66.0/sobjects/AmendmentRequestBudgetCategory__c");
                budgetDetailed1.addProperty("referenceId", "BudgetDetailedRef1");

                JsonObject body1 = new JsonObject();
                body1.addProperty("AmendmentRequest__c", "@{AmendmentRequest1.id}");
                body1.addProperty("BudgetCategoryName__c", "Equipment");
                body1.addProperty("ServiceAreaTitle__c", "Automation Permanent Focus Area2");
                body1.addProperty("CurrentAmount__c", 500);
                body1.addProperty("CashMatch__c", 200);
                body1.addProperty("NonCashMatch__c", 100);
                body1.addProperty("OtherLeverage__c", 0);

                budgetDetailed1.add("body", body1);
                compositeRequest.add(budgetDetailed1);

                // -------- Budget Detailed Ref 2 --------
                JsonObject budgetDetailed2 = new JsonObject();

                budgetDetailed2.addProperty("method", "POST");
                budgetDetailed2.addProperty("url", "/services/data/v66.0/sobjects/AmendmentRequestBudgetCategory__c");
                budgetDetailed2.addProperty("referenceId", "BudgetDetailedRef2");

                JsonObject body2 = new JsonObject();
                body2.addProperty("AmendmentRequest__c", "@{AmendmentRequest1.id}");
                body2.addProperty("BudgetCategoryName__c", "Miscellaneous");
                body2.addProperty("ServiceAreaTitle__c", "Automation Permanent Focus Area");
                body2.addProperty("CurrentAmount__c", 500);
                body2.addProperty("CashMatch__c", 100);
                body2.addProperty("NonCashMatch__c", 100);
                body2.addProperty("OtherLeverage__c", 0.0);

                budgetDetailed2.add("body", body2);
                compositeRequest.add(budgetDetailed2);

                break;

            case "acknowledged":
                break;

            case "submitted for approval":
                body.addProperty("Justification__c", "Submitted for approval via automation");
                break;

            case "approved":
                body.addProperty("Justification__c", "Approved via automation");
                break;

            default:
                break;
        }

        amendment.add("body", body);
        compositeRequest.add(amendment);
        if (status.equalsIgnoreCase("Created")) {
            JsonObject role = new JsonObject();
            role.addProperty("method", "POST");
            role.addProperty("url", "/services/data/v66.0/sobjects/RolesAndResponsibilities__c");
            role.addProperty("referenceId", "RoleRef1");

            JsonObject roleBody = new JsonObject();

            roleBody.addProperty("AmendmentRequest__c", "@{AmendmentRequest1.id}");
            roleBody.addProperty("Name__c", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("PM Username")));
            roleBody.addProperty("AmendmentRequestRole__c", "Step1");
            roleBody.addProperty("BusinessRole__c", "Step1");
            roleBody.addProperty("CustomApp__c", "Grantor");
            roleBody.addProperty("RecordApiName__c", "AmendmentRequest__c");
            roleBody.addProperty("OwnerId", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("PM Username")));
            roleBody.addProperty("ApproverAPIName__c", "ProgramApprover__c");
            roleBody.addProperty("Agency__c", ProjectWebServices.getIdOf("Account", I.amPerforming().propertiesFileOperationsTo().getValue("grantorAutomationOrg")));

            role.add("body", roleBody);
            compositeRequest.add(role);
        }
        graph.add("compositeRequest", compositeRequest);
        graphs.add(graph);
        request.add("graphs", graphs);
        return request;
    }

    public JsonObject payloadSubrecipientSideAmendmentRequestCreation(String amendmentType, String recordType, String award, String status, String filter) {
        JsonObject json = defaultPayloadSubrecipientSideAmendmentRequest(amendmentType, recordType, award, status);
        switch (filter.toUpperCase()) {
            default:
                return json;
        }
    }

    private JsonObject defaultPayloadSubrecipientSideAmendmentRequest(String amendmentType, String recordType, String award, String status) {

        JsonObject request = new JsonObject();

        JsonArray graphs = new JsonArray();
        JsonObject graph = new JsonObject();

        graph.addProperty("graphId", "AmendmentRequestGraph");

        JsonArray compositeRequest = new JsonArray();

        JsonObject amendment = new JsonObject();
        amendment.addProperty("url", "/services/data/v66.0/sobjects/AmendmentRequest__c");
        amendment.addProperty("method", "POST");
        amendment.addProperty("referenceId", "AmendmentRequest1");

        JsonObject amendmentBody = new JsonObject();
        amendmentBody.addProperty("Status__c", status);
        amendmentBody.addProperty("OwnerId", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("SPI3 Username")));
        amendmentBody.addProperty("Award__c", ProjectWebServices.getIdOf("Award__c", award));
        amendmentBody.addProperty("RecordTypeId", ProjectWebServices.getRecordTypeId("AmendmentRequest__c", recordType));
        amendmentBody.addProperty("AmendmentType__c", amendmentType);
        amendmentBody.addProperty("PurposeRTA__c", "Automation Test");
        amendmentBody.addProperty("Impact__c", "Automation Test");
        amendmentBody.addProperty("ContactChangeDescription__c", "Automation Test");
        amendmentBody.addProperty("Justification__c", "Automation Test");
        amendmentBody.addProperty("BudgetPeriodComments__c", "Automation Test");
        amendmentBody.addProperty("TncComments__c", "Automation Test");
        amendmentBody.addProperty("FundingChangeJustification__c", "Automation Test");
        amendmentBody.addProperty("ScopeofWorkChangeDescription__c", "Automation Test");
        amendmentBody.addProperty("InitiatedBy__c", "Subrecipient");
        amendmentBody.addProperty("GrantAwardDescription__c", "Change on Amendment Level");
        amendmentBody.addProperty("GrantAwardName__c", award);
        amendmentBody.addProperty("TncComments__c", "Automation test");
        amendmentBody.addProperty("Addressline1__c", "Street 1");
        amendmentBody.addProperty("Addressline2__c", "Joint Road");
        amendmentBody.addProperty("City__c", "Cal");
        amendmentBody.addProperty("County__c", "New County");
        amendmentBody.addProperty("State__c", "AK");
        amendmentBody.addProperty("CongressionalDistrict__c", "123");
        amendmentBody.addProperty("Zip4__c", "12345");
        amendmentBody.addProperty("Country__c", "USA");
        amendmentBody.addProperty("ZipCode4Extension__c", "1234");
        amendmentBody.addProperty("NewBudgetPeriodEndDate__c", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3800, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        amendmentBody.addProperty("Interceptor__c", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("PM Username")));

        amendment.add("body", amendmentBody);
        compositeRequest.add(amendment);

        // -------- Budget Detailed Ref 1 --------
        JsonObject budgetDetailed1 = new JsonObject();

        budgetDetailed1.addProperty("method", "POST");
        budgetDetailed1.addProperty("url", "/services/data/v66.0/sobjects/AmendmentRequestBudgetCategory__c");
        budgetDetailed1.addProperty("referenceId", "BudgetDetailedRef1");

        JsonObject body1 = new JsonObject();
        body1.addProperty("AmendmentRequest__c", "@{AmendmentRequest1.id}");
        body1.addProperty("BudgetCategoryName__c", "Construction");
        body1.addProperty("ServiceAreaTitle__c", "Automation Permanent Focus Area2");
        body1.addProperty("CurrentAmount__c", 450);
        body1.addProperty("CashMatch__c", 50);
        body1.addProperty("NonCashMatch__c", 50);
        body1.addProperty("OtherLeverage__c", 0);

        budgetDetailed1.add("body", body1);
        compositeRequest.add(budgetDetailed1);

        // -------- Budget Detailed Ref 3 --------
        JsonObject budgetDetailed3 = new JsonObject();

        budgetDetailed3.addProperty("method", "POST");
        budgetDetailed3.addProperty("url", "/services/data/v66.0/sobjects/AmendmentRequestBudgetCategory__c");
        budgetDetailed3.addProperty("referenceId", "BudgetDetailedRef3");

        JsonObject body3 = new JsonObject();
        body3.addProperty("AmendmentRequest__c", "@{AmendmentRequest1.id}");
        body3.addProperty("BudgetCategoryName__c", "Equipment");
        body3.addProperty("ServiceAreaTitle__c", "Automation Permanent Focus Area2");
        body3.addProperty("CurrentAmount__c", 50);
        body3.addProperty("CashMatch__c", 5);
        body3.addProperty("NonCashMatch__c", 5);
        body3.addProperty("OtherLeverage__c", 0);

        budgetDetailed3.add("body", body3);
        compositeRequest.add(budgetDetailed3);

        // -------- Budget Detailed Ref 2 --------
        JsonObject budgetDetailed2 = new JsonObject();

        budgetDetailed2.addProperty("method", "POST");
        budgetDetailed2.addProperty("url", "/services/data/v66.0/sobjects/AmendmentRequestBudgetCategory__c");
        budgetDetailed2.addProperty("referenceId", "BudgetDetailedRef2");

        JsonObject body2 = new JsonObject();
        body2.addProperty("AmendmentRequest__c", "@{AmendmentRequest1.id}");
        body2.addProperty("BudgetCategoryName__c", "Construction");
        body2.addProperty("ServiceAreaTitle__c", "Automation Permanent Focus Area");
        body2.addProperty("CurrentAmount__c", 450);
        body2.addProperty("CashMatch__c", 50);
        body2.addProperty("NonCashMatch__c", 50);
        body2.addProperty("OtherLeverage__c", 0);

        budgetDetailed2.add("body", body2);
        compositeRequest.add(budgetDetailed2);

        // -------- Budget Detailed Ref 4 --------
        JsonObject budgetDetailed4 = new JsonObject();

        budgetDetailed4.addProperty("method", "POST");
        budgetDetailed4.addProperty("url", "/services/data/v66.0/sobjects/AmendmentRequestBudgetCategory__c");
        budgetDetailed4.addProperty("referenceId", "BudgetDetailedRef4");

        JsonObject body4 = new JsonObject();
        body4.addProperty("AmendmentRequest__c", "@{AmendmentRequest1.id}");
        body4.addProperty("BudgetCategoryName__c", "Equipment");
        body4.addProperty("ServiceAreaTitle__c", "Automation Permanent Focus Area");
        body4.addProperty("CurrentAmount__c", 50);
        body4.addProperty("CashMatch__c", 5);
        body4.addProperty("NonCashMatch__c", 5);
        body4.addProperty("OtherLeverage__c", 0);

        budgetDetailed4.add("body", body4);
        compositeRequest.add(budgetDetailed4);

        // -------- KeyContacts__c --------
        JsonObject keyContact = new JsonObject();
        keyContact.addProperty("method", "POST");
        keyContact.addProperty("url", "/services/data/v66.0/sobjects/KeyContacts__c");
        keyContact.addProperty("referenceId", "keycontact1");

        JsonObject keyContactBody = new JsonObject();
        keyContactBody.addProperty("AmendmentRequest__c", "@{AmendmentRequest1.id}");
        keyContactBody.addProperty("ProjectRole__c", "Authorized Signatory");
        keyContactBody.addProperty("CurrentContact__c", ProjectWebServices.getIdOf("Contact", I.amPerforming().propertiesFileOperationsTo().getValue("SPA Username")));
        keyContactBody.addProperty("Contact__c", ProjectWebServices.getIdOf("Contact", I.amPerforming().propertiesFileOperationsTo().getValue("SPA Username")));
        keyContactBody.addProperty("IsKeyContact__c", true);

        keyContact.add("body", keyContactBody);
        compositeRequest.add(keyContact);

        JsonObject role = new JsonObject();
        role.addProperty("method", "POST");
        role.addProperty("url", "/services/data/v66.0/sobjects/RolesAndResponsibilities__c");
        role.addProperty("referenceId", "RoleRef1");

        JsonObject roleBody = new JsonObject();
        roleBody.addProperty("AmendmentRequest__c", "@{AmendmentRequest1.id}");
        roleBody.addProperty("Name__c", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("PM Username")));
        roleBody.addProperty("AmendmentRequestRole__c", "Step1");
        roleBody.addProperty("BusinessRole__c", "Step1");
        roleBody.addProperty("CustomApp__c", "Grantor");
        roleBody.addProperty("RecordApiName__c", "AmendmentRequest__c");
        roleBody.addProperty("OwnerId", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("PM Username")));
        roleBody.addProperty("ApproverAPIName__c", "ProgramApprover__c");
        roleBody.addProperty("Agency__c", ProjectWebServices.getIdOf("Account", I.amPerforming().propertiesFileOperationsTo().getValue("grantorAutomationOrg")));

        role.add("body", roleBody);
        compositeRequest.add(role);

        graph.add("compositeRequest", compositeRequest);
        graphs.add(graph);
        request.add("graphs", graphs);
        return request;
    }

    public JsonObject payloadApplicationCreationForTitle(String title, String announcement, String preAppTitle, String status, String filter) {
        JsonObject json;
        json = defaultPayloadApplicationCreationForTitle(title, announcement, preAppTitle, status);
        switch (filter.toUpperCase()) {
            default:
                return json;
        }
    }

    private JsonObject defaultPayloadApplicationCreationForTitle(String title, String announcement, String preAppTitle, String status) {
        JsonObject request = new JsonObject();
        JsonArray graphs = new JsonArray();
        JsonObject graph = new JsonObject();
        graph.addProperty("graphId", "ApplicationGraph");
        JsonArray compositeRequest = new JsonArray();

        JsonObject app = new JsonObject();
        app.addProperty("url", "/services/data/v66.0/sobjects/Application__c");
        app.addProperty("method", "POST");
        app.addProperty("referenceId", "Application1");

        JsonObject appBody = new JsonObject();
        appBody.addProperty("Status__c", status);
        if (preAppTitle != null && !preAppTitle.isEmpty()) {
            appBody.addProperty("PreApplication__c", ProjectWebServices.getIdOf("PreApplication__c", preAppTitle));
        } else {
            appBody.addProperty("PreApplication__c", preAppTitle);
        }
        appBody.addProperty("Title__c", title);
        appBody.addProperty("OwnerId", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("SPI3 Username")));
        appBody.addProperty("Announcement__c", ProjectWebServices.getIdOf("Announcement__c", announcement));
        appBody.addProperty("OpportunityTitle__c", announcement);
        appBody.addProperty("ApplicationDueDate__c", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(10, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        appBody.addProperty("ApproachMethodology__c", "Automation Approach");
        appBody.addProperty("Capacity__c", "Automation Capacity");
        appBody.addProperty("Qualifications__c", "Automation AQualifications");
        appBody.addProperty("Acknowledgment4__c", "I Agree");
        appBody.addProperty("SubmittedOn__c", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        appBody.addProperty("SubmittedBy__c", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("SPI3 Username")));
        appBody.addProperty("ProjectAbstract__c", "Automation Project Abstract");
        appBody.addProperty("Justification__c", "Automation Justifications");
        appBody.addProperty("RecordTypeId", ProjectWebServices.getRecordTypeId("Application__c", "Grantor"));
        appBody.addProperty("State__c", "IN");
        appBody.addProperty("CongressionalDistrict1__c", "123");
        appBody.addProperty("Addressline1__c", "test");
        appBody.addProperty("City__c", "IL");
        appBody.addProperty("County__c", "US");
        appBody.addProperty("Zip4__c", "12534");
        appBody.addProperty("Addressline2__c", "test2");
        appBody.addProperty("ZipCode4Extension__c", "1234");
        appBody.addProperty("Country__c", "India");
        appBody.addProperty("AwardFloor__c", 1000);
        appBody.addProperty("AwardCeiling__c", 10000);

        app.add("body", appBody);
        compositeRequest.add(app);

        // -------- KeyContacts__c --------
        JsonObject contact = new JsonObject();
        contact.addProperty("method", "POST");
        contact.addProperty("url", "/services/data/v66.0/sobjects/KeyContacts__c");
        contact.addProperty("referenceId", "ContactRef1");

        JsonObject contactBody = new JsonObject();
        contactBody.addProperty("Application__c", "@{Application1.id}");
        contactBody.addProperty("Contact__c", ProjectWebServices.getIdOf("Contact", I.amPerforming().propertiesFileOperationsTo().getValue("SPI3 Username")));
        contactBody.addProperty("OwnerId", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("SPI3 Username")));
        contactBody.addProperty("ProjectRole__c", "Project Director/Manager");
        contactBody.addProperty("IsKeyContact__c", true);

        contact.add("body", contactBody);
        compositeRequest.add(contact);

        // -------- Budget Category 1 --------
        JsonObject budget1 = new JsonObject();
        budget1.addProperty("method", "POST");
        budget1.addProperty("url", "/services/data/v66.0/sobjects/ApplicationBudgetCategory2__c");
        budget1.addProperty("referenceId", "BudgetDetailedRef1");

        JsonObject budgetBody1 = new JsonObject();
        budgetBody1.addProperty("Application__c", "@{Application1.id}");
        budgetBody1.addProperty("CatName__c", "Construction");
        budgetBody1.addProperty("GrantorAmount__c", 500);
        budgetBody1.addProperty("CashMatch__c", 50);
        budgetBody1.addProperty("NonCashMatch__c", 50);

        budget1.add("body", budgetBody1);
        compositeRequest.add(budget1);

        // -------- Budget Category 2 --------
        JsonObject budget2 = new JsonObject();
        budget2.addProperty("method", "POST");
        budget2.addProperty("url", "/services/data/v66.0/sobjects/ApplicationBudgetCategory2__c");
        budget2.addProperty("referenceId", "BudgetDetailedRef2");

        JsonObject budgetBody2 = new JsonObject();
        budgetBody2.addProperty("Application__c", "@{Application1.id}");
        budgetBody2.addProperty("CatName__c", "Equipment");
        budgetBody2.addProperty("GrantorAmount__c", 500);
        budgetBody2.addProperty("CashMatch__c", 50);
        budgetBody2.addProperty("NonCashMatch__c", 50);

        budget2.add("body", budgetBody2);
        compositeRequest.add(budget2);
        graph.add("compositeRequest", compositeRequest);

        // -------- KeyOutcome__c --------
        JsonObject keyOutcome = new JsonObject();

        keyOutcome.addProperty("method", "POST");
        keyOutcome.addProperty("url", "/services/data/v66.0/sobjects/KeyOutcome__c");
        keyOutcome.addProperty("referenceId", "KeyOutcomeRef2");

        JsonObject keyOutcomeBody = new JsonObject();

        keyOutcomeBody.addProperty("Application__c", "@{Application1.id}");
        keyOutcomeBody.addProperty("masterKPITitle", I.amPerforming().propertiesFileOperationsTo().getValue("KPITitle"));
        keyOutcomeBody.addProperty("Target__c", 10);

        keyOutcome.add("body", keyOutcomeBody);
        compositeRequest.add(keyOutcome);

        JsonArray appFormArray = new JsonArray();

        JsonObject form = new JsonObject();
        form.addProperty("Application__c", "@{Application1.id}");
        form.addProperty("Question1__c", "Test Clause Name for Automation");
        form.addProperty("Question2__c", "This is a long description used for automation testing of clause behavior and validations.");
        form.addProperty("Question3__c", "This is a long description used");
        form.addProperty("Question4__c", "5-10 years");
        form.addProperty("Question5__c", "Test Clause Name for Automation");
        form.addProperty("Question6__c", "This is a long description used for automation testing of clause behavior and validations.");
        form.addProperty("Question7__c", "This is a long description used");
        form.addProperty("Question8__c", "5-10 years");
        form.addProperty("Question9__c", "Test Clause Name for Automation");
        form.addProperty("Question10__c", "This is a long description used for automation testing of clause behavior and validations.");
        form.addProperty("Question11__c", "This is a long description used");
        form.addProperty("ExperienceLevel__c", "5-10 years");
        form.addProperty("AppplicationSubmitted__c", "Automation SPI3");
        form.addProperty("SubmittedOnForm__c", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));

        appFormArray.add(form);

        graph.add("ApplicationForm", appFormArray);

        graphs.add(graph);
        request.add("graphs", graphs);
        return request;
    }

    public JsonObject applicationReviewForMultipleRecords(String announcementName) {
        JsonObject json;
        json = defaultPayloadApplicationReviewForMultipleRecords(announcementName);
        return json;
    }

    private JsonObject defaultPayloadApplicationReviewForMultipleRecords(String announcementName) {

        JsonObject request = new JsonObject();

        JsonArray graphs = new JsonArray();
        JsonObject graph = new JsonObject();

        graph.addProperty("graphId", "IntiateReviewGraph");

        JsonArray compositeRequest = new JsonArray();

        JsonObject announcement = new JsonObject();
        announcement.addProperty("url", "/services/data/v66.0/sobjects/Announcement__c");
        announcement.addProperty("method", "POST");
        announcement.addProperty("referenceId", "AnnouncementReviewStep1");

        JsonObject body = new JsonObject();
        body.addProperty("AnnouncementName__c", announcementName);

        announcement.add("body", body);
        compositeRequest.add(announcement);

        graph.add("compositeRequest", compositeRequest);
        graphs.add(graph);
        request.add("graphs", graphs);
        return request;
    }

    public JsonObject preScreenReviewForMultipleRecordsOnAnnouncement(String announcementName, String reviewerName, String filter) {
        JsonObject json;
        json = defaultPayloadPreScreenReviewForMultipleRecordsOnAnnouncement(announcementName, reviewerName);
        switch (filter.toUpperCase()) {
            default:
                return json;
        }
    }

    private JsonObject defaultPayloadPreScreenReviewForMultipleRecordsOnAnnouncement(String announcementName, String reviewerName) {

        JsonObject request = new JsonObject();

        JsonArray graphs = new JsonArray();
        JsonObject graph = new JsonObject();

        graph.addProperty("graphId", "ReviewStepGraph");

        JsonArray compositeRequest = new JsonArray();


        // -------- ReviewStep__c --------
        JsonObject reviewStep = new JsonObject();
        reviewStep.addProperty("method", "POST");
        reviewStep.addProperty("url", "/services/data/v66.0/sobjects/ReviewStep__c");
        reviewStep.addProperty("referenceId", "ReviewStepStep1");

        JsonObject reviewStepBody = new JsonObject();
        reviewStepBody.addProperty("Name", "Pre-Screen Review");
        reviewStepBody.addProperty("Announcement__c", ProjectWebServices.getIdOf("Announcement__c", announcementName));

        reviewStep.add("body", reviewStepBody);
        compositeRequest.add(reviewStep);


        // -------- ReviewPanel__c --------
        JsonObject reviewPanel = new JsonObject();
        reviewPanel.addProperty("method", "POST");
        reviewPanel.addProperty("url", "/services/data/v66.0/sobjects/ReviewPanel__c");
        reviewPanel.addProperty("referenceId", "ReviewPanel1");

        JsonObject panelBody = new JsonObject();
        panelBody.addProperty("ReviewStep__c", "@{ReviewStepStep1.id}");
        panelBody.addProperty("PanelName__c", "Pre-Screen");
        panelBody.addProperty("MinimumNumberOfReviewers__c", 1);
        panelBody.addProperty("Required__c", true);
        panelBody.addProperty("DueInDays__c", 7);

        reviewPanel.add("body", panelBody);
        compositeRequest.add(reviewPanel);


        // -------- ReviewStepUser__c --------
        JsonObject reviewUser = new JsonObject();
        reviewUser.addProperty("method", "POST");
        reviewUser.addProperty("url", "/services/data/v66.0/sobjects/ReviewStepUser__c");
        reviewUser.addProperty("referenceId", "ReviewStepUser1");

        JsonObject userBody = new JsonObject();
        userBody.addProperty("ReviewStep__c", "@{ReviewStepStep1.id}");
        userBody.addProperty("Reviewer__c", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("FO Username")));
        userBody.addProperty("NoOfApplicationsAssigned__c", 1);

        reviewUser.add("body", userBody);
        compositeRequest.add(reviewUser);

        // -------- Review__c --------
        JsonObject review = new JsonObject();
        review.addProperty("method", "POST");
        review.addProperty("url", "/services/data/v66.0/sobjects/Review__c");

        review.addProperty("referenceId", "ReviewStepUser1");

        JsonObject reviewBody = new JsonObject();
        reviewBody.addProperty("ReviewStep__c", "@{ReviewStepStep1.id}");
        reviewBody.addProperty("ConflictOfInterest__c", "I agree");
        reviewBody.addProperty("Recommendation__c", "Recommended");
        reviewBody.addProperty("Comments__c", "REI System Competitive Announcement added on Review Record");
        reviewBody.addProperty("Status__c", "Review Completed");
        reviewBody.addProperty("Score__c", "80");

        review.add("body", reviewBody);
        compositeRequest.add(review);

        graph.add("compositeRequest", compositeRequest);
        graphs.add(graph);
        request.add("graphs", graphs);
        return request;
    }

    public JsonObject submitPreScreenReviewForAnnouncements(String reviewName, String announcementName, String applicationName, String filter) {
        JsonObject json;
        json = defaultPayloadSubmitPreScreenReviewForAnnouncements(reviewName, announcementName, applicationName);
        switch (filter.toUpperCase()) {
            default:
                return json;
        }
    }

    private JsonObject defaultPayloadSubmitPreScreenReviewForAnnouncements(String reviewName, String announcementName, String applicationName) {

        JsonObject request = new JsonObject();

        JsonArray graphs = new JsonArray();
        JsonObject graph = new JsonObject();

        graph.addProperty("graphId", "ReviewStepGraph");

        JsonArray compositeRequest = new JsonArray();

        // -------- ReviewStep__c --------
        JsonObject reviewStep = new JsonObject();
        reviewStep.addProperty("method", "POST");
        reviewStep.addProperty("url", "/services/data/v66.0/sobjects/ReviewStep__c");
        reviewStep.addProperty("referenceId", "ReviewStepStep1");

        JsonObject reviewStepBody = new JsonObject();
        reviewStepBody.addProperty("Name", reviewName);
        reviewStepBody.addProperty("Announcement__c", ProjectWebServices.getIdOf("Announcement__c", announcementName));
        reviewStepBody.addProperty("Status__c", "Completed");

        reviewStep.add("body", reviewStepBody);
        compositeRequest.add(reviewStep);


        // -------- ReviewStepApplication__c --------
        JsonObject reviewStepApp = new JsonObject();
        reviewStepApp.addProperty("method", "POST");
        reviewStepApp.addProperty("url", "/services/data/v66.0/sobjects/ReviewStepApplication__c");
        reviewStepApp.addProperty("referenceId", "ReviewStepUser1");

        JsonObject appBody = new JsonObject();
        appBody.addProperty("ReviewStep__c", "@{ReviewStepStep1.id}");
        appBody.addProperty("Decision__c", "Approved");
        appBody.addProperty("ApplicationTitle", applicationName);

        reviewStepApp.add("body", appBody);
        compositeRequest.add(reviewStepApp);

        graph.add("compositeRequest", compositeRequest);
        graphs.add(graph);
        request.add("graphs", graphs);
        return request;
    }

    public JsonObject smeReviewForMultipleRecordsOnAnnouncement(String announcementName, String reviewerName, String reviewerName2, String reviewerName3, String filter) {
        JsonObject json;
        json = defaultPayloadSmeReviewForMultipleRecordsOnAnnouncement(announcementName, reviewerName, reviewerName2, reviewerName3);
        switch (filter.toUpperCase()) {
            default:
                return json;
        }
    }

    private JsonObject defaultPayloadSmeReviewForMultipleRecordsOnAnnouncement(String announcementName, String reviewerName, String reviewerName2, String reviewerName3) {

        JsonObject request = new JsonObject();

        JsonArray graphs = new JsonArray();
        JsonObject graph = new JsonObject();

        graph.addProperty("graphId", "ReviewStepGraph");

        JsonArray compositeRequest = new JsonArray();

        // -------- ReviewStep__c --------
        JsonObject reviewStep = new JsonObject();
        reviewStep.addProperty("method", "POST");
        reviewStep.addProperty("url", "/services/data/v66.0/sobjects/ReviewStep__c");
        reviewStep.addProperty("referenceId", "ReviewStepStep1");

        JsonObject reviewStepBody = new JsonObject();
        reviewStepBody.addProperty("Name", "SME Review");
        reviewStepBody.addProperty("Announcement__c", ProjectWebServices.getIdOf("Announcement__c", announcementName));

        reviewStep.add("body", reviewStepBody);
        compositeRequest.add(reviewStep);


        // -------- ReviewPanel__c (Compliance) --------
        JsonObject panel1 = new JsonObject();
        panel1.addProperty("method", "POST");
        panel1.addProperty("url", "/services/data/v66.0/sobjects/ReviewPanel__c");
        panel1.addProperty("referenceId", "ReviewPanel1");

        JsonObject panelBody1 = new JsonObject();
        panelBody1.addProperty("ReviewStep__c", "@{ReviewStepStep1.id}");
        panelBody1.addProperty("PanelName__c", "Compliance Review");
        panelBody1.addProperty("MinimumNumberOfReviewers__c", 1);
        panelBody1.addProperty("Required__c", true);
        panelBody1.addProperty("DueInDays__c", 7);

        panel1.add("body", panelBody1);
        compositeRequest.add(panel1);


        // -------- ReviewPanel__c (Fiscal) --------
        JsonObject panel2 = new JsonObject();
        panel2.addProperty("method", "POST");
        panel2.addProperty("url", "/services/data/v66.0/sobjects/ReviewPanel__c");
        panel2.addProperty("referenceId", "ReviewPanel2");

        JsonObject panelBody2 = new JsonObject();
        panelBody2.addProperty("ReviewStep__c", "@{ReviewStepStep1.id}");
        panelBody2.addProperty("PanelName__c", "Fiscal Review");
        panelBody2.addProperty("MinimumNumberOfReviewers__c", 1);
        panelBody2.addProperty("Required__c", true);
        panelBody2.addProperty("DueInDays__c", 7);

        panel2.add("body", panelBody2);
        compositeRequest.add(panel2);


        // -------- ReviewPanel__c (Program) --------
        JsonObject panel3 = new JsonObject();
        panel3.addProperty("method", "POST");
        panel3.addProperty("url", "/services/data/v66.0/sobjects/ReviewPanel__c");
        panel3.addProperty("referenceId", "ReviewPanel3");

        JsonObject panelBody3 = new JsonObject();
        panelBody3.addProperty("ReviewStep__c", "@{ReviewStepStep1.id}");
        panelBody3.addProperty("PanelName__c", "Program Review");
        panelBody3.addProperty("MinimumNumberOfReviewers__c", 1);
        panelBody3.addProperty("Required__c", true);
        panelBody3.addProperty("DueInDays__c", 7);

        panel3.add("body", panelBody3);
        compositeRequest.add(panel3);


        // -------- ReviewStepUser__c user 1--------
        JsonObject reviewUser = new JsonObject();
        reviewUser.addProperty("method", "POST");
        reviewUser.addProperty("url", "/services/data/v66.0/sobjects/ReviewStepUser__c");
        reviewUser.addProperty("referenceId", "ReviewStepUser1");

        JsonObject userBody = new JsonObject();
        userBody.addProperty("ReviewStep__c", "@{ReviewStepStep1.id}");
        userBody.addProperty("Reviewer__c", ProjectWebServices.getIdOf("User",reviewerName));
        userBody.addProperty("NoOfApplicationsAssigned__c", 1);

        reviewUser.add("body", userBody);
        compositeRequest.add(reviewUser);

        // -------- ReviewStepUser__c user 2--------
        JsonObject reviewUser2 = new JsonObject();
        reviewUser2.addProperty("method", "POST");
        reviewUser2.addProperty("url", "/services/data/v66.0/sobjects/ReviewStepUser__c");
        reviewUser2.addProperty("referenceId", "ReviewStepUser2");

        JsonObject userBody2 = new JsonObject();
        userBody2.addProperty("ReviewStep__c", "@{ReviewStepStep1.id}");
        userBody2.addProperty("Reviewer__c", ProjectWebServices.getIdOf("User",reviewerName2));
        userBody2.addProperty("NoOfApplicationsAssigned__c", 1);

        reviewUser2.add("body", userBody2);
        compositeRequest.add(reviewUser2);

        // -------- ReviewStepUser__c user 3--------
        JsonObject reviewUser3 = new JsonObject();
        reviewUser3.addProperty("method", "POST");
        reviewUser3.addProperty("url", "/services/data/v66.0/sobjects/ReviewStepUser__c");
        reviewUser3.addProperty("referenceId", "ReviewStepUser3");

        JsonObject userBody3 = new JsonObject();
        userBody3.addProperty("ReviewStep__c", "@{ReviewStepStep1.id}");
        userBody3.addProperty("Reviewer__c", ProjectWebServices.getIdOf("User",reviewerName3));
        userBody3.addProperty("NoOfApplicationsAssigned__c", 1);

        reviewUser3.add("body", userBody3);
        compositeRequest.add(reviewUser3);


        // -------- Review__c --------
        JsonObject review = new JsonObject();
        review.addProperty("method", "POST");
        review.addProperty("url", "/services/data/v66.0/sobjects/Review__c");
        review.addProperty("referenceId", "ReviewStepUser1");

        JsonObject reviewBody = new JsonObject();
        reviewBody.addProperty("ReviewStep__c", "@{ReviewStepStep1.id}");
        reviewBody.addProperty("ConflictOfInterest__c", "I agree");
        reviewBody.addProperty("Recommendation__c", "Recommended");
        reviewBody.addProperty("Comments__c", "REI System Competitive Announcement added on Review Record");
        reviewBody.addProperty("Status__c", "Review Completed");
        reviewBody.addProperty("Score__c", "80");

        review.add("body", reviewBody);
        compositeRequest.add(review);

        // -------- Review__c 2--------
        JsonObject review2 = new JsonObject();
        review2.addProperty("method", "POST");
        review2.addProperty("url", "/services/data/v66.0/sobjects/Review__c");
        review2.addProperty("referenceId", "ReviewStepUser2");

        JsonObject reviewBody2 = new JsonObject();
        reviewBody2.addProperty("ReviewStep__c", "@{ReviewStepStep1.id}");
        reviewBody2.addProperty("ConflictOfInterest__c", "I agree");
        reviewBody2.addProperty("Recommendation__c", "Recommended");
        reviewBody2.addProperty("Comments__c", "REI System Competitive Announcement added on Review Record");
        reviewBody2.addProperty("Status__c", "Review Completed");

        review2.add("body", reviewBody2);
        compositeRequest.add(review2);

        // -------- Review__c 3--------
        JsonObject review3 = new JsonObject();
        review3.addProperty("method", "POST");
        review3.addProperty("url", "/services/data/v66.0/sobjects/Review__c");
        review3.addProperty("referenceId", "ReviewStepUser3");

        JsonObject reviewBody3 = new JsonObject();
        reviewBody3.addProperty("ReviewStep__c", "@{ReviewStepStep1.id}");
        reviewBody3.addProperty("ConflictOfInterest__c", "I agree");
        reviewBody3.addProperty("Recommendation__c", "Recommended");
        reviewBody3.addProperty("Comments__c", "REI System Competitive Announcement added on Review Record");
        reviewBody3.addProperty("Status__c", "Review Completed");

        review3.add("body", reviewBody3);
        compositeRequest.add(review3);

        graph.add("compositeRequest", compositeRequest);
        graphs.add(graph);
        request.add("graphs", graphs);
        return request;
    }

    public JsonObject managementReviewForMultipleRecordsOnAnnouncement(String announcementName, String reviewerName, String filter) {
        JsonObject json;
        json = defaultPayloadManagementReviewForMultipleRecordsOnAnnouncement(announcementName, reviewerName);
        switch (filter.toUpperCase()) {
            default:
                return json;
        }
    }

    private JsonObject defaultPayloadManagementReviewForMultipleRecordsOnAnnouncement(String announcementName, String reviewerName) {

        JsonObject request = new JsonObject();

        JsonArray graphs = new JsonArray();
        JsonObject graph = new JsonObject();

        graph.addProperty("graphId", "ReviewStepGraph");

        JsonArray compositeRequest = new JsonArray();


        // -------- ReviewStep__c --------
        JsonObject reviewStep = new JsonObject();
        reviewStep.addProperty("method", "POST");
        reviewStep.addProperty("url", "/services/data/v66.0/sobjects/ReviewStep__c");
        reviewStep.addProperty("referenceId", "ReviewStepStep1");

        JsonObject reviewStepBody = new JsonObject();
        reviewStepBody.addProperty("Name", "Management Review");
        reviewStepBody.addProperty("Announcement__c", ProjectWebServices.getIdOf("Announcement__c", announcementName));

        reviewStep.add("body", reviewStepBody);
        compositeRequest.add(reviewStep);


       // -------- ReviewPanel__c --------
        JsonObject panel = new JsonObject();
        panel.addProperty("method", "POST");
        panel.addProperty("url", "/services/data/v66.0/sobjects/ReviewPanel__c");
        panel.addProperty("referenceId", "ReviewPanel1");

        JsonObject panelBody = new JsonObject();
        panelBody.addProperty("ReviewStep__c", "@{ReviewStepStep1.id}");
        panelBody.addProperty("PanelName__c", "Management Review");
        panelBody.addProperty("MinimumNumberOfReviewers__c", 1);
        panelBody.addProperty("Required__c", true);
        panelBody.addProperty("DueInDays__c", 7);

        panel.add("body", panelBody);
        compositeRequest.add(panel);


        // -------- ReviewStepUser__c --------
        JsonObject reviewUser = new JsonObject();
        reviewUser.addProperty("method", "POST");
        reviewUser.addProperty("url", "/services/data/v66.0/sobjects/ReviewStepUser__c");
        reviewUser.addProperty("referenceId", "ReviewStepUser1");

        JsonObject userBody = new JsonObject();
        userBody.addProperty("ReviewStep__c", "@{ReviewStepStep1.id}");
        userBody.addProperty("Reviewer__c", ProjectWebServices.getIdOf("User",reviewerName));
        userBody.addProperty("NoOfApplicationsAssigned__c", 1);

        reviewUser.add("body", userBody);
        compositeRequest.add(reviewUser);


        // -------- Review__c --------
        JsonObject review = new JsonObject();
        review.addProperty("method", "POST");
        review.addProperty("url", "/services/data/v66.0/sobjects/Review__c");

        review.addProperty("referenceId", "ReviewStepUser1");

        JsonObject reviewBody = new JsonObject();
        reviewBody.addProperty("ReviewStep__c", "@{ReviewStepStep1.id}");
        reviewBody.addProperty("ConflictOfInterest__c", "I agree");
        reviewBody.addProperty("Recommendation__c", "Recommended");
        reviewBody.addProperty("Comments__c", "REI System Competitive Announcement added on Review Record");
        reviewBody.addProperty("Status__c", "Review Completed");
        reviewBody.addProperty("Score__c", "80");

        review.add("body", reviewBody);
        compositeRequest.add(review);

        graph.add("compositeRequest", compositeRequest);
        graphs.add(graph);
        request.add("graphs", graphs);
        return request;
    }

    public JsonObject payloadForFDMCreationForAnnouncement(String status, String announcementName, String applicationName, String filter) {
        JsonObject json;
        json = defaultPayloadForFDMCreationForAnnouncement(status, announcementName, applicationName);
        switch (filter.toUpperCase()) {
            default:
                return json;
        }
    }

    private JsonObject defaultPayloadForFDMCreationForAnnouncement(String status, String announcementName, String applicationName) {

        JsonObject request = new JsonObject();

        JsonArray graphs = new JsonArray();
        JsonObject graph = new JsonObject();

        graph.addProperty("graphId", "ReviewStepGraph");

        JsonArray compositeRequest = new JsonArray();

        // -------- ReviewStep__c --------
        JsonObject reviewStep = new JsonObject();
        reviewStep.addProperty("method", "POST");
        reviewStep.addProperty("url", "/services/data/v66.0/sobjects/ReviewStep__c");
        reviewStep.addProperty("referenceId", "ReviewStepStep1");

        JsonObject reviewStepBody = new JsonObject();
        reviewStepBody.addProperty("Name", "Funding Decision Memo");
        reviewStepBody.addProperty("Announcement__c", ProjectWebServices.getIdOf("Announcement__c", announcementName));
        reviewStepBody.addProperty("Status__c", status);
        reviewStepBody.addProperty("GrantCode__c", "REI");
        reviewStepBody.addProperty("Justification__c", "Automation Justification");

        reviewStep.add("body", reviewStepBody);
        compositeRequest.add(reviewStep);

        // -------- ReviewStepApplication__c --------
        JsonObject reviewStepApp = new JsonObject();
        reviewStepApp.addProperty("method", "POST");
        reviewStepApp.addProperty("url", "/services/data/v66.0/sobjects/ReviewStepApplication__c");
        reviewStepApp.addProperty("referenceId", "ReviewStepUser1");

        JsonObject appBody = new JsonObject();
        appBody.addProperty("ReviewStep__c", "@{ReviewStepStep1.id}");
        appBody.addProperty("Decision__c", "Approved");
        appBody.addProperty("ApplicationTitle", applicationName);
        appBody.addProperty("RecommendedAmount__c", 1000);
        appBody.addProperty("TotalCommitmentAmount__c", 1000);
        appBody.addProperty("RecommendedForAward__c", "Yes");
        appBody.addProperty("Comments__c", "Data Added");
        appBody.addProperty("FDMStatus__c", "Approved");

        reviewStepApp.add("body", appBody);
        compositeRequest.add(reviewStepApp);

        // -------- RolesAndResponsibilities__c --------
        JsonObject approver = new JsonObject();
        approver.addProperty("method", "POST");
        approver.addProperty("url", "/services/data/v66.0/sobjects/RolesAndResponsibilities__c");
        approver.addProperty("referenceId", "ApproverRef1");

        JsonObject approverBody = new JsonObject();
        approverBody.addProperty("ReviewStep__c", "@{ReviewStepStep1.id}");
        approverBody.addProperty("Name__c", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("FO Username")));
        approverBody.addProperty("FDMRole__c", "Step1");
        approverBody.addProperty("BusinessRole__c", "Step1");
        approverBody.addProperty("CustomApp__c", "Grantor");
        approverBody.addProperty("RecordApiName__c", "ReviewStep__c");
        approverBody.addProperty("RoleApiName__c", "FDMRole__c");

        approver.add("body", approverBody);
        compositeRequest.add(approver);

        graph.add("compositeRequest", compositeRequest);
        graphs.add(graph);
        request.add("graphs", graphs);
        return request;
    }

    public JsonObject initiateAwardForFDMRecordsForAnnouncement(String announcementName, String applicationName, String filter) {
        JsonObject json;
        json = defaultPayloadInitiateAwardForFDMRecordsForAnnouncement(announcementName, applicationName);
        switch (filter.toUpperCase()) {
            default:
                return json;
        }
    }

    private JsonObject defaultPayloadInitiateAwardForFDMRecordsForAnnouncement(String announcementName, String applicationName) {

        JsonObject request = new JsonObject();

        JsonArray graphs = new JsonArray();
        JsonObject graph = new JsonObject();

        graph.addProperty("graphId", "ReviewStepGraph");

        JsonArray compositeRequest = new JsonArray();

        // -------- ReviewStep__c --------
        JsonObject reviewStep = new JsonObject();
        reviewStep.addProperty("method", "POST");
        reviewStep.addProperty("url", "/services/data/v66.0/sobjects/ReviewStep__c");
        reviewStep.addProperty("referenceId", "ReviewStepStep1");

        JsonObject reviewStepBody = new JsonObject();
        reviewStepBody.addProperty("Name", "Funding Decision Memo");
        reviewStepBody.addProperty("Announcement__c", ProjectWebServices.getIdOf("Announcement__c", announcementName));

        reviewStep.add("body", reviewStepBody);
        compositeRequest.add(reviewStep);

        // -------- ReviewStepApplication__c --------
        JsonObject reviewStepApp = new JsonObject();
        reviewStepApp.addProperty("method", "POST");
        reviewStepApp.addProperty("url", "/services/data/v66.0/sobjects/ReviewStepApplication__c");
        reviewStepApp.addProperty("referenceId", "ReviewStepUser1");

        JsonObject appBody = new JsonObject();
        appBody.addProperty("ReviewStep__c", "@{ReviewStepStep1.id}");
        appBody.addProperty("ApplicationTitle", applicationName);

        reviewStepApp.add("body", appBody);
        compositeRequest.add(reviewStepApp);

        graph.add("compositeRequest", compositeRequest);
        graphs.add(graph);
        request.add("graphs", graphs);
        return request;
    }

    public JsonObject payloadPreApplicationCreationForTitle(String title, String announcement, String status, String filter) {
        JsonObject json;
        json = defaultPayloadPreApplicationCreationForTitle(title, announcement, status);
        switch (filter.toUpperCase()) {
            default:
                return json;
        }
    }

    private JsonObject defaultPayloadPreApplicationCreationForTitle(String title, String announcement, String status) {
        JsonObject request = new JsonObject();
        JsonArray graphs = new JsonArray();
        JsonObject graph = new JsonObject();

        graph.addProperty("graphId", "PreApplicationGraph");

        JsonArray compositeRequest = new JsonArray();

        // -------- PreApplication__c --------
        JsonObject preApplication = new JsonObject();
        preApplication.addProperty("url", "/services/data/v66.0/sobjects/PreApplication__c");
        preApplication.addProperty("method", "POST");
        preApplication.addProperty("referenceId", "PreApplication1");

        JsonObject preAppBody = new JsonObject();
        preAppBody.addProperty("Status__c", status);
        preAppBody.addProperty("Title__c", title);
        preAppBody.addProperty("OwnerId", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("SPI3 Username")));
        preAppBody.addProperty("Announcement__c", ProjectWebServices.getIdOf("Announcement__c", announcement));
        preAppBody.addProperty("OpportunityTitle__c", announcement);
        preAppBody.addProperty("ApplicationDueDate__c", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(10, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        preAppBody.addProperty("ProjectBeneficiaries__c", "Automation Beneficiaries");
        preAppBody.addProperty("ProjectGoal__c", "Automation Project Goal");
        preAppBody.addProperty("ProjectAbstract__c", "Automation Project Abstract");
        preAppBody.addProperty("Agreement5__c", "I Agree");
        preAppBody.addProperty("SubmittedOn__c", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        preAppBody.addProperty("SubmittedBy__c", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("SPI3 Username")));
        preAppBody.addProperty("Justification__c", "Automation Justification");
        preAppBody.addProperty("RecordTypeId", ProjectWebServices.getRecordTypeId("PreApplication__c", "Grantor"));

        preApplication.add("body", preAppBody);
        compositeRequest.add(preApplication);

        // -------- KeyContacts__c --------
        JsonObject contact = new JsonObject();
        contact.addProperty("method", "POST");
        contact.addProperty("url", "/services/data/v66.0/sobjects/KeyContacts__c");
        contact.addProperty("referenceId", "ContactRef1");

        JsonObject contactBody = new JsonObject();
        contactBody.addProperty("PreApplication__c", "@{PreApplication1.id}");
        contactBody.addProperty("Contact__c", ProjectWebServices.getIdOf("Contact", I.amPerforming().propertiesFileOperationsTo().getValue("SPI3 Username")));
        contactBody.addProperty("OwnerId", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("SPI3 Username")));
        contactBody.addProperty("ProjectRole__c", "Project Director/Manager");
        contactBody.addProperty("IsKeyContact__c", true);

        contact.add("body", contactBody);
        compositeRequest.add(contact);

        // -------- Budget Category 1 --------
        JsonObject budget1 = new JsonObject();
        budget1.addProperty("method", "POST");
        budget1.addProperty("url", "/services/data/v66.0/sobjects/PreApplicationBudgetCategory__c");
        budget1.addProperty("referenceId", "BudgetDetailedRef1");

        JsonObject budgetBody1 = new JsonObject();
        budgetBody1.addProperty("PreApplication__c", "@{PreApplication1.id}");
        budgetBody1.addProperty("CatName__c", "Construction");
        budgetBody1.addProperty("GrantorAmount__c", 500);
        budgetBody1.addProperty("CashMatch__c", 50);
        budgetBody1.addProperty("NonCashMatch__c", 50);
        budgetBody1.addProperty("OtherLeverage__c", 0);

        budget1.add("body", budgetBody1);
        compositeRequest.add(budget1);

        // -------- Budget Category 2 --------
        JsonObject budget2 = new JsonObject();
        budget2.addProperty("method", "POST");
        budget2.addProperty("url", "/services/data/v66.0/sobjects/PreApplicationBudgetCategory__c");
        budget2.addProperty("referenceId", "BudgetDetailedRef2");

        JsonObject budgetBody2 = new JsonObject();
        budgetBody2.addProperty("PreApplication__c", "@{PreApplication1.id}");
        budgetBody2.addProperty("CatName__c", "Equipment");
        budgetBody2.addProperty("GrantorAmount__c", 500);
        budgetBody2.addProperty("CashMatch__c", 50);
        budgetBody2.addProperty("NonCashMatch__c", 50);
        budgetBody2.addProperty("OtherLeverage__c", 0);

        budget2.add("body", budgetBody2);
        compositeRequest.add(budget2);

        graph.add("compositeRequest", compositeRequest);

        JsonArray standardFormArray = new JsonArray();

        JsonObject form = new JsonObject();
        form.addProperty("PreApplication__c", "@{PreApplication1.id}");
        form.addProperty("Question3__c", "Test Clause Name for Automation");
        form.addProperty("Question1__c", "This is a long description used for automation testing of clause behavior and validations.");
        form.addProperty("sbirEmpNumber__c", "3");
        form.addProperty("ExperienceLevel__c", "5-10 years");
        form.addProperty("AppplicationSubmitted__c", "Automation SPI3");
        form.addProperty("SubmittedOnForm__c", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));

        standardFormArray.add(form);

        graph.add("StandardPreApplicationform", standardFormArray);

        graphs.add(graph);
        request.add("graphs", graphs);
        return request;
    }

    public JsonObject payloadAnnouncementCreationForTitle(String announcementName, String programName, String type, String allocationlevel, String status, String filter) {
        String user = "";
        JsonObject json;
        json = defaultPayloadAnnouncementCreationForTitle(announcementName, programName, type, allocationlevel, status);
        if (filter.toLowerCase().contains("user")) {
            user = filter.split("-")[1].split("user")[0].trim();
            updateAnnouncementOwner(json, user);
            filter = filter.split("-")[0];
        } else {
            filter = filter.toUpperCase();
        }
        switch (filter) {
            default:
                return json;
        }
    }

    private JsonObject defaultPayloadAnnouncementCreationForTitle(String announcementName, String programName, String type, String allocationlevel, String status) {
        JsonObject request = new JsonObject();
        JsonArray graphs = new JsonArray();

        JsonObject graph = new JsonObject();
        graph.addProperty("graphId", "AnnouncementGraph");

        JsonArray compositeRequest = new JsonArray();

        JsonObject announcement = new JsonObject();

        announcement.addProperty("method", "POST");
        announcement.addProperty("url", "/services/data/v66.0/sobjects/Announcement__c");
        announcement.addProperty("referenceId", "AnnouncementRef1");

        JsonObject announcementBody = new JsonObject();

        announcementBody.addProperty("AnnouncementName__c", announcementName);
        announcementBody.addProperty("RecordTypeId", ProjectWebServices.getRecordTypeId("Announcement__c", "Grantor"));
        announcementBody.addProperty("Status__c", status);
        announcementBody.addProperty("AnnouncementType__c", type);
        announcementBody.addProperty("Program__c", ProjectWebServices.getIdOf("Program__c", programName));
        announcementBody.addProperty("Budget_Category_Package__c", "Construction");
        announcementBody.addProperty("Organization__c", ProjectWebServices.getIdOf("Account", I.amPerforming().propertiesFileOperationsTo().getValue("grantorAutomationOrg")));
        announcementBody.addProperty("OwnerId", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("PM Username")));
        announcementBody.addProperty("MaxApplicationsAllowed__c", 10);
        announcementBody.addProperty("GranteeMatch__c", 10);
        announcementBody.addProperty("AreExpensesBuildIUpLevel__c", "No");
        announcementBody.addProperty("IsAdvancePermitted__c", "No");
        announcementBody.addProperty("IsNegotiationsAllowed__c", "Yes");
        announcementBody.addProperty("ClosingDateExplanation__c", "Application closure");
        announcementBody.addProperty("CategoryOfFundingActivity__c", "AG");
        announcementBody.addProperty("AgencyEmailAddress__c", "automation.test@yopmail.com");
        announcementBody.addProperty("AgencyEmailDescription__c", "Application for grants.gov submission");
        announcementBody.addProperty("AgencyContactDescription__c", "Contact for grants.gov submission");
        announcementBody.addProperty("AnnouncementDescription__c", "Automation test description");
        announcementBody.addProperty("EligibleApplicantTypes__c", "21;23;09;10;22");
        announcementBody.addProperty("PreApplicationDueDate__c", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(10, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        announcementBody.addProperty("ApplicationDueDate__c", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(10, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        announcementBody.addProperty("PreApplicationNeeded__c", "No");
        announcementBody.addProperty("FocusAreaRequired__c", "Yes");
        announcementBody.addProperty("IsGoalsRequired__c", "Yes");
        announcementBody.addProperty("KPIsRequired__c", "Yes");
        announcementBody.addProperty("IsMatchRequired__c", "Yes");
        announcementBody.addProperty("LaverageAllowed__c", "No");
        announcementBody.addProperty("RiskAssessment_Required__c", "Yes");
        announcementBody.addProperty("IsProgramIncomeAnticipated__c", "No");
        announcementBody.addProperty("Allocationlevel__c", allocationlevel);
        announcementBody.addProperty("PublishToGrantsGov__c", "No");
        announcementBody.addProperty("AwardFloor__c", 1000);
        announcementBody.addProperty("AwardCeiling__c", 10000);
        announcementBody.addProperty("EstimatedNumberOfAwards__c", 2);
        announcementBody.addProperty("TotalCommittedAmount__c", 10000);
        announcementBody.addProperty("Justification__c", "Automation Test");
        announcementBody.addProperty("DetailedBudgetingRequired__c", "Yes");

        announcement.add("body", announcementBody);

        compositeRequest.add(announcement);

        // -------- KeyContacts__c --------
        JsonObject contact = new JsonObject();

        contact.addProperty("method", "POST");
        contact.addProperty("url", "/services/data/v66.0/sobjects/KeyContacts__c");
        contact.addProperty("referenceId", "ContactRef1");

        JsonObject contactBody = new JsonObject();

        contactBody.addProperty("Announcement__c", "@{AnnouncementRef1.id}");
        contactBody.addProperty("Contact__c", ProjectWebServices.getIdOf("Contact", I.amPerforming().propertiesFileOperationsTo().getValue("EXE Username")));

        contact.add("body", contactBody);

        compositeRequest.add(contact);

        // -------- RolesAndResponsibilities__c (Peer Review) --------
        JsonObject peerReview = new JsonObject();

        peerReview.addProperty("method", "POST");
        peerReview.addProperty("url", "/services/data/v66.0/sobjects/RolesAndResponsibilities__c");
        peerReview.addProperty("referenceId", "PeerReviewRef1");

        JsonObject peerReviewBody = new JsonObject();

        peerReviewBody.addProperty("Announcement__c", "@{AnnouncementRef1.id}");
        peerReviewBody.addProperty("Name__c", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("EXE Username")));
        peerReviewBody.addProperty("Responsibility__c", "test Automation responsibility");
        peerReviewBody.addProperty("ReviewerRole__c", "Program Reviewer");
        peerReviewBody.addProperty("DueDate__c", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(7, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        peerReviewBody.addProperty("AllowRecordEdit__c", "No");
        peerReviewBody.addProperty("Status__c", "Created");
        peerReviewBody.addProperty("BusinessRole__c", "Program Reviewer");

        peerReview.add("body", peerReviewBody);

        compositeRequest.add(peerReview);

        // -------- RolesAndResponsibilities__c (Approver Step1) --------
        JsonObject approver1 = new JsonObject();

        approver1.addProperty("method", "POST");
        approver1.addProperty("url", "/services/data/v66.0/sobjects/RolesAndResponsibilities__c");
        approver1.addProperty("referenceId", "ApproverRef1");

        JsonObject approverBody1 = new JsonObject();

        approverBody1.addProperty("Announcement__c", "@{AnnouncementRef1.id}");
        approverBody1.addProperty("Name__c", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("PM Username")));
        approverBody1.addProperty("AnnouncementRole__c", "Step1");
        approverBody1.addProperty("BusinessRole__c", "Step1");
        approverBody1.addProperty("CustomApp__c", "Grantor");
        approverBody1.addProperty("RecordApiName__c", "Announcement__c");
        approverBody1.addProperty("RoleApiName__c", "AnnouncementRole__c");

        approver1.add("body", approverBody1);

        compositeRequest.add(approver1);

        // -------- RolesAndResponsibilities__c (Approver Step2) --------
        JsonObject approver2 = new JsonObject();

        approver2.addProperty("method", "POST");
        approver2.addProperty("url", "/services/data/v66.0/sobjects/RolesAndResponsibilities__c");
        approver2.addProperty("referenceId", "ApproverRef2");

        JsonObject approverBody2 = new JsonObject();

        approverBody2.addProperty("Announcement__c", "@{AnnouncementRef1.id}");
        approverBody2.addProperty("Name__c", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("EXE Username")));
        approverBody2.addProperty("AnnouncementRole__c", "Step2");
        approverBody2.addProperty("BusinessRole__c", "Step2");
        approverBody2.addProperty("CustomApp__c", "Grantor");
        approverBody2.addProperty("RecordApiName__c", "Announcement__c");
        approverBody2.addProperty("RoleApiName__c", "AnnouncementRole__c");

        approver2.add("body", approverBody2);

        compositeRequest.add(approver2);

        // -------- AnnouncementServiceArea__c --------
//        JsonObject serviceArea = new JsonObject();
//
//        serviceArea.addProperty("method", "POST");
//        serviceArea.addProperty("url", "/services/data/v66.0/sobjects/AnnouncementServiceArea__c");
//        serviceArea.addProperty("referenceId", "ServiceAreaRef2");

//        JsonObject serviceAreaBody = new JsonObject();
//
//        serviceAreaBody.addProperty("Announcement__c", "@{AnnouncementRef1.id}");
//        serviceAreaBody.add("ServiceArea__c", JsonNull.INSTANCE);
//
//        serviceArea.add("body", serviceAreaBody);
//
//        compositeRequest.add(serviceArea);

        // -------- KPIGoalsObjectives__c --------
//        JsonObject kpiGoal = new JsonObject();
//
//        kpiGoal.addProperty("method", "POST");
//        kpiGoal.addProperty("url", "/services/data/v66.0/sobjects/KPIGoalsObjectives__c");
//        kpiGoal.addProperty("referenceId", "KPIGoalRef1");
//
//        JsonObject kpiGoalBody = new JsonObject();
//
//        kpiGoalBody.addProperty("Announcement__c", "@{AnnouncementRef1.id}");
//        kpiGoalBody.add("StrategicPlan__c", JsonNull.INSTANCE);
//
//        kpiGoal.add("body", kpiGoalBody);
//
//        compositeRequest.add(kpiGoal);

        // -------- KeyOutcome__c --------
//        JsonObject keyOutcome = new JsonObject();
//
//        keyOutcome.addProperty("method", "POST");
//        keyOutcome.addProperty("url", "/services/data/v66.0/sobjects/KeyOutcome__c");
//        keyOutcome.addProperty("referenceId", "KeyOutcomeRef1");
//
//        JsonObject keyOutcomeBody = new JsonObject();
//
//        keyOutcomeBody.addProperty("Announcement__c", "@{AnnouncementRef1.id}");
//        keyOutcomeBody.add("MasterKPI__c", JsonNull.INSTANCE);
//
//        keyOutcome.add("body", keyOutcomeBody);
//
//        compositeRequest.add(keyOutcome);

        // -------- Checklist__c --------
        JsonObject checklist = new JsonObject();

        checklist.addProperty("method", "POST");
        checklist.addProperty("url", "/services/data/v66.0/sobjects/Checklist__c");
        checklist.addProperty("referenceId", "ChecklistRef1");

        JsonObject checklistBody = new JsonObject();

        checklistBody.addProperty("Announcement__c", "@{AnnouncementRef1.id}");
        checklistBody.addProperty("Description__c", "Automation");
        checklistBody.addProperty("Required__c", "Mandatory");
        checklistBody.addProperty("AttachmentLocation__c", "Application");
        checklistBody.addProperty("Status__c", "Active");

        checklist.add("body", checklistBody);

        compositeRequest.add(checklist);

        // -------- BudgetPeriod__c --------
        JsonObject budgetPeriod = new JsonObject();

        budgetPeriod.addProperty("method", "POST");
        budgetPeriod.addProperty("url", "/services/data/v66.0/sobjects/BudgetPeriod__c");
        budgetPeriod.addProperty("referenceId", "BudgetPeriodRef1");

        JsonObject budgetPeriodBody = new JsonObject();

        budgetPeriodBody.addProperty("FundingOpportunity__c", "@{AnnouncementRef1.id}");
        budgetPeriodBody.addProperty("BudgetStartDate__c",  I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(50, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        budgetPeriodBody.addProperty("BudgetEndDate__c",  I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(150, DateTimeFormatter.ofPattern("yyyy-MM-dd")));

        budgetPeriod.add("body", budgetPeriodBody);

        compositeRequest.add(budgetPeriod);

        // -------- FundingAccount__c --------
        JsonObject fundingAccount = new JsonObject();

        fundingAccount.addProperty("method", "POST");
        fundingAccount.addProperty("url", "/services/data/v66.0/sobjects/AwardFundingAccount__c");
        fundingAccount.addProperty("referenceId", "FundingAccountRef1");

        JsonObject fundingAccountBody = new JsonObject();

        fundingAccountBody.addProperty("Announcement__c", "@{AnnouncementRef1.id}");
        fundingAccountBody.addProperty("FundingAccount__c", ProjectWebServices.getIdOf("FundingAccount__c", I.amPerforming().propertiesFileOperationsTo().getValue("fundingAccount")));
        fundingAccountBody.addProperty("PreEncumbranceAmount__c", 1000);

        fundingAccount.add("body", fundingAccountBody);

        compositeRequest.add(fundingAccount);

        graph.add("compositeRequest", compositeRequest);

        graphs.add(graph);

        request.add("graphs", graphs);
        return request;
    }

    public JsonObject payloadCloseoutCreationForTitle(String awardName, String closeoutType, String status, String filter) {
        JsonObject json;
        json = defaultPayloadCloseoutCreationForTitle(awardName, closeoutType, status);
        switch (filter.toUpperCase()) {
            default:
                return json;
        }
    }

    private JsonObject defaultPayloadCloseoutCreationForTitle(String awardName, String closeoutType, String status) {
        JsonObject request = new JsonObject();
        JsonArray graphs = new JsonArray();

        JsonObject graph = new JsonObject();
        graph.addProperty("graphId", "CloseoutGraph");

        JsonArray compositeRequest = new JsonArray();

        JsonObject closeout = new JsonObject();

        closeout.addProperty("method", "POST");
        closeout.addProperty("url", "/services/data/v66.0/sobjects/Closeout__c");
        closeout.addProperty("referenceId", "CloseoutRef1");

        JsonObject closeoutBody = new JsonObject();

        closeoutBody.addProperty("Grant__c",  ProjectWebServices.getIdOf("Grant__c", awardName));
        closeoutBody.addProperty("Status__c", status);
        closeoutBody.addProperty("Type__c", closeoutType);
        closeoutBody.addProperty("Reason__c", "Early Termination");
        closeoutBody.addProperty("CloseoutDate__c", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        closeoutBody.addProperty("CloseoutType__c", "Project Period Closeout");
        closeoutBody.addProperty("Justification__c", "Automation Test");
        if(status.equalsIgnoreCase("Acknowledged by Subrecipient") || status.equalsIgnoreCase("Overridden") || status.equalsIgnoreCase("Submitted for Approval") || status.equalsIgnoreCase("Approved") || status.equalsIgnoreCase("Completed")) {
            closeoutBody.addProperty("Aggreement__c", true);
            closeoutBody.addProperty("AggreementDate__c", I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            closeoutBody.addProperty("AggreementBy__c", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("SPI3 Username")));
        }
        closeoutBody.addProperty("ChecklistQuestionPick2__c", "Yes");
        closeoutBody.addProperty("ChecklistQuestionPick1__c", "Yes");
        closeoutBody.addProperty("ExpensesComments__c", "Test");
        closeoutBody.addProperty("ChecklistQuestionPick5__c", "Yes");
        closeoutBody.addProperty("ChecklistQuestionPick4__c", "Yes");
        closeoutBody.addProperty("ChecklistQuestionPick3__c", "Yes");
        closeoutBody.addProperty("ChecklistQuestionPick6__c", "Yes");
        closeoutBody.addProperty("ReportFinanceComments__c", "Test");
        closeoutBody.addProperty("ChecklistQuestionPick9__c", "Yes");
        closeoutBody.addProperty("ChecklistQuestionPick10__c", "Yes");
        closeoutBody.addProperty("ChecklistQuestionPick7__c", "Yes");
        closeoutBody.addProperty("Comments2__c", "Test");
        closeoutBody.addProperty("ChecklistQuestionPick8__c", "Yes");
        closeoutBody.addProperty("ChecklistQuestionPick11__c", "Yes");
        closeoutBody.addProperty("ChecklistQuestionPick13__c", "Yes");
        closeoutBody.addProperty("ChecklistQuestionPick14__c", "Yes");
        closeoutBody.addProperty("Comments3__c", "Test");
        closeoutBody.addProperty("ChecklistQuestionPick12__c", "Yes");
        closeoutBody.addProperty("ChecklistQuestionPick22__c", "Yes");
        closeoutBody.addProperty("ChecklistQuestionPick23__c", "Yes");
        closeoutBody.addProperty("Comments6__c", "Test");
        closeoutBody.addProperty("ChecklistQuestionPick19__c", "Yes");
        closeoutBody.addProperty("ChecklistQuestionPick20__c", "Yes");
        closeoutBody.addProperty("ChecklistQuestionPick21__c", "Yes");
        closeoutBody.addProperty("Comments4__c", "Test");
        closeoutBody.addProperty("ChecklistQuestionPick15__c", "Yes");
        closeoutBody.addProperty("ChecklistQuestionPick18__c", "Yes");
        closeoutBody.addProperty("ChecklistQuestionPick17__c", "Yes");
        closeoutBody.addProperty("Comments5__c", "Yes");
        closeoutBody.addProperty("ChecklistQuestionPick16__c", "Yes");

        closeout.add("body", closeoutBody);

        compositeRequest.add(closeout);

        // -------- RolesAndResponsibilities__c --------
        JsonObject role = new JsonObject();

        role.addProperty("method", "POST");
        role.addProperty("url", "/services/data/v66.0/sobjects/RolesAndResponsibilities__c");
        role.addProperty("referenceId", "RoleRef1");

        JsonObject roleBody = new JsonObject();

        roleBody.addProperty("Closeout__c", "@{CloseoutRef1.id}");
        roleBody.addProperty("Name__c", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("PM Username")));
        roleBody.addProperty("CloseoutRole__c", "Step1");
        roleBody.addProperty("BusinessRole__c", "Step1");
        roleBody.addProperty("CustomApp__c", "Grantor");
        roleBody.addProperty("RecordApiName__c", "Closeout__c");
        roleBody.addProperty("OwnerId", ProjectWebServices.getIdOf("User", I.amPerforming().propertiesFileOperationsTo().getValue("PM Username")));
        roleBody.addProperty("ApproverAPIName__c", "POApprover__c");
        roleBody.addProperty("Agency__c", ProjectWebServices.getIdOf("Account", I.amPerforming().propertiesFileOperationsTo().getValue("grantorAutomationOrg")));

        role.add("body", roleBody);

        compositeRequest.add(role);

        graph.add("compositeRequest", compositeRequest);

        graphs.add(graph);

        request.add("graphs", graphs);
        return request;
    }
}
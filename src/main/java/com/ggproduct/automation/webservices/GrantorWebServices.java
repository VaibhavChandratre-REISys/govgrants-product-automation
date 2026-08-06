package com.ggproduct.automation.webservices;

import com.helperPackage.handlers.govgrants;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.helperPackage.register.I;
import io.restassured.response.Response;
import org.apache.commons.lang.StringUtils;

import java.util.List;
import java.util.stream.Collectors;

public class GrantorWebServices extends ProjectWebServices {
    private String jobID;
    private String status;
    GrantorPayloads projectApis = new GrantorPayloads();

    /*handles to get the record id of a record */
    public void getRecordIdFromResponse(String objectType, String recordName, String objectApiName) {
        String response = "";
        response = (automationBatchExecuteApi(objectType, recordName, objectApiName.split(","))).asString().replace("\"", "");
        if (!response.equalsIgnoreCase("Completed")) {
            govgrants.perform().pageDetails().idOfRecord = response;
            I.amPerforming().propertiesFileOperationsTo().saveValue("Record Id", govgrants.perform().pageDetails().idOfRecord);
        }
    }

    /*
     * calls the api which will create post award records currently accepts
     * PaymentRequest, ProgressReport, Closeout.
     *
     * @param objectType -: This is the batch job type. Currently supports 3
     * different values – PaymentRequest, ProgressReport, Closeout.
     *
     * @param recordName -: The name of the award (for payment/progress) or grant
     * (for closeout) for which you want to run the batch job.
     *
     * @param objectApiName -: This is the object api name.
     */
    public Response automationBatchExecuteApi(String objectType, String recordName, String... objectName) {
        String finalEndPoint, objectApiName = "";
        Response response = null;
        objectApiName = objectName[0];
        finalEndPoint = endPoint + "/services/apexrest/productAutomationRunBatchJob?type=" + objectType + "&recordName="
                + recordName;

        response = I.amPerforming().restHttp().getCall(finalEndPoint, "Authorization", "Bearer " + tokenString);
        assertStatusCode(response);

        jobID = response.asString().replace("\"", "");
        finalEndPoint = endPoint + "/services/apexrest/productAutomationGetBatchJobStatus?batchId=" + jobID;
        I.amPerforming().waitFor().makeThreadSleep(20000);
        long apiWaitTimer = (System.currentTimeMillis()) / 1000 + 120;
        while (apiWaitTimer > System.currentTimeMillis() / 1000) {
            response = I.amPerforming().restHttp().getCall(finalEndPoint, "Authorization", "Bearer " + tokenString);
            assertStatusCode(response);
            status = response.asString().replace("\"", "");
            if (status.equalsIgnoreCase("Completed") || status.equalsIgnoreCase("Aborted")) {
                System.out.println("Batch Status is :" + status);
                break;
            }
            I.amPerforming().waitFor().makeThreadSleep(7000);
        }

        if (status.equalsIgnoreCase("Completed") && objectName.length == 1 && !objectApiName.equalsIgnoreCase("closeout")) {
            return getRecordId(recordName, "Title__c", objectApiName);
        } else {
            return response;
        }
    }

    public Response riskAssessmentApi(String organizationName) {
        String finalEndPoint = endPoint + "/services/apexrest/productAutomationRiskAssessmentApi?recordName=" + organizationName;
        Response response = I.amPerforming().restHttp().getCall(finalEndPoint, "Authorization", "Bearer " + tokenString);
        response.prettyPrint();
        assertStatusCode(response);
        return response;
    }

    public static void deleteAttachmentsForRecord(String recordName, String objectAPIName) {
        String recordId = getIdOf(objectAPIName, recordName);
        JsonObject parent = new JsonObject();
        JsonArray array = new JsonArray();
        array.add(recordId);
        parent.add("recordid", array);
        String finalEndPoint = endPoint + "/services/apexrest/deleteFiles";
        Response response = I.amPerforming().restHttp().postCall(parent, null, finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        assertStatusCode(response);
    }

    public void deleteRecordInHooks() {
        List<String> recordNameList = I.amPerforming().propertiesFileOperationsTo().getAllSavedKeys().stream()
                .filter(Keys -> Keys.startsWith("AUTOMATION RUNTIME")).collect(Collectors.toList());

        for (String record : recordNameList) {
            if (StringUtils.containsIgnoreCase(record, "focus area")) {
                deleteFocusArea(I.amPerforming().propertiesFileOperationsTo().getValue(record));
            }
            if (StringUtils.containsIgnoreCase(record, "funding source")) {
                deleteFundingSource(I.amPerforming().propertiesFileOperationsTo().getValue(record));
            }
            if (StringUtils.containsIgnoreCase(record, "kpi")) {
                deleteKPI(I.amPerforming().propertiesFileOperationsTo().getValue(record));
            }
            if (StringUtils.containsIgnoreCase(record, "program")) {
                deleteProgram(I.amPerforming().propertiesFileOperationsTo().getValue(record));
            }
            if (StringUtils.containsIgnoreCase(record, "strategic plan")) {
                deleteStrategicPlan(I.amPerforming().propertiesFileOperationsTo().getValue(record));
            }
            if (StringUtils.containsIgnoreCase(record, "site visit")) {
                deleteSiteVisit(I.amPerforming().propertiesFileOperationsTo().getValue(record));
            }
            if (StringUtils.containsIgnoreCase(record, "desk")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Desk Review");
            }
            if (StringUtils.containsIgnoreCase(record, "amendment")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Amendment Request");
            }
            if (StringUtils.containsIgnoreCase(record, "payment")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Payment Request");
            }
            if (StringUtils.containsIgnoreCase(record, "risk")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "ORGANIZATION RISKASSESSMENT");
            }
            if (StringUtils.containsIgnoreCase(record, "closeout")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Closeout");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Payment Request");
            }
            if (StringUtils.containsIgnoreCase(record, "contact")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Contact");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "DUNS");
            }
            if (StringUtils.containsIgnoreCase(record, "application")) {
                try {
                    deleteAttachmentsForRecord(I.amPerforming().propertiesFileOperationsTo().getValue(record), "PreApplication__c");
                } catch (AssertionError error) {
                }
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "APPLICATION REVIEWS");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "PreApplication");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Application");
            }
            if (StringUtils.containsIgnoreCase(record, "Organization")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "USER REGISTRATION");
            }
        }

        if (recordNameList.stream().anyMatch(s -> s.toLowerCase().contains("award"))) {
            for (String record : recordNameList) {
                if (StringUtils.containsIgnoreCase(record, "award")) {
                    deleteAward(I.amPerforming().propertiesFileOperationsTo().getValue(record));
                }
            }
        }

        if (recordNameList.stream().anyMatch(s -> s.toLowerCase().contains("announcement"))) {
            for (String record : recordNameList) {
                if (StringUtils.containsIgnoreCase(record, "announcement")) {
                    deleteAnnouncement(I.amPerforming().propertiesFileOperationsTo().getValue(record));
                }
            }
        }

        if (recordNameList.stream().anyMatch(s -> s.toLowerCase().contains("fdm"))) {
            deleteFDM(recordNameList);
        }
    }

    public void initateApplicationReviewOnAnnouncement(String applicationTitle, String announcementTitle, String filter) {
        initiateApplicationReview(projectApis.applicationReview(applicationTitle, announcementTitle, filter));
    }

    public void initateApplicationReviewOnAnnouncementForBulkRecords(String applicationTitle, String announcementTitle, String filter) {
        initiateApplicationReview(projectApis.applicationReviewForBulkRecords(applicationTitle, announcementTitle, filter));
    }

    /**
     * @param applicationName name of application
     */
    public void approveDFM(String applicationName) {
        approveDFMPostCall(projectApis.defaultRequestPayroleForApprovedDFM(), applicationName);
    }

    /**
     * @param applicationName name of application
     */
    public void approveDFMForBulkRecords(String applicationName) {
        approveDFMPostCall(projectApis.defaultRequestPayroleForApprovedDFMForBulkRecords(), applicationName);
    }

    /**
     * @param applicationName name of application for Plumbing cases
     */
    public void approveDFMForPlumbingcases(String applicationName) {
        approveDFMPostCall(projectApis.defaultRequestPayroleForApprovedDFMForPlumbingcases(), applicationName);
    }

    public void reviewedApplication(String applicationName) {
        reviewApplicationPostCall(projectApis.defaultPayloadReviewApplication(), applicationName);
    }

    /**
     * @param announcementName name of announcement on which application is created with same name as announcement
     */
    public void createAwardFromFDM(String announcementName) {
        createAwardFromFDMPostCall(projectApis.defaultPayloadCreateAwardFromFDM(announcementName));
    }

    /**
     * @param announcementName name of announcement on which application is created with same name as announcement for Plumbing cases
     */
    public void createAwardFromFDMForPlumbingCases(String announcementName) {
        createAwardFromFDMPostCall(projectApis.defaultPayloadCreateAwardFromFDMForPlumbingCases(announcementName));
    }

    public void createAwardFromFDM(String announcementName, String... Type) {
        if (Type.length > 0)
            createAwardFromFDMPostCall(projectApis.PayloadCreateAwardFromFDM(announcementName, Type[0]));
        else
            createAwardFromFDMPostCall(projectApis.PayloadCreateAwardFromFDM(announcementName));
    }


    /**
     * @param applicationName name of application from which we have to create activate FDM
     * @see GrantorPayloads#defaultPayloadActivateAwardFromFDM()
     */
    public void activateFMD(String applicationName) {
        activateAwardFromFDMPostCall(projectApis.defaultPayloadActivateAwardFromFDM(), applicationName);
    }

    /**
     * @param annType type of announcement such as Formula, Competitive, Directed
     * @param annName name of announcement
     * @param filter  if we want to change anything from default payload then we can create
     *                our own filter in publishAnnPayload(String, String) method
     * @see GrantorPayloads#publishAnnPayload(String, String, String)
     */
    public void publishAnnouncment(String annType, String annName, String filter) {
        publishAnnouncementPostCall(projectApis.publishAnnPayload(annType, annName, filter));
    }

    /**
     * @param annType type of announcement such as Formula, Competitive, Directed
     * @param annName name of announcement
     * @param filter  if we want to change anything from default payload then we can create
     *                our own filter in publishAnnPayload(String, String) method
     * @see GrantorPayloads#publishAnnPayload(String, String, String)
     */
    public void publishAnnouncmentForPlumbingCases(String annType, String annName, String filter) {
        publishAnnouncementPostCall(projectApis.publishAnnPayloadForPlumbingCases(annType, annName, filter));
    }

    /**
     * @param grantName name of award
     * @param filter    if we want to change anything from default payload then we can create
     *                  our own filter in payloadForCreateStandaloneAward(String, String) method
     * @see GrantorPayloads# payloadForCreateStandaloneAward(String, String, String,String)
     */
    public void activateSubaward(String grantName, String filter, String... Type) {
        if (Type.length > 0)
            activateSubawardGetCall(projectApis.payloadForCreateStandaloneAward(grantName, filter, Type[0]), grantName);
        else
            activateSubawardGetCall(projectApis.payloadForCreateStandaloneAward(grantName, filter), grantName);
    }

    private void activateSubawardGetCall(JsonObject jsonObject, String awardName) {
        String createAwardEndPoint = endPoint + "/services/apexrest/activateAwardFromGrantCopy/v1";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                createAwardEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
        I.amPerforming().waitFor().makeThreadSleep(60000);
        String activateAwardEndPoint = endPoint + "/services/apexrest/activateAwardFromGrant/v2?AwardId=" + getIdOf("Award__c", awardName);
        Response response1 = I.amPerforming().restHttp().getCall(
                activateAwardEndPoint, "Authorization", "Bearer " + tokenString);
        response1.prettyPrint();
        assertStatusCode(response1);
    }

    private void publishAnnouncementPostCall(JsonObject jsonObject) {
        String finalEndPoint = endPoint + "/services/apexrest/PublishAnnouncementCopy";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    private void initiateApplicationReview(JsonObject jsonObject) {
        String finalEndPoint = endPoint + "/services/apexrest/CreateFDMCopy/v1";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        assertStatusCode(response);
    }

    private void createAwardFromFDMPostCall(JsonObject jsonObject) {
        String finalEndPoint = endPoint + "/services/apexrest/activateAwardFromFDM/v1.1";
        I.amPerforming().waitFor().makeThreadSleep(5000);
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    private void reviewApplicationPostCall(JsonObject jsonObject, String applicationName) {
        String finalEndPoint = endPoint + "/services/apexrest/CreateFDM/v2?AppId=" + getIdOf("Application__c", applicationName);
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        assertStatusCode(response);
    }

    private void activateAwardFromFDMPostCall(JsonObject jsonObject, String applicationName) {
        String finalEndPoint = endPoint + "/services/apexrest/activateAwardFromFDM/v2?GrantId=" + getIdOf("Grant__c", applicationName);
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    private void approveDFMPostCall(JsonObject jsonObject, String applicationName) {
        String finalEndPoint = endPoint + "/services/apexrest/CreateFDM/v2?AppId=" + getIdOf("Application__c", applicationName);
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        assertStatusCode(response);
    }

    private void deleteAward(String recordName) {
        deletionApi(recordName, "Progress Report");
        deletionApi(recordName, "Progress Report");
        deletionApi(recordName, "Amendment Request");
        deletionApi(recordName, "Payment Request");
        deletionApi(recordName, "Award");
        deletionApi(recordName, "Grant");
    }

    private void deleteFDM(List<String> recordNames) {

        for (String record : recordNames) {
            if (StringUtils.containsIgnoreCase(record, "desk review")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Desk Review");
            }
        }

        for (String record : recordNames) {
            if (StringUtils.containsIgnoreCase(record, "site visit")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Site Visit");
            }
        }

        for (String record : recordNames) {
            if (StringUtils.containsIgnoreCase(record, "application")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "APPLICATION REVIEWS");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "PreApplication");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Application");
            }
        }

        for (String record : recordNames) {
            if (StringUtils.containsIgnoreCase(record, "announcement")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Announcement");
            }
        }

        for (String record : recordNames) {
            if (StringUtils.containsIgnoreCase(record, "fdm")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Progress Report");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "FDM");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "subaward");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Award");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Grant");
            }
        }
    }

    public void deleteAnnouncement(String recordName) {
        deletionApi(recordName, "APPLICATION REVIEWS");
        deletionApi(recordName, "Application");
        deletionApi(recordName, "PreApplication");
        deletionApi(recordName, "Announcement");
    }

    private void deleteFocusArea(String recordName) {
        deletionApi(recordName, "Focus Area");
    }

    private void deleteFundingSource(String recordName) {
        deletionApi(recordName, "Funding Source");
    }

    private void deleteKPI(String recordName) {
        deletionApi(recordName, "KPI");
    }

    private void deleteProgram(String recordName) {
        deletionApi(recordName, "Program");
    }

    private void deleteStrategicPlan(String recordName) {
        deletionApi(recordName, "Strategic Plan");
    }

    private void deleteSiteVisit(String recordName) {
        deletionApi(recordName, "Site Visit");
    }

    private void deleteOrganization(String recordName) {
        deletionApi(recordName, "USER REGISTRATION");
    }

    /**
     * @param oppoNumber to update gov grants lead from backend
     */
    public void UpdateForSettingAsGrantsgovLeadWithOpportunityNumber(String oppoNumber) {
        UpdateLeadSettingsAPIPostCall(projectApis.UpdateLeadSettingsAPI(oppoNumber));
    }

    private void UpdateLeadSettingsAPIPostCall(JsonObject jsonObject) {
        String finalEndPoint = endPoint + "/services/apexrest/updateLeadSettings";
        Response response = I.amPerforming().restHttp().patchCall(jsonObject, null,
                finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    public void createQualifiedLead(String isManual, String oppTitle, String oppoNo, String filter) {
        createQualifiedLeadGetCall(projectApis.payloadForQualifiedLead(isManual, oppTitle, oppoNo, filter));
    }

    private void createQualifiedLeadGetCall(JsonObject jsonObject) {
        String createAwardEndPoint = endPoint + "/services/apexrest/createOpportunityFromLead";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                createAwardEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    public void CreateOpportunityWithStateForOpportunityNumberWithProperties(String state, String oppoNo, String filter) {
        createOpportunityPatchCall(projectApis.payloadForCreatedOrApprovedOpportunity(state, oppoNo, filter));
    }

    private void createOpportunityPatchCall(JsonObject jsonObject) {
        String createAwardEndPoint = endPoint + "/services/apexrest/UpdateGranteeOpportunity";
        Response response = I.amPerforming().restHttp().patchCall(jsonObject, null,
                createAwardEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    public void CreatePreApplicationWithStateForOpportunityNumberWithProperties(String module, String preAppTitle, String state, String oppoNo, String filter) {
        createPreApplicationPostCall(projectApis.payloadForPreApplicationCreatedAndAccepted(module, preAppTitle, state, oppoNo, filter));
    }

    private void createPreApplicationPostCall(JsonObject jsonObject) {
        String createAwardEndPoint = endPoint + "/services/apexrest/CreateGranteePreAppAndApp";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                createAwardEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    public void awardFromApplicationForOpportunityForTitleWithProperties(String state, String oppoNo, String appTitle, String filter) {
        standaloneAwardPostCall(projectApis.payloadForawardFromApplicationForOpportunityForTitle(state, oppoNo, appTitle, filter));
    }

    private void standaloneAwardPostCall(JsonObject jsonObject) {
        String createAwardEndPoint = endPoint + "/services/apexrest/CreateGranteeGrant";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                createAwardEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    public void CreateAdhocCloseoutForStatusWithProperties(String grantTitle, String status, String filter) {
        createAdhocCloseoutPostCall(projectApis.payloadForAdhocCloseoutCreatedAndApproved(grantTitle, status, filter));
    }

    private void createAdhocCloseoutPostCall(JsonObject jsonObject) {
        String createAwardEndPoint = endPoint + "/services/apexrest/CreateCloseoutRequest";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                createAwardEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    public void CreateScheduleCloseoutForStatusWithProperties(String grantTitle, String status, String filter) {
        createScheduleCloseoutPostCall(projectApis.payloadForScheduleCloseoutCreatedAndApproved(grantTitle, status, filter));
    }

    private void createScheduleCloseoutPostCall(JsonObject jsonObject) {
        String createAwardEndPoint = endPoint + "/services/apexrest/scheduledCloseout2";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                createAwardEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    public void StandaloneSubawardWithProperties(String grantTitle, String state, String filter) {
        standaloneAwardPostCall(projectApis.payloadForStandaloneAwardCreatedAndActivated(grantTitle, state, filter));
    }

    public void CreateActivateTheAward(String grantTitle) {
        activateAwardPostCall(projectApis.payloadForActivateTheAward(grantTitle));
    }

    private void activateAwardPostCall(JsonObject jsonObject) {
        String createAwardEndPoint = endPoint + "/services/apexrest/ActivateAwardGrant";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                createAwardEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    public void CreateTheProgressReportForTitleWithProperties(String status, String type, String title, String filter) {
        CreateProgressandFinancialReportPostCall(projectApis.payloadForCreateTheProgressReportCreatedAndApproved(status, type, title, filter));
    }

    private void CreateProgressandFinancialReportPostCall(JsonObject jsonObject) {
        String createAwardEndPoint = endPoint + "/services/apexrest/CreateProgressReport";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                createAwardEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    public void CreateTheScheduleProgressReportForTitleWithProperties(String type, String grantTitle, String filter) {
        CreateScheduleProgressandFinancialReportPostCall(projectApis.payloadForCreateTheScheduleProgressReportCreatedAndApproved(type, grantTitle, filter));
    }

    private void CreateScheduleProgressandFinancialReportPostCall(JsonObject jsonObject) {
        String createAwardEndPoint = endPoint + "/services/apexrest/scheduledProgressFinancialReport";
        Response response = I.amPerforming().restHttp().patchCall(jsonObject, null,
                createAwardEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    public void UpdateTheScheduleProgressReportForTitleWithProperties(String type, String state, String grantTitle, String filter) {
        CreateScheduleProgressandFinancialReportPostCall(projectApis.payloadForUpdateTheScheduleProgressReportCreatedAndApproved(type, state, grantTitle, filter));
    }

    public void CreateTheAmendmentRequestWithType(String state, String type, String grantTitle, String filter) {
        CreateTheAmendmentRequestPostCall(projectApis.payloadForCreateTheAmendmentRequestWithType(state, type, grantTitle, filter));
    }

    private void CreateTheAmendmentRequestPostCall(JsonObject jsonObject) {
        String createAwardEndPoint = endPoint + "/services/apexrest/createAllAmendmentApi";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                createAwardEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    public void updatedAwardFromApplicationForTitleWithProperties(String appTitle, String filter) {
        appToAwardUpdatePostCall(projectApis.payloadupdatedAwardFromApplicationForTitle(appTitle, filter));
    }

    private void appToAwardUpdatePostCall(JsonObject jsonObject) {
        String createAwardEndPoint = endPoint + "/services/apexrest/GranteeGrantChildshandler";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                createAwardEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    public void UpdatedDirectGrantAwardForTitleWithProperties(String appTitle, String filter) {
        appToAwardUpdatePostCall(projectApis.payloadupdatedDirectGrantAwardForTitle(appTitle, filter));
    }

    public void createProgramRecordsWithStatusUsingProperties(String title, String recordType, String status, String filter) {
        createProgramPostCall(projectApis.payloadProgramCreationForTitle(title, recordType, status, filter));
    }

    private void createProgramPostCall(JsonObject jsonObject) {
        String createSolicitationEndPoint = endPoint + "/services/apexrest/govGrantsCreateRecord";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                createSolicitationEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCodeTwoZeroOne(response);
    }

    private void assertStatusCodeTwoZeroOne(Response response) {
        response.then().statusCode(201);
        System.out.println("response code is " + response.getStatusCode());
        response.then().statusCode(201);
    }

    /**
     * Creates Amendment Request records by building payload and triggering API call.
     *
     * @param amendmentType the Amendment Type (RecordType)
     * @param award         the Award Salesforce ID
     * @param status        the Amendment Request status
     * @param filter        payload modifier (e.g., "default")
     */
    public void createAmendmentRequestRecordsWithStatusUsingProperties(String amendmentType, String recordType, String award, String status, String filter) {
        createAmendmentRequestPostCall(projectApis.payloadAmendmentRequestCreation(amendmentType, recordType, award, status, filter));
    }

    /**
     * Executes POST API call to create Amendment Request records.
     *
     * @param jsonObject the request payload for Amendment creation
     */
    private void createAmendmentRequestPostCall(JsonObject jsonObject) {
        String endpoint = endPoint + "/services/apexrest/govGrantsCreateRecord";
        Response response = I.amPerforming().restHttp().postCall(
                jsonObject,
                null,
                endpoint,
                "Authorization",
                "Bearer " + tokenString,
                null
        );
        response.prettyPrint();
        assertStatusCodeTwoZeroOne(response);
    }

    public void createSubrecipientSideAmendmentRequestRecordsWithStatusUsingProperties(String amendmentType, String recordType, String award, String grant, String status, String filter) {
        createAmendmentRequestPostCall(projectApis.payloadSubrecipientSideAmendmentRequestCreation(amendmentType, recordType, award, grant, status, filter));
    }

    public void createApplicationRecordsWithStatusUsingProperties(String title, String announcement, String preAppTitle, String status, String filter) {
        createApplicationPostCall(projectApis.payloadApplicationCreationForTitle(title, announcement, preAppTitle, status, filter));
    }

    private void createApplicationPostCall(JsonObject jsonObject) {
        String createSolicitationEndPoint = endPoint + "/services/apexrest/govGrantsCreateRecord";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                createSolicitationEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCodeTwoZeroOne(response);
    }

    public void initateApplicationReviewOnAnnouncementForMultipleRecords(String announcementName) {
        initiateApplicationReviewPostCall(projectApis.applicationReviewForMultipleRecords(announcementName));
    }

    private void initiateApplicationReviewPostCall(JsonObject jsonObject) {
        String createSolicitationEndPoint = endPoint + "/services/apexrest/govGrantsCreateRecord";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                createSolicitationEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    public void initiatePreScreenReviewForMultipleRecordsOnAnnouncementUsingProperties(String announcementName, String reviewerName, String filter) {
        initiatePreScreenReviewPostCall(projectApis.preScreenReviewForMultipleRecordsOnAnnouncement(announcementName, reviewerName, filter));
    }

    private void initiatePreScreenReviewPostCall(JsonObject jsonObject) {
        String createSolicitationEndPoint = endPoint + "/services/apexrest/govGrantsCreateRecord";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                createSolicitationEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    public void submitPreScreenReviewForAnnouncementsWithProperties(String reviewName, String announcementName, String applicationName, String filter) {
        initiateApplicationReviewPostCall(projectApis.submitPreScreenReviewForAnnouncements(reviewName, announcementName, applicationName, filter));
    }

    public void initiateSMEReviewForAnnouncementsWithProperties(String announcementName, String reviewerName, String reviewerName2, String reviewerName3, String filter) {
        initiatePreScreenReviewPostCall(projectApis.smeReviewForMultipleRecordsOnAnnouncement(announcementName, reviewerName, reviewerName2, reviewerName3, filter));
    }

    public void initiateManagementReviewForAnnouncementsWithProperties(String announcementName, String reviewerName, String filter) {
        initiatePreScreenReviewPostCall(projectApis.managementReviewForMultipleRecordsOnAnnouncement(announcementName, reviewerName, filter));
    }

    public void createFDMRecordsWithStatusUsingProperties(String status, String announcementName, String applicationName, String filter) {
        initiatePreScreenReviewPostCall(projectApis.payloadForFDMCreationForAnnouncement(status, announcementName, applicationName, filter));
    }

    public void initiateAwardForFDMRecordsWithProperties(String announcementName, String applicationName, String filter) {
        initiatePreScreenReviewPostCall(projectApis.initiateAwardForFDMRecordsForAnnouncement(announcementName, applicationName, filter));
    }

    public void createPreApplicationRecordsWithStatusUsingProperties(String title, String announcement, String status, String filter) {
        createApplicationPostCall(projectApis.payloadPreApplicationCreationForTitle(title, announcement, status, filter));
    }

    public void createAnnouncementRecordsWithStatusUsingProperties(String announcementName, String programName, String type, String allocationlevel, String status, String filter) {
        createApplicationPostCall(projectApis.payloadAnnouncementCreationForTitle(announcementName, programName, type, allocationlevel,  status, filter));
    }

    public void createCloseoutRecordsWithStatusUsingProperties(String awardName, String closeoutType, String status, String filter) {
        createApplicationPostCall(projectApis.payloadCloseoutCreationForTitle(awardName, closeoutType, status, filter));
    }

    public void createPaymentRequestRecordsWithStatusUsingProperties(String title, String awardName, String paymentRequestType, String status, String filter) {
        createApplicationPostCall(projectApis.payloadPaymentRequestCreationForTitle(title, awardName, paymentRequestType, status, filter));
    }

    public void createSiteVisitRecordsWithStatusUsingProperties(String title, String awardName, String recordType, String monitoringType, String associateAward, String status, String filter) {
        createApplicationPostCall(projectApis.payloadSiteVisitCreationForTitle(title, awardName, recordType, monitoringType, associateAward, status, filter));
    }

    public void createOrgLevelSiteVisitOrDeskReviewRecordsWithStatusUsingProperties(String title, String accountName, String recordType, String monitoringType, String associateAward, String status, String filter) {
        createApplicationPostCall(projectApis.payloadOrgLevelSiteVisitOrDeskReviewCreationForTitle(title, accountName, recordType, monitoringType, associateAward, status, filter));
    }

    public void updateSchedulePaymentRequestRecordsWithStatusUsingProperties(String egmsId, String awardName, String paymentRequestType, String status, String filter) {
        createApplicationPostCall(projectApis.payloadSchedulePaymentRequestUpdateForTitle(egmsId, awardName, paymentRequestType, status, filter));
    }

    public void updateScheduleProgressReportRecordsWithStatusUsingProperties(String egmsId, String awardName, String status, String filter) {
        createApplicationPostCall(projectApis.payloadScheduleProgressReportUpdateForTitle(egmsId, awardName, status, filter));
    }


//    #Bulk
    public void createAnnouncementRecordsWithStatusUsingPropertiesForBulkRecords(String announcementName, String programName, String type, String allocationlevel, String status, String filter) {
        createApplicationPostCall(projectApis.payloadAnnouncementCreationForTitleForBulkRecords(announcementName, programName, type, allocationlevel,  status, filter));
    }

    public void createApplicationRecordsWithStatusUsingPropertiesForBulkRecords(String title, String announcement, String preAppTitle, String status, String filter) {
        createApplicationPostCall(projectApis.payloadApplicationCreationForTitleForBulkRecords(title, announcement, preAppTitle, status, filter));
    }

    public void createFDMRecordsWithStatusUsingPropertiesforbulkrecords(String status, String announcementName, String applicationName, String filter) {
        initiatePreScreenReviewPostCall(projectApis.payloadForFDMCreationForAnnouncementforbulkrecords(status, announcementName, applicationName, filter));
    }
}

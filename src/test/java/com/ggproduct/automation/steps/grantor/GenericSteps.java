package com.ggproduct.automation.steps.grantor;

import com.helperPackage.actionsfactory.api.ByUsing;
import com.helperPackage.handlers.govgrants;
import com.ggproduct.automation.projectmanager.GrantorProjectManager;
import com.ggproduct.automation.webservices.GrantorWebServices;
import com.helperPackage.objects.Elements;
import com.helperPackage.register.I;
import com.helperPackage.report.LogLevel;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.Before;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.springframework.context.annotation.Description;

import javax.mail.MessagingException;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

public class GenericSteps {
    private GrantorProjectManager grantorProjectManager;
    private GrantorWebServices grantorWebServices;

    public GenericSteps(GrantorProjectManager grantorProjectManager, GrantorWebServices grantorWebServices) {
        this.grantorProjectManager = grantorProjectManager;
        this.grantorWebServices = grantorWebServices;
    }

    @Description("API call used to create a post award records i.e. Payment Request, Progress Report and Closout and will fetch the record ID for that record. These step we can only use after Award Activation")
    @When("^I create a post award record \"([^\"]*)\" for the Award \"([^\"]*)\" having object api name as \"([^\"]*)\"$")
    public void iCreateAPostAwardRecordForTheAwardHavingObjectApiNameAs(String objectType, String recordName, String objectApiName) {
        I.amPerforming().waitFor().makeThreadSleep(30000);
        grantorWebServices.getRecordIdFromResponse(objectType, recordName, objectApiName);
    }

    @Description("To verify field value is blank in flex table with Id")
    @Then("^I (softly see|see|do not see|softly do not see) field name \"([^\"]*)\" is blank in flex table with Id \"([^\"]*)\"$")
    public void iSeeFieldNameIsBlank(String usage, String fieldname, String tableId) {
        grantorProjectManager.assertColumnValuIsBlank(tableId, fieldname, usage);
    }

    @Description("To verify total records available under flex table")
    @Then("^I (softly see|see) total records count \"([^\"]*)\" in flex table \"([^\"]*)\"$")
    public void iSeeTotalRecordsCountInFlexTable(String usage, String totalRecords, String tableId) {
        grantorProjectManager.AssertTotalRecordsCountInFlexTable(totalRecords, tableId, usage.contains("softly"));
    }

    @Then("^I (softly can see|can see|cannot see|softly cannot see) page block \"([^\"]*)\"$")
    public void iCanSeeCannotSeePageBlock(String usage, String pageblockName) {
        I.amPerforming().waitFor().makeThreadSleep(2000);
        grantorProjectManager.AssertPageBlockDisplayed(pageblockName, "can see".equalsIgnoreCase(usage) || "softly can see".equalsIgnoreCase(usage), usage.contains("softly"));
    }

    @Description("To get the field value from page block")
    @And("^I get the field value \"([^\"]*)\" from sub tab \"([^\"]*)\"$")
    public void iGetTheFieldValueFromSubTab(String fieldName, String subTabName) {
        grantorProjectManager.getFieldValue(fieldName, subTabName);
    }

    @Description("To compare two different field values")
    @Then("^I (compare|softly compare) field \"([^\"]*)\" from sub tab \"([^\"]*)\" with expected field$")
    public void iCompareFieldFromSubTabWithExpectedField(String usage, String fieldName, String subTabName) {
        grantorProjectManager.assertTwoFieldValues(fieldName, subTabName, usage.contains("softly"));
    }

    @Description("To verify text under attachment flex table")
    @Then("^I (softly see|see|do not see|softly do not see) \"([^\"]*)\" has been added in \"([^\"]*)\" flex table$")
    public void iSeeHasBeenAddedInFlexTable(String usage, String valueToBeSearch, String flexTableHeader) {
        if (usage.equals("see")) {
            Assert.assertTrue(grantorProjectManager.isValueInsideFlexTable(valueToBeSearch, flexTableHeader));
        } else if (usage.equals("do not see")) {
            Assert.assertFalse(grantorProjectManager.isValueInsideFlexTable(valueToBeSearch, flexTableHeader));
        } else if (usage.equals("softly see")) {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.isValueInsideFlexTable(valueToBeSearch, flexTableHeader)).isTrue();
        } else {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.isValueInsideFlexTable(valueToBeSearch, flexTableHeader)).isFalse();
        }
    }

    @Description("To upload attachment from default workspace")
    @And("^I upload attachment \"([^\"]*)\" from workspace$")
    public void iUploadAttachmentFromWorkspace(String fileNameToBeUpload) {
        grantorProjectManager.uploadAttachmentFromWorkspace(fileNameToBeUpload);
    }

    @When("^I click on top right parallel lines bar for \"([^\"]*)\"$")
    public void clickTopRightParallelLinesBar(String title) {
        grantorProjectManager.clickRightHeaderBars(title);
    }

    @Then("^I (verify|softly verify) that \"([^\"]*)\" file is downloaded$")
    public void iVerifyThatPdfFileIsDownloaded(String usage, String fileType) {
        grantorProjectManager.assertThatFileIsDownloaded(fileType, usage.contains("softly"));
    }

    @Then("^I (see|softly see) that (file|file name contains) \"([^\"]*)\" is downloaded$")
    public void iVerifyThatPdfFileIsDownloaded(String usage, String fileNamePartialMatch, String fileName) {
        grantorProjectManager.assertThatTheFileIsDownloaded(usage.contains("softly"), fileNamePartialMatch.contains("contains"), fileName);
    }

    @Then("^I delete file (name|contains name) \"([^\"]*)\"$")
    public void deleteGivenFile(String usage, String fileName) {
        grantorProjectManager.deleteGivenFile(usage.contains("contains"), fileName);
    }

    @Description("To verify no of rows checked for field name")
    @Then("^I can (softly see|see) \"([^\"]*)\" record value is checked for field name \"([^\"]*)\"$")
    public void iCanSeeRecordValueIsCheckedForFieldName(String usage, String count, String fieldName) {
        grantorProjectManager.AssertFieldValueIsChecked(fieldName, count, usage.contains("softly"));
    }

    @Given("^I (softly can see|can see) mail notification for \"([^\"]*)\" user with following subject:$")
    public void iSeeMailSubject(String usage, String userType, List<String> subjectList) throws MessagingException {
        String subject = subjectList.get(0);
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.validateMailSubject(userType, subject)).isTrue();
        } else {
            Assert.assertTrue(grantorProjectManager.validateMailSubject(userType, subject));
        }
    }

    @Description("Navigate to last page of the flex table")
    @And("^I navigate to last page in flex table \"([^\"]*)\"$")
    public void iNavigateToLastPageInFlexTable(String flexTableId) {
        try {
            govgrants.perform().flexTable().flexTablePagination(flexTableId, "Last");
        } catch (Exception e) {
            // eating exception....
        }
    }

    @Description("Get last value for specified column name in the flex table")
    @And("I get the value from row {string} for column name {string} in flex table {string}")
    public void iGetTheSpecifiedValueForColumnNameInFlexTable(String columnValueFromRow, String columnName, String flexTableId) {
        grantorProjectManager.iSavedSpecificValueFromFlexTable(columnValueFromRow, columnName, flexTableId);
    }

    @Description("Validation of equality for values of Schedule end date AND Reporting Period End Date")
    @Then("^I (verify|softly verify) that the Schedule end date is matching with Reporting Period End Date$")
    public void iVerifyThatTheScheduleEndDateIsMatchingWithReportingPeriodEndDate(String usage) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().propertiesFileOperationsTo().getValue("lastValueFromTableForCol")).isEqualTo(I.amPerforming().propertiesFileOperationsTo().getValue("ScheduleEndDate"));
        } else {
            Assert.assertEquals(I.amPerforming().propertiesFileOperationsTo().getValue("lastValueFromTableForCol"), I.amPerforming().propertiesFileOperationsTo().getValue("ScheduleEndDate"));
        }
    }

    @Then("^I (verify|softly verify) that the Schedule start date is matching with Reporting Period start Date$")
    public void iVerifyThatTheScheduleStartDateIsMatchingWithReportingPeriodStartDate(String usage) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().propertiesFileOperationsTo().getValue("lastValueFromTableForCol")).isEqualTo(I.amPerforming().propertiesFileOperationsTo().getValue("ScheduleStartDate"));
        } else {
            Assert.assertEquals(I.amPerforming().propertiesFileOperationsTo().getValue("lastValueFromTableForCol"), I.amPerforming().propertiesFileOperationsTo().getValue("ScheduleStartDate"));
        }
    }

    @Then("^I (see|do not see|softly see|softly do not see) that the fields in flex table title as \"([^\"]*)\" are editable$")
    public void iSeeThatTheFieldsInFlexTableTitleAsAreEditable(String editable, String tableTitle) {
        if (editable.equals("see")) {
            Assert.assertTrue(grantorProjectManager.verifyIfFieldsAreEditableInFlexTable(tableTitle));
        } else if (editable.equals("do not see")) {
            Assert.assertFalse(grantorProjectManager.verifyIfFieldsAreEditableInFlexTable(tableTitle));
        } else if (editable.equals("softly see")) {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.verifyIfFieldsAreEditableInFlexTable(tableTitle)).isTrue();
        } else {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.verifyIfFieldsAreEditableInFlexTable(tableTitle)).isFalse();
        }
    }

    @When("I add the Notes for progress report")
    public void iAddTheNotesForProgressupdatingOfReportWith() {
        grantorProjectManager.addNotesToPR();
    }

    @Then("^I (softly verify|verify) that the file \"([^\"]*)\" is downloaded$")
    public void iVerifyThatTheFileIsDownloaded(String usage, String fileName) {
        I.amPerforming().waitFor().makeThreadSleep(10000);
        boolean yes = false;
        File[] list = I.amPerforming().fileHandling().toGetCompleteFilesListOnLocalDirectory(System.getProperty("user.dir") + File.separatorChar + "target");
        for (File f : list) {
            if (fileName.equalsIgnoreCase(f.getName())) {
                yes = true;
            }
        }
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(yes).isTrue();
        } else {
            Assert.assertTrue(yes);
        }
    }

    @Then("^I (softly verify|verify) that field \"([^\"]*)\" is not editable by entering \"([^\"]*)\" value$")
    public void iVerifyThatFieldIsNotEditableByEnteringValue(String usage, String fieldApi, String value) {

        boolean verify = true;
        try {
            govgrants.perform().inputForms().inputFormDataByFieldApiName(fieldApi, value, false);
            verify = false;
        } catch (Exception ex) {

        }
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(verify).isTrue();
        } else {
            Assert.assertTrue(verify);
        }
    }

    @Then("^I (softly see|see) snapshot with name containing \"([^\"]*)\" as name$")
    public void iSeeSnapshotWithNameContainingAsName(String usage, String snapshotName) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().getElementReference().of(By.xpath("//c-snapshot-history//tbody//tr//*[contains(text(),'" + snapshotName + "')]")).isDisplayed()).isTrue();
        } else {
            Assert.assertTrue(I.amPerforming().getElementReference().of(By.xpath("//c-snapshot-history//tbody//tr//*[contains(text(),'" + snapshotName + "')]")).isDisplayed());
        }
    }

    @Then("^I (softly see|see) snapshot with user containing \"([^\"]*)\" against the value \"([^\"]*)\"$")
    public void iSoftlySeeSnapshotWithUserContainingAgainstTheValue(String usage, String userName, String snapshotName) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().getElementReference().of(By.xpath("//c-snapshot-history//tbody//tr//*[contains(text(),'" + snapshotName + "')]/ancestor::tr//*[contains(text(),'" + userName + "')]")).isDisplayed()).isTrue();
        } else {
            Assert.assertTrue(I.amPerforming().getElementReference().of(By.xpath("//c-snapshot-history//tbody//tr//*[contains(text(),'" + snapshotName + "')]/ancestor::tr//*[contains(text(),'" + userName + "')]")).isDisplayed());
        }
    }

    @And("I create multiple records from sheet {string} of {string} with following data")
    public void createMultipleData(String sheetName, String spreadsheetName, List<List<String>> testData) {
        String[][] data = I.amPerforming().fileHandling().forExcelAnd().readExcelFile(spreadsheetName, sheetName);
        String currentSubTab = "";
        Map<String, Map<String, String>> map = I.amPerforming().conversionOf().listOfListsToMapOfMaps(testData);

        String key = map.keySet().iterator().next();
        Map<String, String> testDataMap = map.get(key);

        if (data != null) {

            for (int i = 2; i < data.length; i++) {
                int colLen = data[i].length;
                govgrants.perform().mainPage().clickMainMenuBarForLwc(testDataMap.get("Navigation"));
                govgrants.perform().sideBar().clickSideBarContent(testDataMap.get("subHeader"), testDataMap.get("subHeaderContent"));
                govgrants.perform().flexTable().clickTableTopRightButton(testDataMap.get("FlexTableId"), testDataMap.get("PageDetailsButton"));

                for (int j = 0; j < colLen; j++) {
                    String subTab = data[0][j].trim();
                    String apiName = data[1][j].trim();
                    String value = data[i][j].trim();

                    if (subTab != null && !"None".equalsIgnoreCase(subTab) && !subTab.equalsIgnoreCase(currentSubTab)) {
                        govgrants.perform().pageDetails().clickSubTabsInsideTableViewForLWC(subTab);
                        currentSubTab = subTab;
                    }
                    govgrants.perform().inputForms().inputFormDataByFieldApiName(apiName, value, false);
                }

                govgrants.perform().modal().clickModalContentSpecificButton(testDataMap.get("ModalButton"));
                govgrants.perform().pageDetails().clickAnyTopRightButton("Save");
            }
        }
    }

    @When("I create a risk assessment record for organization {string}")
    public void iCreateARiskAssessmentRecordForOrganization(String organizationName) {
        grantorWebServices.riskAssessmentApi(organizationName);
    }

    @Then("^I (softly see|see) \"([^\"]*)\" image as \"([^\"]*)\"$")
    public void compareImages(String usage, String fieldLabel, String imageName) throws IOException {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.assertRiskLevelImage(fieldLabel, imageName)).isTrue();
        } else {
            Assert.assertTrue(grantorProjectManager.assertRiskLevelImage(fieldLabel, imageName));
        }
    }

    @Then("^I (softly see|see) selected element \"([^\"]*)\"$")
    public void saveCurrentSelectedElementValue(String usage, String elementText) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.getSelectedSubTab(elementText)).isTrue();
        } else {
            Assert.assertTrue(grantorProjectManager.getSelectedSubTab(elementText));
        }
    }

    @Then("^I can (softly see|softly do not see|see|do not see) modal button \"([^\"]*)\"$")
    public void iCanSeeModalButton(String usage, String buttonName) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.isButtonDisplayedOnModal(buttonName)).isTrue();
        } else if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(grantorProjectManager.isButtonDisplayedOnModal(buttonName));
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.isButtonDisplayedOnModal(buttonName)).isFalse();
        } else {
            Assert.assertFalse(grantorProjectManager.isButtonDisplayedOnModal(buttonName));
        }
    }

    @And("I upload document {string} of type {string}")
    public void iUploadDocumentOfType(String fileName, String fileType) {
        grantorProjectManager.uploadDocument(fileName, fileType);
    }

    @Then("^I (see|softly see) that Budget Period field contains the updated Budget Period End Date$")
    public void iSeeThatBudgetPeriodFieldContainsTheUpdatedBudgetPeriodEndDate(String usage) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(govgrants.perform().pageDetails().getFieldValue("Budget Period")).contains(govgrants.perform().pageDetails().getFieldValue("Budget Period End Date"));
        } else {
            Assert.assertTrue(govgrants.perform().pageDetails().getFieldValue("Budget Period").contains(govgrants.perform().pageDetails().getFieldValue("Budget Period End Date")));
        }
    }

    @Description("handles to click on table Top right button which will not accept any alert if any")
    @When("I click table top right button {string} in flex table with id {string}")
    public void iClickTableTopRightButtonInFlexTableWithId(String buttonName, String flexTableId) {
        grantorProjectManager.clickTableTopRightButton(buttonName, flexTableId);
    }

    @Description("Click on reset button in table")
    @When("I click on button {string} in flex table with id {string}")
    public void clickResetIcon(String buttonName, String flexTableId) {
        grantorProjectManager.clickButtonNameReset(buttonName, flexTableId);
    }

    @And("I click {string} button in modal")
    public void iClickButtonInModal(String buttonName) {
        By Button = ByUsing.xpath("//div[@id='ModalDivID']//button[contains(text(),'" + buttonName + "')] |  //button[normalize-space()='" + buttonName + "']");
        try {
            I.amPerforming().waitFor().ElementToBeClickable(Button);
            I.amPerforming().click().withJavaScript(Button);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Then("^I (softly verify|verify) that All the following projects roles are available in picklist :$")
    public void iVerifyThatAllProjectsRolesAreAvailableInPicklist(String usage, List<String> projectRoles) {
        grantorProjectManager.compareContactListEquality(usage, projectRoles);
    }

    @Then("^I (softly see|see|softly cannot see) that the saved value \"([^\"]*)\" and \"([^\"]*)\" are equal$")
    public void iSeeThatTheSavedValueAndAreEqual(String usage, String savedValue1, String savedValue2) {
        grantorProjectManager.compareTwoSavedStringValueEquality(usage, savedValue1, savedValue2);
    }

    @Then("^I (softly see|see) initial budget balance \"([^\"]*)\" is decreased by \"([^\"]*)\" and is matched with current budget balance \"([^\"]*)\"$")
    public void iSeeInitialBudgetBalanceIsDecreasedByAndIsMatchedWithCurrentBudgetBalance(String usage, String iniBudgetBalance, String decreasedBy, String currentBalance) {
        grantorProjectManager.verifyBalanceBudget(usage, iniBudgetBalance, decreasedBy, currentBalance);
    }

    @Then("^I (softly see|see) grant details on modal and it gets enlarge$")
    public void iSeeGrantDetailsOnModalAndItGetsEnlarge(String usage) {
        grantorProjectManager.validateModalEnlargeAndGrantDetails(usage);
    }

    @And("^I (softly see|see) all the fields are present for site visit while initializing it$")
    public void iSeeAllTheFieldsArePresentForSiteVisit(String usage) {
        grantorProjectManager.allFieldsCheckSiteVisit(usage);
    }

    @Then("^I (softly cannot see|cannot see|softly see|see) field label \"([^\"]*)\" present on page under \"([^\"]*)\" table$")
    public void iDoNotSeeFieldLabelPresentOnPageUnderTable(String usage, String fieldLabel, String tableHeaderTitle) {
        if (usage.contains("softly")) {
            if (usage.contains("not")) {
                I.amPerforming().assertionsTo().assertThat(grantorProjectManager.assertToCheckFieldPresentOnPageUnderSpecificTable(fieldLabel, tableHeaderTitle)).isFalse().as("Field " + fieldLabel + " is still present on the page under table " + tableHeaderTitle);
            } else {
                I.amPerforming().assertionsTo().assertThat(grantorProjectManager.assertToCheckFieldPresentOnPageUnderSpecificTable(fieldLabel, tableHeaderTitle)).isTrue().as("Field " + fieldLabel + " is not present on the page under table " + tableHeaderTitle);
            }
        } else {
            if (usage.contains("not")) {
                Assert.assertFalse(grantorProjectManager.assertToCheckFieldPresentOnPageUnderSpecificTable(fieldLabel, tableHeaderTitle));
            } else {
                Assert.assertTrue(grantorProjectManager.assertToCheckFieldPresentOnPageUnderSpecificTable(fieldLabel, tableHeaderTitle));
            }
        }
    }

    @And("^I click on top right button \"([^\"]*)\" in notes flex table having header \"([^\"]*)\"$")
    public void clickOnTopButtonInFlexTable(String buttonName, String flextTableHeader) {
        I.amPerforming().click().on(By.xpath("//*[" + I.amPerforming().sanityOfXpathTo().translate(flextTableHeader) + "]//ancestor::div[(@id and @class='ng-scope')]//button[text()='" + buttonName + "' or @title='" + buttonName + "']"));
    }

    @Description("Check the users status against value in Approval History table inside Hsitory Tab")
    @Then("I see {string} against {string} in approval history")
    public void seeStatusOfRecordInApprovalHistory(String seeThisString, String againstThisString) {
        By listOfsUsers = By.xpath("//div[@id='chevronBarId']//ul[1]//li//a");
        List<Elements> listOfLoc = I.amPerforming().getElementReference().forListOfElements().of(listOfsUsers);
        int expectedIndex = 0;
        for (int i = 0; i < listOfLoc.size(); i++) {
            expectedIndex = expectedIndex + 1;
            if (listOfLoc.get(i).getText().trim().equalsIgnoreCase(againstThisString)) {
                break;
            }
        }
        I.amPerforming().assertionsTo().assertThat(I.amPerforming().actionToGet().text(By.xpath("//div[@id='chevronBarId']//ul[2]//li[" + expectedIndex + "]//a")).trim()).isEqualToIgnoringCase(seeThisString);
    }

    @Description("Check the Application Due Date is Less/greater than today's Date")
    @Then("^I (softly see|see) field \"([^\"]*)\" contains date (less|greater) than todays date$")
    public void isFieldDateGreaterThanOrLessThanTodaysDate(String usage, String fieldLabel, String lessORgreater) throws ParseException {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.isFieldDateGreaterThanOrLessThanTodaysDate(fieldLabel, lessORgreater)).isTrue();
        } else {
            Assert.assertTrue(grantorProjectManager.isFieldDateGreaterThanOrLessThanTodaysDate(fieldLabel, lessORgreater));
        }
    }

    @Description("Check the given is less/greater than today's Date")
    @Then("^I (softly see|see) date \"([^\"]*)\" is (less|greater) than todays date$")
    public void isGivenDateGreaterThanOrLessThanTodaysDate(String usage, String givenDate, String lessORgreater) throws ParseException {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.isGivenDateGreaterOrLessThanTodaysDate(givenDate, lessORgreater)).isTrue();
        } else {
            Assert.assertTrue(grantorProjectManager.isGivenDateGreaterOrLessThanTodaysDate(givenDate, lessORgreater));
        }
    }

    @Description("Check the Application Due Date is Less/greater than today's Date")
    @Then("^I (softly see|see) field \"([^\"]*)\" contains date (less|greater) than \"([^\"]*)\" date$")
    public void isFieldDateGreaterThanOrLessThanExpectedDate(String usage, String fieldLabel1, String lessORgreater, String fieldLabel2) throws ParseException {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.isFieldDateGreaterThanOrLessThanExpectedDate(fieldLabel1, lessORgreater, fieldLabel2)).isTrue();
        } else {
            Assert.assertTrue(grantorProjectManager.isFieldDateGreaterThanOrLessThanExpectedDate(fieldLabel1, lessORgreater, fieldLabel2));
        }
    }

    @Description("To click on Submit Review modal button of Grantor Review")
    @And("^I click on modal button Submit Review$")
    public void iClickOnModalButtonSubmitReview() {
        try {
            By buttonPath = By.xpath("//div[@id='footerButtonsPanel']//*[text()='Submit Review' or @title='Submit Review']");
            I.amPerforming().click().on(buttonPath);
        } catch (Exception ee) {
            I.amPerforming().waitFor().makeThreadSleep(5000);
            By buttonPath = By.xpath("//div[@id='footerButtonsPanel']//*[text()='Submit Review' or @title='Submit Review']");
            I.amPerforming().click().on(buttonPath);
        }
    }

    @Then("^I (softly see|see) following details for email sent under collab:$")
    public void iSoftlySeeFollowingDetailsForEmailSentUnderCollab(String usage, List<List<String>> text) {
        for (int i = 0; i < text.size(); i++) {
            By path = By.xpath("//div[@id='sendEmail']//*[text()='" + text.get(i).get(0) + "']");
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().checkToSee().isDisplayed(path)).isTrue();
        }
    }

    @Before(order = 5)
    public void initializeData() {
        grantorProjectManager.initData();
    }

    @And("I delete all rows inside flex table with id {string}")
    public void performDeleteActionForAllRows(String flexTableId) {
        grantorProjectManager.clickAllDeleteButtonsInsideFlexTable(flexTableId);
    }

    @And("I clear all the filter from the table id {string}")
    public void iClearAllTheFilterFromTheTableId(String filterTableId) {
        By clearAll = By.xpath("//*[@id='" + filterTableId + "']//*[@title='Clear All']//i | //c-lwc-flex-table[@data-flextablename='" + filterTableId + "']//*[@title='Clear']");
        I.amPerforming().click().on(clearAll);
    }

    @And("I enter value {string} in my feed section and share the post")
    public void iEnterValueInMyFeedSectionAndShareThePost(String value) {
        By feedSection = By.xpath("//div/textarea[@class='mention-for-post']");
        I.amPerforming().textInput().in(feedSection, value);
        I.amPerforming().waitFor().makeThreadSleep(2000);
        I.amPerforming().click().on(By.xpath("//div[@class='mentions-input-box']//div[3]"));
        I.amPerforming().click().on(By.xpath("//div/input[@id='PostToFeedButton']"));
    }

    @Given("I initiated an application review for application {string} on announcement {string} with properties {string}")
    public void iInitiatedAnApplicationReviewOnAnnouncement(String applicationTitle, String announcmentTitle, String filter) {
                I.amPerforming().waitFor().makeThreadSleep(20000); //ToDO- This API gets failed as It needs Announcement Record, So added wait time as of now
        grantorWebServices.initateApplicationReviewOnAnnouncement(applicationTitle, announcmentTitle, filter);
    }

    @Given("I created approved FDM on application {string}")
    public void iCreatedApprovedFDMWithProperties(String applicationName) {
        I.amPerforming().waitFor().makeThreadSleep(40000); //ToDO- This API gets failed as It needs Application Record, So added wait time as of now
        grantorWebServices.approveDFM(applicationName);
    }


    @And("I created approved FDM on application {string} for Plumbing Cases")
    public void iCreatedApprovedFDMOnApplicationForPlumbingCases(String applicationName) {
        I.amPerforming().waitFor().makeThreadSleep(40000); //ToDO- This API gets failed as It needs Application Record, So added wait time as of now
        grantorWebServices.approveDFMForPlumbingcases(applicationName);
    }

    @Given("I reviewed the application {string}")
    public void reviewedApplication(String applicationName) {
        I.amPerforming().waitFor().makeThreadSleep(40000); //ToDO- This API gets failed as It needs Application Record, So added wait time as of now
        grantorWebServices.reviewedApplication(applicationName);
    }

    @Given("I activate award from FDM having application name {string}")
    public void iActivateAwardFromDFMWith(String applicationName) {
        grantorWebServices.activateFMD(applicationName);
    }

    @Given("I created award from approved FDM with announcement {string}")
    public void iCreatedAwardFromApprovedFDMWithAnnouncement(String announcementName) {
        grantorWebServices.createAwardFromFDM(announcementName);
    }

    @Given("I created award from approved FDM with announcement {string} for plumbing cases")
    public void iCreatedAwardFromApprovedFDMWithAnnouncementForPlumbingCases(String announcementName) {
        grantorWebServices.createAwardFromFDMForPlumbingCases(announcementName);
    }

    @Given("I created award from approved FDM with announcement {string} and properties {string}")
    public void iCreatedAwardFromApprovedFDMWithAnnouncement(String announcementName, String Type) {
        grantorWebServices.createAwardFromFDM(announcementName, Type);
    }

    @And("I published {string} type announcement having name {string} and properties {string}")
    public void iPublishedTypeAnnouncementHavingNameAndProperties(String annType, String annName, String filter) {
        String newAnnName = annName + I.amPerforming().addOnsTo().getRandomNumber();
        I.amPerforming().propertiesFileOperationsTo().saveValue(annName, newAnnName);
        grantorWebServices.publishAnnouncment(annType, newAnnName, filter);
    }

    @And("I published {string} type announcement having name {string} and properties {string} for plumbing cases")
    public void iPublishedTypeAnnouncementHavingNameAndPropertiesForPlumbingCases(String annType, String annName, String filter) {
        String newAnnName = annName + I.amPerforming().addOnsTo().getRandomNumber();
        I.amPerforming().propertiesFileOperationsTo().saveValue(annName, newAnnName);
        annName = newAnnName;
        grantorWebServices.publishAnnouncmentForPlumbingCases(annType, annName, filter);
    }

    @And("I activated standalone subaward {string} with properties {string}")
    public void iActivatedStandaloneSubawardWithProperties(String grantName, String filter) {
        String newGrantName = grantName + I.amPerforming().addOnsTo().getRandomNumber();
        I.amPerforming().propertiesFileOperationsTo().saveValue(grantName, newGrantName);
        grantName = newGrantName;
        grantorWebServices.activateSubaward(grantName, filter);
    }

    @And("I activated standalone subaward {string} with properties {string} of type {string}")
    public void iActivatedStandaloneSubawardWithPropertiesAndType(String grantName, String filter, String Type) {
        String newGrantName = grantName + I.amPerforming().addOnsTo().getRandomNumber();
        I.amPerforming().propertiesFileOperationsTo().saveValue(grantName, newGrantName);
        grantName = newGrantName;
        grantorWebServices.activateSubaward(grantName, filter, Type);
    }

    @And("I click on submit review")
    public void iClickOnSubmitReview() {
        By submit_button = By.xpath("//div[contains(@class,'modal__container')]//*[text()='Submit Review' or @title='Submit Review']");
        I.amPerforming().click().on(submit_button);
    }

    @And("I click on Menu icon present on top right corner of the page")
    public void iClickOnMenuIconPresentOnTopRightCornerOfThePage() {
        By menu = By.xpath("//gnt-header-overview//lightning-button-menu//button");
        I.amPerforming().waitFor().ElementToBeVisible(menu);
        I.amPerforming().click().withJavaScript(menu);
    }

    @And("I upload the attachment {string} of type {string} from computer")
    public void uploadAttachmentFromComputer(String fileName, String fileClassificationType) {
        By classificationType = By.xpath("//select[@title='Classification' or @name='Classification']");
        By filePath = By.xpath("//label[contains(@id,'file')]/../input");
        String defaultFilePath = System.getProperty("user.dir") + "/src/main/resources/";
        I.amPerforming().dropDownSelection().from(classificationType).selectByValue(fileClassificationType);
        I.amPerforming().textInput().in(filePath, defaultFilePath + fileName);
        I.amPerforming().click().on(By.xpath("//button[text()='Upload']"));
    }

    @And("I enter value {string} in email body")
    public void iEnterValueIntoEmailBody(String enterValue) {
        By emailBody = By.xpath("//body[contains(@id,'accountInvitation')]");
        I.amPerforming().textInput().in(emailBody, enterValue);
    }

    @And("I check the checkbox in modal with field value {string}")
    public void iCheckTheCheckboxInModalWithFieldAPI(String arg0) {
        By checkbox = ByUsing.xpath("//span[contains(text(),'" + arg0 + "')]/..//span[@class='slds-checkbox_faux']");
        I.amPerforming().waitFor().ElementToBeClickable(checkbox);
        I.amPerforming().click().withJavaScript(checkbox, true);
    }

    @Then("^I (softly see|softly cannot see|cannot see|see) column \"([^\"]*)\" inside row \"([^\"]*)\" at position \"([^\"]*)\" contains text \"([^\"]*)\"$")
    public void iSeeInsideRowOfIndexAndColumnIndex(String usage, String colName, String rowNo, String tData, String text) {
        grantorProjectManager.assertTextInHistoryTable(usage, colName, rowNo, tData, text);
    }

    @Then("^I (softly see|softly cannot see|cannot see|see) column \"([^\"]*)\" at position \"([^\"]*)\" contains text \"([^\"]*)\"$")
    public void iSeeInsideRowOfIndexAndColumnIndexForLWC(String usage, String colName, String tData, String text) {
        grantorProjectManager.assertTextInHistoryTableForLWC(usage, colName, tData, text);
    }

    @And("^I (see|softly see|do not see|softly do not see) field \"([^\"]*)\" as \"([^\"]*)\" in \"([^\"]*)\" pageblock$")
    public void iSeeFieldStatusInPageBlock(String usage, String fieldName, String fieldValue, String pageblockName) {
        grantorProjectManager.seeFieldStatusInPageBlock(usage, fieldName, fieldValue, pageblockName);
    }

    @Then("^I (see|softly see|do not see|softly do not see) \"([^\"]*)\" button is displayed On Modal$")
    public void assertButtonDisplayedOnModal(String usage, String buttonName) {
        grantorProjectManager.assertButtonDisplayedOnModal(usage, buttonName);
    }

    @Then("^I (see|softly see|do not see|softly do not see) value \"([^\"]*)\" against the value \"([^\"]*)\" for title \"([^\"]*)\" in approval history$")
    public void iSeeValueAgainstTheValueForTitleInApprovalHistory(String usage, String expectedValue, String againstValue, String columnname) {
        grantorProjectManager.assertValueAgainstTheValueForTitleInApprovalHistory(usage, expectedValue, againstValue, columnname);
    }

    @And("^I select (user|dropdown|users) value \"([^\"]*)\" in field \"([^\"]*)\"$")
    public void iSelectValueInField(String usage, String arg0, String arg1) {
        if (usage.equalsIgnoreCase("user")) {
            By textbox = ByUsing.xpath("//c-fieldlwc[@data-fieldapiname='" + arg1 + "']//input[@type='search' or @placeholder='Search User...']");
            By SearchValue = ByUsing.xpath("//td[@data-label='" + arg0 + "']");
            I.amPerforming().click().on(textbox);
            I.amPerforming().checkToSee().isElementDisplayed(textbox);
            I.amPerforming().textInput().in(textbox, arg0);
            I.amPerforming().click().withJavaScript(textbox);
            if (I.amPerforming().checkToSee().isElementDisplayed(SearchValue)) {
                I.amPerforming().scroll().toMoveToElement(SearchValue);
                I.amPerforming().click().on(SearchValue);
            }
        } else if (usage.equalsIgnoreCase("users")) {
            By textbox = ByUsing.xpath("//div[contains(@class,'" + arg1 + "')]//input[@placeholder='Search Users...']");
            By SearchValue = ByUsing.xpath("//div[@title='" + arg0 + "']");
            I.amPerforming().click().on(textbox);
            I.amPerforming().checkToSee().isElementDisplayed(textbox);
            I.amPerforming().textInput().toClear(textbox);
            I.amPerforming().textInput().in(textbox, arg0);
            I.amPerforming().click().withJavaScript(textbox);
            if (I.amPerforming().checkToSee().isElementDisplayed(SearchValue)) {
                I.amPerforming().scroll().toMoveToElement(SearchValue);
                I.amPerforming().click().on(SearchValue);
            }
        } else if (usage.equalsIgnoreCase("dropdown")) {
            By Ddown = ByUsing.xpath("//c-fieldlwc[@data-fieldapiname='" + arg1 + "']//div[@part='input-container']/input[@placeholder='Select an Option']");
            By Option = ByUsing.xpath("//ul/li//span[text()='" + arg0 + "']");
            I.amPerforming().click().on(Ddown);
            I.amPerforming().waitFor().makeThreadSleep(2000);
            I.amPerforming().click().on(Option);
        }
    }

    @And("I click on nested button {string} in flex table with id {string}")
    public void iClickOnNestedButtonForValueInFlexTableWithId(String arg0, String arg2) {
        By Action = ByUsing.xpath("//c-lwc-flex-table[@data-flextablename='" + arg2 + "']//button[@class='slds-button slds-button_icon-border']");
        By Remove = ByUsing.xpath("//lightning-menu-item[@title='" + arg0 + "']");
        I.amPerforming().click().on(Action);
        I.amPerforming().waitFor().ElementToBeClickable(Remove);
        I.amPerforming().click().on(Remove);
    }

    @Then("I do not see value {string} inside auto search result after enterring into field {string}")
    public void iSeeValueInsideAutoSearchResultAfterEnterringIntoField(String arg0, String arg1) {
        Assert.assertFalse(isvalueDisplayinsearchicon(arg0, arg1));
    }

    private static boolean isvalueDisplayinsearchicon(String arg0, String arg1) {
        try {
            By textbox = ByUsing.xpath("//c-fieldlwc[@data-fieldapiname='" + arg1 + "']//input[@type='search' or @placeholder='Search User...'] | //div[@part='input-text']//input[contains(@id,'input') and @placeholder='Search User...']");
            By opt = ByUsing.xpath("//td[@data-label='" + arg0 + "']");
            I.amPerforming().click().on(textbox);
            I.amPerforming().checkToSee().isElementDisplayed(textbox);
            I.amPerforming().textInput().in(textbox, arg0);
            I.amPerforming().click().withJavaScript(textbox);
            if (I.amPerforming().checkToSee().isEnabled(opt)) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
        }
        return false;
    }

    @And("^I check button \"([^\"]*)\" is (present|not present) in table with id \"([^\"]*)\"$")
    public void iCheckButtonIsPresentInTableWithId(String arg0, String usage, String arg1) {
        if (usage.equalsIgnoreCase("present")) {
            Assert.assertTrue(assertButtoninTablewithId(arg0, arg1));
        } else if (usage.equalsIgnoreCase("not present")) {
            Assert.assertFalse(assertButtoninTablewithId(arg0, arg1));
        }
    }

    private static Boolean assertButtoninTablewithId(String buttonName, String id) {
        By Button = By.xpath("//c-lwc-flex-table[@data-flextablename='" + id + "']//button[contains(text(),'" + buttonName + "')]");
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(I.amPerforming().getElementReference().of(Button))) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    @And("I click on hyperlink against {string} in table {string}")
    public void iClickOnHyperlinkAgainstInTable(String value, String id) {
        grantorProjectManager.clickHyperLinkAgainstValueinTable(value, id);
    }

    @And("I click on {string} button on left navigation for global search")
    public void iClickOnButtonOnLeftNavigationForGlobalSearch(String buttonName) {
        grantorProjectManager.isButtonClickOnLeftNavigation(buttonName);
    }

    @And("I delete the file in download folder")
    public void iDeleteTheFileInDownloadFolder() throws IOException {
        I.amPerforming().waitFor().makeThreadSleep(2000);
        I.amPerforming().fileHandling().cleanDownloadFolder();
    }

    @And("I Update for setting as grantsgov lead with opportunity number {string}")
    public void iUpdateForSettingAsGrantsgovLeadWithOpportunityNumber(String OppoNumber) {
        grantorWebServices.UpdateForSettingAsGrantsgovLeadWithOpportunityNumber(OppoNumber);
    }

    @And("I create {string} qualified lead for title {string} and opportunity number {string} with properties {string}")
    public void iCreateQualifiedLeadTitleOfOpportunityNumberWithProperties(String isManual, String oppTitle, String oppoNo, String filter) {
        String newoppTitle = oppTitle + I.amPerforming().addOnsTo().getRandomNumber();
        I.amPerforming().propertiesFileOperationsTo().saveValue(oppTitle, newoppTitle);
        oppTitle = newoppTitle;

        if (oppoNo.startsWith("Automation Runtime")) {
            var newFieldValue = oppoNo + I.amPerforming().addOnsTo().getStringRandomNumber();
            I.amPerforming().propertiesFileOperationsTo().saveValue(oppoNo, newFieldValue);
            oppoNo = newFieldValue;
        }
        grantorWebServices.createQualifiedLead(isManual, oppTitle, oppoNo, filter);
    }

    @And("I create opportunity with state {string} for opportunity number {string} with properties {string}")
    public void iCreateOpportunityWithStateForOpportunityNumberWithProperties(String state, String oppoNo, String filter) {
        govgrants.perform().mainPage().waitForNavigationLogoToDisappear();
        grantorWebServices.CreateOpportunityWithStateForOpportunityNumberWithProperties(state, oppoNo, filter);
    }

    @And("^I create (Pre-application|Application) \"([^\"]*)\" with state \"([^\"]*)\" for opportunity number \"([^\"]*)\" with properties \"([^\"]*)\"$")
    public void iCreatePreApplicationWithStateForOpportunityNumberWithProperties(String module, String preAppTitle, String state, String oppoNo, String filter) {
        I.amPerforming().waitFor().makeThreadSleep(10000); //Wait for opportinity record to be available
        if (module.equalsIgnoreCase("Pre-application")) {
            grantorWebServices.CreatePreApplicationWithStateForOpportunityNumberWithProperties(module, preAppTitle, state, oppoNo, filter);
        } else {
            grantorWebServices.CreatePreApplicationWithStateForOpportunityNumberWithProperties(module, preAppTitle, state, oppoNo, filter);
        }
    }

    @And("I {string} award from application for opportunity {string} for title {string} with properties {string}")
    public void iAwardFromApplicationForOpportunityForTitleWithProperties(String state, String oppoNo, String appTitle, String filter) {
        grantorWebServices.awardFromApplicationForOpportunityForTitleWithProperties(state, oppoNo, appTitle, filter);
    }

    @And("I create adhoc closeout {string} for status {string} with properties {string}")
    public void iCreateAdhocCloseoutForStatusWithProperties(String grantTitle, String status, String filter) {
        grantorWebServices.CreateAdhocCloseoutForStatusWithProperties(grantTitle, status, filter);
    }

    @And("I create schedule closeout {string} for status {string} with properties {string}")
    public void iCreateScheduleCloseoutForStatusWithProperties(String grantTitle, String status, String filter) {
        grantorWebServices.CreateScheduleCloseoutForStatusWithProperties(grantTitle, status, filter);
    }

    @And("I {string} standalone subaward {string} with properties {string}")
    public void iStandaloneSubawardWithProperties(String state, String grantTitle, String filter) {
        String newGrantName = grantTitle + I.amPerforming().addOnsTo().getRandomNumber();
        I.amPerforming().propertiesFileOperationsTo().saveValue(grantTitle, newGrantName);
        grantTitle = newGrantName;
        grantorWebServices.StandaloneSubawardWithProperties(grantTitle, state, filter);
    }

    @And("I activate the award for title {string}")
    public void iActivateTheAwardForTitle(String grantTitle) {
        grantorWebServices.CreateActivateTheAward(grantTitle);
    }

    @And("I {string} the {string} for title {string} with properties {string}")
    public void iTheForTitleWithProperties(String status, String type, String title, String filter) {
        grantorWebServices.CreateTheProgressReportForTitleWithProperties(status, type, title, filter);
    }

    @And("I Created the schedule {string} for title {string} with properties {string}")
    public void iCreatedTheForTitleWithProperties(String type, String grantTitle, String filter) {
        grantorWebServices.CreateTheScheduleProgressReportForTitleWithProperties(type, grantTitle, filter);
    }

    @And("I update the schedule {string} in {string} state for title {string} with properties {string}")
    public void iUpdateTheScheduleInStateForTitleWithProperties(String type, String state, String grantTitle, String filter) {
        grantorWebServices.UpdateTheScheduleProgressReportForTitleWithProperties(type, state, grantTitle, filter);
    }

    @And("I {string} of type {string} amendment request for title {string} with properties {string}")
    public void iOfTypeAmendmentRequestForTitleWithProperties(String state, String type, String grantTitle, String filter) {
        grantorWebServices.CreateTheAmendmentRequestWithType(state, type, grantTitle, filter);
    }

    @And("I updated award from application for title {string} with properties {string}")
    public void iUpdatedAwardFromApplicationForTitleWithProperties(String appTitle, String filter) {
        grantorWebServices.updatedAwardFromApplicationForTitleWithProperties(appTitle, filter);
    }

    @And("I updated direct grant award for title {string} with properties {string}")
    public void iUpdatedDirectGrantAwardForTitleWithProperties(String appTitle, String filter) {
        grantorWebServices.UpdatedDirectGrantAwardForTitleWithProperties(appTitle, filter);
    }

    @And("I create program records with status {string} using {string} properties")
    public void iCreateProgramRecordsWithStatusUsingProperties(String status, String filter, DataTable table) {
        List<Map<String, String>> rows = table.asMaps();
        for (Map<String, String> row : rows) {

            String title = row.get("Title");
            String recordType = row.get("RecordType");

            if (title.startsWith("Automation Runtime")) {
                String newTitle = title + I.amPerforming().addOnsTo().getRandomNumber();
                I.amPerforming().propertiesFileOperationsTo().saveValue(title, newTitle);
                title = newTitle;
            }
            grantorWebServices.createProgramRecordsWithStatusUsingProperties(title, recordType, status, filter);
        }
    }

    /**
     * Creates Amendment Request records using status, filter, and DataTable input.
     * Converts Award name to ID and invokes service layer for record creation.
     *
     * @param status the Amendment Request status
     * @param filter payload modifier (e.g., "default")
     * @param table  DataTable containing Title (Award) and RecordType (Amendment Type)
     */
    @And("I create amendment request records with status {string} using {string} properties")
    public void iCreateAmendmentRequestRecordsWithStatusUsingProperties(String status, String filter, DataTable table) {
        List<Map<String, String>> rows = table.asMaps();
        for (Map<String, String> row : rows) {
            String award = row.get("Title");
            String amendmentType = row.get("AmendmentType");
            String recordType = row.get("RecordType");
            grantorWebServices.createAmendmentRequestRecordsWithStatusUsingProperties(amendmentType, recordType, award, status, filter);
        }
    }

    @And("I create subrecipient side amendment request records with status {string} using {string} properties")
    public void iCreateSubrecipientSideAmendmentRequestRecordsWithStatusUsingProperties(String status, String filter, DataTable table) {
        List<Map<String, String>> rows = table.asMaps();
        for (Map<String, String> row : rows) {
            String award = row.get("Title");
            String grant = row.get("GrantName");
            String amendmentType = row.get("AmendmentType");
            String recordType = row.get("RecordType");
            grantorWebServices.createSubrecipientSideAmendmentRequestRecordsWithStatusUsingProperties(amendmentType, recordType, award, grant, status, filter);
        }
    }

    @And("I create application records with status {string} using {string} properties")
    public void iCreateApplicationRecordsWithStatusUsingProperties(String status, String filter, DataTable table) {
        List<Map<String, String>> rows = table.asMaps();
        for (Map<String, String> row : rows) {
            String title = row.get("Title");
            String announcement = row.get("AnnouncementName");
            String preAppTitle = row.get("PreAppTitle");
            if (title.startsWith("Automation Runtime")) {
                String newTitle = title + I.amPerforming().addOnsTo().getRandomNumber();
                I.amPerforming().propertiesFileOperationsTo().saveValue(title, newTitle);
                title = newTitle;
            }
            grantorWebServices.createApplicationRecordsWithStatusUsingProperties(title, announcement, preAppTitle, status, filter);
        }
    }

    @And("I Initiated application review for multiple records on announcement")
    public void iInitiatedApplicationForMultipleRecords(DataTable table) {
        List<Map<String, String>> rows = table.asMaps();
        for (Map<String, String> row : rows) {
            String announcementName = row.get("AnnouncementName");
            grantorWebServices.initateApplicationReviewOnAnnouncementForMultipleRecords(announcementName);
        }
    }

    @And("I initiate pre-screen review for announcements with properties {string}")
    public void iStartedPreScreenReviewForMultipleRecordsOnAnnouncementUsingProperties(String filter, DataTable table) {
        List<Map<String, String>> rows = table.asMaps();
        for (Map<String, String> row : rows) {
            String announcementName = row.get("AnnouncementName");
            String reviewerName = row.get("ReviewerName");
            grantorWebServices.initiatePreScreenReviewForMultipleRecordsOnAnnouncementUsingProperties(announcementName, reviewerName, filter);
        }
    }

    @And("I submit review for announcements with properties {string}")
    public void iSubmitPreScreenReviewForAnnouncementsWithProperties(String filter, DataTable table) {
        List<Map<String, String>> rows = table.asMaps();
        for (Map<String, String> row : rows) {
            String reviewName = row.get("ReviewName");
            String announcementName = row.get("AnnouncementName");
            String applicationName = row.get("ApplicationName");
            grantorWebServices.submitPreScreenReviewForAnnouncementsWithProperties(reviewName, announcementName, applicationName, filter);
        }
    }

    @And("I initiate SME review for announcements with properties {string}")
    public void iInitiateSMEReviewForAnnouncementsWithProperties(String filter, DataTable table) {
        List<Map<String, String>> rows = table.asMaps();
        for (Map<String, String> row : rows) {
            String announcementName = row.get("AnnouncementName");
            String reviewerName = row.get("ReviewerName");
            String reviewerName2 = row.get("ReviewerName2");
            String reviewerName3 = row.get("ReviewerName3");
            grantorWebServices.initiateSMEReviewForAnnouncementsWithProperties(announcementName, reviewerName, reviewerName2, reviewerName3, filter);
        }
    }

    @And("I initiate management review for announcements with properties {string}")
    public void iInitiateManagementReviewForAnnouncementsWithProperties(String filter, DataTable table) {
        List<Map<String, String>> rows = table.asMaps();
        for (Map<String, String> row : rows) {
            String announcementName = row.get("AnnouncementName");
            String reviewerName = row.get("ReviewerName");
            grantorWebServices.initiateManagementReviewForAnnouncementsWithProperties(announcementName, reviewerName, filter);
        }
    }

    @And("I create FDM records with status {string} using {string} properties")
    public void iCreateFDMRecordsWithStatusUsingProperties(String status, String filter, DataTable table) {
        List<Map<String, String>> rows = table.asMaps();
        for (Map<String, String> row : rows) {
            String announcementName = row.get("AnnouncementName");
            String applicationName = row.get("ApplicationName");
            grantorWebServices.createFDMRecordsWithStatusUsingProperties(status, announcementName, applicationName, filter);
        }
    }

    @And("I initiate award for FDM records with properties {string}")
    public void iInitiateAwardForFDMRecordsWithProperties(String status, String filter, DataTable table) {
        List<Map<String, String>> rows = table.asMaps();
        for (Map<String, String> row : rows) {
            String announcementName = row.get("AnnouncementName");
            String applicationName = row.get("ApplicationName");
            grantorWebServices.initiateAwardForFDMRecordsWithProperties(announcementName, applicationName, filter);
        }
    }

    @And("I create pre-application records with status {string} using {string} properties")
    public void iCreatePreApplicationRecordsWithStatusUsingProperties(String status, String filter, DataTable table) {
        List<Map<String, String>> rows = table.asMaps();
        for (Map<String, String> row : rows) {
            String title = row.get("Title");
            String announcement = row.get("AnnouncementName");
            if (title.startsWith("Automation Runtime")) {
                String newTitle = title + I.amPerforming().addOnsTo().getRandomNumber();
                I.amPerforming().propertiesFileOperationsTo().saveValue(title, newTitle);
                title = newTitle;
            }
            grantorWebServices.createPreApplicationRecordsWithStatusUsingProperties(title, announcement, status, filter);
        }

    }

    @And("I create announcement records with status {string} using {string} properties")
    public void iCreateAnnouncementRecordsWithStatusUsingProperties(String status, String filter, DataTable table) {
        List<Map<String, String>> rows = table.asMaps();
        for (Map<String, String> row : rows) {
            String announcementName = row.get("AnnouncementName");
            String programName = row.get("ProgramName");
            String type = row.get("AnnType");
            String allocationlevel = row.get("AllocationLevel");
            if (announcementName.startsWith("Automation Runtime")) {
                String newTitle = announcementName + I.amPerforming().addOnsTo().getRandomNumber();
                I.amPerforming().propertiesFileOperationsTo().saveValue(announcementName, newTitle);
                announcementName = newTitle;
            }
            grantorWebServices.createAnnouncementRecordsWithStatusUsingProperties(announcementName, programName, type, allocationlevel, status, filter);
        }
    }

    @And("I create closeout records with status {string} using {string} properties")
    public void iCreateCloseoutRecordsWithStatusUsingProperties(String status, String filter, DataTable table) {
        List<Map<String, String>> rows = table.asMaps();
        for (Map<String, String> row : rows) {
            String awardName = row.get("AwardName");
            String closeoutType = row.get("CloseoutType");
            grantorWebServices.createCloseoutRecordsWithStatusUsingProperties(awardName, closeoutType, status, filter);
        }
    }

    @And("I create payment request records with status {string} using {string} properties")
    public void iCreatePaymentRequestRecordsWithStatusUsingProperties(String status, String filter, DataTable table) {
        List<Map<String, String>> rows = table.asMaps();
        for (Map<String, String> row : rows) {
            String title = row.get("Title");
            String awardName = row.get("AwardName");
            String paymentRequestType = row.get("PaymentRequestType");
            if (title.startsWith("Automation Runtime")) {
                String newTitle = title + I.amPerforming().addOnsTo().getRandomNumber();
                I.amPerforming().propertiesFileOperationsTo().saveValue(title, newTitle);
                title = newTitle;
            }
            grantorWebServices.createPaymentRequestRecordsWithStatusUsingProperties(title, awardName, paymentRequestType, status, filter);
        }
    }

    @And("I create site visit or Desk Review records with status {string} using {string} properties")
    public void iCreateSiteVisitRecordsWithStatusUsingProperties(String status, String filter, DataTable table) {
        List<Map<String, String>> rows = table.asMaps();
        for (Map<String, String> row : rows) {
            String title = row.get("Title");
            String awardName = row.get("AwardName");
            String recordType = row.get("RecordType");
            String monitoringType = row.get("MonitoringType");
            String associateAward = row.get("AssociateAward");
            if (title.startsWith("Automation Runtime")) {
                String newTitle = title + I.amPerforming().addOnsTo().getRandomNumber();
                I.amPerforming().propertiesFileOperationsTo().saveValue(title, newTitle);
                title = newTitle;
            }
            grantorWebServices.createSiteVisitRecordsWithStatusUsingProperties(title, awardName, recordType, monitoringType, associateAward, status, filter);
        }
    }

    @And("I create org level site visit or Desk Review records with status {string} using {string} properties")
    public void iCreateOrgLevelSiteVisitOrDeskReviewRecordsWithStatusUsingProperties(String status, String filter, DataTable table) {
        List<Map<String, String>> rows = table.asMaps();
        for (Map<String, String> row : rows) {
            String title = row.get("Title");
            String accountName = row.get("AccountName");
            String recordType = row.get("RecordType");
            String monitoringType = row.get("MonitoringType");
            String associateAward = row.get("AssociateAward");
            if (title.startsWith("Automation Runtime")) {
                String newTitle = title + I.amPerforming().addOnsTo().getRandomNumber();
                I.amPerforming().propertiesFileOperationsTo().saveValue(title, newTitle);
                title = newTitle;
            }
            grantorWebServices.createOrgLevelSiteVisitOrDeskReviewRecordsWithStatusUsingProperties(title, accountName, recordType, monitoringType, associateAward, status, filter);
        }
    }

    @And("I update schedule payment request records with status {string} using {string} properties")
    public void iUpdateSchedulePaymentRequestRecordsWithStatusUsingProperties(String status, String filter, DataTable table) {
        List<Map<String, String>> rows = table.asMaps();
        for (Map<String, String> row : rows) {
            String EGMSId = row.get("EGMSId");
            String awardName = row.get("AwardName");
            String paymentRequestType = row.get("PaymentRequestType");
            grantorWebServices.updateSchedulePaymentRequestRecordsWithStatusUsingProperties(EGMSId, awardName, paymentRequestType, status, filter);
        }
    }

    @And("I update schedule progress report records with status {string} using {string} properties")
    public void iUpdateScheduleProgressReportRecordsWithStatusUsingProperties(String status, String filter, DataTable table) {
        List<Map<String, String>> rows = table.asMaps();
        for (Map<String, String> row : rows) {
            String EGMSId = row.get("EGMSId");
            String awardName = row.get("AwardName");
            grantorWebServices.updateScheduleProgressReportRecordsWithStatusUsingProperties(EGMSId, awardName, status, filter);
        }
    }
}

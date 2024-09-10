package com.ggproduct.automation.steps.govgrantsSteps;


import com.helperPackage.handlers.govgrants;
import com.helperPackage.exception.TestingBlazeCustomException;
import com.helperPackage.objects.Elements;
import com.helperPackage.register.I;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.io.File;
import java.util.List;
import java.util.Map;

public final class GovGrantsObjects {
    private String searchTermForQsearch, tableIdForQsearch;
    private boolean validationActionFlag = false;
    private int refreshActionIcon = 0;

    /**
     * generic method to take search term and search for it
     *
     * @param searchTermForQsearch
     */
    protected void performQuickSearch(String searchTermForQsearch) {
        this.searchTermForQsearch = searchTermForQsearch;
        govgrants.perform().quickSearch().performQuickSearch(this.searchTermForQsearch);
    }

    /**
     * generic method to take search term and search for it inside global search
     *
     * @param searchTermForGlobalQsearch
     */
    protected void performQuickSearchForGlobalSearch(String searchTermForGlobalQsearch) {
        this.searchTermForQsearch = searchTermForGlobalQsearch;
        govgrants.perform().quickSearch().performGlobalQuickSearch(this.searchTermForQsearch);
    }

    /**
     * generic method to take search term and search for it using tableId and search
     *
     * @param tableIdForQsearch
     * @param searchTermForQsearch
     */
    protected void performQuickSearch(String tableIdForQsearch, String searchTermForQsearch) throws TestingBlazeCustomException {
        this.tableIdForQsearch = tableIdForQsearch;
        this.searchTermForQsearch = searchTermForQsearch;
        if (!I.amPerforming().browserOperationsTo().getCurrentUrl().contains("lightning") && !I.amPerforming().browserOperationsTo().getCurrentUrl().contains("recipient")) {
            if (searchTermForQsearch.equalsIgnoreCase("Record Id")) {
                govgrants.perform().quickSearch().performTableSpecificQuickSearch(this.tableIdForQsearch,
                        govgrants.perform().pageDetails().idOfRecord);
            } else {
                govgrants.perform().quickSearch().performTableSpecificQuickSearch(this.tableIdForQsearch, this.searchTermForQsearch);
            }
        } else {
            if (this.tableIdForQsearch.contains("PendingTasks") || this.tableIdForQsearch.contains("CompletedTasks")) {
                boolean recordPresent = false;
                int counter = 0;
                while (!recordPresent && counter < 15) {
                    if (I.amPerforming().checkToSee().IsElementPresentQuick(By.xpath("//c-lwc-flex-table[@data-flextablename='" + this.tableIdForQsearch + "']//*[contains(text(),'Total Records:')]"))) {
                        recordPresent = true;
                        break;
                    } else {
                        if (this.tableIdForQsearch.contains("PendingTasks")) {
                            I.amPerforming().browserOperationsTo().refreshPage();
                            govgrants.perform().sideBar().clickSideBarContent("My Tasks", "Pending Tasks");
                            I.amPerforming().waitFor().makeThreadSleep(9000);
                        } else if (this.tableIdForQsearch.contains("CompletedTasks")) {
                            I.amPerforming().browserOperationsTo().refreshPage();
                            govgrants.perform().sideBar().clickSideBarContent("My Tasks", "Completed Tasks");
                            I.amPerforming().waitFor().makeThreadSleep(9000);
                        }
                        counter++;
                    }
                }
            }
            if (searchTermForQsearch.equalsIgnoreCase("Record Id")) {
                govgrants.perform().quickSearch().performTableSpecificQuickSearchLwc(this.tableIdForQsearch,
                        govgrants.perform().pageDetails().idOfRecord);
            } else {
                govgrants.perform().quickSearch().performTableSpecificQuickSearchLwc(this.tableIdForQsearch, this.searchTermForQsearch);
            }
        }
    }


    /**
     * perform click on advance filter with table id
     *
     * @param tableId
     * @param dataTargetValue
     */
    public void performClickOnAdvanceFilterWithTableId(String tableId, String dataTargetValue) {
        I.amPerforming().click().on(govgrants.perform().phasePanel().getAdvanceFilterItem(tableId, dataTargetValue));
    }

    /**
     * perform click on advance filter with table id
     *
     * @param tableId
     */
    public void performClickOnAdvanceFilterWithTableIdForLWC(String tableId) {
        I.amPerforming().click().withJavaScript(govgrants.perform().phasePanel().getAdvanceFilterItemForLWC(tableId));
    }

    /**
     * click logout to log out
     */
    protected void clickLogOut() {
        if (I.amPerforming().browserOperationsTo().getCurrentUrl().contains("lightning")) {
            govgrants.perform().mainPage().clickLoginDropDown();
            govgrants.perform().mainPage().clickLoginDropDownItems("Log Out");
        } else {
            try {
                I.amPerforming().waitFor().makeThreadSleep(1000);
                govgrants.perform().mainPage().clickLoginDropDown();
                govgrants.perform().mainPage().clickLoginDropDownItems("Logout");
            } catch (Exception ex) {
                I.amPerforming().waitFor().makeThreadSleep(1000);
                I.amPerforming().click().withJavaScript(govgrants.perform().mainPage().getLoginDropDownItems("Logout"));
            }
        }
    }

    /**
     * Click on toggle button on flex table
     */
    protected void clickToggleButtonAndSelect(String menuItemName) {
        try {
            govgrants.perform().phasePanel().clickDoubleArrowDropDownAndSelectItem(menuItemName);
        } catch (Exception e) {
            govgrants.perform().phasePanel().clickDoubleArrowDropDownAndSelectItem(menuItemName);
        }
    }

    /**
     * Click on Sub Tabs inside Grants and Announcements
     */
    protected void clickSubTab(String subTab) {
        if (I.amPerforming().browserOperationsTo().getCurrentUrl().contains("lightning") || I.amPerforming().browserOperationsTo().getCurrentUrl().contains("recipient")) {
            govgrants.perform().pageDetails().clickSubTabsInsideTableViewForLWC(subTab);
        } else {
            govgrants.perform().pageDetails().clickSubTabsInsideTableView(subTab);
        }
    }

    /**
     * Click on Sub Tabs inside Grants and Announcements
     */
    protected void clickSubTabInSplitScreen(String subTab) {
        govgrants.perform().pageDetails().clickSubTabsInsideTableViewForSplitScreen(subTab);
    }

    /**
     * click any action icon It refreshes the page to get the element after
     * processing is completed.
     */
    protected void clickActionIconWithRecordWaitOnly(String actionIcon, String... anyUniqueColumnValue) {
        if (validationActionFlag) {
            validationActionFlag = false;
            refreshActionIcon = 0;
        }
        try {
            try {
                govgrants.perform().flexTable().clickTableActionIcons(actionIcon, anyUniqueColumnValue);
                validationActionFlag = true;
            } catch (Exception e) {
                govgrants.perform().flexTable().clickTableActionIcons(actionIcon, anyUniqueColumnValue);
                validationActionFlag = true;
            }
        } catch (Exception e) {
            refreshActionIcon++;
            if (!validationActionFlag && refreshActionIcon < 2) {
                I.amPerforming().browserOperationsTo().refreshPage();
                clickActionIconWithRecordWaitOnly(actionIcon, anyUniqueColumnValue);
            } else {
                throw e;
            }
        }
    }

    /**
     * click any action icon. It also refreshes the page get the element after
     * processing is completed.
     */
    protected void clickActionIconWithRecordWaitOnlyy(String flexTableId, String actionIcon,
                                                      String... anyUniqueColumnValue) {
        if (validationActionFlag) {
            validationActionFlag = false;
            refreshActionIcon = 0;
        }
        try {
            govgrants.perform().flexTable().clickTableActionIcon(flexTableId, actionIcon, anyUniqueColumnValue);
            validationActionFlag = true;
        } catch (Exception e) {
            refreshActionIcon++;
            if (!validationActionFlag && refreshActionIcon < 2) {
                I.amPerforming().browserOperationsTo().refreshPage();
                clickActionIconWithRecordWaitOnlyy(flexTableId, actionIcon, anyUniqueColumnValue);
            } else {
                throw e;
            }
        }
    }

    /**
     * click any action icon. The method will also perform quick search if it was
     * executed prior calling it. It also refreshes the page get the element after
     * processing is completed.
     */
    protected void clickActionIconWithWaitAndSearch(String actionIcon, String... anyUniqueColumnValue) {
        if (validationActionFlag) {
            validationActionFlag = false;
            refreshActionIcon = 0;
        }
        try {
            try {
                if ((anyUniqueColumnValue.length == 1) && (anyUniqueColumnValue[0].equalsIgnoreCase("Record Id"))) {
                    govgrants.perform().flexTable().clickTableActionIcons(actionIcon, govgrants.perform().pageDetails().idOfRecord);
                } else {
                    govgrants.perform().flexTable().clickTableActionIcons(actionIcon, anyUniqueColumnValue);
                }
            } catch (Exception e) {
                if ((anyUniqueColumnValue.length == 1) && (anyUniqueColumnValue[0].equalsIgnoreCase("Record Id"))) {
                    govgrants.perform().flexTable().clickTableActionIcons(actionIcon, govgrants.perform().pageDetails().idOfRecord);
                } else {
                    govgrants.perform().flexTable().clickTableActionIcons(actionIcon, anyUniqueColumnValue);
                }
            }
            validationActionFlag = true;
            tableIdForQsearch = null;
            searchTermForQsearch = null;
        } catch (Exception e) {
            refreshActionIcon++;
            if (!validationActionFlag && refreshActionIcon < 2) {
                if (searchTermForQsearch != null) {
                    handlePerformSearchForActions();
                }
                clickActionIconWithWaitAndSearch(actionIcon, anyUniqueColumnValue);
            } else {
                refreshActionIcon = 0;
                tableIdForQsearch = null;
                searchTermForQsearch = null;
                throw e;
            }
        }
    }

    /**
     * click any action icon. The method will also perform quick search if it was
     * executed prior calling it. It also refreshes the page get the element after
     * processing is completed.
     */
    protected void clickActionIconWithWaitAndSearchh(String flexTableId, String actionIcon,
                                                     String... anyUniqueColumnValue) {
        if (validationActionFlag) {
            validationActionFlag = false;
            refreshActionIcon = 0;
        }
        try {
            try {
                if ((anyUniqueColumnValue.length == 1) && (anyUniqueColumnValue[0].equalsIgnoreCase("Record Id"))) {
                    govgrants.perform().flexTable().clickTableActionIcon(flexTableId, actionIcon, govgrants.perform().pageDetails().idOfRecord);
                } else {
                    govgrants.perform().flexTable().clickTableActionIcon(flexTableId, actionIcon, anyUniqueColumnValue);
                }
            } catch (Exception e) {
                if ((anyUniqueColumnValue.length == 1) && (anyUniqueColumnValue[0].equalsIgnoreCase("Record Id"))) {
                    govgrants.perform().flexTable().clickTableActionIcon(flexTableId, actionIcon, govgrants.perform().pageDetails().idOfRecord);
                } else {
                    govgrants.perform().flexTable().clickTableActionIcon(flexTableId, actionIcon, anyUniqueColumnValue);
                }
            }

            validationActionFlag = true;
            tableIdForQsearch = null;
            searchTermForQsearch = null;
        } catch (Exception e) {
            refreshActionIcon++;
            if (!validationActionFlag && refreshActionIcon < 2) {
                I.amPerforming().browserOperationsTo().refreshPage();
                if (searchTermForQsearch != null) {
                    handlePerformSearchForActions();
                }
                clickActionIconWithWaitAndSearchh(flexTableId, actionIcon, anyUniqueColumnValue);
            } else {
                refreshActionIcon = 0;
                tableIdForQsearch = null;
                searchTermForQsearch = null;
                throw e;
            }
        }
//        govgrants.perform().modal().acceptPopUp();
    }

    /**
     * Fills out a new RoleAndResponsibility record with the given User and
     * Responsibility
     */
    protected void assignRole(String flexTableId, Map<String, String> mapFieldApiNamesToValues) {
        for (int i = 0; i < 10; i++) {
            try {
                govgrants.perform().flexTable().clickTableTopRightButton(flexTableId, "New");
                break;
            } catch (Exception e) {
                I.amPerforming().browserOperationsTo().refreshPage();
            }
        }
        for (String key : mapFieldApiNamesToValues.keySet()) {
            govgrants.perform().inputForms().inputFormDataByFieldApiName(key, mapFieldApiNamesToValues.get(key), false);
        }
        govgrants.perform().modal().clickModalContentSpecificButton("Save");
        try {
            if (I.amPerforming().checkToSee().isDisplayed(govgrants.perform().modal().getModalContentSpecificButton("Save"), false)) {
                I.amPerforming().waitFor().makeThreadSleep(1500);
                govgrants.perform().modal().clickModalContentSpecificButton("Save");
            }
        } catch (Exception e) {
            // No action require
        }
    }

    /**
     * Assigns a User to be a reviewer for a Program during a given review step
     */
    protected void assignReviewer(String flexTableId, String stepName, String panelName, String user) {
        clickActionIconWithWaitAndSearchh(flexTableId, "View", stepName);
        clickActionIconWithWaitAndSearchh("RelatedReviewPanelTemplate", "View", panelName);
        govgrants.perform().flexTable().clickTableTopRightButton("RelatedTemplateReviewers", "New");
        govgrants.perform().inputForms().inputFormDataByFieldApiName("Reviewer__c", user, false);
        govgrants.perform().modal().clickModalContentSpecificButton("Save");
        govgrants.perform().modal().closeModalByClickingTopRightCloseButton();
    }

    /**
     * Checks a checkbox in each row of a flex table containing given strings
     */
    public void checkFlexRows(String flexTableId, String... uniqueColumnTexts) {
        govgrants.perform().flexTable().selectCheckBoxes(flexTableId, uniqueColumnTexts);
    }


    /**
     * Performs the necessary actions to upload an attachment through a flex table
     * Cannot use individual steps because the flex table id changes in between different environments
     * <p>
     * Actions taken:
     * 1. Gets the Id of the flex table
     * 2. Clicks the "Add" button (which switches to the modal)
     * 3. Enters the required information
     * 4. Clicks "Save"
     * 5. Closes modal by clicking the top-right "x" button
     *
     * @param fileName The name of the file to upload
     * @param fileType The type of file to upload (the value to enter in the dropdown)
     */
    public void uploadAttachmentInFlexTable(String fileName, String fileType) {
        By attachmentClassificationPath = By.xpath("//select[@title='Classification' or text()='Classification']");
        By attachmentDescriptionPath = By.xpath("//div//label[text()='Description']/..//textarea");
        By attachmentFilePath = By.xpath(""
                + "//td//label[text()='File']/../..//input[@type='file']"
                + " | //div//label[text()='File']/..//input[@type='file']"
                + " | //div//span[text()='File']/../..//input[@type='file']");
        String defaultFilePath = System.getProperty("user.dir") + "/src/main/resources/";

        // Step 1
        String tableId = I.amPerforming().actionToGet().attribute(By.xpath("//*[contains(@class, 'panel-heading')]//button[text()='Add']"), "data-target");
        tableId = tableId.substring(tableId.length() - 18);

        // Step 2
        govgrants.perform().flexTable().clickTableTopRightButton(tableId, "Add");

        // Step 3
        I.amPerforming().dropDownSelection().from(attachmentClassificationPath).selectByValue(fileType);
        I.amPerforming().textInput().in(attachmentDescriptionPath, "Default Comment");
        I.amPerforming().textInput().in(attachmentFilePath, defaultFilePath + fileName);

        // Step 4
        I.amPerforming().click().on(By.xpath("//input[@value='Save']"));

        // Step 5
        govgrants.perform().modal().closeModalByClickingTopRightCloseButton();
    }

    /**
     * @param fileName name of a file
     * @param fileType type of file such as Other....
     *                 When we wants to add classification type and file on modal after clicking on Add Files top right button present in
     *                 flex table then we can use this step...
     */
    public void uploadAttachmentInFlexTableFromComputer(Boolean withoutRandomNumber, String fileName, String fileType) {
        /*By classificationType = By.xpath("//select[@title='Classification' or @name='Classification']");
        By filePath = By.xpath("//label[contains(@id,'file')]/../input");
        String defaultFilePath = System.getProperty("user.dir") + "/src/main/resources/";
        I.amPerforming().dropDownSelection().from(classificationType).selectByValue(fileType);
        I.amPerforming().textInput().in(filePath, defaultFilePath + fileName);
        I.amPerforming().click().on(By.xpath("//button[text()='Upload']"));*/

        By classificationType = By.xpath("//select[@title='Classification' or @name='Classification']");
        By filePath = By.xpath("//label[contains(@id,'file')]/../input");
        String defaultFilePath = System.getProperty("user.dir") + "/src/main/resources/";
        String[] splitFileName = fileName.split("\\.");
        String newFileName = withoutRandomNumber ? fileName : splitFileName[0] + I.amPerforming().addOnsTo().getStringRandomNumber() + "." + splitFileName[1];
        try {
            // renamed file with random number
            if (!withoutRandomNumber) {
                renameFile(defaultFilePath, fileName, newFileName);
            }
            I.amPerforming().waitFor().ElementToBeVisible(classificationType);
            I.amPerforming().dropDownSelection().from(classificationType).selectByValue(fileType);
            I.amPerforming().waitFor().makeThreadSleep(5000);
            I.amPerforming().textInput().in(filePath, defaultFilePath + newFileName);
            I.amPerforming().click().withJavaScript(By.xpath("//button[text()='Upload']"));
        } finally {
            try {
                I.amPerforming().waitFor().makeThreadSleep(10000);
                if (!withoutRandomNumber) {
                    // renaming back to the original file name
                    renameFile(defaultFilePath, newFileName, fileName);
                }
            } catch (Exception ee) {
                ee.printStackTrace();
            }
        }
    }

    public void uploadAttachmentInFlexTableFromComputerForLWC(Boolean withoutRandomNumber, String fileName, String fileType) {

        By classificationType = By.xpath("//button[@title='Classification' or @name='Classification']");
        By selectClassificationType = By.xpath("//span[normalize-space(text())='" + fileType + "']");
        By filePath = By.xpath("//label[contains(@id,'file')]/../input");
        String defaultFilePath = System.getProperty("user.dir") + "/src/main/resources/";
        String[] splitFileName = fileName.split("\\.");
        String newFileName = withoutRandomNumber ? fileName : splitFileName[0] + I.amPerforming().addOnsTo().getStringRandomNumber() + "." + splitFileName[1];
        try {
            // renamed file with random number
            if (!withoutRandomNumber) {
                renameFile(defaultFilePath, fileName, newFileName);
            }
            I.amPerforming().click().on(classificationType);
            I.amPerforming().click().on(selectClassificationType);
            I.amPerforming().waitFor().makeThreadSleep(5000);
            I.amPerforming().textInput().in(filePath, defaultFilePath + newFileName);
            I.amPerforming().click().withJavaScript(By.xpath("//button[text()='Upload']"));
        } finally {
            try {
                I.amPerforming().waitFor().makeThreadSleep(10000);
                if (!withoutRandomNumber) {
                    // renaming back to the original file name
                    renameFile(defaultFilePath, newFileName, fileName);
                }
            } catch (Exception ee) {
                ee.printStackTrace();
            }
        }
    }

    /**
     * complete steps to upload attachment on row level edit click inside attachment block
     * <p>
     * Actions taken:
     * 1. Clicks the "Edit" icon (which switches to the modal)
     * 2. Enters the required information
     * 3. Clicks "Save"
     *
     * @param iconName
     * @param fileName The name of the file to upload
     * @param fileType The type of file to upload (the value to enter in the dropdown)
     * @author: Monu.Kumar
     */
    public void clickEditAnduploadAttachmentInFlexTable(String iconName, String fileName, String fileType) {
        By attachmentClassificationPath = By.xpath("//select[@title='Classification' or text()='Classification']");
        By attachmentDescriptionPath = By.xpath("//div//label[text()='Description']/..//textarea");
        By attachmentFilePath = By.xpath("//td//input[@type='file']");
        String defaultFilePath = System.getProperty("user.dir") + "/src/main/resources/";
        String tableId = I.amPerforming().actionToGet().attribute(By.xpath("//*[contains(@class, 'panel-heading')]//button[text()='Add']"), "data-target");
        tableId = tableId.substring(tableId.length() - 18);
        govgrants.perform().flexTable().clickTableActionIcon(tableId, iconName, fileName);
        I.amPerforming().dropDownSelection().from(attachmentClassificationPath).selectByValue(fileType);
        I.amPerforming().textInput().toClear(attachmentDescriptionPath);
        I.amPerforming().textInput().in(attachmentDescriptionPath, "T&CDefault Comment");
        I.amPerforming().textInput().in(attachmentFilePath, defaultFilePath + fileName);
        I.amPerforming().click().on(By.xpath("//input[@value='Save']"));
    }

    /**
     * click on add button inside attachments page block only
     * <p>
     * Reason for this function - As in framework and in PRDOH we have some scenarios where we just performing
     * click on Add button at Attachment Page block.
     * </p>
     *
     * @author Monu Kumar
     */

    public void clickAddUnderAttachmentsPageBlock(String buttonName) {
        I.amPerforming().click().on(By.xpath("//button[@title='" + buttonName + "']"));
    }

    /**
     * complete steps to add notes in attachment sub tab
     * Actions taken:
     * 1. Clicks the "Add" button (which switches to the modal)
     * 2. Enters the required information
     * 3. Clicks "Save/Save and Close Modal"
     *
     * @author: Monu Kumar
     */
    public void addNotesInFlexTable() {
        By notesDescriptionPath = By.xpath("//div[@id='addAtt']//label[text()='Description']/..//textarea");
        By notesTitle = By.xpath("//div[@id='addAtt']//label[text()='Title']/..//input");
        String tableId = I.amPerforming().actionToGet().attribute(By.xpath("//*[contains(@class, 'panel-heading')]//button[text()='Add' and contains(@data-target,'Note')]"), "data-target");
        tableId = tableId.substring(tableId.length() - 18) + "Notes";
        govgrants.perform().flexTable().clickTableTopRightButton(tableId, "Add");
        I.amPerforming().textInput().in(notesTitle, "Notes Record");
        I.amPerforming().textInput().in(notesDescriptionPath, "Automation Notes");
        I.amPerforming().click().on(By.xpath("//input[@value='Save']|//input[@value='Save and Close Modal']"));
    }

    /**
     * * click flex table item based on program name/subject , status and iconName
     * * without processing any operation on modal/confirmation box
     *
     * @param flextableId
     * @param iconName
     * @param anycolumnvalue
     */
    protected void clickTableActionIconsForSpecificSubjectWithoutProcessing(String flextableId, String iconName,
                                                                            String... anycolumnvalue) {
        if (!I.amPerforming().browserOperationsTo().getCurrentUrl().contains("lightning") && !I.amPerforming().browserOperationsTo().getCurrentUrl().contains("recipient")) {
            I.amPerforming().click().on(govgrants.perform().flexTable().getTableActionIcon(flextableId, iconName, anycolumnvalue));
        } else {
            WebElement desiredAction = null;
            for (String uniqueColumnValue : anycolumnvalue) {
                desiredAction = I.amPerforming().getElementReference().of(By.xpath("//c-lwc-flex-table[@data-flextablename='" + flextableId + "']//tbody/tr//*[text()='" + uniqueColumnValue + "']//ancestor::td/div[not(contains(@class,'inputRows'))]/parent::td/preceding-sibling::td//button"));
                I.amPerforming().scroll().toMoveToElement(desiredAction);
                I.amPerforming().waitFor().makeThreadSleep(2000);
                I.amPerforming().click().withJavaScript(desiredAction);
                I.amPerforming().click().withJavaScript(govgrants.perform().flexTable().getTableActionIcon(flextableId, iconName, anycolumnvalue));
            }
        }
    }

    /**
     * handles perform quick search for action icon. gets the static variables from
     * project manager
     */
    private void handlePerformSearchForActions() {
        if (searchTermForQsearch != null) {
            try {
                performQuickSearch(searchTermForQsearch);
            } catch (Exception e) {
                /* Ignore Exception */
            }
            if (tableIdForQsearch != null) {
                try {
                    performQuickSearch(tableIdForQsearch, searchTermForQsearch);
                } catch (Exception e) {
                    /* Ignore Exception */
                }
            }
        }
    }


    /**
     * return true if expected records displayed inside table
     *
     * @param recordsName
     * @return
     */
    public void isExpectedRecordsDisplayedInsideTable(String usage, String flexTableHeader, String actionName, String... recordsName) {
        Boolean isRecordsDisplayed = false;
        if (!usage.contains("action"))
            for (String expectedRecords : recordsName) {
                I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[@id='myTabbedContent']//a[@title='" + flexTableHeader + "']/../../../following-sibling::div//tbody//td//span[normalize-space(text())='" + expectedRecords + "']"));
                isRecordsDisplayed = true;
            }
        else {
            for (String expectedRecords : recordsName) {
                I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[@id='myTabbedContent']//a[@title='" + flexTableHeader + "']/ancestor::div/following-sibling::div//tbody//td//span[normalize-space(text())='" + expectedRecords + "']//ancestor::td/following-sibling::td//*[@title='" + actionName + "']"));
                isRecordsDisplayed = true;
            }
        }

        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(isRecordsDisplayed).isTrue();
        } else {
            Assert.assertTrue(isRecordsDisplayed);
        }
    }

    public void renameFile(String defaultPath, String oldFileName, String newFileName) {
        File oldFile = new File(defaultPath + oldFileName);
        File newFile = new File(defaultPath + newFileName);
        if (newFile.exists())
            throw new RuntimeException("Name of renamed file is already exist...");
        boolean success = oldFile.renameTo(newFile);
        if (!success) {
            throw new RuntimeException("File is not renamed");
        }
    }

    /**
     * To click on back navigation arrow
     *
     * @author keerti.munde
     */

    public void backNavigation() {
        I.amPerforming().browserOperationsTo().navigateBack();
    }

    public void toCheckValueForTitleInsideFieldHistoryTable(String usage, String rowValue, String headerName) {
        if (usage.equals("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isFileHistoryDisplayedInsidetable(rowValue, headerName)).isTrue();
        } else if (usage.equals("see")) {
            Assert.assertTrue(isFileHistoryDisplayedInsidetable(rowValue, headerName));
        } else if (usage.equals("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isFileHistoryDisplayedInsidetable(rowValue, headerName)).isFalse();
        } else if (usage.equals("do not see")) {
            Assert.assertFalse(isFileHistoryDisplayedInsidetable(rowValue, headerName));
        }
    }

    public void toCheckValueForTitleInsideFieldHistoryTableAgainstValue(boolean isSoftly, String rowValue, String headerName, String uniqueValue) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(isFileHistoryDisplayedInsidetableAgainstValue(rowValue, headerName, uniqueValue)).isTrue();
        } else {
            Assert.assertTrue(isFileHistoryDisplayedInsidetableAgainstValue(rowValue, headerName, uniqueValue));
        }
    }

    public boolean isFileHistoryDisplayedInsidetable(String rowValue, String headerName) {
        Boolean flag = false;
        try {
            return I.amPerforming().checkToSee().isDisplayed(By.xpath("//table//tr//th[@data-label='" + headerName + "']//span[@title='" + rowValue + "' or text()='" + rowValue + "'] | //table//tr//td[@data-label='" + headerName + "']//*[text()='" + rowValue + "'] | //table//tr//td[@data-label='" + headerName + "']//a[@title='" + rowValue + "'] | //table//tr//td[@data-label='" + headerName + "']//lightning-input[@Checked]"));
        } catch (Exception e) {
        }
        return false;
    }

    public boolean isFileHistoryDisplayedInsidetableAgainstValue(String rowValue, String headerName, String uniqueValue) {
        Boolean flag = false;
        try {
            return I.amPerforming().checkToSee().isDisplayed(By.xpath("//table//tr//th[@data-label='" + headerName + "']//span[@title='" + rowValue + "' or text()='" + rowValue + "']/ancestor::tr//td//*[@title='" + uniqueValue + "' or text()='" + uniqueValue + "'] | //table//tr//td//a[@title='" + uniqueValue + "' or text()='" + uniqueValue + "']/ancestor::tr//td[@data-label='" + headerName + "']//a[text()='" + rowValue + "'] | //table//tr//td//*[@title='" + uniqueValue + "' or text()='" + uniqueValue + "']/ancestor::tr//td[@data-label='" + headerName + "']//*[text()='" + rowValue + "'] | //table//tr//td[@data-label='" + headerName + "']//a[@title='" + rowValue + "']/ancestor::tr//td//a[@title='" + uniqueValue + "' or text()='" + uniqueValue + "']"));
        } catch (Exception e) {
        }
        return false;
    }

    public void toClickOnRowLevelActionButtonforGloabalSearchTable(String tableId, String uniqueColumnValue, String buttonName) {
        String columnValueUpdated = uniqueColumnValue;
        if (uniqueColumnValue.equalsIgnoreCase("Record Id")) {
            columnValueUpdated = govgrants.perform().pageDetails().idOfRecord;
        }
        WebElement ClickSelector = I.amPerforming().getElementReference().of(By.xpath("//div[contains(@aria-label,'" + tableId + "')]//table//th//*[text()='" + columnValueUpdated + "']//ancestor::tr//td//a[@role='button'] | //div[contains(@aria-label,'" + tableId + "')]//table//td//*[text()='" + columnValueUpdated + "']//ancestor::tr//td//a[@role='button']"));
        I.amPerforming().click().withJavaScript(ClickSelector);
        WebElement element = I.amPerforming().getElementReference().of(By.xpath("//div[@role='menu']//ul//li//*[text()='" + buttonName + "']"));
        I.amPerforming().click().withJavaScript(element);
        govgrants.perform().modal().acceptPopUp();
    }

    public void toClickOnRecordIdForGlobalSearch(String recordName) {
        WebElement dropdownRecord = I.amPerforming().getElementReference().of(By.xpath("//div[@class='listContent']//ul//li//a//span[@title='" + recordName + "']"));
        I.amPerforming().click().on(dropdownRecord);
    }

    public void toFilterTheValueByLabelName(String usage, String searchValue, String labelName) {
        if (usage.equalsIgnoreCase("dropDown")) {
            WebElement valueName = I.amPerforming().getElementReference().of(By.xpath("//div[@data-aura-class='forceSearchResultsFilters']//label[text()='" + labelName + "']/..//button[@aria-haspopup='listbox']"));
            I.amPerforming().click().on(valueName);
            By dropdownOptions = By.xpath("//div[@data-aura-class='forceSearchResultsFilters']//label[text()='Status']/..//div//div[@role='listbox']//span[@title='" + searchValue + "']");
            I.amPerforming().waitFor().ElementToBeVisible(dropdownOptions);
            I.amPerforming().click().on(dropdownOptions);
        } else{
            WebElement valueName = I.amPerforming().getElementReference().of(By.xpath("//div[@data-aura-class='forceSearchResultsFilters']//label//*[text()='" + labelName + "']/../parent::div//input[@type='text']"));
            By buttonName = By.xpath("//div[@data-aura-class='forceSearchResultsFilters']//label//*[text()='" + labelName + "']/../parent::div/..//button[@title='Apply filter']");
            I.amPerforming().click().on(valueName);
            I.amPerforming().textInput().toClear(valueName);
            I.amPerforming().textInput().in(valueName, searchValue);
            if (I.amPerforming().checkToSee().isElementDisplayed(buttonName)) {
                I.amPerforming().click().on(buttonName);
            }
        }
    }

    public void toClickOnModuleOnLeftNavigationForGlobalSearch(String moduleName) {
        By buttonLabel = By.xpath("//div[@id='allItemsList']//ul//li//*[text()='" + moduleName + "']");
        I.amPerforming().waitFor().ElementToBeClickable(buttonLabel);
        I.amPerforming().click().on(buttonLabel);
    }

    public void toUpdateTitleAsOnUploadFileModal(String titleName) {
       By title = By.xpath("//div[@id='WorkspaceFileEdit']//label[text()='Title']/..//div//input[@part='input']");
       I.amPerforming().waitFor().ElementToBeVisible(title);
       I.amPerforming().textInput().toClear(title);
       I.amPerforming().textInput().in(title,titleName);
    }

    public void toClickOnNavigatorButtonInBottom(String buttonName) {
        I.amPerforming().click().on(By.xpath("//div[@data-component-id='GNT_sideBarLwc']//span[text()='" + buttonName + "']/parent::button[@type='button']"));
    }
}

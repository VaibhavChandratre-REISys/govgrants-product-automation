package com.helperPackage.govgrants;


import com.helperPackage.handlers.govgrants;
import com.helperPackage.actionsfactory.api.ByUsing;
import com.helperPackage.objects.Elements;
import com.helperPackage.register.EnvironmentFactory;
import com.helperPackage.register.I;
import com.helperPackage.report.LogLevel;
import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.Select;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

//@Refactoring of the class is required. There is commented code which will be considered to remove gradually.

public final class InputForms {
    private final By
            ConflictOfInterestReviewFromPath = By.xpath("//span//input[@type='radio'][@value='I agree']"),
            formSectionTitles = By.xpath("//div[@class='panel-heading']//h3");
    private final By
            ConflictOfInterestReviewForLwcFromPath = By.xpath("//label//span[@class='slds-form-element__label']/../../input[@type='radio'][@value='I agree']"),
            formSectionTitlesLwc = By.xpath("//div[@class='slds-box pblock']//span[contains(@class,'slds-text-heading_medium')]");

    /******* "Key Methods with complete functionality - Public" *****************/

    /**
     * generic method to enter field values from an Excel file on a page form Excel
     * file should have three columns in the following order:
     * <p>
     * SubTab: The subtab the field input is found on. Note: Do not leave this
     * blank. Enter "None" if there is no subtab
     * <p>
     * FieldApiName: The Salesforce API name of the field. Note: Include the "__c"
     * suffix for the field, even if the field is standard.
     * <p>
     * FieldValue: The value to be entered into the field. Note: "Date" and
     * "Date/Time" inputs accept an integer offset (possibly negative) from the
     * current day, as well as a hard-coded date in the format "MM/dd/YYYY" and
     * "MM/dd/YYYY hh:mm a", respectively. "Checkbox" inputs accept the
     * case-insensitive values "Checked" and "Unchecked". "MultiSelect" inputs
     * accept lists in the form "value 1;value 2;..." (without the quotes).
     * <p>
     * Inputs are read starting from the second row of the sheet. This is a feature
     * of ExcelReader, allowing you to use the first row as a header.
     *
     * @param fileName
     * @param sheetName
     * @author john.philips
     * @modifier nauman.shahid : added condition for product home scenarios
     * @modifier aashish.pardeshi : added condition for inputs for forms
     */
    public void enterInputFieldsFromExcelFile(String fileName, String sheetName, String isModal) {
        String[][] data = I.amPerforming().fileHandling().forExcelAnd().readExcelFile(fileName, sheetName);
        if (!isModal.contains("form")) {
            String currentSubTab = "";
            if (data != null) {
                for (String[] column : data) {
                    if ((column[0] == null || "".equalsIgnoreCase(column[0].trim()))
                            && (column[1] == null || "".equalsIgnoreCase(column[1].trim()))
                            && (column[2] == null || "".equalsIgnoreCase(column[2].trim()))) {
                        continue;
                    }
                    String subTab = column[0];
                    String fieldApiName = column[1];
                    String fieldValue = column[2];
                    // Added temporarily for product home scenarios
                    if (fieldValue.equalsIgnoreCase("Product Automation Org")) {
                        fieldValue = fieldValue + Math.random() * ((1000 - 100) + 1) + 100;
                    }
                    // Switch to relevant tab
                    if (subTab != null && !"None".equalsIgnoreCase(subTab) && !subTab.equalsIgnoreCase(currentSubTab)) {
                        if(I.amPerforming().browserOperationsTo().getCurrentUrl().contains("lightning")) {
                           govgrants.perform().pageDetails().clickSubTabsInsideTableViewForLWC(subTab);
                           currentSubTab = subTab;
                       }else{
                           govgrants.perform().pageDetails().clickSubTabsInsideTableView(subTab);
                           currentSubTab = subTab;
                       }
                    }
                    this.inputFormDataByFieldApiName(fieldApiName, fieldValue, isModal.contains("modal"));
                }
            }
        } else if (isModal.contains("form")) {
            if (data != null) {
                for (String[] column : data) {
                    if ((column[0] == null || "".equalsIgnoreCase(column[0].trim()))
                            && (column[1] == null || "".equalsIgnoreCase(column[1].trim()))
                            && (column[2] == null || "".equalsIgnoreCase(column[2].trim()))) {
                        continue;
                    }
                    String subTab = column[0];
                    String fieldApiName = column[1];
                    String fieldValue = column[2];

                    // Switch to relevant page block and label
                    By element = By.xpath("//h3//a[contains(@title,'" + subTab + "')]/ancestor::div[@class='panel-heading']/following-sibling::div//dt//*[contains(text(),'" + fieldApiName + "')]//parent::dt//following-sibling::dd");
                    WebElement fieldWrapper = I.amPerforming().getElementReference().of(element);
                    handleFormDataInputs(fieldWrapper, fieldValue);
                }
            }
        }
    }

    /**
     * @param fieldApiName The Salesforce Api name of the field to be entered. Can be found
     *                     in the Edit page's HTML in a div surrounding the input field with
     *                     the id "field" + fieldApiName.
     * @param fieldValue   The value to be entered in the field. Note: "Date" and "Date/Time"
     *                     inputs accept an integer offset (possibly negative) from the
     *                     current day, as well as a hard-coded date in the format
     *                     "MM/dd/YYYY" and "MM/dd/YYYY hh:mm a", respectively. "Checkbox"
     *                     inputs accept the case-insensitive values "Checked" and
     *                     "Unchecked". "MultiSelect" inputs accept lists in the form "value
     *                     1;value 2;..." (without the quotes).
     * @author john.phillips
     * @modifier nauman.shahid: added local-name for span in fieldWrapper locator to support DC and LCTCS. 10/12/2020
     * @modifier meenakshi.jha: updated xpath for modal. (10/29/2020)
     * updated the xpath for modal as it was pointing to the element in the page details too,
     * if we are having the same fieldApiName for two different fields both on modal and page details
     * Added the if condition for Automation Runtime Record (12/18/2020)
     */
    public void inputFormDataByFieldApiName(String fieldApiName, String fieldValue, boolean isModal) {

        if (fieldValue.startsWith("Automation Runtime") && (!fieldValue.matches(".*\\d+.*"))) {
            var newFieldValue = fieldValue + I.amPerforming().addOnsTo().getStringRandomNumber();
            I.amPerforming().propertiesFileOperationsTo().saveValue(fieldValue, newFieldValue);
            fieldValue = newFieldValue;
        }

        govgrants.perform().mainPage().waitForNavigationLogoToDisappear();
        By fieldWrapperLocator;
        if (isModal) {
            fieldWrapperLocator = By.xpath("//div[@id='modaltemp']//div[@id='field" + fieldApiName + "' or @id='" + fieldApiName + "'] | //span[contains(@id,'" + fieldApiName + "')]|//div[@id='modaltemp']//div[@id='" + fieldApiName + "'] | //field[@field-name='" + fieldApiName + "'] | //div[contains(@class,'modal__container')]//div[@data-field_api_name='" + fieldApiName + "']");
            I.amPerforming().waitFor().ElementToBePresent(fieldWrapperLocator);
        } else {
            fieldWrapperLocator = By.xpath("//*[(local-name()='div' or local-name()='span') and @id='field" + fieldApiName + "' or @id='" + fieldApiName + "'] | //field[@field-name='" + fieldApiName + "'] | //div[@data-field_api_name='" + fieldApiName + "']");
           int size=  I.amPerforming().getElementReference().forListOfElements().of(fieldWrapperLocator).size();
            if (size > 2){
                fieldWrapperLocator=By.xpath("//*[(local-name()='div' or local-name()='span') and @id='" + fieldApiName + "'] | //field[@field-name='" + fieldApiName + "']");
                size=  I.amPerforming().getElementReference().forListOfElements().of(fieldWrapperLocator).size();
                if (size > 1) {
                    fieldWrapperLocator=By.xpath("//*[(local-name()='div' or local-name()='span') and @id='" + fieldApiName + "']//label[contains(string(),'Description')]/.. | //field[@field-name='" + fieldApiName + "']");
                }

            }
        }
        WebElement fieldWrapper = I.amPerforming().getElementReference().of(fieldWrapperLocator);
        I.amPerforming().waitFor().makeThreadSleep(2000);
//        I.amPerforming().scroll().toElementCenter(fieldWrapperLocator);
        I.amPerforming().scroll().toMoveToElement(fieldWrapperLocator);
        if ("".equalsIgnoreCase(fieldValue)) {
            handleClearingFormDataInputs(fieldWrapper);
        } else {
            handleFormDataInputs(fieldWrapper, fieldValue);
        }
    }

    /**
     * @param pageBlock Page block name on form page
     * @param table     table contains field and value
     * @author aashish.pardeshi
     * @modifier aashish.pardeshi -- added xpath and logic for multi-comments section for review form
     */
    public void inputDataIntoForms(String operation, String pageBlock, List table) {
        if (operation.equalsIgnoreCase("clear")) {
            Iterator itrTbl = table.iterator();
            while (itrTbl.hasNext()) {
                Map<String, String> map = (Map) itrTbl.next();
                By element = By.xpath("//h3//a[contains(@title,'" + pageBlock + "')]/ancestor::div[@class='panel-heading']/following-sibling::div//dt//*[contains(text(),'" + (String) map.get("Field") + "')]//parent::dt//following-sibling::dd | //h3//a[contains(text(),'" + pageBlock + "')]/ancestor::div[@class='panel-heading']/following-sibling::div//dt//*[contains(text(),'" + (String) map.get("Field") + "')]//ancestor::dt//following-sibling::dd | //h3[contains(@title,'" + pageBlock + "') or contains(text(),'" + pageBlock + "')]/ancestor::div[@class='panel-heading']/following-sibling::div//dt//*[contains(text(),'" + (String) map.get("Field") + "')]//ancestor::dt//following-sibling::dd");
                List<Elements> comments = I.amPerforming().getElementReference().forListOfElements().of(element);
                for (int i = 0; i < comments.size(); i++) {
                    WebElement fieldComment = comments.get(i).getElementReference();
                    handleClearingFormDataInputs(fieldComment);
                }
            }
        } else {
            Iterator itrTbl = table.iterator();
            while (itrTbl.hasNext()) {
                Map<String, String> map = (Map) itrTbl.next();
                By element = By.xpath("//h3//a[contains(@title,'" + pageBlock + "')]/ancestor::div[@class='panel-heading']/following-sibling::div//dt//*[contains(text(),'" + (String) map.get("Field") + "')]//parent::dt//following-sibling::dd | //h3//a[contains(text(),'" + pageBlock + "')]/ancestor::div[@class='panel-heading']/following-sibling::div//dt//*[contains(text(),'" + (String) map.get("Field") + "')]//ancestor::dt//following-sibling::dd | //h3[contains(@title,'" + pageBlock + "') or contains(text(),'" + pageBlock + "')]/ancestor::div[@class='panel-heading']/following-sibling::div//dt//*[contains(text(),'" + (String) map.get("Field") + "')]//ancestor::dt//following-sibling::dd");
                List<Elements> comments = I.amPerforming().getElementReference().forListOfElements().of(element);
                for (int i = 0; i < comments.size(); i++) {
                    WebElement fieldComment = comments.get(i).getElementReference();
                    handleFormDataInputs(fieldComment, (String) map.get("Value"));
                }
            }
        }
    }

    /**
     * @param fieldApiName The Salesforce Api name of the field to be entered. Can be found
     *                     in the Edit page's HTML in a div surrounding the input field with
     *                     the id "field" + fieldApiName.
     * @author john.phillips
     * @modifier pooja added fieldName xpath
     */
    public void clearFormDataByFieldApiName(String fieldApiName, boolean isModal) {
        By fieldWrapperLocator;
        if (isModal) {
            fieldWrapperLocator = By.xpath("//div[@id='modaltemp']//div[@id='field" + fieldApiName + "' or @id='" + fieldApiName + "'] | //field[@field-name='" + fieldApiName + "'] | //div[@data-field_api_name='" + fieldApiName + "']");
        } else {
            fieldWrapperLocator = By.xpath("//div[@id='field" + fieldApiName + "' or @id='" + fieldApiName + "'] | //field[@field-name='" + fieldApiName + "'] | //div[@data-field_api_name='" + fieldApiName + "']");
        }
        WebElement fieldWrapper = I.amPerforming().getElementReference().of(fieldWrapperLocator);
        handleClearingFormDataInputs(fieldWrapper);
    }

    /**
     * Handles filling up of any review form Handles Text area, Score, Percent,
     * Date, Dollar value Note: All are text fields but expects to enter values in
     * different format
     *
     * @author hema.ananthan
     * @modified mahadev.hanme
     * @modifier aashish.pardeshi Added display condition for ConflictOfInterestReviewFromPath
     */
    public void completeFillingReviewFormForLwc(String recommendation) {
        try {
            if (I.amPerforming().checkToSee().IsElementPresentQuick(ConflictOfInterestReviewForLwcFromPath)) {
                I.amPerforming().click().withJavaScript(ConflictOfInterestReviewForLwcFromPath);
            }
            I.amPerforming().click().on(By.xpath("//div[@class='slds-tabs_default']//li[@title='Review' or @name='Review']"));
            I.amPerforming().click().on(getSummaryRecommendationForLwcXpath());
            I.amPerforming().click().on(selectRecommendationForLwcXpath(recommendation));
            I.amPerforming().textInput().in(getSummaryCommentsForLwc(), "Automation test description");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        for (int i = 0; i < getTitlesInFormForLwc().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewFormForLwc(getTitlesInFormForLwc().get(i)); j++) {
                if (checkTextAreaPresentReviewFormForLwc(getTitlesInFormForLwc().get(i), j) > 0) {
                    I.amPerforming().textInput().toClear(getTextAreaReviewFormForLwc(getTitlesInFormForLwc().get(i), j));
                    I.amPerforming().textInput().in(getTextAreaReviewFormForLwc(getTitlesInFormForLwc().get(i), j), "Automation test description");
                }
            }
        }

        for (int i = 0; i < getTitlesInFormForLwc().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewFormForLwc(getTitlesInFormForLwc().get(i)); j++) {
                if (checkTextInputScorePresentReviewFormForLwc(getTitlesInFormForLwc().get(i), j) > 0) {
                    I.amPerforming().textInput().toClear(getTextInputScoreReviewFormForLwc(getTitlesInFormForLwc().get(i), j));
                    I.amPerforming().textInput().in(getTextInputScoreReviewFormForLwc(getTitlesInFormForLwc().get(i), j), "3");
                }
            }
        }

        for (int i = 0; i < getTitlesInFormForLwc().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewFormForLwc(getTitlesInFormForLwc().get(i)); j++) {
                if (checkDropdownPresentReviewFormForLwc(getTitlesInFormForLwc().get(i), j) > 0) {
                   I.amPerforming().click().withJavaScript(checkDropdownReviewFormForLwc(getTitlesInFormForLwc().get(i), j));
                    try {
                        I.amPerforming().click().withJavaScript(selectDropdownReviewFormForLwc(getTitlesInFormForLwc().get(i), j));
                    } catch (Exception e) {
                        I.amPerforming().click().withJavaScript(selectDropdownReviewFormForLwc(getTitlesInFormForLwc().get(i), j));
                    }
                }
            }
        }

        for (int i = 0; i < getTitlesInFormForLwc().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewFormForLwc(getTitlesInFormForLwc().get(i)); j++) {
                if ( checkTextInputPercentPresentReviewFormForLwc(getTitlesInFormForLwc().get(i), j) > 0) {
                    I.amPerforming().textInput().toClear(getTextInputPercentReviewFormForLwc(getTitlesInFormForLwc().get(i), j));
                    I.amPerforming().textInput().in(getTextInputPercentReviewFormForLwc(getTitlesInFormForLwc().get(i), j), "25");
                }
            }
        }

        for (int i = 0; i < getTitlesInFormForLwc().size(); i++) {
            for (int j = 1; j <=  getcountForRowsReviewFormForLwc(getTitlesInFormForLwc().get(i)); j++) {
                if (checkTextInputDollarPresentReviewFormForLwc(getTitlesInFormForLwc().get(i), j) > 0) {
                    I.amPerforming().textInput().toClear(getTextInputDollarPresentReviewFormForLwc(getTitlesInFormForLwc().get(i), j));
                    I.amPerforming().textInput().in(getTextInputDollarPresentReviewFormForLwc(getTitlesInFormForLwc().get(i), j), "1000");
                }
            }
        }

        for (int i = 0; i < getTitlesInFormForLwc().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewFormForLwc(getTitlesInFormForLwc().get(i)); j++) {
                if (checkTextInputDatePresentReviewFormForLwc(getTitlesInFormForLwc().get(i), j) > 0) {
                    I.amPerforming().textInput().toClear(getTextInputDateReviewFormForLwc(getTitlesInFormForLwc().get(i), j));
                    I.amPerforming().textInput().in(getTextInputDateReviewFormForLwc(getTitlesInFormForLwc().get(i), j), "05/05/2020");
                }
            }
        }
    }

    public void completeFillingReviewForm(String recommendation) {
//        try {
            if (I.amPerforming().checkToSee().IsElementPresentQuick(ConflictOfInterestReviewFromPath)) {
                I.amPerforming().click().on(ConflictOfInterestReviewFromPath);
            }
            I.amPerforming().dropDownSelection().from(getSummaryRecommendationXpath()).selectByValue(recommendation);
            I.amPerforming().textInput().in(getSummaryComments(), "Automation test description");
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
        for (int i = 0; i < getTitlesInForm().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewForm(getTitlesInForm().get(i)); j++) {
                if (checkTextAreaPresentReviewForm(getTitlesInForm().get(i), j) > 0) {
                    I.amPerforming().textInput().toClear(getTextAreaReviewForm(getTitlesInForm().get(i), j));
                    I.amPerforming().textInput().in(getTextAreaReviewForm(getTitlesInForm().get(i), j), "Automation test description");
                }
            }
        }

        for (int i = 0; i < getTitlesInForm().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewForm(getTitlesInForm().get(i)); j++) {
                if (checkTextInputScorePresentReviewForm(getTitlesInForm().get(i), j) > 0) {
                    I.amPerforming().textInput().toClear(getTextInputScoreReviewForm(getTitlesInForm().get(i), j));
                    I.amPerforming().textInput().in(getTextInputScoreReviewForm(getTitlesInForm().get(i), j), "3");
                }
            }
        }

        for (int i = 0; i < getTitlesInForm().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewForm(getTitlesInForm().get(i)); j++) {
                if (checkDropdownPresentReviewForm(getTitlesInForm().get(i), j) > 0) {
                    Select select = I.amPerforming().dropDownSelection().from(checkDropdownReviewForm(getTitlesInForm().get(i), j));
                    try {
                        select.selectByVisibleText("Yes");
                    } catch (Exception e) {
                        select.selectByVisibleText("Medium");
                    }
                }
            }
        }

        for (int i = 0; i < getTitlesInForm().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewForm(getTitlesInForm().get(i)); j++) {
                if (checkTextInputPercentPresentReviewForm(getTitlesInForm().get(i), j) > 0) {
                    I.amPerforming().textInput().toClear(getTextInputPercentReviewForm(getTitlesInForm().get(i), j));
                    I.amPerforming().textInput().in(getTextInputPercentReviewForm(getTitlesInForm().get(i), j), "25");
                }
            }
        }

        for (int i = 0; i < getTitlesInForm().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewForm(getTitlesInForm().get(i)); j++) {
                if (checkTextInputDollarPresentReviewForm(getTitlesInForm().get(i), j) > 0) {
                    I.amPerforming().textInput().toClear(getTextInputDollarReviewForm(getTitlesInForm().get(i), j));
                    I.amPerforming().textInput().in(getTextInputDollarReviewForm(getTitlesInForm().get(i), j), "1000");
                }
            }
        }

        for (int i = 0; i < getTitlesInForm().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewForm(getTitlesInForm().get(i)); j++) {
                if (checkTextInputDatePresentReviewForm(getTitlesInForm().get(i), j) > 0) {
                    I.amPerforming().textInput().toClear(getTextInputDateReviewForm(getTitlesInForm().get(i), j));
                    I.amPerforming().textInput().in(getTextInputDateReviewForm(getTitlesInForm().get(i), j), "05/05/2020");
                }
            }
        }
    }

    /**
     * Handles filling up of any review form Handles Text area, Score, Percent,
     * Date, Dollar value Note: All are text fields but expects to enter values in
     * different format
     *
     * @author hema.ananthan
     * @modified mahadev.hanme
     * @modifier vaibhav.chandratre updated values for check the score
     */
    public void completeFillReviewForm(String recommendation) {
        try {
            if (I.amPerforming().checkToSee().IsElementPresentQuick(ConflictOfInterestReviewFromPath)) {
                I.amPerforming().click().on(ConflictOfInterestReviewFromPath);
            }
            I.amPerforming().dropDownSelection().from(getSummaryRecommendationXpath()).selectByValue(recommendation);
            I.amPerforming().textInput().in(getSummaryComments(), "Automation test description");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        for (int i = 0; i < getTitlesInForm().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewForm(getTitlesInForm().get(i)); j++) {
                if (checkTextAreaPresentReviewForm(getTitlesInForm().get(i), j) > 0) {
                    I.amPerforming().textInput().toClear(getTextAreaReviewForm(getTitlesInForm().get(i), j));
                    I.amPerforming().textInput().in(getTextAreaReviewForm(getTitlesInForm().get(i), j), "Automation test description");
                }
            }
        }

        for (int i = 0; i < getTitlesInForm().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewForm(getTitlesInForm().get(i)); j++) {
                if (checkTextInputScorePresentReviewForm(getTitlesInForm().get(i), j) > 0) {
                    I.amPerforming().textInput().toClear(getTextInputScoreReviewForm(getTitlesInForm().get(i), j));
                    I.amPerforming().textInput().in(getTextInputScoreReviewForm(getTitlesInForm().get(i), j), "4");
                }
            }
        }

        for (int i = 0; i < getTitlesInForm().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewForm(getTitlesInForm().get(i)); j++) {
                if (checkDropdownPresentReviewForm(getTitlesInForm().get(i), j) > 0) {
                    Select select = I.amPerforming().dropDownSelection().from(checkDropdownReviewForm(getTitlesInForm().get(i), j));
                    try {
                        select.selectByVisibleText("No");
                    } catch (Exception e) {
                        select.selectByVisibleText("Low");
                    }
                }
            }
        }

        for (int i = 0; i < getTitlesInForm().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewForm(getTitlesInForm().get(i)); j++) {
                if (checkTextInputPercentPresentReviewForm(getTitlesInForm().get(i), j) > 0) {
                    I.amPerforming().textInput().toClear(getTextInputPercentReviewForm(getTitlesInForm().get(i), j));
                    I.amPerforming().textInput().in(getTextInputPercentReviewForm(getTitlesInForm().get(i), j), "20");
                }
            }
        }

        for (int i = 0; i < getTitlesInForm().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewForm(getTitlesInForm().get(i)); j++) {
                if (checkTextInputDollarPresentReviewForm(getTitlesInForm().get(i), j) > 0) {
                    I.amPerforming().textInput().toClear(getTextInputDollarReviewForm(getTitlesInForm().get(i), j));
                    I.amPerforming().textInput().in(getTextInputDollarReviewForm(getTitlesInForm().get(i), j), "2000");
                }
            }
        }

        for (int i = 0; i < getTitlesInForm().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewForm(getTitlesInForm().get(i)); j++) {
                if (checkTextInputDatePresentReviewForm(getTitlesInForm().get(i), j) > 0) {
                    I.amPerforming().textInput().toClear(getTextInputDateReviewForm(getTitlesInForm().get(i), j));
                    I.amPerforming().textInput().in(getTextInputDateReviewForm(getTitlesInForm().get(i), j), "09/09/2023");
                }
            }
        }
    }

    /******* "Private methods with limited functonality - Private" **************/

    /**
     * Chooses the correct data input method based on the contents of the
     * fieldWrapper parameter The order of the if statements is important, so do not
     * change without verifying that all types of input still work as expected.
     *
     * @param fieldWrapper
     * @param fieldValue
     * @author john.phillips
     * @modifier nauman.shahid : Modified date strategy. Still in progress. To Remove : Commented lines and all corresponding methods
     * @modifier ashwini.mahore : Modified xpath to get radio buttons having multiple values aligned vertically
     */
    private void handleFormDataInputs(WebElement fieldWrapper, String fieldValue) {
        int counter = 0;
        while (counter < 5) {
            govgrants.perform().mainPage().waitForNavigationLogoToDisappear();
            if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//iframe")).size() > 0) {
                handleRichTextInput(fieldWrapper, fieldValue);
                break;
            } else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//div[contains(@class,'text-area')] | .//div[contains(@class,'textarea')]//textarea")).size() > 0) {
                handleRichTextAreaInput(fieldWrapper, fieldValue);
                break;
            } else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper,
                    By.xpath(".//input[@type='text'] | .//textarea[not(@warningchar)]"))
                    .size() > 0) {
                /*if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//*[contains(@class, 'datetimepicker')]")).size() > 0) {
                    handleDatePickerInput(fieldWrapper, fieldValue);
                } else */
                if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//*[contains(@class, 'dateOnlyInput')]")).size() > 0) {
                    handleDateInput(fieldWrapper, fieldValue, false);
                } else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//*[contains(@class, 'dateInput')]")).size() > 0) {
                    handleDateInput(fieldWrapper, fieldValue, true);
                } else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//lightning-datepicker")).size() > 0) {
                    handleDateInput(fieldWrapper, fieldValue, false);
                } else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//*[contains(@class, 'lookupInput')]")).size() > 0) {
                    handleLookUpInput(fieldWrapper, fieldValue);
                } else {
                    handleTextInput(fieldWrapper, fieldValue);
                }
                break;
            } else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//select")).size() > 0) {
                Select select = new Select(I.amPerforming().getElementReference().ofNested(fieldWrapper, By.xpath(".//select")));
                if (select.isMultiple()) {
                    handleMultiSelectInput(fieldWrapper, fieldValue.split(";"));
                } else {
                    handleDropdownInput(fieldWrapper, fieldValue);
                }
                break;
            }  else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//ul//li[contains(@class,'listbox__item')]")).size() > 0) {
                handleMultiSelectInput(fieldWrapper, fieldValue.split(";"));
                break;
            } else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//button[contains(@id,'combobox-button')]")).size() > 0) {
                handleDropdownInput(fieldWrapper, fieldValue);
                break;
            } else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//input[@type='checkbox']")).size() > 0) {
                handleCheckBoxInput(fieldWrapper, fieldValue);
                break;
            } else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath("//c-lwc-flex-table//input[@type='checkbox']")).size() > 0) {
                    handleCheckBoxInputForTable(fieldWrapper, fieldValue);
                    break;
            } else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//input[" + I.amPerforming().sanityOfXpathTo().equals("@value", fieldValue) + "] ")).size() > 0) {
                handleRadioButtonInput(fieldWrapper, fieldValue);
                break;
            } else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath("//input[@type='text'] | .//textarea[not(@warningchar)]")).size() > 0) {
                if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath("//lightning-datepicker")).size() > 0) {
                    handleDateInput(fieldWrapper, fieldValue, false);
                } else {
                    handleTextInput(fieldWrapper, fieldValue);
                }
                break;
            }
            I.amPerforming().waitFor().makeThreadSleep(1000);
            counter++;
        }
    }

    /**
     * @param fieldWrapper
     * @author john.phillips
     * @modifier nauman.shahid : Removed loop
     */
    private void handleClearingFormDataInputs(WebElement fieldWrapper) {
        if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper
                , By.xpath(".//input[@type='text'] | .//textarea[contains(@class, '508Input')]"))
                .size() > 0) {
            handleClearingTextInput(fieldWrapper);

        } else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//iframe")).size() > 0) {
            handleClearingRichTextInput(fieldWrapper);

        } else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//input[@type='checkbox']")).size() > 0) {
            handleCheckBoxInput(fieldWrapper, "Unchecked");

        } else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//select")).size() > 0) {
            Select select = new Select(I.amPerforming().getElementReference().ofNested(fieldWrapper, By.xpath(".//select")));
            if (select.isMultiple()) {
                handleClearingMultiSelectInput(fieldWrapper);
            } else {
                handleClearingDropdownInput(fieldWrapper);
            }

        }
    }

    /**
     * @param fieldWrapper
     * @param value
     * @author john.phillips
     * @modified nauman.shahid : update xpath on line for inputBoxSelector. Turn off frame switch and Commented part to be removed once everything looks stable
     * @modifier tejal.gadewar : Created new overloaded method with one additional parameter. By default parameter is false then it will clear rich text box content and if it is true then it will not clear rich text box content
     */
    private void handleRichTextInput(WebElement fieldWrapper, String value) {
        handleRichTextInput(fieldWrapper, value, false);
    }
    private void handleRichTextAreaInput(WebElement fieldWrapper, String fieldValue) {
        if(I.amPerforming().browserOperationsTo().getCurrentUrl().contains("lightning")){
            I.amPerforming().waitFor().makeThreadSleep(2000);
            String field = fieldWrapper.toString().split("//")[2].split("\'")[1];
            if(field.contains("field")) {
                String field1 = field.toString().split("field")[1];
                By inputBox1 = By.xpath("//div[@data-field_api_name='"+ field1 +"']//input[@type='text'] | //div[@data-field_api_name='"+ field1 +"']//div[contains(@class,'text-area')] | //div[@data-field_api_name='" + field1 + "']//div[contains(@class,'textarea')]//textarea");
                I.amPerforming().click().withJavaScript(inputBox1);
                I.amPerforming().textInput().in(inputBox1, fieldValue);
            } else {
                By inputBox = By.xpath("//div[@data-field_api_name='" + field + "']//input[@type='text'] | //div[@data-field_api_name='" + field + "']//div[contains(@class,'text-area')] | //div[@data-field_api_name='" + field + "']//div[contains(@class,'textarea')]//textarea");
                I.amPerforming().click().withJavaScript(inputBox);
                I.amPerforming().textInput().in(inputBox, fieldValue);
            }
        }
    }

    /**
     * @param fieldWrapper
     * @param value
     * @param isClear
     * @author john.phillips
     * @modified nauman.shahid : update xpath on line for inputBoxSelector. Turn off frame switch and Commented part to be removed once everything looks stable
     * @modifier tejal.gadewar : added condition for isClear parameter
     */
    private void handleRichTextInput(WebElement fieldWrapper, String value, boolean isClear) {
        By inputBoxSelector = By.xpath("//html//body[@contenteditable='true']");
        I.amPerforming().waitFor().makeThreadSleep(1000);
        I.amPerforming().switchTo().frame(I.amPerforming().getElementReference().ofNested(fieldWrapper, (By.xpath(".//iframe"))));
        try {
            if (!isClear) {
                I.amPerforming().textInput().toClear(I.amPerforming().getElementReference().ofNested(fieldWrapper, inputBoxSelector));
            }
        } catch (Exception e) {
        }
        I.amPerforming().textInput().in(inputBoxSelector, value);
        I.amPerforming().switchTo().parentFrame();
    }

    /**
     * @param fieldWrapper
     * @author john.phillips
     * @modified nauman.shahid : Turn off frame switch.Commented part to be removed once everything looks stable.
     */
    private void handleClearingRichTextInput(WebElement fieldWrapper) {
        By inputBoxSelector = By.xpath("//html//body[@contenteditable='true']");
        I.amPerforming().switchTo().frame(I.amPerforming().getElementReference().ofNested(fieldWrapper, By.xpath(".//iframe")));
        I.amPerforming().textInput().toClear(inputBoxSelector);
        I.amPerforming().switchTo().parentFrame();
    }

    /**
     * @param fieldWrapper
     * @param fieldValue
     * @author john.phillips
     */
    private void handleTextInput(WebElement fieldWrapper, String fieldValue) {
        if(I.amPerforming().browserOperationsTo().getCurrentUrl().contains("lightning")){
            I.amPerforming().waitFor().makeThreadSleep(2000);
            String field = fieldWrapper.toString().split("//")[2].split("\'")[1];
            if(field.contains("field")) {
                String field1 = field.toString().split("field")[1];
                if(I.amPerforming().checkToSee().IsElementPresentQuick(By.xpath("//div[contains(@class,'modal__container')]//div[@data-field_api_name='" + field1 + "']"))){
                    By inputBox1 = By.xpath("//div[contains(@class,'modal__container')]//div[@data-field_api_name='" + field1 + "']//input[@type='text'] | //div[contains(@class,'modal__container')]//div[@data-field_api_name='" + field1 + "']//div[contains(@class,'text-area')] | //div[contains(@class,'modal__container')]//div[@data-field_api_name='" + field1 + "']//div[contains(@class,'textarea')]//textarea");
                    I.amPerforming().click().withJavaScript(inputBox1);
                    I.amPerforming().textInput().toClear(inputBox1);
                    I.amPerforming().textInput().in(inputBox1, fieldValue);
                } else {
                    By inputBox1 = By.xpath("//div[@data-field_api_name='" + field1 + "']//input[@type='text'] | //div[@data-field_api_name='" + field1 + "']//div[contains(@class,'text-area')] | //div[@data-field_api_name='" + field1 + "']//div[contains(@class,'textarea')]//textarea");
                    I.amPerforming().click().withJavaScript(inputBox1);
                    I.amPerforming().textInput().toClear(inputBox1);
                    I.amPerforming().textInput().in(inputBox1, fieldValue);
                }
            } else {
                if(I.amPerforming().checkToSee().IsElementPresentQuick(By.xpath("//div[contains(@class,'modal__container')]//div[@data-field_api_name='" + field + "']"))) {
                    By inputBox = By.xpath("//div[contains(@class,'modal__container')]//div[@data-field_api_name='" + field + "']//input[@type='text'] | //div[contains(@class,'modal__container')]//div[@data-field_api_name='" + field + "']//div[contains(@class,'text-area')] | //div[contains(@class,'modal__container')]//div[@data-field_api_name='" + field + "']//div[contains(@class,'textarea')]//textarea");
                    I.amPerforming().click().withJavaScript(inputBox);
                    I.amPerforming().textInput().toClear(inputBox);
                    I.amPerforming().textInput().in(inputBox, fieldValue);
                } else {
                    By inputBox = By.xpath("//div[@data-field_api_name='" + field + "']//input[@type='text'] | //div[@data-field_api_name='" + field + "']//div[contains(@class,'text-area')] | //div[@data-field_api_name='" + field + "']//div[contains(@class,'textarea')]//textarea");
                    I.amPerforming().click().withJavaScript(inputBox);
                    I.amPerforming().textInput().toClear(inputBox);
                    I.amPerforming().textInput().in(inputBox, fieldValue);
                }
            }
       }  else{
            By inputBoxSelector = By.xpath(".//input[@type='text'] | .//textarea");
            WebElement inputBox = I.amPerforming().getElementReference().ofNested(fieldWrapper, inputBoxSelector);
            I.amPerforming().click().withJavaScript(inputBox);
            I.amPerforming().textInput().toClear(inputBox);
            I.amPerforming().textInput().in(inputBox, fieldValue);
       }
    }

    /**
     * @param fieldWrapper
     * @author john.phillips
     */
    private void handleClearingTextInput(WebElement fieldWrapper) {
        WebElement inputBox = I.amPerforming().getElementReference().ofNested(fieldWrapper, By.xpath(".//input[@type='text'] | .//textarea"));
        I.amPerforming().scroll().toElementCenter(inputBox);
        I.amPerforming().textInput().toClear(inputBox);

        // Makes the date(time) picker popup disappear, if clearing a date field
        if (inputBox.getAttribute("class").contains("date")) {
            makeCalendarPopupDisappear(inputBox);
        }
    }

    /**
     * Handle date picker dates
     *
     * @param fieldWrapper
     * @param fieldValue
     * @author nauman.shahid : method version 1.0 : This is initial method and will be improved with passag of time
     * @deprecated This method should no longer be needed
     */
    private void handleDatePickerInput(WebElement fieldWrapper, String fieldValue) {
        /*
        var scrollType = fieldValue.contains("-") ? "scrollDown" : "scrollUp";
        String date = I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(Integer.parseInt(fieldValue), DateTimeFormatter.ofLocalizedDate(FormatStyle.FULL).withLocale(Locale.US));
        String[] dateSplit = date.split(",");
        String[] dayMonth = dateSplit[1].trim().split(" ");
        // streamline creds
        String day = dayMonth[1].trim();
        String month = dayMonth[0].trim();
        String year = dateSplit[2].trim();
        // click on date field
        I.amPerforming().click().on(I.amPerforming().getElementReference().ofNested(fieldWrapper, (By.xpath(".//input[@type='text']"))));

        //Set the current day to today on first
        I.amPerforming().click().on(By.xpath("//div[contains(@style,'display: block;')]//button[@aria-label='Today']"));

        // check year
        if (!(I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[contains(@style,'display: block;')]//div[contains(@class,'xdsoft_year')]/span[text()='" + year + "']"), false).size() > 0)) {
            String yearXpath = "//div[contains(@style,'display: block;')]//div[contains(@class,'xdsoft_year')]";
            I.amPerforming().click().on(By.xpath(yearXpath), false);
            if (!I.amPerforming().checkToSee().isInteractable(I.amPerforming().getElementReference().of(By.xpath(yearXpath + "//div[text()='" + year + "']"), false)))
                dateScroller(I.amPerforming().getElementReference().of(By.xpath(yearXpath + "//div[text()='" + year + "']"), false), yearXpath, scrollType);

        }

        //check Month
        if (!(I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[contains(@style,'display: block;')]//div[contains(@class,'xdsoft_month')]/span[text()='" + month + "']"), false).size() > 0)) {
            String monthXpath = "//div[contains(@style,'display: block;')]//div[contains(@class,'xdsoft_month')]";
            I.amPerforming().click().on(By.xpath(monthXpath), false);
            if (!I.amPerforming().checkToSee().isInteractable(I.amPerforming().getElementReference().of(By.xpath(monthXpath + "//div[text()='" + month + "']"), false)))
                dateScroller(I.amPerforming().getElementReference().of(By.xpath(monthXpath + "//div[text()='" + month + "']"), false), monthXpath, scrollType);
        }

        // click on desired day
        I.amPerforming().click().withMouse().doubleClickOn(By.xpath("//div[contains(@style,'display: block;')]//div[@class='xdsoft_calendar']//td[@data-date='" + day.trim() + "' and not(contains(@class,'xdsoft_other_month'))]"));
        */
    }

    /**
     * This method will handle date picker scroller
     *
     * @param dateInQuestion
     * @param scrollBarLiesIn
     * @author nauman.shahid : method version 1.0 : This is initial method and will be improved with passag of time
     * @deprecated This method should no longer be needed
     */
    private void dateScroller(WebElement dateInQuestion, String scrollBarLiesIn, String scrollType) {
        /*
        int initialPosition = 0;
        var isUpwardSwipeSuccessful = false;

        if (scrollType.equalsIgnoreCase("scrollDown")) {
            while (initialPosition < 5) {
                I.amPerforming().scroll().moveSliderByOffset(By.xpath(scrollBarLiesIn + "//div[@class='xdsoft_scroller']"), 0, -3, false);
                if (I.amPerforming().checkToSee().isInteractable(dateInQuestion)) {
                    isUpwardSwipeSuccessful = true;
                    break;
                }
                initialPosition++;
            }
        }
        if (scrollType.equalsIgnoreCase("scrollUp") || !isUpwardSwipeSuccessful) {
            for (int i = 2; i < 30; i += 2) {
                I.amPerforming().scroll().moveSliderByOffset(By.xpath(scrollBarLiesIn + "//div[@class='xdsoft_scroller']"), 0, i, false);
                if (I.amPerforming().checkToSee().isInteractable(dateInQuestion)) {
                    break;
                }
            }
        }
        */
    }

    /**
     * @param fieldWrapper
     * @param fieldValue
     * @param isDateTime
     * @author john.phillips
     * @modified nauman.shahid: replaced regular text input with input with JS & commented pupupDisappear to support old projects like DC,LCTCS. 10/12/2020
     */
    public void handleDateInput(WebElement fieldWrapper, String fieldValue, boolean isDateTime) {
        if(I.amPerforming().browserOperationsTo().getCurrentUrl().contains("lightning")) {
            I.amPerforming().waitFor().makeThreadSleep(2000);
            String field = fieldWrapper.toString().split("//")[2].split("\'")[1];
            if (field.contains("field")) {
                String field1 = field.toString().split("field")[1];
//                By inputBox1 = By.xpath("//div[@data-field_api_name='" + field1 + "']//input[@type='text']");
                WebElement inputBox1 = I.amPerforming().getElementReference().of(By.xpath("//div[@data-field_api_name='" + field1 + "']//input[@type='text']"));

                DateTimeFormatter formatter = getDateInputFormat(inputBox1, isDateTime);

                String inputValue = parseDateFieldValue(fieldValue, formatter);

                    try {
                        SimpleDateFormat dt = new SimpleDateFormat("MM/dd/yyyy");
                        Date date = dt.parse(inputValue);
                        SimpleDateFormat dt1 = new SimpleDateFormat("MMM dd, yyyy");
                        inputValue = dt1.format(date);
                    }catch(Exception e){
                }
                I.amPerforming().textInput().toClear(inputBox1);
                I.amPerforming().textInput().in(inputBox1, inputValue);

            } else {
                WebElement inputBox = I.amPerforming().getElementReference().of(By.xpath("//div[@data-field_api_name='" + field + "']//input[@type='text']"));

                DateTimeFormatter formatter = getDateInputFormat(inputBox, isDateTime);

                String inputValue = parseDateFieldValue(fieldValue, formatter);

                try {
                    SimpleDateFormat dt = new SimpleDateFormat("MM/dd/yyyy");
                    Date date = dt.parse(inputValue);
                    SimpleDateFormat dt1 = new SimpleDateFormat("MMM dd, yyyy");
                    inputValue = dt1.format(date);
                }catch(Exception e){
                }
                I.amPerforming().textInput().toClear(inputBox);
                I.amPerforming().textInput().in(inputBox, inputValue);
            }
        }
    }   //makeCalendarPopupDisappear(inputBox);

    private DateTimeFormatter getDateInputFormat(WebElement input, boolean isDateTime) {
        String inputFormat = "";
        try {
            // placeholder will be the format, like MM/dd/yyyy.  This allows dynamic formatting
            if (input.getAttribute("placeholder") != null && !input.getAttribute("placeholder").equalsIgnoreCase("")) {
                inputFormat = input.getAttribute("placeholder");
            }
        } catch (Exception e) {
            /* Ignore Exception */
        }

        StringBuilder sb = new StringBuilder();
        // This pattern matches "##/##/####", where # can be a day, month, or year specifier
        Matcher matcher = Pattern.compile("[mMdDYyu]{1,2}/[mMdDYyu]{1,2}/[mMdDYyu]{1,4}").matcher(inputFormat);
        int last = 0;
        while (matcher.find()) {
            sb.append(inputFormat, last, matcher.start());

            String converted = matcher.group()
                    .replaceAll("D", "d")     // Ensure day of week, not day of year
                    .replaceAll("m", "M")     // Ensure month, not minute
                    .replaceAll("[yY]", "u"); // Ensure year, not year-of-era

            sb.append(converted);
            last = matcher.end();
        }
        inputFormat = sb.append(inputFormat, last, inputFormat.length()).toString();

        if (inputFormat.equalsIgnoreCase("")) {
            inputFormat = "M/d/uuuu";
            if (isDateTime) {
                inputFormat += " hh:mm a";
            }
        } else if (isDateTime && !inputFormat.endsWith(" hh:mm a")) {
            inputFormat = inputFormat.split(" ")[0] + " hh:mm a";
        }

        return DateTimeFormatter.ofPattern(inputFormat);
    }

    private String parseDateFieldValue(String dateFieldValue, DateTimeFormatter formatter) {
        // Try to parse input value as an Integer offset from the current day
        try {
            return I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(Integer.parseInt(dateFieldValue), formatter);
        } catch (Exception e) {
            /* Ignore Exception */
        }

        // Try to parse input value as a date/time
        try {
            return I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(Integer.parseInt(dateFieldValue), formatter);
        } catch (Exception e) {
            /* Ignore Exception */
        }

        // Try to parse input value as date only
        try {
            return LocalDate.parse(dateFieldValue, formatter).format(formatter);
        } catch (Exception e) {
            /* Ignore Exception */
        }

        // Default to the current date
        try {
            return LocalDateTime.now().format(formatter);
        } catch (Exception e) {
            return LocalDate.now().format(formatter);
        }
    }

    private void makeCalendarPopupDisappear(WebElement inputBox) {
        try {
            I.amPerforming().waitFor().ElementToBeVisible(By.xpath("//div[contains(@class, 'xdsoft_datetimepicker') and contains(@style, 'block')]"), 2);
        } catch (Exception e) {
            I.amPerforming().updatingOfReportWith().write(LogLevel.BUSINESS_LAYER_ERROR, "Wait for calendar popup to appear timed out.  Logic has been reconsidered, and max wait time is now 5 seconds");
        }
        I.amPerforming().textInput().in(inputBox, Keys.TAB.toString());
    }


    /**
     * @param fieldWrapper
     * @param searchTerm
     * @author john.phillips
     */
    private void handleLookUpInput(WebElement fieldWrapper, String searchTerm) {
        if(!I.amPerforming().browserOperationsTo().getCurrentUrl().contains("lightning")) {

           openLookupModal(fieldWrapper);
           performLookupQuickSearch(searchTerm);
           selectLookupValue(searchTerm);
       } else {
            String Search = fieldWrapper.toString().split("//")[2].split("\'")[1];
            if(Search.contains("field")){
                String Search1 = Search.toString().split("field")[1];
                I.amPerforming().click().on(By.xpath("//div[@data-field_api_name='"+ Search1 +"']//input[@type='search']"));
                By lookupInputBoxSelector = By.xpath("//div[@data-field_api_name='"+ Search1 +"']//input[@type='search']");
                I.amPerforming().textInput().toClear(lookupInputBoxSelector, false);
                I.amPerforming().textInput().in(lookupInputBoxSelector, searchTerm, false);
                By selectButtonLocator = By.xpath("//div[@title='"+ searchTerm +"']");
                I.amPerforming().click().on(selectButtonLocator);
            } else {
                I.amPerforming().click().on(By.xpath("//div[@data-field_api_name='" + Search + "']//input[@type='search']"));
                By lookupInputBoxSelector = By.xpath("//div[@data-field_api_name='" + Search + "']//input[@type='search']");
                I.amPerforming().textInput().toClear(lookupInputBoxSelector, false);
                I.amPerforming().textInput().in(lookupInputBoxSelector, searchTerm, false);
                By selectButtonLocator = By.xpath("//div[@title='" + searchTerm + "']");
                I.amPerforming().click().on(selectButtonLocator);
            }
       }
    }

    /**
     * @param fieldWrapper
     * @param fieldValue
     * @author john.phillips
     */
    private void handleCheckBoxInput(WebElement fieldWrapper, String fieldValue) {
        By checkBoxSelector = By.xpath(".//input[@type='checkbox']");
        WebElement checkBox = I.amPerforming().getElementReference().ofNested(fieldWrapper, checkBoxSelector);
        if ("Checked".equalsIgnoreCase(fieldValue) && !checkBox.isSelected()
                || "Unchecked".equalsIgnoreCase(fieldValue) && checkBox.isSelected()) {
            I.amPerforming().click().on(checkBox);
        }
    }

    private void handleCheckBoxInputForTable(WebElement fieldWrapper, String fieldValue) {
        By checkBoxSelector = By.xpath("./following::tr//input[@type='checkbox']");
        WebElement checkBox = I.amPerforming().getElementReference().ofNested(fieldWrapper, checkBoxSelector);
        if ("Checked".equalsIgnoreCase(fieldValue) && !checkBox.isSelected()
                || "Unchecked".equalsIgnoreCase(fieldValue) && checkBox.isSelected()) {
            I.amPerforming().click().on(checkBox);
        }
    }

    /**
     * @param fieldWrapper
     * @param valueList
     * @author john.phillips
     */
    private void handleMultiSelectInput(WebElement fieldWrapper, String[] valueList) {
        if(I.amPerforming().browserOperationsTo().getCurrentUrl().contains("lightning")) {
            String field = fieldWrapper.toString().split("//")[2].split("\'")[1];
            By selectList = By.xpath("//div[@data-field_api_name='" + field + "']//ul//li[contains(@class,'listbox__item')]");
            if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, selectList).size() > 1) {
                By addButtonSelector = By.xpath("//div[@data-field_api_name='" + field + "']//button[@title='Move selection to Chosen']");
                for (String value : valueList) {
                    I.amPerforming().click().withJavaScript(By.xpath("//div[@data-field_api_name='" + field + "']//ul//li[contains(@class,'listbox__item')]//span[text()='" + value + "']"));
                }
                I.amPerforming().click().withJavaScript(addButtonSelector);
            }
        } else {
            By selects = By.xpath(".//select");
            if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, selects).size() > 1) {
                By addButtonSelector = By.xpath(".//img[@title='Add']//..");
                By optionsSelector = By.xpath(".//optgroup[@label='Available']//..");
                for (String value : valueList) {
                    I.amPerforming().dropDownSelection().from(I.amPerforming().getElementReference().ofNested(fieldWrapper, optionsSelector)).selectByVisibleText(value);
                }
                I.amPerforming().click().on(I.amPerforming().getElementReference().ofNested(fieldWrapper, addButtonSelector));
            } else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, selects).size() == 1) {
                for (String value : valueList) {
                    I.amPerforming().dropDownSelection().from(I.amPerforming().getElementReference().ofNested(fieldWrapper, selects)).selectByVisibleText(value);
                }
            }
        }
    }

    /**
     * @param fieldWrapper
     * @author john.phillips
     */
    private void handleClearingMultiSelectInput(WebElement fieldWrapper) {
        By selectBoxSelector = By.xpath(".//optgroup[@label='Chosen']//..");
        By optionsSelector = By.xpath(".//optgroup[@label='Chosen']//option" +
                " | .//optgroup[@label='Chosen']//following-sibling::option");
        By removeButtonSelector = By.xpath(".//img[@title='Remove']//..");

        for (Elements element : I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, optionsSelector)) {
            I.amPerforming().dropDownSelection().from(I.amPerforming().getElementReference().ofNested(fieldWrapper, selectBoxSelector)).selectByVisibleText(element.getText());
        }
        I.amPerforming().click().on(I.amPerforming().getElementReference().ofNested(fieldWrapper, removeButtonSelector));
    }

    /**
     * @param fieldWrapper
     * @param value
     * @author john.phillips
     */
    private void handleDropdownInput(WebElement fieldWrapper, String value) {
        if(I.amPerforming().browserOperationsTo().getCurrentUrl().contains("lightning")){
            String table = fieldWrapper.toString().split("//")[2].split("\'")[1];
            if(table.contains("field")){
                String table1 = table.toString().split("field")[1];
                By dropDownSelector1 = By.xpath("//div[@data-field_api_name='"+ table1 +"']//button[@aria-haspopup='listbox']");
                try {
                    I.amPerforming().waitFor().ElementListToBePresent(dropDownSelector1);
                    I.amPerforming().click().on(dropDownSelector1);
                    I.amPerforming().click().on(By.xpath("//span[@title='" + value + "']"));
                }catch(Exception e){
                    I.amPerforming().click().withJavaScript(dropDownSelector1);
                    I.amPerforming().click().withJavaScript(By.xpath("//span[@title='" + value + "']"));
                }
            } else {
                By dropDownSelector = By.xpath("//div[@data-field_api_name='"+ table +"']//button[@aria-haspopup='listbox']");
                try {
                    I.amPerforming().click().on(dropDownSelector);
                    I.amPerforming().click().on(By.xpath("//span[@title='" + value + "']"));
                }catch(Exception e){
                    I.amPerforming().click().withJavaScript(dropDownSelector);
                    I.amPerforming().click().withJavaScript(By.xpath("//span[@title='" + value + "']"));
                }
            }
        } else {
            By dropDownSelector = By.xpath(".//select");
            I.amPerforming().getElementReference().of(dropDownSelector);
            I.amPerforming().dropDownSelection().from(I.amPerforming().getElementReference().ofNested(fieldWrapper, dropDownSelector)).selectByVisibleText(value);
        }
    }

    /**
     * @param fieldWrapper
     * @author john.phillips
     */
    private void handleClearingDropdownInput(WebElement fieldWrapper) {
        By dropDownSelector = By.xpath(".//select");
        I.amPerforming().dropDownSelection().from(I.amPerforming().getElementReference().ofNested(fieldWrapper, dropDownSelector)).selectByValue("");
    }

    /**
     * @param fieldWrapper
     * @param fieldValue
     * @author john.phillips
     * @modifier meenakshi.jha : Ashwini's changes reverted
     */
    private void handleRadioButtonInput(WebElement fieldWrapper, String fieldValue) {
        By radioButtonSelector = By.xpath(""
                + ".//input[" + I.amPerforming().sanityOfXpathTo().equals("@value", fieldValue)
                + " or " + I.amPerforming().sanityOfXpathTo().equals("text()", fieldValue) + "]");
        WebElement radioButton = I.amPerforming().getElementReference().ofNested(fieldWrapper, (radioButtonSelector));
        I.amPerforming().click().on(radioButton);
    }

    /**
     * @param fieldWrapper
     * @modifier aashish.pardeshi
     */
    private void openLookupModal(WebElement fieldWrapper) {
        By searchButton = By.xpath(".//dd//span[@class='lookupInput']//a");
            I.amPerforming().getElementReference().of(searchButton);
        By lookupTableHeader = By.xpath("//input[@id='LookupSearchReportText']");
            WebElement searchIcon = I.amPerforming().getElementReference().ofNested(fieldWrapper, searchButton);
            I.amPerforming().click().on(searchIcon);
            I.amPerforming().getElementReference().of(lookupTableHeader);
        }

    /**
     * handles perform quick search for action icon. gets the static variables from
     * project manager
     *
     * @author john.phillips
     */
    private void performLookupQuickSearch(String searchTerm) {
           String tableId = I.amPerforming().actionToGet().attribute(By.xpath("//div[@id='ModalDivID']//div[1]"), "id");
           By lookupInputBoxSelector = By.xpath("//div[@id='" + tableId + "']//div/input");
           By lookUpSearchButton = By.xpath("//div[@id='" + tableId + "']//button//i[contains(@class, 'fa-search')]");
           By selectButtonLocator = By.xpath("//td//*[text()='" + searchTerm + "' or @title='" + searchTerm + "']//ancestor::tr[1]//a[@title='Select']");

           for (long startTime = System.currentTimeMillis(), elapsedTime = 0;
                elapsedTime < EnvironmentFactory.getMaxWaitTime() * 2 && !I.amPerforming().checkToSee().IsElementPresentQuick(selectButtonLocator);
                elapsedTime = (System.currentTimeMillis() - startTime) / 1000) {
               try {
                   I.amPerforming().textInput().toClear(lookupInputBoxSelector, false);
                   I.amPerforming().textInput().in(lookupInputBoxSelector, searchTerm, false);
                   I.amPerforming().click().on(lookUpSearchButton, false);
               } catch (Exception e) {
                   /* Ignore Exception */
               }
           }
    }

    /**
     * Select value after search in look up modal
     *
     * @param searchTerm
     * @modifier nauman.shahid
     */
    private void selectLookupValue(String searchTerm) {
            By selectButtonLocator = By.xpath("//td//*[text()='" + searchTerm + "']//ancestor::tr[1]//a[@title='Select']");
            try {
                I.amPerforming().waitFor().makeThreadSleep(200);
                I.amPerforming().waitFor().ElementToBeClickable(selectButtonLocator);
                I.amPerforming().click().withMouse().on(selectButtonLocator);
            } catch (
                    StaleElementReferenceException stale) { // Exception handling added due to inappropriate refresh behaviour on orgs
                I.amPerforming().waitFor().makeThreadSleep(500);
                I.amPerforming().waitFor().ElementToBeClickable(selectButtonLocator);
                I.amPerforming().click().withMouse().on(selectButtonLocator);
            }
            // Below block is only added to be executed if the click is performed but the record is not still selected

            try {
                if (I.amPerforming().checkToSee().isDisplayed(selectButtonLocator, false)) {
                    I.amPerforming().waitFor().makeThreadSleep(500);
                    I.amPerforming().click().on(selectButtonLocator);
                }
            } catch (Exception e) {

            }
    }

    /******** Holds private methods for filling up of Review form ******/

    private List<String> getTitlesInForm() {
        List<String> applicationReviewFormTitles = new ArrayList<>();
        for (Elements myElement : I.amPerforming().getElementReference().forListOfElements().of(formSectionTitles, false)) {
            Collections.addAll(applicationReviewFormTitles, myElement.getText());
        }
        return applicationReviewFormTitles;
    }

    private List<String> getTitlesInFormForLwc() {
        List<String> applicationReviewFormTitles = new ArrayList<>();
        for (Elements myElement : I.amPerforming().getElementReference().forListOfElements().of(formSectionTitlesLwc, false)) {
            Collections.addAll(applicationReviewFormTitles, myElement.getText());
        }
        return applicationReviewFormTitles;
    }

    private By getSummaryRecommendationXpath() {
        return By.xpath("//*[contains(@class,'panel-title') and contains(text(),'Overview')]//ancestor::div[contains(@class,'tab-inner-content')]//select");
    }

    private By getSummaryRecommendationForLwcXpath() {
        return By.xpath("//button[@name='Recommendation__c']");
    }

    private By selectRecommendationForLwcXpath(String recommendation) {
        return By.xpath("//button[@name='Recommendation__c']/../..//span[text()='" + recommendation + "']");
    }

    private By getSummaryComments() {
        return By.xpath("//div[@class='panel-heading' or @class='tab-inner-content']//span[text()='Comments']/../../..//textarea");
    }

    private By getSummaryCommentsForLwc() {
        return By.xpath("//label[text()='Comments']/following-sibling::div//textarea");
    }

    private int getcountForRowsReviewForm(String title) {
        return I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow']"), false).size();
    }

    private int getcountForRowsReviewFormForLwc(String title) {
        return I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@class='slds-box pblock']//span[text()='" + title + "']//parent::div//c-review-form-field"), false).size();
    }

    private int checkTextAreaPresentReviewForm(String title, int qNumber) {
        return I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                + "]//textarea"), false).size();
    }

    private int checkTextAreaPresentReviewFormForLwc(String title, int qNumber) {
        return I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@class='slds-box pblock']//span[text()='" + title + "']//parent::div//c-review-form-field[" + qNumber + "]//textarea"), false).size();
    }

    private By getTextAreaReviewForm(String title, int qNumber) {
        return By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                + "]//textarea");
    }

    private By getTextAreaReviewFormForLwc(String title, int qNumber) {
        return By.xpath("//div[@class='slds-box pblock']//span[text()='" + title + "']//parent::div//c-review-form-field[" + qNumber + "]//textarea");
    }

    private int checkTextInputScorePresentReviewForm(String title, int qNumber) {
        return I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                + "]//input[@placeholder='Enter a number']"), false).size();
    }

    private int checkTextInputScorePresentReviewFormForLwc(String title, int qNumber) {
        return I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@class='slds-box pblock']//span[text()='" + title + "']//parent::div//c-review-form-field[" + qNumber + "]//input[@placeholder='Enter a Number']"), false).size();
    }

    private By getTextInputScoreReviewForm(String title, int qNumber) {
        return By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                + "]//input[@placeholder='Enter a number']");
    }

    private By getTextInputScoreReviewFormForLwc(String title, int qNumber) {
        return By.xpath("//div[@class='slds-box pblock']//span[text()='" + title + "']//parent::div//c-review-form-field[" + qNumber + "]//input[@placeholder='Enter a Number']");
    }

    private int checkTextInputPercentPresentReviewForm(String title, int qNumber) {
        return I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                + "]//input[@placeholder='Enter a percentage']"), false).size();
    }

    private int checkTextInputPercentPresentReviewFormForLwc(String title, int qNumber) {
        return I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@class='slds-box pblock']//span[text()='" + title + "']//parent::div//c-review-form-field[" + qNumber + "]//input[@placeholder='Enter a Percentage']"), false).size();
    }

    private By getTextInputPercentReviewForm(String title, int qNumber) {
        return By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                + "]//input[@placeholder='Enter a percentage']");
    }

    private By getTextInputPercentReviewFormForLwc(String title, int qNumber) {
        return By.xpath("//div[@class='slds-box pblock']//span[text()='" + title + "']//parent::div//c-review-form-field[" + qNumber + "]//input[@placeholder='Enter a Percentage']");
    }

    /**
     * Modifier- komal.mukhekar: Added XPath for SCAG Project
     */
    private int checkTextInputDollarPresentReviewForm(String title, int qNumber) {
        if (EnvironmentFactory.getEnvironmentUrl().contains("scag")) {
            return I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                    + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                    + "]//input[@placeholder='Enter a dollar value']" +
                    " | //div[@class='panel-heading']//h3[text()='" + title + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber + "]//input"), false).size();

        } else {
            return I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                    + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                    + "]//input[@placeholder='Enter a dollar value']"), false).size();
        }
    }

    private int checkTextInputDollarPresentReviewFormForLwc(String title, int qNumber) {
        return I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@class='slds-box pblock']//span[text()='" + title + "']//parent::div//c-review-form-field[" + qNumber + "]//input[@placeholder='Enter a DOllar']"), false).size();
        }

    private By getTextInputDollarPresentReviewFormForLwc(String title, int qNumber) {
        return By.xpath("//div[@class='slds-box pblock']//span[text()='" + title + "']//parent::div//c-review-form-field[" + qNumber + "]//input[@placeholder='Enter a DOllar']");
    }


    /**
     * Modifier- komal.mukhekar: Added XPath for SCAG Project
     */
    private By getTextInputDollarReviewForm(String title, int qNumber) {
        if (EnvironmentFactory.getEnvironmentUrl().contains("scag")) {
            return By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                    + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                    + "]//input[@placeholder='Enter a dollar value'] " +
                    "| //div[@class='panel-heading']//h3[text()='" + title + "']/../../..//div[contains(@class,'panel-body')]/div//input");
        } else {
            return By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                    + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                    + "]//input[@placeholder='Enter a dollar value']");
        }
    }

    private int checkTextInputDatePresentReviewForm(String title, int qNumber) {
        return I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                + "]//input[@placeholder='mm/dd/yyyy']"), false).size();
    }

    private By getTextInputDateReviewForm(String title, int qNumber) {
        return By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                + "]//input[@placeholder='mm/dd/yyyy']");
    }

    private int checkTextInputDatePresentReviewFormForLwc(String title, int qNumber) {
        return I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@class='slds-box pblock']//span[text()='" + title + "']//parent::div//c-review-form-field["+ qNumber + "]//lightning-datepicker//input"), false).size();
    }

    private By getTextInputDateReviewFormForLwc(String title, int qNumber) {
        return By.xpath("//div[@class='slds-box pblock']//span[text()='" + title + "']//parent::div//c-review-form-field["+ qNumber + "]//lightning-datepicker//input");
    }

    private int checkDropdownPresentReviewForm(String title, int qNumber) {
        return I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow' or @class='row']["
                + qNumber + "]//select"), false).size();
    }

    private int checkDropdownPresentReviewFormForLwc(String title, int qNumber) {
        return I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@class='slds-box pblock']//span[text()='" + title + "']//parent::div//c-review-form-field[" + qNumber + "]//button[@role='combobox']"), false).size();
    }


    private By checkDropdownReviewForm(String title, int qNumber) {
        return By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow' or @class='row']["
                + qNumber + "]//select");
    }

    private By checkDropdownReviewFormForLwc(String title, int qNumber) {
        return By.xpath("//div[@class='slds-box pblock']//span[text()='" + title + "']//parent::div//c-review-form-field[" + qNumber + "]//button[@role='combobox']");
    }

    private By selectDropdownReviewFormForLwc(String title, int qNumber) {
        return By.xpath("//div[@class='slds-box pblock']//span[text()='" + title + "']//parent::div//c-review-form-field[" + qNumber + "]//button[@role='combobox']/../..//span[text()='Yes' or text()='Medium' ]");
    }

    /**
     * clear value from fields present on form page
     *
     * @param pageBlock  Page block name on form page
     * @param fieldLabel field label on form page
     * @author ashwini.mahore
     */
    public void clearFormData(String pageBlock, String fieldLabel) {
        By element = ByUsing.xpath("//h3//a[contains(@title,'" + pageBlock + "')]/ancestor::div[@class='panel-heading']/following-sibling::div//dt//*[contains(text(),'" + fieldLabel + "')]//parent::dt//following-sibling::dd");
        WebElement fieldWrapper = I.amPerforming().getElementReference().of(element);
        handleClearingFormDataInputs(fieldWrapper);
    }

    /**
     * method under testing
     *
     * @param isModal
     * @param nubmerOfChar
     * @param fieldApi
     * @author tejal.gadewar
     */
    public void iEnterCharactersIntoField(boolean isModal, String nubmerOfChar, String fieldApi) {
        int actualCount = 0;
        int reminder = Integer.parseInt(nubmerOfChar) % 100;
        actualCount = reminder > 0 ? (Integer.parseInt(nubmerOfChar) / 100) + 1 : Integer.parseInt(nubmerOfChar) / 100;
        int charCount = 0;
        WebElement fieldWrapperLocator;
        if (isModal) {
            fieldWrapperLocator = I.amPerforming().getElementReference().of(By.xpath("//div[@id='modaltemp']//div[@id='field" + fieldApi + "' or @id='" + fieldApi + "'] | //span[contains(@id,'" + fieldApi + "')]|//div[@id='modaltemp']//div[@id='" + fieldApi + "'] | //field[@field-name='" + fieldApi + "']"));
        } else {
            fieldWrapperLocator = I.amPerforming().getElementReference().of(By.xpath("//*[(local-name()='div' or local-name()='span') and @id='field" + fieldApi + "' or @id='" + fieldApi + "'] | //field[@field-name='" + fieldApi + "']"));
        }
        for (int j = 0; j < actualCount; j++) {
            StringBuilder value = new StringBuilder();
            for (int i = 1; i <= 100; i++) {
                if (charCount < Integer.parseInt(nubmerOfChar)) {
                    value.append("a");
                    ++charCount;
                }
            }
            String finalValue = value.toString();
            this.handleRichTextInput(fieldWrapperLocator, finalValue, true);
        }

    }
}

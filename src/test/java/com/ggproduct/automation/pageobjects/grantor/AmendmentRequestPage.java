package com.ggproduct.automation.pageobjects.grantor;

import com.helperPackage.handlers.govgrants;
import com.ggproduct.automation.projectmanager.GrantorProjectManager;
import com.helperPackage.actionsfactory.api.ByUsing;
import com.helperPackage.register.I;
import org.junit.platform.commons.function.Try;
import org.openqa.selenium.By;

import java.time.format.DateTimeFormatter;

public class AmendmentRequestPage extends GrantorProjectManager {

    /**
     * Used to calculate revised encumbrance balance
     * @return - Revised Encumbrance balance
     * @Author - Mahadev.hanme
     */
    public Double calculateRevisedEncumbrance(String awardName) {
        String awardBudget = getFieldValueFromAPI(awardName, "GrantAwardName__c", "Award__c", "AmountAvailable__c");
        String requestedChangeInBudget = getFieldValueFromAPI(awardName, "GrantAwardName__c", "AmendmentRequest__c", "RequestedChangeInBudget__c");
        double awardBudgetInDouble = Double.parseDouble(awardBudget);
        double requestedChangeInBudgetDouble = Double.parseDouble(requestedChangeInBudget);
        if (Double.parseDouble(requestedChangeInBudget) >= 0.0) {
            return awardBudgetInDouble + requestedChangeInBudgetDouble;
        } else
            return awardBudgetInDouble - requestedChangeInBudgetDouble;
    }

    /**
     * handles to enter revised encumbrance balance on amendment request
     * @Author - Mahadev.hanme
      */
    public void enterRevisedEncumbrance(String awardName) {
        I.amPerforming().textInput().toClear(By.xpath("//c-fieldlwc[@data-fieldapiname='ActualEncumbrance__c']//input"));
        I.amPerforming().textInput().in(By.xpath("//c-fieldlwc[@data-fieldapiname='ActualEncumbrance__c']//input"),calculateRevisedEncumbrance(awardName).toString());
    }

    public void updatedBudgetPeriodEndDate(String offset, String awardName) {
        String rawDate = getFieldValueFromAPI(awardName, "GrantAwardName__c", "Award__c", "BudgetPeriodEndDate__c");
        String[] rawDateSplitted = rawDate.split(" ")[0].split("-");
        String fieldValue = rawDateSplitted[1] + "/" + rawDateSplitted[2] + "/" + rawDateSplitted[0];
        I.amPerforming().propertiesFileOperationsTo().saveValue("updatedBudgetPeriodDate", I.amPerforming().dateOperationsToGet().givenDateWithOffsetFromGivenDate(fieldValue,Integer.parseInt(offset),DateTimeFormatter.ofPattern("M/d/uuuu")));
    }

    /**
     * Method to click on any button after selection of record in the tables for LWC
     * @param buttonName
     * @param recordValue
     * @param numberofEntries
     * @param flexTableId
     * @modified komal.mukhekar - updated method to select the record by performing quick search and then click on the button in the right panel for LWC tables instead of selecting the record by navigating through the pagination in the tables
     */
    public void clickAfterSelectionOfInTheTablesForLwc(String buttonName, String recordValue, String numberofEntries, String flexTableId) {
        By entriesDropDown = ByUsing.xpath("//*[@data-flextablename='" + flexTableId + "']//div//input[@placeholder='Select an Option']");
        try {
            I.amPerforming().waitFor().ElementToBePresent(entriesDropDown,5);
            if (I.amPerforming().checkToSee().isDisplayed(entriesDropDown)
                    || I.amPerforming().checkToSee().isEnabled(entriesDropDown)) {
                govgrants.perform().quickSearch().performModalSpecificQuickSearchForLWC(flexTableId, recordValue);
                govgrants.perform().flexTable().flexTableShowEntriesDropDownForLWC(flexTableId, numberofEntries);
            }
        } catch (Exception e) {

        }
        govgrants.perform().flexTable().selectCheckBoxes(flexTableId, recordValue);
        govgrants.perform().phasePanel().clickAnyRightPannelButton(flexTableId, buttonName);
    }

}

package com.ggproduct.automation.steps;

import com.ggproduct.automation.projectmanager.ProjectManager;
import com.ggproduct.automation.webservices.ProjectWebServices;
import com.helperPackage.handlers.govgrants;
import com.helperPackage.register.I;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import jdk.jfr.Description;
import org.openqa.selenium.By;

public class CommonSteps {
    ProjectManager projectManager;

    public CommonSteps(ProjectManager projectManager) {
        this.projectManager = projectManager;
    }

    /* ReCaptcha Steps */

    @Before("@recaptcha")
    public void turnOffRecaptcha() {
        ProjectWebServices.recaptchaChange(true);
    }

    @After("@recaptcha")
    public void turnOnRecaptcha() {
        ProjectWebServices.recaptchaChange(false);
    }

    @Given("^I delete the record \"([^\"]*)\" from the object \"([^\"]*)\"$")
    public void deleteTestData(String recordName, String objectType) {
        projectManager.deletionApi(recordName, objectType);
    }

    @When("I close the tab")
    public void closeCurrentTab() {
        I.amPerforming().browserOperationsTo().closeBrowserOrTab();
        I.amPerforming().switchTo().windowHandler(
                I.amPerforming().switchTo().getWindowsHandlers().size() - 1
        );
    }

    @Then("^I (softly see|do not see) the image \"([^\"]*)\" in page detail$")
    public void validateImageinPageDetail(String usage, String imageName) {
        projectManager.validateImage(usage, imageName);
    }

    @Then("^I see the page contains text \"([^\"]*)\"$")
    public void assertTextOnPage(String desiredText) {
        projectManager.assertTextOnPage(desiredText);
    }

    @Description("Validate text message coming on confirmation box")
    @Then("^I (softly see|see) confirmation box with quotes in body \"(.*?)\" is displayed$")
    public void assertConfirmationBoxWithMessage(String usage, String message) {
        projectManager.assertMessageOfConfirmationBoxPopUp(message, usage.contains("softly"));
    }

    @Description("Validate field is not editable")
    @Then("I (softly see|see) field \"([^\"]*)\" not in edit mode$")
    public void iSoftlySeeFieldNotInEditMode(String usage,String fieldAPIName) {
        projectManager.assertFieldIsNotInEditMode(fieldAPIName, usage.contains("softly"));
    }

    @Then("I softly see fields value with label {string} contains {string} characters")
    public void iSoftlySeeFieldsValueWithLabelContainsCharacters(String usage, String fieldLabel, String charCount) {
        projectManager.assertLengthOfFieldValues(usage, fieldLabel, charCount);
    }

    @And("I click radio button {string} in COI of review form")
    public void iClickRadioButtonInCOIOfReviewForm(String radioButtonName) {
        projectManager.clickOnCOIOption(radioButtonName);
    }

    @And("I reset the table")
    public void iResetTheTable() {
        I.amPerforming().click().withJavaScript(By.xpath("//div[@class='resetIcon']//button"));
    }
    @And("I click on remove for lookup from field \"([^\"]*)\"$")
    public void iRemovelookupvalue(String fieldApiName) {
        I.amPerforming().click().withJavaScript(By.xpath("//div[@data-field_api_name='" + fieldApiName + "']//div[contains(@class,'pillDiv slds-show')]//*[@title='Remove selected option']"));
    }


    @Then("I (softly see|do not see) value \"([^\"]*)\" for the field \"([^\"]*)\"$")
    public void iSoftlySeeValueForTheField(String labelName, String labelValue, String usage) {
        projectManager.assertFieldValues(usage, labelName, labelValue);
    }
}



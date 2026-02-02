package com.helperPackage.govgrants;

import com.helperPackage.handlers.govgrants;
import com.helperPackage.register.I;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;

public final class Modal {

    /**
     * click on any button on modal content
     *
     * @param buttonName
     * @modifier saranjit.modak modified catch with javascript click 10/05/2023
     */
    public void clickModalContentSpecificButton(String buttonName) {
        By modalButton = getModalContentSpecificButton(buttonName);
        try {
            govgrants.perform().mainPage().waitForNavigationLogoToDisappear();
            I.amPerforming().click().on(modalButton, false);
            govgrants.perform().mainPage().waitForNavigationLogoToDisappear();
        } catch (Exception ee) {
            I.amPerforming().click().withJavaScript(modalButton);
            govgrants.perform().mainPage().waitForNavigationLogoToDisappear();
        }
        govgrants.perform().modal().acceptPopUp();
    }

    public By getModalContentSpecificButton(String buttonName) {
        return By.xpath("//div[contains(@class,'modal__container')]//button[contains(text(),'" + buttonName + "')] | //div[contains(@class,'modal__container')]//button[@title='" + buttonName + "'] | //div[@id='WorkspaceFileEdit']//button[@title='" + buttonName + "' or text()='" + buttonName + "']");
    }

    /**
     * closes a modal by clicking the little 'x' button in the top right of the
     * modal, and switches to the parent frame.
     *
     * @author daniel.hilla
     */
    public void closeModalByClickingTopRightCloseButton() {
        By closeButton = By.xpath("//div[contains(@class, 'modal__container')]//button[@title='Cancel and close']");
        I.amPerforming().click().on(closeButton);
    }

    /**
     * closes a modal by clicking the little 'x' button in the top right of the modal
     * Author - Nauman Shahid
     * Modifier - saranjit.modak Added Xpath - 17/05/2023
     */
    public void closeModalByClickingTopRightCloseButton(String titleName) {
        By closeButton = By.xpath("//div[contains(@class,'modal')]//h2[text()='" + titleName + "']/parent::header//button[@title='Close']");
        I.amPerforming().click().on(closeButton);
    }

    /**
     * Accept modal based pop up
     */
    public void acceptPopUp() {
        for (int i = 0; i < 5; i++) {
            try {
                if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[contains(@class,'modal__container')]//lightning-confirm | //div[contains(@class,'modal__container')]//header//h2[text()='Confirm'] | //div[contains(@class,'modal__container')]//*[text()='Confirm']"))) {
                    WebElement popup = I.amPerforming().getElementReference().of(By.xpath("//div[contains(@class,'modal__container')]"));
                    I.amPerforming().click().on(I.amPerforming().getElementReference().ofNested(popup, By.xpath("//div[contains(@class,'modal__container')]//button[text()='OK' or text()='Yes' or text()='Continue']")));
                    break;
                }
            } catch (NoSuchElementException e) {
                I.amPerforming().waitFor().makeThreadSleep(1000);
            }
        }

        //Comment box handler
        try {
            if (I.amPerforming().checkToSee().IsElementPresentQuick(By.xpath("//div[contains(@class,'modal__container')]//lightning-prompt//input | //div[contains(@class,'modal__container')]//div[@class='confirm-modal']//input | //button[text()='Edit']"))) {
                I.amPerforming().textInput().in(By.xpath("//div[contains(@class,'modal__container')]//lightning-prompt//input | //div[contains(@class,'modal__container')]//div[@class='confirm-modal']//input"), "Automated Test");
                I.amPerforming().click().on(By.xpath("//div[contains(@class,'modal__container')]//button[text()='OK' or text()='Yes' or text()='Continue'] | //button[text()='Edit']"));
            }
        } catch (Exception e) {

        }
    }


    /**
     * Accept/reject modal based pop up with passed parameter
     */
    public void acceptPopUpWithParameter(String buttonName) {
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[contains(@class,'modal__footer')] | //div[contains(@class,'modal__container')]//lightning-confirm | //div[contains(@class,'modal__container')]//header"), true)) {
                I.amPerforming().click().on(By.xpath("//div[contains(@class,'modal__footer')]//button[text()='" + buttonName + "'] | //div[contains(@class,'modal__container')]//button[text()='" + buttonName + "'] | //footer[contains(@class,'modal__footer')]//button[text()='" + buttonName + "']"));
            }
        } catch (Exception e) {
        }
    }

    /**
     * To handle enter comments and click button
     *
     * @param comments
     * @param buttonName
     */
    public void enterCommentsOnPopup(String comments, String buttonName) {
        try {
            I.amPerforming().waitFor().ElementToBePresent(By.xpath("//div[contains(@class, 'modal') and contains(@class, 'bootbox')]//div[contains(@class, 'modal-content')]"));
        } catch (Exception e) {
        }
        I.amPerforming().textInput().in(By.xpath("//form[@class='bootbox-form']//textarea"), comments);
        I.amPerforming().click().on(By.xpath("//div[contains(@class, 'modal-content')]//button[text()='" + buttonName + "']"));
    }

    /**
     * click search icon of owner organization lookup field at page block detail edit page.
     * It will handle two things:-1. if you want to click lookup search with clearing data inside search box.
     * 2. If you want to click lookup search with existing search data.
     *
     * @param lookupFieldName
     * @param wantsToClear
     * @author Monu Kumar
     */
    public void clickLookupModalQuickSearch(String lookupFieldName, boolean wantsToClear) {
        if (wantsToClear) {
            I.amPerforming().textInput().toClear(I.amPerforming().getElementReference().of(By.xpath("//img[@title='" + lookupFieldName + "']/../../input[@type='text']")));
        }
        I.amPerforming().click().on(By.xpath("//img[@title='" + lookupFieldName + "']"));
    }

    /**
     * To handle alert pop up
     *
     * @param buttonName
     * @author Meenakshi Jha
     */
    public void clickAlertContentSpecificButton(String buttonName) {
        try {
            if (buttonName.contains("OK")) {
                I.amPerforming().switchTo().acceptAlert();
            } else {
                I.amPerforming().switchTo().rejectAlert();
            }
        } catch (org.openqa.selenium.NoAlertPresentException noAlertPresentException) {
            I.amPerforming().waitFor().makeThreadSleep(2000);
            if (buttonName.contains("OK")) {
                I.amPerforming().switchTo().acceptAlert();
            } else {
                I.amPerforming().switchTo().rejectAlert();
            }
        }
    }

    public void clickAlertContentSpecificButtonForLwc(String buttonName) {
        I.amPerforming().click().on(By.xpath("//div[contains(@class,'modal__footer')]//button[text()='" + buttonName + "']"));
    }

    /**
     * Accept modal based on pop up for discard changes
     */
    public void acceptPopUpForEditPage() {
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[contains(@class,'modal__container')]//div[contains(@class,'modal-header')]//h1[text()='Save Changes?'] | //div[contains(@class,'modal__container')]//header[contains(@class,'modal__header')]//h2[text()='Saved Changes'] | //div[contains(@class,'modal__container')]//div[contains(@class,'modal__header')]//h1[text()='Confirm']"))) {
                WebElement popup = I.amPerforming().getElementReference().of(By.xpath("//div[contains(@class,'modal__container')]"));
                I.amPerforming().click().on(I.amPerforming().getElementReference().ofNested(popup, By.xpath("//div[contains(@class,'modal__container')]//button[text()='Discard Changes' or text()='OK' or contains(text(),'Discard Changes')]")));
            }
        } catch (Exception e) {

        }

    }
}




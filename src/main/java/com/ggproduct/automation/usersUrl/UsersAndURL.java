package com.ggproduct.automation.usersUrl;


import com.helperPackage.controller.UsersController;
import com.helperPackage.misclib.Properties_Logs;
import com.helperPackage.register.EnvironmentFactory;
import com.helperPackage.register.I;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class UsersAndURL implements UsersController {

    public UsersAndURL() {
        I.amPerforming().propertiesFileOperationsTo().saveValue("ADMIN Username", "Automation ADMIN");
        I.amPerforming().propertiesFileOperationsTo().saveValue("ADMIN1 Username", "Automation ADMIN1");
        I.amPerforming().propertiesFileOperationsTo().saveValue("EXE Username", "Automation EXE");
        I.amPerforming().propertiesFileOperationsTo().saveValue("FO Username", "Automation FO");
        I.amPerforming().propertiesFileOperationsTo().saveValue("PO Username", "Automation PO");
        I.amPerforming().propertiesFileOperationsTo().saveValue("FD Username", "Automation FD");
        I.amPerforming().propertiesFileOperationsTo().saveValue("PM Username", "Automation PM");
        I.amPerforming().propertiesFileOperationsTo().saveValue("PM1 Username", "Automation PM1");
        I.amPerforming().propertiesFileOperationsTo().saveValue("EXE1 Username", "Automation EXE1");
        I.amPerforming().propertiesFileOperationsTo().saveValue("FO1 Username", "Automation FO1");
        I.amPerforming().propertiesFileOperationsTo().saveValue("PO1 Username", "Automation PO1");
        I.amPerforming().propertiesFileOperationsTo().saveValue("FD1 Username", "Automation FD1");
        I.amPerforming().propertiesFileOperationsTo().saveValue("AUDITOR Username", "Automation AUDITOR");
        I.amPerforming().propertiesFileOperationsTo().saveValue("SPI Username", "Automation SPI");
        I.amPerforming().propertiesFileOperationsTo().saveValue("SPI3 Username", "Automation SPI3");
        I.amPerforming().propertiesFileOperationsTo().saveValue("SPA Username", "Automation SPA");
        I.amPerforming().propertiesFileOperationsTo().saveValue("SPI4 Username", "Automation SPI4");
        I.amPerforming().propertiesFileOperationsTo().saveValue("IND Username", "Automation IND");
        I.amPerforming().propertiesFileOperationsTo().saveValue("SME Username", "Automation SME");
        I.amPerforming().propertiesFileOperationsTo().saveValue("GRANTEE ADMIN Username", "Grantee ADMIN");
        I.amPerforming().propertiesFileOperationsTo().saveValue("GRANTEE PO Username", "Grantee PO");
        I.amPerforming().propertiesFileOperationsTo().saveValue("GRANTEE FD Username", "Grantee FD");
        I.amPerforming().propertiesFileOperationsTo().saveValue("GRANTEE PM Username", "Grantee PM");
        I.amPerforming().propertiesFileOperationsTo().saveValue("GRANTEE PM1 Username", "Grantee PM1");
        I.amPerforming().propertiesFileOperationsTo().saveValue("GRANTEE FO Username", "Grantee FO");
        I.amPerforming().propertiesFileOperationsTo().saveValue("GRANTEE EXE Username", "Grantee EXE");
    }

    /**
     * @REI-Systems
     * @author nauman.shahid
     * @category Handles users based on different environments
     */

    /****
     * BELOW ARE SAMPLE METHODS TO HANDLE USERS BASED ON DIFFERENT ENVIRONEMNTS
     *******/
    /****
     * IT ALSO HANDLE ANY ADDITIONAL URL IN ADDITION TO STANDARD PROJECT
     **********/
    /****
     * SINCE THESE ARE GENERIC METHODS SO YOU MAY KEEP THE SAME WITH MODIFICATION
     ******/

    @Override
    public String getUserName(String userLevel) {
        String userName = null;
        if ((EnvironmentFactory.getEnvironmentName() != null) && (EnvironmentFactory.getEnvironmentName().contains("QA"))) {
            userName = getQAEnvironmentUser(setUpUserLevel(userLevel));
        } else if ((EnvironmentFactory.getEnvironmentName() != null) && (EnvironmentFactory.getEnvironmentName().contains("TEST8"))) {
            userName = getTest8EnvironmentUser(setUpUserLevel(userLevel));
        } else if ((EnvironmentFactory.getEnvironmentName() != null) && (EnvironmentFactory.getEnvironmentName().contains("PROLWC"))) {
            userName = getProLwcEnvironmentUser(setUpUserLevel(userLevel));
        } else if ((EnvironmentFactory.getEnvironmentName() != null) && (EnvironmentFactory.getEnvironmentName().contains("NYLWC"))) {
            userName = getNYLwcEnvironmentUser(setUpUserLevel(userLevel));
        } else if ((EnvironmentFactory.getEnvironmentName() != null) && (EnvironmentFactory.getEnvironmentName().contains("MERGE"))) {
            userName = getMergeEnvironmentUser(setUpUserLevel(userLevel));
        } else if ((EnvironmentFactory.getEnvironmentName() != null) && (EnvironmentFactory.getEnvironmentName().contains("WASHINGTON"))) {
            userName = getWashingtonEnvironmentUser(setUpUserLevel(userLevel));
        } else {
            userName = getAUTOEnvironmentUser(setUpUserLevel(userLevel));
        }
        return userName;
    }

    @Override
    public String getPassword(String userLevel) {
        String password = null;
        if (EnvironmentFactory.getEnvironmentName().contains("QA")) {
            password = getQAEnvironmentPassword(setUpUserLevel(userLevel));
        } else if (EnvironmentFactory.getEnvironmentName().contains("TEST8")) {
            password = getTest8EnvironmentPassword(setUpUserLevel(userLevel));
        } else if (EnvironmentFactory.getEnvironmentName().contains("PROLWC")) {
            password = getProLwcEnvironmentPassword(setUpUserLevel(userLevel));
        } else if (EnvironmentFactory.getEnvironmentName().contains("NYLWC")) {
            password = getNYLwcEnvironmentPassword(setUpUserLevel(userLevel));
        } else if (EnvironmentFactory.getEnvironmentName().contains("MERGE")) {
            password = getMergeEnvironmentPassword(setUpUserLevel(userLevel));
        } else if (EnvironmentFactory.getEnvironmentName().contains("WASHINGTON")) {
            password = getWashingtonEnvironmentPassword(setUpUserLevel(userLevel));
        } else
            password = getAUTOEnvironmentPassword(setUpUserLevel(userLevel));
        return password;
    }

    private String getProLwcEnvironmentPassword(String userLevel) {
        String password;
        switch (userLevel.toUpperCase()) {
            case "SARAH PM":
                password = "Salesforce@2040";
                break;
            case "PM":
                password = "Salesforce@2040";
                break;
            case "ADMIN":
                password = "Salesforce@2040";
                break;
            default:
                password = "Salesforce@2039";
        }
        return password;
    }

    private String getNYLwcEnvironmentPassword(String userLevel) {
        String password;
        switch (userLevel.toUpperCase()) {
            case "GRANTEE ADMIN":
                password = "Qaadmin@2030";
                break;
            case "GRANTEE PM":
                password = "Rei@2025";
                break;
            case "GRANTEE EXE":
                password = "Rei@2026";
                break;
            case "GRANTEE FO":
                password = "Rei@2025";
                break;
            case "SARAH PM":
                password = "Rei@2025";
                break;
            case "ADMIN":
                password = "Automation@2026";
                break;
            case "ADMIN1":
                password = "Automation@2026";
                break;
            default:
                password = "Automation@2025";
        }
        return password;
    }

    private String getMergeEnvironmentUser(String userLevel) {
        Map<String, String> username = new HashMap<>();
        username.put("ADMIN", "govgrantsauto@yopmail.com.ggmergeqa2");
        username.put("ADMIN1", "manu.admin@ggp.test8.ggmergeqa2");
        username.put("EXE", "exe.automation.ggmergeqa2@yopmail.com");
        username.put("PM", "pm.automation.merge@yopmail.com");
        username.put("FO", "fo.automation.ggmergeqa2@yopmail.com");
        username.put("PO", "automationpo@yopmail.com.ggmergeqa2");
        username.put("FD", "automationfd.ggmergeqa2@yopmail.com");
        username.put("PM1", "pm1.automation@yopmail.com.ggmergeqa2");
        username.put("EXE1", "exe1.automation@yopmail.com.ggmergeqa2");
        username.put("PO1", "automationpo1@yopmail.com.ggmergeqa2");
        username.put("FO1", "fo1.automation@yopmail.com.ggmergeqa2");
        username.put("FD1", "automationfd1@yopmail.com.ggmergeqa2");
        username.put("AUDITOR", "automationauditor@yopmail.com.ggmergeqa2");
        username.put("SPI3", "automationspi31.ggdev2@yopmail.com.ggmergeqa2");
        username.put("SPA", "spaautomation12@yopmail.com.ggmergeqa2");
        username.put("SA", "asa@grants.gov.ggmergeqa2");
        username.put("IND", "ind12.automation@yopmail.com.ggmergeqa2");
        username.put("SME", "sme11@yopmail.com.ggmergeqa2");
        username.put("SPI4", "spi4@yopmail.com.ggmergeqa2");
        username.put("SARAH PM", "sarah.pm@ggp.test8.ggmergeqa2");

        username.put("GRANTEE ADMIN", "demo.admin@ggp.test8.ggmergeqa2");
        username.put("GRANTEE ADMIN1", "qa.admin.testing@ggp.test8.ggmergeqa2");
        username.put("GRANTEE ADMIN2", "govgrantsauto@yopmail.com.ggmergeqa2");
        username.put("GRANTEE PM", "sarah.pm@ggp.test8.ggmergeqa2");
        username.put("GRANTEE EXE", "victor.exe@ggp.test8.ggmergeqa2");
        username.put("GRANTEE EXE1", "exe1.automation@yopmail.com.ggmergeqa2");
        username.put("GRANTEE FO", "david.fo@ggp.test8.ggmergeqa2");
        username.put("GRANTEE FD", "danielle.garcia@ggp.test8.ggmergeqa2");
        username.put("GRANTEE PO", "grantee.po@yopmail.com.ggmergeqa2");
        username.put("GRANTEE AUDITOR", "alex.auditor@yopmail.com.ggmergeqa2");

        if (userLevel.toUpperCase() != null) {
            return username.get(userLevel.toUpperCase());
        } else {
            return username.get("ADMIN");
        }
    }

    private String getMergeEnvironmentPassword(String userLevel) {
        String password;
        switch (userLevel.toUpperCase()) {
            case "GRANTEE ADMIN":
                password = "QaTest@July2026";
                break;
            case "GRANTEE ADMIN1":
                password = "Dev@3030";
                break;
            case "GRANTEE ADMIN2":
                password = "Auto@2020";
                break;
            case "GRANTEE PM":
                password = "QaTest@July2026";
                break;
            case "GRANTEE EXE":
                password = "QaTest@July2026";
                break;
            case "GRANTEE EXE1":
                password = "Auto@2020";
                break;
            case "GRANTEE FO":
                password = "QaTest@July2026";
                break;
            case "GRANTEE FD":
                password = "QaTest@July2026";
                break;
            case "GRANTEE PO":
                password = "QaTest@July2026";
                break;
            case "GRANTEE AUDITOR":
                password = "QaTest@July202601";
                break;
            case "SARAH PM":
                password = "QaTest@July2026";
                break;
            case "ADMIN":
                password = "Automation@May2026";
                break;
            case "EXE":
                password = "Automation@July2026";
                break;
            case "FD":
                password = "Automation@July2026";
                break;
            case "AUDITOR":
                password = "Rei@2032";
                break;
            case "SME":
                password = "Automation@July26";
                break;
            default:
                password = "Automation!123";
        }
        return password;
    }

private String getWashingtonEnvironmentPassword(String userLevel) {
    String password;
    switch (userLevel.toUpperCase()) {
        case "GRANTEE ADMIN":
            password = "Automation@2025";
            break;
        case "GRANTEE ADMIN1":
            password = "Automation@2026";
            break;
        case "GRANTEE PM":
            password = "Grantor@123";
            break;
        case "GRANTEE EXE":
            password = "Grantor@123";
            break;
        case "GRANTEE FO":
            password = "Grantor@123";
            break;
        case "GRANTEE FD":
            password = "Grantor@123";
            break;
        case "GRANTEE AUDITOR":
            password = "Automation@2025";
            break;
        case "GRANTEE PO":
            password = "Grantor@123";
            break;
        case "SARAH PM":
            password = "Grantor@123";
            break;
        case "SA":
            password = "Automation@2026";
            break;
        case "PO":
            password = "Grantor@123";
            break;
        case "PM":
            password = "Grantor@123";
            break;
        case "FO":
            password = "Grantor@123";
            break;
        case "FO1":
            password = "Grantor@123";
            break;
        case "ADMIN":
            password = "Automation@2026";
            break;
        case "ADMIN1":
            password = "Automation@2026";
            break;
        default:
            password = "Automation@2025";
    }
    return password;
}

private String getQAEnvironmentPassword(String userLevel) {
    String password;
    switch (userLevel.toUpperCase()) {
        case "SIMON PM":
            password = "Salesforce@2034";
            break;
        case "SPI3":
            password = "Salesforce@2026";
            break;
        case "SARAH PM":
            password = "Pm@20278";
            break;
        case "GRANTEE ADMIN":
            password = "Rei@2025";
            break;
        case "GRANTEE ADMIN1":
            password = "Rei@2025";
            break;
        case "GRANTEE PM":
            password = "Grantee@2030";
            break;
        case "GRANTEE PM1":
            password = "Grantee@2030";
            break;
        case "GRANTEE ADMIN2":
            password = "Grantee@2031";
            break;
        case "GRANTEE EXE":
            password = "Grantee@2030";
            break;
        case "GRANTEE EXE1":
            password = "Grantee@2030";
            break;
        case "GRANTEE FO":
            password = "Grantee@2030";
            break;
        case "GRANTEE FO1":
            password = "Grantee@2030";
            break;
        case "GRANTEE FD":
            password = "Grantee@2030";
            break;
        case "GRANTEE FD1":
            password = "Grantee@2030";
            break;
        case "GRANTEE AUDITOR":
            password = "Grantee@2030";
            break;
        case "GRANTEE PO":
            password = "Grantee@2030";
            break;
        case "GRANTEE PO1":
            password = "Grantee@2030";
            break;
        case "ADMIN":
            password = "Salesforce@2035";
            break;
        case "FO":
            password = "Rei@2031";
            break;
        case "FD":
            password = "Rei@2031";
            break;
        case "AUDITOR":
            password = "Rei@2031";
            break;
        default:
            password = "Salesforce@2034";
    }
    return password;
}

private String getTest8EnvironmentPassword(String userLevel) {
    String password;
    switch (userLevel.toUpperCase()) {
        case "ADMIN":
            password = "Salesforce@2025";
            break;
        case "ADMIN1":
            password = "Salesforce@2031";
            break;
        case "SPI3":
            password = "Salesforce@2033";
            break;
        case "IND":
            password = "Salesforce@2033";
            break;
        case "PM":
            password = "Salesforce@2032";
            break;
        case "PM1":
            password = "Salesforce@2032";
            break;
        case "SPA":
            password = "Salesforce@2032";
            break;
        default:
            password = "Salesforce@2032";
    }
    return password;
}

private String getAUTOEnvironmentPassword(String userLevel) {
    String password;
    switch (userLevel.toUpperCase()) {
        case "SME":
            password = "Salesforce2027";
            break;
        case "SPA":
            password = "Salesforce2029";
            break;
        case "FD":
            password = "Salesforce2029";
            break;
        case "SPI4":
            password = "Salesforce@2028";
            break;
        default:
            password = "Sales@2024";
    }
    return password;
}

private String getProLwcEnvironmentUser(String userLevel) {
    Map<String, String> username = new HashMap<>();
    username.put("ADMIN", "govgrantsautomation@yopmail.com.prolwcut");
    username.put("ADMIN1", "manu.admin@ggp.test8.prolwcut");
    username.put("EXE", "test@gmaildemo.com.prolwcut");
    username.put("PM", "donald_pm@ggp.test7.atm.prolwcut");
    username.put("FO", "auto.fm@auto.com.prolwcut");
    username.put("PO", "automationpo@yopmail.com.prolwcut");
    username.put("FD", "automationfd@yopmail.com.prolwcut");
    username.put("PM1", "pm1.automation@yopmail.com.prolwcut");
    username.put("EXE1", "exe1.automation@yopmail.com.prolwcut");
    username.put("PO1", "automationpo1@yopmail.com.prolwcut");
    username.put("FO1", "fo1.automation@yopmail.com.prolwcut");
    username.put("FD1", "automationfd1@yopmail.com.prolwcut");
    username.put("SPI3", "aspi3@grants.gov");
    username.put("SPA", "spaautomation12@yopmail.com");
    username.put("SA", "asa@grants.gov");
    username.put("IND", "ind12.automation@yopmail.com");
    username.put("AUDITOR", "automationauditor@yopmail.com.prolwcut");
    username.put("SME", "sme11@yopmail.com");
    username.put("SPI4", "spi4@yopmail.com.prolwcut");
    username.put("SARAH PM", "sarah.pm@ggp.test8.prolwcut");

    if (userLevel.toUpperCase() != null) {
        return username.get(userLevel.toUpperCase());
    } else {
        return username.get("ADMIN");
    }
}

private String getNYLwcEnvironmentUser(String userLevel) {
    Map<String, String> username = new HashMap<>();
    username.put("ADMIN", "govgrantsauto@yopmail.com.ggqa2");
    username.put("ADMIN1", "manu.admin@ggp.test8.ggqa2");
    username.put("EXE", "test@gmaildemo.com.ggqa2");
    username.put("PM", "donald_pm@ggp.test7.atm.ggqa2");
    username.put("FO", "auto.fm@auto.com.ggqa2");
    username.put("PO", "automationpo@yopmail.com.ggqa2");
    username.put("FD", "automationfd@yopmail.com.ggqa2");
    username.put("PM1", "pm1.automation@yopmail.com.ggqa2");
    username.put("EXE1", "exe1.automation@yopmail.com.ggqa2");
    username.put("PO1", "automationpo1@yopmail.com.ggqa2");
    username.put("FO1", "fo1.automation@yopmail.com.ggqa2");
    username.put("FD1", "automationfd1@yopmail.com.ggqa2");
    username.put("AUDITOR", "automationauditor@yopmail.com.ggqa2");
    username.put("SPI3", "automationspi31.ggdev2@yopmail.com.ggqa2");
    username.put("SPA", "spaautomation12@yopmail.com.ggqa2");
    username.put("SA", "asa@grants.gov.ggqa2");
    username.put("IND", "ind12.automation@yopmail.com.ggqa2");
    username.put("SME", "sme11@yopmail.com.ggqa2");
    username.put("SPI4", "spi4@yopmail.com.ggqa2");
    username.put("SARAH PM", "sarah.pm@ggp.test8.ggqa2");

    username.put("GRANTEE ADMIN", "product.qa@ggp.test8.ggqa2");
    username.put("GRANTEE ADMIN1", "qa.admin@ggp.test8.ggdev2");
    username.put("GRANTEE PM", "sarah.pm@ggp.test8.ggqa2");
    username.put("GRANTEE EXE", "victor.exe@ggp.test8.ggqa2");
    username.put("GRANTEE FO", "david.fo@ggp.test8.ggqa2");
    username.put("GRANTEE FD", "danielle.garcia@ggp.test8.ggdev2");
    username.put("GRANTEE PO", "grantee.po@yopmail.com.ggdev2");
    username.put("GRANTEE AUDITOR", "automationauditor@yopmail.com.ggdev2");

    if (userLevel.toUpperCase() != null) {
        return username.get(userLevel.toUpperCase());
    } else {
        return username.get("ADMIN");
    }
}

private String getWashingtonEnvironmentUser(String userLevel) {
    Map<String, String> username = new HashMap<>();
    username.put("ADMIN", "govgrantsauto@yopmail.com.ggdev2");
    username.put("ADMIN1", "manu.admin@ggp.test8.ggdev2");
    username.put("EXE", "test@gmaildemo.com.ggdev2");
    username.put("PM", "donald_pm@ggp.test7.atm.ggdev2");
    username.put("FO", "auto.fm@auto.com.ggdev2");
    username.put("PO", "automationpo@yopmail.com.ggdev2");
    username.put("FD", "automationfd@yopmail.com.ggdev2");
    username.put("PM1", "pm1.automation@yopmail.com.ggdev2");
    username.put("EXE1", "exe1.automation@yopmail.com.ggdev2");
    username.put("PO1", "automationpo1@yopmail.com.ggdev2");
    username.put("FO1", "fo1.automation@yopmail.com.ggdev2");
    username.put("FD1", "automationfd1@yopmail.com.ggdev2");
    username.put("SPI3", "automationspi31.ggdev2@yopmail.com");
    username.put("SPA", "spaautomation12@yopmail.com.ggdev2");
    username.put("SA", "asa@grants.gov.ggdev2");
    username.put("IND", "ind12.automation@yopmail.com.ggdev2");
    username.put("AUDITOR", "automationauditor@yopmail.com.ggdev2");
    username.put("SME", "sme11@yopmail.com.ggdev2");
    username.put("SPI4", "spi4@yopmail.com.ggdev2");
    username.put("SARAH PM", "sarah.pm@ggp.test8.ggdev2");

    username.put("GRANTEE ADMIN", "product.qa@ggp.test8.ggdev2");
    username.put("GRANTEE ADMIN1", "qa.admin@ggp.test8.ggdev2");
    username.put("GRANTEE PM", "sarah.pm@ggp.test8.ggdev2");
    username.put("GRANTEE EXE", "victor.exe@ggp.test8.ggdev2");
    username.put("GRANTEE FO", "david.fo@ggp.test8.ggdev2");
    username.put("GRANTEE FD", "danielle.garcia@ggp.test8.ggdev2");
    username.put("GRANTEE PO", "grantee.po@yopmail.com.ggdev2");
    username.put("GRANTEE AUDITOR", "automationauditor@yopmail.com.ggdev2");

    if (userLevel.toUpperCase() != null) {
        return username.get(userLevel.toUpperCase());
    } else {
        return username.get("ADMIN");
    }
}

private String getQAEnvironmentUser(String userLevel) {
    Map<String, String> username = new HashMap<>();
    username.put("ADMIN", "govgrantsautomation@yopmail.com.qaorg");
    username.put("ADMIN1", "admin1@yopmail.com.qaorg");
    username.put("EXE", "test@gmaildemo.com.qaorg");
    username.put("PM", "donald_pm@ggp.test7.atm.qaorg");
    username.put("FO", "david.fo@ggp.test8.qaorg");
    username.put("PO", "automationpo@yopmail.com.qaorg");
    username.put("FD", "danielle.garcia@ggp.test8.qaorg");
    username.put("PM1", "pm1.automation@yopmail.com.qaorg");
    username.put("EXE1", "exe1.automation@yopmail.com.qaorg");
    username.put("PO1", "automationpo1@yopmail.com.qaorg");
    username.put("FO1", "fo1.automation@yopmail.com.qaorg");
    username.put("FD1", "automationfd1@yopmail.com.qaorg");
    username.put("SPI3", "danieljacks@yopmail.com");
    username.put("SPA", "spa.automation@yopmail.com");
    username.put("SA", "automationspi2@yopmail.com");
    username.put("IND", "ind2029.automation@yopmail.com");
    username.put("AUDITOR", "amperoaud@yopmail.com.qaorg");
    username.put("SARAH PM", "sarah.pm@ggp.test8.qaorg");

    username.put("GRANTEE ADMIN", "product.qa@ggp.test8.qagrnteatm");
    username.put("GRANTEE ADMIN1", "qa.admin@ggp.test8.qagrnteatm");
    username.put("GRANTEE ADMIN2", "adminautotest@yopmail.com.qagrnteatm");
    username.put("GRANTEE PM", "sarah.pm@ggp.test8.qagrnteatm");
    username.put("GRANTEE PM1", "donald_pm@ggp.test7.atm.qagrnteatm");
    username.put("GRANTEE EXE", "victor.exe@ggp.test8.qagrnteatm");
    username.put("GRANTEE EXE1", "exe1.automation@yopmail.com.qagrnteatm");
    username.put("GRANTEE FO", "david.fo@ggp.test8.qagrnteatm");
    username.put("GRANTEE FO1", "fo1.automation@yopmail.com.qagrnteatm");
    username.put("GRANTEE FD", "danielle.garcia@ggp.test8.qagrnteatm");
    username.put("GRANTEE FD1", "automationfd1@yopmail.com.qagrnteatm");
    username.put("GRANTEE PO", "grantee.po@yopmail.com.qagrnteatm");
    username.put("GRANTEE PO1", "automationpo1@yopmail.com.qagrnteatm");
    username.put("GRANTEE AUDITOR", "automationauditor@yopmail.com.qagrnteatm");

    if (userLevel.toUpperCase() != null) {
        return username.get(userLevel.toUpperCase());
    } else {
        return username.get("ADMIN");
    }
}

private String getAUTOEnvironmentUser(String userLevel) {
    Map<String, String> username = new HashMap<>();
    username.put("ADMIN", "govgrantsautomation@yopmail.com");
    username.put("ADMIN1", "admin1@yopmail.com.automation");
    username.put("EXE", "test@gmaildemo.com.atm.automation");
    username.put("PM", "donald_pm@ggp.test7.atm.automation");
    username.put("FO", "auto.fm@auto.com.atm.automation");
    username.put("FD", "automationfd@yopmail.com");
    username.put("PO", "automationpo@yopmail.com");
    username.put("SPI", "automation.spi@yopmail.com.automation");
    username.put("SPA", "automation.spa@yopmail.com");
    username.put("IND", "ind.automation@yopmail.com");
    username.put("SA", "automationspi1@yopmail.com");  // need to check this user.
    username.put("SPI3", "automationspi30@yopmail.com");
    username.put("AUDITOR", "automationauditor@yopmail.com");
    username.put("PM1", "pm1.automation@yopmail.com");
    username.put("EXE1", "exe1.automation@yopmail.com");
    username.put("PO1", "automationpo1@yopmail.com");
    username.put("FO1", "fo1.automation@yopmail.com");
    username.put("FD1", "automationfd1@yopmail.com");
    username.put("SME", "sme1@yopmail.com");
    username.put("SPI4", "signingauthority.sa@yopmail.com.automation");
    username.put("SARAH PM", "sarah.pm@ggp.test9.automation");

    username.put("SIMON PM", "simon@ggp.test8.automation");
    username.put("ALEX FO", "alex_fo@ggp.test7.automation");
    username.put("CATHY PM", "cathy_pm@ggp.test7.automation");
    username.put("OSCAR PM", "oscar_pm@ggp.test7.automation");
    username.put("Bill PM", "bill_pm@ggp.test7.automation");

    username.put("GRANTEE PM", "autopmgrantee@yopmail.com");
    username.put("GRANTEE PM1", "autopm1grantee@yopmail.com");
    username.put("GRANTEE FO", "automationfograntee@yopmail.com");
    username.put("GRANTEE FD", "autofdgrantee@yopmail.com");
    username.put("GRANTEE EXE", "automationexegrantee@yopmail.com");
    username.put("GRANTEE ADMIN", "autoadmingrantee@yopmail.com");
    username.put("GRANTEE PO", "autopograntee@yopmail.com");

    if (userLevel.toUpperCase() != null) {
        return username.get(userLevel.toUpperCase());
    } else {
        return username.get("ADMIN");
    }
}

private String getTest8EnvironmentUser(String userLevel) {
    Map<String, String> username = new HashMap<>();
    username.put("ADMIN", "govgrantsautomation@yopmail.com");
    username.put("ADMIN1", "manu.admin@ggp.test8");
    username.put("EXE", "test@gmaildemo.com.atm");
    username.put("PM", "donald_pm@ggp.test7.atm");
    username.put("FO", "auto.fm@auto.com.atm");
    username.put("SPA", "automation.spa@yopmail.com");
    username.put("IND", "ind1.automation@yopmail.com");
    username.put("SA", "automationspi1@yopmail.com");
    username.put("SPI3", "automationspi30@yopmail.com");
    username.put("AUDITOR", "test8.automationauditor@yopmail.com");
    username.put("PO", "test8.automationpo@yopmail.com");
    username.put("FD", "test8.automationfd@yopmail.com");
    username.put("PM1", "test8.pm1.automation@yopmail.com");
    username.put("EXE1", "test8.exe1.automation@yopmail.com");
    username.put("FO1", "test8.fo1.automation@yopmail.com");
    username.put("PO1", "test8.automationpo1@yopmail.com");
    username.put("FD1", "test8.automationfd1@yopmail.com");
    username.put("SME", "sme1@yopmail.com");

    if (userLevel.toUpperCase() != null) {
        return username.get(userLevel.toUpperCase());
    } else {
        return username.get("ADMIN");
    }
}

/**
 * setup userLevel based on jvm property or default value or as passed from feature
 *
 * @param userType dynamicUser or EXE/PM
 * @return userLevel
 * @author nauman.shahid
 */
private String setUpUserLevel(String userType) {
    return userType.equalsIgnoreCase("dynamicUser") && System.getProperty("userType") != null ? System.getProperty("userType") : !userType.equalsIgnoreCase("dynamicUser") ? userType : "PM";
}

/**
 * @param userType e.g (INTERNAL,EXTERNAL)
 * @return Will return map<username,password> of corresponding type of user saved in mail.properties file.
 */
public Map<String, String> getUserCredentialsForMailNotification(String userType) {
    Map<String, String> credentials = new HashMap();
    String userAndPassword;
    String env = System.getProperty("env");
    if (env == null || "".equalsIgnoreCase(env)) {
        env = "QA";
    }
    try {
        userAndPassword = (new Properties_Logs()).ReadPropertyFile("mail.properties", env.toUpperCase() + userType.toUpperCase());
        credentials.put("username", userAndPassword.split(":")[0]);
        credentials.put("password", userAndPassword.split(":")[1]);
    } catch (IOException e) {
        e.printStackTrace();
        throw new RuntimeException("Property file mail.properties is not present");
    }
    return credentials;
}
}
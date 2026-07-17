package com.helperPackage.authentication;

import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.net.URLEncoder;

public final class SalesforceJWTLoginManager {

    private final WebDriver driver;


    public SalesforceJWTLoginManager(
            WebDriver driver) {

        if (driver == null) {

            throw new IllegalArgumentException(
                    "WebDriver cannot be null."
            );
        }


        this.driver =
                driver;
    }


    public void login(
            String userType) {

        System.out.println(
                "[JWT Login] Starting Salesforce JWT login..."
        );


        System.out.println(
                "[JWT Login] Requested user type: "
                        + userType
        );


        /*
         * STEP 1:
         * Resolve Cucumber user type to the
         * actual Salesforce username.
         */
        String username =
                SalesforceJWTUserResolver
                        .resolveUsername(
                                userType
                        );


        System.out.println(
                "[JWT Login] Resolved Salesforce username: "
                        + username
        );


        /*
         * STEP 2:
         * Create JWT for selected Salesforce user.
         */
        SalesforceJWTAuth jwtAuth =
                new SalesforceJWTAuth();


        SalesforceJWTAuthResponse authResponse = jwtAuth.authenticate(username);


        if (authResponse == null) {

            throw new IllegalStateException(
                    "Salesforce JWT authentication response is null "
                            + "for user type: "
                            + userType
            );
        }


        /*
         * STEP 3:
         * Create Salesforce frontdoor URL.
         */
        String frontdoorUrl =
                createFrontdoorUrl(
                        authResponse
                );


        System.out.println(
                "[JWT Login] JWT token obtained."
        );


        System.out.println(
                "[JWT Login] Navigating through Salesforce frontdoor..."
        );


        /*
         * IMPORTANT:
         *
         * Never print frontdoorUrl.
         *
         * It contains the Salesforce access token.
         */
        driver.get(
                frontdoorUrl
        );


        /*
         * STEP 4:
         * Wait until Salesforce Lightning session
         * is established.
         */
        waitForSalesforceSession();


        System.out.println(
                "[JWT Login] Salesforce browser session established."
        );


        System.out.println(
                "[JWT Login] Logged in user type: "
                        + userType
        );


        System.out.println(
                "[JWT Login] Logged in username: "
                        + username
        );


        System.out.println(
                "[JWT Login] Current URL: "
                        + sanitizeUrl(
                        driver.getCurrentUrl()
                )
        );
    }


    private String createFrontdoorUrl(
            SalesforceJWTAuthResponse response) {

        try {

            return response
                    .getInstanceUrl()

                    + "/secur/frontdoor.jsp"

                    + "?sid="

                    + URLEncoder.encode(
                    response.getAccessToken(),
                    "UTF-8"
            )

                    + "&retURL="

                    + URLEncoder.encode(
                    "/lightning/page/home",
                    "UTF-8"
            );


        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to create Salesforce frontdoor URL",
                    e
            );
        }
    }


    private void waitForSalesforceSession() {

        try {

            WebDriverWait wait =
                    new WebDriverWait(
                            driver,
                            60
                    );


            wait.until(
                    webDriver -> {

                        String currentUrl =
                                webDriver.getCurrentUrl();


                        String title =
                                webDriver.getTitle();


                        System.out.println(
                                "[JWT Login] Waiting. URL: "
                                        + sanitizeUrl(
                                        currentUrl
                                )
                        );


                        if (currentUrl != null
                                && currentUrl.contains(
                                "UnifiedPasskeyVerificationUi"
                        )) {

                            throw new IllegalStateException(
                                    "Salesforce redirected JWT browser "
                                            + "session to passkey verification."
                            );
                        }


                        if (title != null
                                && title.contains(
                                "Verify Your Identity"
                        )) {

                            throw new IllegalStateException(
                                    "Salesforce identity verification "
                                            + "page detected."
                            );
                        }


                        return currentUrl != null
                                && currentUrl.contains(
                                "/lightning/"
                        );
                    }
            );


        } catch (TimeoutException e) {

            throw new IllegalStateException(
                    "Salesforce JWT browser session "
                            + "was not established within 60 seconds.",
                    e
            );
        }
    }


    private String sanitizeUrl(
            String url) {

        if (url == null) {

            return "";
        }


        return url.replaceAll(
                "(?i)(sid=)[^&]+",
                "$1***"
        );
    }
}
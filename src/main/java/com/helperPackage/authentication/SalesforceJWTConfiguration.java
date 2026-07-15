package com.helperPackage.authentication;

public final class SalesforceJWTConfiguration {

    /*
     * Salesforce JWT authentication is enabled
     * directly from the framework.
     */
    private static final boolean JWT_ENABLED = true;

    /*
     * External Client App Consumer Key / Client ID.
     *
     * IMPORTANT:
     * Use Consumer Key.
     * Do NOT use Consumer Secret.
     */
    private static final String CLIENT_ID =
            "3MVG9nN49A55.GBH4brW2vRP9B1WnCZ0MMIwIJXm_b2c5JyiKYkT1nx4QGelRn6yHCJie8G0Q3k3j6heku92g";

    /*
     * PKCS#8 private key used for JWT signing.
     */
    private static final String PRIVATE_KEY_PATH =
            "config/salesforce-jwt-pkcs8.key";

    /*
     * Package Org is a Salesforce Sandbox.
     */
    private static final String LOGIN_URL =
            "https://test8-internal--ggmergeqa2.sandbox.my.salesforce.com";


    private SalesforceJWTConfiguration() {

        /*
         * Utility class.
         */
    }


    public static boolean isEnabled() {

        return JWT_ENABLED;
    }


    public static String getClientId() {

        return CLIENT_ID;
    }


    public static String getPrivateKeyPath() {

        return PRIVATE_KEY_PATH;
    }


    public static String getLoginUrl() {

        return LOGIN_URL;
    }


    public static void validate() {

        if (!JWT_ENABLED) {

            return;
        }

        requireValue(
                "Salesforce JWT Client ID",
                CLIENT_ID
        );

        requireValue(
                "Salesforce JWT Private Key Path",
                PRIVATE_KEY_PATH
        );

        requireValue(
                "Salesforce JWT Login URL",
                LOGIN_URL
        );

        System.out.println(
                "[JWT Configuration] Configuration validation successful."
        );
    }


    private static void requireValue(
            String name,
            String value) {

        if (value == null
                || value.trim().isEmpty()) {

            throw new IllegalStateException(
                    name + " is not configured."
            );
        }
    }
}
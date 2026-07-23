package com.helperPackage.authentication;

import java.util.Collections;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public final class SalesforceJWTUserResolver {

    private static final Map<String, String> JWT_USERS;


    static {

        Map<String, String> users =
                new HashMap<>();


        /*
         * IMPORTANT:
         *
         * Left side:
         * Cucumber user type.
         *
         * Right side:
         * Exact Salesforce Username.
         */


        users.put(
                "ADMIN",
                "govgrantsauto@yopmail.com.afsautoqa"
        );

        users.put(
                "ADMIN1",
                "manu.admin@ggp.test8.afsautoqa"
        );

        users.put(
                "EXE",
                "test@gmaildemo.com.afsautoqa"
        );

        users.put(
                "PM",
                "donald_pm@ggp.test7.atm.afsautoqa"
        );

        users.put(
                "dynamicUser",
                "donald_pm@ggp.test7.atm.afsautoqa"
        );

        users.put(
                "FO",
                "auto.fm@auto.com.afsautoqa"
        );

        users.put(
                "PO",
                "automationpo@yopmail.com.afsautoqa"
        );

        users.put(
                "FD",
                "automationfd@yopmail.com.afsautoqa"
        );

        users.put(
                "PM1",
                "pm1.automation@yopmail.com.afsautoqa"
        );

        users.put(
                "EXE1",
                "exe1.automation@yopmail.com.afsautoqa"
        );

        users.put(
                "PO1",
                "automationpo1@yopmail.com.afsautoqa"
        );

        users.put(
                "FO1",
                "fo1.automation@yopmail.com.afsautoqa"
        );

        users.put(
                "FD1",
                "automationfd1@yopmail.com.afsautoqa"
        );

        users.put(
                "SPI3",
                "aspi3@grants.gov.afsautoqa"
        );

        users.put(
                "SPA",
                "spaautomation12@yopmail.com.afsautoqa"
        );

        users.put(
                "SA",
                "asa@grants.gov.afsautoqa"
        );

        users.put(
                "IND",
                "ind12.automation@yopmail.com.afsautoqa"
        );

        users.put(
                "AUDITOR",
                "automationauditor@yopmail.com.afsautoqa"
        );

        users.put(
                "SME",
                "sme11@yopmail.com"
        );

        users.put(
                "SPI4",
                "spi4@yopmail.com.afsautoqa"
        );

        users.put(
                "SARAH PM",
                "sarah.pm@ggp.test8.afsautoqa"
        );

        /*
         * Add exact Alex Salesforce username.
         *
         * Confirm the exact Username field from:
         *
         * Setup
         *   -> Users
         *   -> Users
         *   -> Alex
         *   -> Username
         */

        users.put(
                "ADMIN",
                "govgrantsauto@yopmail.com.afsautoqa"
        );


        /*
         * Add remaining GovSBIR users.
         */

        /*
        users.put(
                "SPI",
                "ACTUAL_SPI_SALESFORCE_USERNAME"
        );

        users.put(
                "SPA",
                "ACTUAL_SPA_SALESFORCE_USERNAME"
        );

        users.put(
                "SME",
                "ACTUAL_SME_SALESFORCE_USERNAME"
        );
        */


        JWT_USERS =
                Collections.unmodifiableMap(
                        users
                );
    }


    private SalesforceJWTUserResolver() {

        /*
         * Utility class.
         */
    }


    public static String resolveUsername(
            String userType) {

        if (userType == null
                || userType.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Salesforce JWT user type cannot be null or empty."
            );
        }


        String normalizedUserType =
                userType
                        .trim()
                        .toUpperCase(
                                Locale.ENGLISH
                        );


        String username =
                JWT_USERS.get(
                        normalizedUserType
                );


        if (username == null
                || username.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "No Salesforce JWT username configured "
                            + "for user type: "
                            + userType
            );
        }


        System.out.println(
                "[JWT User Resolver] Requested user type: "
                        + userType
        );


        System.out.println(
                "[JWT User Resolver] Normalized user type: "
                        + normalizedUserType
        );


        System.out.println(
                "[JWT User Resolver] Salesforce username: "
                        + username
        );


        return username;
    }
}
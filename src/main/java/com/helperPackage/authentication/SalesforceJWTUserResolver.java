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
                "govgrantsauto@yopmail.com.ggmergeqa2"
        );

        users.put(
                "ADMIN1",
                "manu.admin@ggp.test8.ggmergeqa2"
        );

        users.put(
                "EXE",
                "exe.automation.ggmergeqa2@yopmail.com"
        );

        users.put(
                "PM",
                "pm.automation.merge@yopmail.com"
        );

        users.put(
                "dynamicUser",
                "pm.automation.merge@yopmail.com"
        );

        users.put(
                "FO",
                "fo.automation.ggmergeqa2@yopmail.com"
        );

        users.put(
                "PO",
                "automationpo@yopmail.com.ggmergeqa2"
        );

        users.put(
                "FD",
                "automationfd.ggmergeqa2@yopmail.com"
        );

        users.put(
                "PM1",
                "pm1.automation@yopmail.com.ggmergeqa2"
        );

        users.put(
                "EXE1",
                "exe1.automation@yopmail.com.ggmergeqa2"
        );

        users.put(
                "PO1",
                "automationpo1@yopmail.com.ggmergeqa2"
        );

        users.put(
                "FO1",
                "fo1.automation@yopmail.com.ggmergeqa2"
        );

        users.put(
                "FD1",
                "automationfd1@yopmail.com.ggmergeqa2"
        );

        users.put(
                "AUDITOR",
                "automationauditor@yopmail.com.ggmergeqa2"
        );

        users.put(
                "SPI3",
                "automationspi31.ggdev2@yopmail.com.ggmergeqa2"
        );

        users.put(
                "SPA",
                "spaautomation12@yopmail.com.ggmergeqa2"
        );

        users.put(
                "SA",
                "asa@grants.gov.ggmergeqa2"
        );

        users.put(
                "IND",
                "ind12.automation@yopmail.com.ggmergeqa2"
        );

        users.put(
                "SME",
                "sme11@yopmail.com.ggmergeqa2"
        );

        users.put(
                "SPI4",
                "spi4@yopmail.com.ggmergeqa2"
        );

        users.put(
                "SARAH PM",
                "sarah.pm@ggp.test8.ggmergeqa2"
        );

        users.put(
                "GRANTEE ADMIN",
                "demo.admin@ggp.test8.ggmergeqa2"
        );

        users.put(
                "GRANTEE ADMIN1",
                "qa.admin.testing@ggp.test8.ggmergeqa2"
        );

        users.put(
                "GRANTEE ADMIN2",
                "govgrantsauto@yopmail.com.ggmergeqa2"
        );

        users.put(
                "GRANTEE PM",
                "sarah.pm@ggp.test8.ggmergeqa2"
        );

        users.put(
                "GRANTEE EXE",
                "victor.exe@ggp.test8.ggmergeqa2"
        );

        users.put(
                "GRANTEE EXE1",
                "exe1.automation@yopmail.com.ggmergeqa2"
        );

        users.put(
                "GRANTEE FO",
                "david.fo@ggp.test8.ggmergeqa2"
        );

        users.put(
                "GRANTEE FD",
                "danielle.garcia@ggp.test8.ggmergeqa2"
        );

        users.put(
                "GRANTEE PO",
                "grantee.po@yopmail.com.ggmergeqa2"
        );

        users.put(
                "GRANTEE AUDITOR",
                "alex.auditor@yopmail.com.ggmergeqa2"
        );


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
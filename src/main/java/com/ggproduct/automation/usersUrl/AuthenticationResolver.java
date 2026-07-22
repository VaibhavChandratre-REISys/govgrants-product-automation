package com.ggproduct.automation.usersUrl;

public class AuthenticationResolver {
    public static AuthenticationType resolve(String userType) {
        switch (userType.trim().toUpperCase()) {
            case "ADMIN":
            case "PM":
            case "PO":
            case "FO":
            case "FD":
            case "EXE":
            case "ADMIN1":
            case "PM1":
            case "EXE1":
            case "PO1":
            case "FO1":
            case "FD1":
            case "GRANTEE ADMIN":
            case "GRANTEE ADMIN1":
            case "GRANTEE ADMIN2":
            case "GRANTEE PM":
            case "GRANTEE EXE":
            case "GRANTEE EXE1":
            case "GRANTEE FO":
            case "GRANTEE FD":
            case "GRANTEE PO":
            case "GRANTEE AUDITOR":
                return AuthenticationType.JWT;
            case "SPI3":
            case "SPI4":
            case "IND":
            case "SME":
            case "SPA":
                return AuthenticationType.UI;
            default:
                return AuthenticationType.UI;
        }
    }
}

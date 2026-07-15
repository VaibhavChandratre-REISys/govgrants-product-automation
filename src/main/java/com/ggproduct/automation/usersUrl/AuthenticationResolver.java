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
                return AuthenticationType.JWT;
            case "SPI":
            case "SPA":
                return AuthenticationType.UI;
            default:
                return AuthenticationType.UI;
        }
    }
}

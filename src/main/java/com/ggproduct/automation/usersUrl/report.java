package com.ggproduct.automation.usersUrl;

import com.helperPackage.enums.GenerateReportAnalytics;
import com.helperPackage.register.EnvironmentFactory;
import com.helperPackage.report.RunReportAnalyzer;

public class report {
    public static void main(String[] args) {
        EnvironmentFactory.setEnvironmentName("QA1");
        EnvironmentFactory.setExecutionDate("08/15/2022");
        RunReportAnalyzer.performAnalysis(GenerateReportAnalytics.onLocal);
    }
}

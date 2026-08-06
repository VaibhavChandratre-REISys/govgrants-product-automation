@GovGrantsSanityPreRequisiteCheck
Feature: Validate Pre-requisiste check for Sanity/Regression

  @TestBulkApp
  Scenario: Test Ann
    And I create announcement records with status "Published" using "default" properties
      | AnnouncementName                                      | ProgramName                                            | AnnType     | AllocationLevel |
      | Automation Permanent Announcement for Bulk Award_Comp | Automation Permanent Internal Program for Bulk Records | Competitive | N/A             |

  @ApprovedFDMBulkRecordCreation_SPI_1500_Ann
  Scenario: Bulk Award -> Competitive Type Announcement -> Automation SPI3 User -- Ann Creation
    And I create announcement records with status "Published" using "default" properties for bulk records
      | AnnouncementName                                      | ProgramName                                            | AnnType     | AllocationLevel |
      | Automation Permanent Announcement for Bulk Award_Comp | Automation Permanent Internal Program for Bulk Records | Competitive | N/A             |

  @BulkApplication @ApprovedFDMBulkRecordCreation_SPI_1500
  Scenario Outline: Bulk Award -> Competitive Type Announcement -> Automation SPI3 User -- Application/FDM Records Creation
    And I create application records with status "Submitted to Grantor" using "default" properties for bulk records
      | Title            | AnnouncementName   | PreAppTitle |
      | Bulk SPI App_1   | <AnnouncementName> |             |
      | Bulk SPI App_2   | <AnnouncementName> |             |
      | Bulk SPI App_3   | <AnnouncementName> |             |
      | Bulk SPI App_4   | <AnnouncementName> |             |
      | Bulk SPI App_5   | <AnnouncementName> |             |
      | Bulk SPI App_6   | <AnnouncementName> |             |
      | Bulk SPI App_7   | <AnnouncementName> |             |
      | Bulk SPI App_8   | <AnnouncementName> |             |
      | Bulk SPI App_9   | <AnnouncementName> |             |
      | Bulk SPI App_10  | <AnnouncementName> |             |
      | Bulk SPI App_11  | <AnnouncementName> |             |
      | Bulk SPI App_12  | <AnnouncementName> |             |
      | Bulk SPI App_13  | <AnnouncementName> |             |
      | Bulk SPI App_14  | <AnnouncementName> |             |
      | Bulk SPI App_15  | <AnnouncementName> |             |
      | Bulk SPI App_16  | <AnnouncementName> |             |
      | Bulk SPI App_17  | <AnnouncementName> |             |
      | Bulk SPI App_18  | <AnnouncementName> |             |
      | Bulk SPI App_19  | <AnnouncementName> |             |
      | Bulk SPI App_20  | <AnnouncementName> |             |
      | Bulk SPI App_21  | <AnnouncementName> |             |
      | Bulk SPI App_22  | <AnnouncementName> |             |
      | Bulk SPI App_23  | <AnnouncementName> |             |
      | Bulk SPI App_24  | <AnnouncementName> |             |
      | Bulk SPI App_25  | <AnnouncementName> |             |
      | Bulk SPI App_26  | <AnnouncementName> |             |
      | Bulk SPI App_27  | <AnnouncementName> |             |
      | Bulk SPI App_28  | <AnnouncementName> |             |
      | Bulk SPI App_29  | <AnnouncementName> |             |
      | Bulk SPI App_30  | <AnnouncementName> |             |
      | Bulk SPI App_31  | <AnnouncementName> |             |
      | Bulk SPI App_32  | <AnnouncementName> |             |
      | Bulk SPI App_33  | <AnnouncementName> |             |
      | Bulk SPI App_34  | <AnnouncementName> |             |
      | Bulk SPI App_35  | <AnnouncementName> |             |
      | Bulk SPI App_36  | <AnnouncementName> |             |
      | Bulk SPI App_37  | <AnnouncementName> |             |
      | Bulk SPI App_38  | <AnnouncementName> |             |
      | Bulk SPI App_39  | <AnnouncementName> |             |
      | Bulk SPI App_40  | <AnnouncementName> |             |
      | Bulk SPI App_41  | <AnnouncementName> |             |
      | Bulk SPI App_42  | <AnnouncementName> |             |
      | Bulk SPI App_43  | <AnnouncementName> |             |
      | Bulk SPI App_44  | <AnnouncementName> |             |
      | Bulk SPI App_45  | <AnnouncementName> |             |
      | Bulk SPI App_46  | <AnnouncementName> |             |
      | Bulk SPI App_47  | <AnnouncementName> |             |
      | Bulk SPI App_48  | <AnnouncementName> |             |
      | Bulk SPI App_49  | <AnnouncementName> |             |
      | Bulk SPI App_50  | <AnnouncementName> |             |
      | Bulk SPI App_51  | <AnnouncementName> |             |
      | Bulk SPI App_52  | <AnnouncementName> |             |
      | Bulk SPI App_53  | <AnnouncementName> |             |
      | Bulk SPI App_54  | <AnnouncementName> |             |
      | Bulk SPI App_55  | <AnnouncementName> |             |
      | Bulk SPI App_56  | <AnnouncementName> |             |
      | Bulk SPI App_57  | <AnnouncementName> |             |
      | Bulk SPI App_58  | <AnnouncementName> |             |
      | Bulk SPI App_59  | <AnnouncementName> |             |
      | Bulk SPI App_60  | <AnnouncementName> |             |
      | Bulk SPI App_61  | <AnnouncementName> |             |
      | Bulk SPI App_62  | <AnnouncementName> |             |
      | Bulk SPI App_63  | <AnnouncementName> |             |
      | Bulk SPI App_64  | <AnnouncementName> |             |
      | Bulk SPI App_65  | <AnnouncementName> |             |
      | Bulk SPI App_66  | <AnnouncementName> |             |
      | Bulk SPI App_67  | <AnnouncementName> |             |
      | Bulk SPI App_68  | <AnnouncementName> |             |
      | Bulk SPI App_69  | <AnnouncementName> |             |
      | Bulk SPI App_70  | <AnnouncementName> |             |
      | Bulk SPI App_71  | <AnnouncementName> |             |
      | Bulk SPI App_72  | <AnnouncementName> |             |
      | Bulk SPI App_73  | <AnnouncementName> |             |
      | Bulk SPI App_74  | <AnnouncementName> |             |
      | Bulk SPI App_75  | <AnnouncementName> |             |
      | Bulk SPI App_76  | <AnnouncementName> |             |
      | Bulk SPI App_77  | <AnnouncementName> |             |
      | Bulk SPI App_78  | <AnnouncementName> |             |
      | Bulk SPI App_79  | <AnnouncementName> |             |
      | Bulk SPI App_80  | <AnnouncementName> |             |
      | Bulk SPI App_81  | <AnnouncementName> |             |
      | Bulk SPI App_82  | <AnnouncementName> |             |
      | Bulk SPI App_83  | <AnnouncementName> |             |
      | Bulk SPI App_84  | <AnnouncementName> |             |
      | Bulk SPI App_85  | <AnnouncementName> |             |
      | Bulk SPI App_86  | <AnnouncementName> |             |
      | Bulk SPI App_87  | <AnnouncementName> |             |
      | Bulk SPI App_88  | <AnnouncementName> |             |
      | Bulk SPI App_89  | <AnnouncementName> |             |
      | Bulk SPI App_90  | <AnnouncementName> |             |
      | Bulk SPI App_91  | <AnnouncementName> |             |
      | Bulk SPI App_92  | <AnnouncementName> |             |
      | Bulk SPI App_93  | <AnnouncementName> |             |
      | Bulk SPI App_94  | <AnnouncementName> |             |
      | Bulk SPI App_95  | <AnnouncementName> |             |
      | Bulk SPI App_96  | <AnnouncementName> |             |
      | Bulk SPI App_97  | <AnnouncementName> |             |
      | Bulk SPI App_98  | <AnnouncementName> |             |
      | Bulk SPI App_99  | <AnnouncementName> |             |
      | Bulk SPI App_100 | <AnnouncementName> |             |

    And I Initiated application review for multiple records on announcement
      | AnnouncementName   |
      | <AnnouncementName> |
    And I initiate pre-screen review for announcements with properties "default"
      | AnnouncementName   | ReviewerName             |
      | <AnnouncementName> | {SavedValue:FO Username} |

    And I submit review for announcements with properties "default" for bulk records
      | ReviewName        | AnnouncementName   | ApplicationName  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_1   |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_2   |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_3   |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_4   |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_5   |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_6   |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_7   |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_8   |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_9   |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_10  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_11  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_12  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_13  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_14  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_15  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_16  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_17  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_18  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_19  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_20  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_21  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_22  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_23  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_24  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_25  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_26  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_27  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_28  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_29  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_30  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_31  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_32  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_33  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_34  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_35  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_36  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_37  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_38  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_39  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_40  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_41  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_42  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_43  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_44  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_45  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_46  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_47  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_48  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_49  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_50  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_51  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_52  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_53  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_54  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_55  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_56  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_57  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_58  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_59  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_60  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_61  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_62  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_63  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_64  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_65  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_66  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_67  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_68  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_69  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_70  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_71  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_72  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_73  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_74  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_75  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_76  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_77  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_78  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_79  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_80  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_81  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_82  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_83  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_84  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_85  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_86  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_87  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_88  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_89  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_90  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_91  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_92  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_93  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_94  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_95  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_96  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_97  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_98  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_99  |
      | Pre-Screen Review | <AnnouncementName> | Bulk SPI App_100 |

    And I initiate SME review for announcements with properties "default"
      | AnnouncementName   | ReviewerName             | ReviewerName2             | ReviewerName3            |
      | <AnnouncementName> | {SavedValue:FO Username} | {SavedValue:EXE Username} | {SavedValue:PM Username} |

    And I submit review for announcements with properties "default" for bulk records
      | ReviewName | AnnouncementName   | ApplicationName  |
      | SME Review | <AnnouncementName> | Bulk SPI App_1   |
      | SME Review | <AnnouncementName> | Bulk SPI App_2   |
      | SME Review | <AnnouncementName> | Bulk SPI App_3   |
      | SME Review | <AnnouncementName> | Bulk SPI App_4   |
      | SME Review | <AnnouncementName> | Bulk SPI App_5   |
      | SME Review | <AnnouncementName> | Bulk SPI App_6   |
      | SME Review | <AnnouncementName> | Bulk SPI App_7   |
      | SME Review | <AnnouncementName> | Bulk SPI App_8   |
      | SME Review | <AnnouncementName> | Bulk SPI App_9   |
      | SME Review | <AnnouncementName> | Bulk SPI App_10  |
      | SME Review | <AnnouncementName> | Bulk SPI App_11  |
      | SME Review | <AnnouncementName> | Bulk SPI App_12  |
      | SME Review | <AnnouncementName> | Bulk SPI App_13  |
      | SME Review | <AnnouncementName> | Bulk SPI App_14  |
      | SME Review | <AnnouncementName> | Bulk SPI App_15  |
      | SME Review | <AnnouncementName> | Bulk SPI App_16  |
      | SME Review | <AnnouncementName> | Bulk SPI App_17  |
      | SME Review | <AnnouncementName> | Bulk SPI App_18  |
      | SME Review | <AnnouncementName> | Bulk SPI App_19  |
      | SME Review | <AnnouncementName> | Bulk SPI App_20  |
      | SME Review | <AnnouncementName> | Bulk SPI App_21  |
      | SME Review | <AnnouncementName> | Bulk SPI App_22  |
      | SME Review | <AnnouncementName> | Bulk SPI App_23  |
      | SME Review | <AnnouncementName> | Bulk SPI App_24  |
      | SME Review | <AnnouncementName> | Bulk SPI App_25  |
      | SME Review | <AnnouncementName> | Bulk SPI App_26  |
      | SME Review | <AnnouncementName> | Bulk SPI App_27  |
      | SME Review | <AnnouncementName> | Bulk SPI App_28  |
      | SME Review | <AnnouncementName> | Bulk SPI App_29  |
      | SME Review | <AnnouncementName> | Bulk SPI App_30  |
      | SME Review | <AnnouncementName> | Bulk SPI App_31  |
      | SME Review | <AnnouncementName> | Bulk SPI App_32  |
      | SME Review | <AnnouncementName> | Bulk SPI App_33  |
      | SME Review | <AnnouncementName> | Bulk SPI App_34  |
      | SME Review | <AnnouncementName> | Bulk SPI App_35  |
      | SME Review | <AnnouncementName> | Bulk SPI App_36  |
      | SME Review | <AnnouncementName> | Bulk SPI App_37  |
      | SME Review | <AnnouncementName> | Bulk SPI App_38  |
      | SME Review | <AnnouncementName> | Bulk SPI App_39  |
      | SME Review | <AnnouncementName> | Bulk SPI App_40  |
      | SME Review | <AnnouncementName> | Bulk SPI App_41  |
      | SME Review | <AnnouncementName> | Bulk SPI App_42  |
      | SME Review | <AnnouncementName> | Bulk SPI App_43  |
      | SME Review | <AnnouncementName> | Bulk SPI App_44  |
      | SME Review | <AnnouncementName> | Bulk SPI App_45  |
      | SME Review | <AnnouncementName> | Bulk SPI App_46  |
      | SME Review | <AnnouncementName> | Bulk SPI App_47  |
      | SME Review | <AnnouncementName> | Bulk SPI App_48  |
      | SME Review | <AnnouncementName> | Bulk SPI App_49  |
      | SME Review | <AnnouncementName> | Bulk SPI App_50  |
      | SME Review | <AnnouncementName> | Bulk SPI App_51  |
      | SME Review | <AnnouncementName> | Bulk SPI App_52  |
      | SME Review | <AnnouncementName> | Bulk SPI App_53  |
      | SME Review | <AnnouncementName> | Bulk SPI App_54  |
      | SME Review | <AnnouncementName> | Bulk SPI App_55  |
      | SME Review | <AnnouncementName> | Bulk SPI App_56  |
      | SME Review | <AnnouncementName> | Bulk SPI App_57  |
      | SME Review | <AnnouncementName> | Bulk SPI App_58  |
      | SME Review | <AnnouncementName> | Bulk SPI App_59  |
      | SME Review | <AnnouncementName> | Bulk SPI App_60  |
      | SME Review | <AnnouncementName> | Bulk SPI App_61  |
      | SME Review | <AnnouncementName> | Bulk SPI App_62  |
      | SME Review | <AnnouncementName> | Bulk SPI App_63  |
      | SME Review | <AnnouncementName> | Bulk SPI App_64  |
      | SME Review | <AnnouncementName> | Bulk SPI App_65  |
      | SME Review | <AnnouncementName> | Bulk SPI App_66  |
      | SME Review | <AnnouncementName> | Bulk SPI App_67  |
      | SME Review | <AnnouncementName> | Bulk SPI App_68  |
      | SME Review | <AnnouncementName> | Bulk SPI App_69  |
      | SME Review | <AnnouncementName> | Bulk SPI App_70  |
      | SME Review | <AnnouncementName> | Bulk SPI App_71  |
      | SME Review | <AnnouncementName> | Bulk SPI App_72  |
      | SME Review | <AnnouncementName> | Bulk SPI App_73  |
      | SME Review | <AnnouncementName> | Bulk SPI App_74  |
      | SME Review | <AnnouncementName> | Bulk SPI App_75  |
      | SME Review | <AnnouncementName> | Bulk SPI App_76  |
      | SME Review | <AnnouncementName> | Bulk SPI App_77  |
      | SME Review | <AnnouncementName> | Bulk SPI App_78  |
      | SME Review | <AnnouncementName> | Bulk SPI App_79  |
      | SME Review | <AnnouncementName> | Bulk SPI App_80  |
      | SME Review | <AnnouncementName> | Bulk SPI App_81  |
      | SME Review | <AnnouncementName> | Bulk SPI App_82  |
      | SME Review | <AnnouncementName> | Bulk SPI App_83  |
      | SME Review | <AnnouncementName> | Bulk SPI App_84  |
      | SME Review | <AnnouncementName> | Bulk SPI App_85  |
      | SME Review | <AnnouncementName> | Bulk SPI App_86  |
      | SME Review | <AnnouncementName> | Bulk SPI App_87  |
      | SME Review | <AnnouncementName> | Bulk SPI App_88  |
      | SME Review | <AnnouncementName> | Bulk SPI App_89  |
      | SME Review | <AnnouncementName> | Bulk SPI App_90  |
      | SME Review | <AnnouncementName> | Bulk SPI App_91  |
      | SME Review | <AnnouncementName> | Bulk SPI App_92  |
      | SME Review | <AnnouncementName> | Bulk SPI App_93  |
      | SME Review | <AnnouncementName> | Bulk SPI App_94  |
      | SME Review | <AnnouncementName> | Bulk SPI App_95  |
      | SME Review | <AnnouncementName> | Bulk SPI App_96  |
      | SME Review | <AnnouncementName> | Bulk SPI App_97  |
      | SME Review | <AnnouncementName> | Bulk SPI App_98  |
      | SME Review | <AnnouncementName> | Bulk SPI App_99  |
      | SME Review | <AnnouncementName> | Bulk SPI App_100 |

    And I initiate management review for announcements with properties "default"
      | AnnouncementName   | ReviewerName             |
      | <AnnouncementName> | {SavedValue:FO Username} |
    And I submit review for announcements with properties "default" for bulk records
      | ReviewName        | AnnouncementName   | ApplicationName  |
      | Management Review | <AnnouncementName> | Bulk SPI App_1   |
      | Management Review | <AnnouncementName> | Bulk SPI App_2   |
      | Management Review | <AnnouncementName> | Bulk SPI App_3   |
      | Management Review | <AnnouncementName> | Bulk SPI App_4   |
      | Management Review | <AnnouncementName> | Bulk SPI App_5   |
      | Management Review | <AnnouncementName> | Bulk SPI App_6   |
      | Management Review | <AnnouncementName> | Bulk SPI App_7   |
      | Management Review | <AnnouncementName> | Bulk SPI App_8   |
      | Management Review | <AnnouncementName> | Bulk SPI App_9   |
      | Management Review | <AnnouncementName> | Bulk SPI App_10  |
      | Management Review | <AnnouncementName> | Bulk SPI App_11  |
      | Management Review | <AnnouncementName> | Bulk SPI App_12  |
      | Management Review | <AnnouncementName> | Bulk SPI App_13  |
      | Management Review | <AnnouncementName> | Bulk SPI App_14  |
      | Management Review | <AnnouncementName> | Bulk SPI App_15  |
      | Management Review | <AnnouncementName> | Bulk SPI App_16  |
      | Management Review | <AnnouncementName> | Bulk SPI App_17  |
      | Management Review | <AnnouncementName> | Bulk SPI App_18  |
      | Management Review | <AnnouncementName> | Bulk SPI App_19  |
      | Management Review | <AnnouncementName> | Bulk SPI App_20  |
      | Management Review | <AnnouncementName> | Bulk SPI App_21  |
      | Management Review | <AnnouncementName> | Bulk SPI App_22  |
      | Management Review | <AnnouncementName> | Bulk SPI App_23  |
      | Management Review | <AnnouncementName> | Bulk SPI App_24  |
      | Management Review | <AnnouncementName> | Bulk SPI App_25  |
      | Management Review | <AnnouncementName> | Bulk SPI App_26  |
      | Management Review | <AnnouncementName> | Bulk SPI App_27  |
      | Management Review | <AnnouncementName> | Bulk SPI App_28  |
      | Management Review | <AnnouncementName> | Bulk SPI App_29  |
      | Management Review | <AnnouncementName> | Bulk SPI App_30  |
      | Management Review | <AnnouncementName> | Bulk SPI App_31  |
      | Management Review | <AnnouncementName> | Bulk SPI App_32  |
      | Management Review | <AnnouncementName> | Bulk SPI App_33  |
      | Management Review | <AnnouncementName> | Bulk SPI App_34  |
      | Management Review | <AnnouncementName> | Bulk SPI App_35  |
      | Management Review | <AnnouncementName> | Bulk SPI App_36  |
      | Management Review | <AnnouncementName> | Bulk SPI App_37  |
      | Management Review | <AnnouncementName> | Bulk SPI App_38  |
      | Management Review | <AnnouncementName> | Bulk SPI App_39  |
      | Management Review | <AnnouncementName> | Bulk SPI App_40  |
      | Management Review | <AnnouncementName> | Bulk SPI App_41  |
      | Management Review | <AnnouncementName> | Bulk SPI App_42  |
      | Management Review | <AnnouncementName> | Bulk SPI App_43  |
      | Management Review | <AnnouncementName> | Bulk SPI App_44  |
      | Management Review | <AnnouncementName> | Bulk SPI App_45  |
      | Management Review | <AnnouncementName> | Bulk SPI App_46  |
      | Management Review | <AnnouncementName> | Bulk SPI App_47  |
      | Management Review | <AnnouncementName> | Bulk SPI App_48  |
      | Management Review | <AnnouncementName> | Bulk SPI App_49  |
      | Management Review | <AnnouncementName> | Bulk SPI App_50  |
      | Management Review | <AnnouncementName> | Bulk SPI App_51  |
      | Management Review | <AnnouncementName> | Bulk SPI App_52  |
      | Management Review | <AnnouncementName> | Bulk SPI App_53  |
      | Management Review | <AnnouncementName> | Bulk SPI App_54  |
      | Management Review | <AnnouncementName> | Bulk SPI App_55  |
      | Management Review | <AnnouncementName> | Bulk SPI App_56  |
      | Management Review | <AnnouncementName> | Bulk SPI App_57  |
      | Management Review | <AnnouncementName> | Bulk SPI App_58  |
      | Management Review | <AnnouncementName> | Bulk SPI App_59  |
      | Management Review | <AnnouncementName> | Bulk SPI App_60  |
      | Management Review | <AnnouncementName> | Bulk SPI App_61  |
      | Management Review | <AnnouncementName> | Bulk SPI App_62  |
      | Management Review | <AnnouncementName> | Bulk SPI App_63  |
      | Management Review | <AnnouncementName> | Bulk SPI App_64  |
      | Management Review | <AnnouncementName> | Bulk SPI App_65  |
      | Management Review | <AnnouncementName> | Bulk SPI App_66  |
      | Management Review | <AnnouncementName> | Bulk SPI App_67  |
      | Management Review | <AnnouncementName> | Bulk SPI App_68  |
      | Management Review | <AnnouncementName> | Bulk SPI App_69  |
      | Management Review | <AnnouncementName> | Bulk SPI App_70  |
      | Management Review | <AnnouncementName> | Bulk SPI App_71  |
      | Management Review | <AnnouncementName> | Bulk SPI App_72  |
      | Management Review | <AnnouncementName> | Bulk SPI App_73  |
      | Management Review | <AnnouncementName> | Bulk SPI App_74  |
      | Management Review | <AnnouncementName> | Bulk SPI App_75  |
      | Management Review | <AnnouncementName> | Bulk SPI App_76  |
      | Management Review | <AnnouncementName> | Bulk SPI App_77  |
      | Management Review | <AnnouncementName> | Bulk SPI App_78  |
      | Management Review | <AnnouncementName> | Bulk SPI App_79  |
      | Management Review | <AnnouncementName> | Bulk SPI App_80  |
      | Management Review | <AnnouncementName> | Bulk SPI App_81  |
      | Management Review | <AnnouncementName> | Bulk SPI App_82  |
      | Management Review | <AnnouncementName> | Bulk SPI App_83  |
      | Management Review | <AnnouncementName> | Bulk SPI App_84  |
      | Management Review | <AnnouncementName> | Bulk SPI App_85  |
      | Management Review | <AnnouncementName> | Bulk SPI App_86  |
      | Management Review | <AnnouncementName> | Bulk SPI App_87  |
      | Management Review | <AnnouncementName> | Bulk SPI App_88  |
      | Management Review | <AnnouncementName> | Bulk SPI App_89  |
      | Management Review | <AnnouncementName> | Bulk SPI App_90  |
      | Management Review | <AnnouncementName> | Bulk SPI App_91  |
      | Management Review | <AnnouncementName> | Bulk SPI App_92  |
      | Management Review | <AnnouncementName> | Bulk SPI App_93  |
      | Management Review | <AnnouncementName> | Bulk SPI App_94  |
      | Management Review | <AnnouncementName> | Bulk SPI App_95  |
      | Management Review | <AnnouncementName> | Bulk SPI App_96  |
      | Management Review | <AnnouncementName> | Bulk SPI App_97  |
      | Management Review | <AnnouncementName> | Bulk SPI App_98  |
      | Management Review | <AnnouncementName> | Bulk SPI App_99  |
      | Management Review | <AnnouncementName> | Bulk SPI App_100 |

    And I create FDM records with status "Created" using "default" properties for bulk records
      | AnnouncementName   | ApplicationName  |
      | <AnnouncementName> | Bulk SPI App_1   |
      | <AnnouncementName> | Bulk SPI App_2   |
      | <AnnouncementName> | Bulk SPI App_3   |
      | <AnnouncementName> | Bulk SPI App_4   |
      | <AnnouncementName> | Bulk SPI App_5   |
      | <AnnouncementName> | Bulk SPI App_6   |
      | <AnnouncementName> | Bulk SPI App_7   |
      | <AnnouncementName> | Bulk SPI App_8   |
      | <AnnouncementName> | Bulk SPI App_9   |
      | <AnnouncementName> | Bulk SPI App_10  |
      | <AnnouncementName> | Bulk SPI App_11  |
      | <AnnouncementName> | Bulk SPI App_12  |
      | <AnnouncementName> | Bulk SPI App_13  |
      | <AnnouncementName> | Bulk SPI App_14  |
      | <AnnouncementName> | Bulk SPI App_15  |
      | <AnnouncementName> | Bulk SPI App_16  |
      | <AnnouncementName> | Bulk SPI App_17  |
      | <AnnouncementName> | Bulk SPI App_18  |
      | <AnnouncementName> | Bulk SPI App_19  |
      | <AnnouncementName> | Bulk SPI App_20  |
      | <AnnouncementName> | Bulk SPI App_21  |
      | <AnnouncementName> | Bulk SPI App_22  |
      | <AnnouncementName> | Bulk SPI App_23  |
      | <AnnouncementName> | Bulk SPI App_24  |
      | <AnnouncementName> | Bulk SPI App_25  |
      | <AnnouncementName> | Bulk SPI App_26  |
      | <AnnouncementName> | Bulk SPI App_27  |
      | <AnnouncementName> | Bulk SPI App_28  |
      | <AnnouncementName> | Bulk SPI App_29  |
      | <AnnouncementName> | Bulk SPI App_30  |
      | <AnnouncementName> | Bulk SPI App_31  |
      | <AnnouncementName> | Bulk SPI App_32  |
      | <AnnouncementName> | Bulk SPI App_33  |
      | <AnnouncementName> | Bulk SPI App_34  |
      | <AnnouncementName> | Bulk SPI App_35  |
      | <AnnouncementName> | Bulk SPI App_36  |
      | <AnnouncementName> | Bulk SPI App_37  |
      | <AnnouncementName> | Bulk SPI App_38  |
      | <AnnouncementName> | Bulk SPI App_39  |
      | <AnnouncementName> | Bulk SPI App_40  |
      | <AnnouncementName> | Bulk SPI App_41  |
      | <AnnouncementName> | Bulk SPI App_42  |
      | <AnnouncementName> | Bulk SPI App_43  |
      | <AnnouncementName> | Bulk SPI App_44  |
      | <AnnouncementName> | Bulk SPI App_45  |
      | <AnnouncementName> | Bulk SPI App_46  |
      | <AnnouncementName> | Bulk SPI App_47  |
      | <AnnouncementName> | Bulk SPI App_48  |
      | <AnnouncementName> | Bulk SPI App_49  |
      | <AnnouncementName> | Bulk SPI App_50  |
      | <AnnouncementName> | Bulk SPI App_51  |
      | <AnnouncementName> | Bulk SPI App_52  |
      | <AnnouncementName> | Bulk SPI App_53  |
      | <AnnouncementName> | Bulk SPI App_54  |
      | <AnnouncementName> | Bulk SPI App_55  |
      | <AnnouncementName> | Bulk SPI App_56  |
      | <AnnouncementName> | Bulk SPI App_57  |
      | <AnnouncementName> | Bulk SPI App_58  |
      | <AnnouncementName> | Bulk SPI App_59  |
      | <AnnouncementName> | Bulk SPI App_60  |
      | <AnnouncementName> | Bulk SPI App_61  |
      | <AnnouncementName> | Bulk SPI App_62  |
      | <AnnouncementName> | Bulk SPI App_63  |
      | <AnnouncementName> | Bulk SPI App_64  |
      | <AnnouncementName> | Bulk SPI App_65  |
      | <AnnouncementName> | Bulk SPI App_66  |
      | <AnnouncementName> | Bulk SPI App_67  |
      | <AnnouncementName> | Bulk SPI App_68  |
      | <AnnouncementName> | Bulk SPI App_69  |
      | <AnnouncementName> | Bulk SPI App_70  |
      | <AnnouncementName> | Bulk SPI App_71  |
      | <AnnouncementName> | Bulk SPI App_72  |
      | <AnnouncementName> | Bulk SPI App_73  |
      | <AnnouncementName> | Bulk SPI App_74  |
      | <AnnouncementName> | Bulk SPI App_75  |
      | <AnnouncementName> | Bulk SPI App_76  |
      | <AnnouncementName> | Bulk SPI App_77  |
      | <AnnouncementName> | Bulk SPI App_78  |
      | <AnnouncementName> | Bulk SPI App_79  |
      | <AnnouncementName> | Bulk SPI App_80  |
      | <AnnouncementName> | Bulk SPI App_81  |
      | <AnnouncementName> | Bulk SPI App_82  |
      | <AnnouncementName> | Bulk SPI App_83  |
      | <AnnouncementName> | Bulk SPI App_84  |
      | <AnnouncementName> | Bulk SPI App_85  |
      | <AnnouncementName> | Bulk SPI App_86  |
      | <AnnouncementName> | Bulk SPI App_87  |
      | <AnnouncementName> | Bulk SPI App_88  |
      | <AnnouncementName> | Bulk SPI App_89  |
      | <AnnouncementName> | Bulk SPI App_90  |
      | <AnnouncementName> | Bulk SPI App_91  |
      | <AnnouncementName> | Bulk SPI App_92  |
      | <AnnouncementName> | Bulk SPI App_93  |
      | <AnnouncementName> | Bulk SPI App_94  |
      | <AnnouncementName> | Bulk SPI App_95  |
      | <AnnouncementName> | Bulk SPI App_96  |
      | <AnnouncementName> | Bulk SPI App_97  |
      | <AnnouncementName> | Bulk SPI App_98  |
      | <AnnouncementName> | Bulk SPI App_99  |
      | <AnnouncementName> | Bulk SPI App_100 |

    Examples:
      | AnnouncementName                                      |
      | Automation Permanent Announcement for Bulk Award_Comp |


 ##################################################################

  @mkk @ApprovedFDMBulkRecordCreation_IND_500
  Scenario Outline: Bulk Award -> Competitive Type Announcement -> Automation IND User -- Application/FDM Creation

    And I create application records with status "Submitted to Grantor" using "KEY_POC-Automation IND" properties for bulk records
      | Title            | AnnouncementName   | PreAppTitle |
      | Bulk IND App_1   | <AnnouncementName> |             |
      | Bulk IND App_2   | <AnnouncementName> |             |
      | Bulk IND App_3   | <AnnouncementName> |             |
      | Bulk IND App_4   | <AnnouncementName> |             |
      | Bulk IND App_5   | <AnnouncementName> |             |
      | Bulk IND App_6   | <AnnouncementName> |             |
      | Bulk IND App_7   | <AnnouncementName> |             |
      | Bulk IND App_8   | <AnnouncementName> |             |
      | Bulk IND App_9   | <AnnouncementName> |             |
      | Bulk IND App_10  | <AnnouncementName> |             |
      | Bulk IND App_11  | <AnnouncementName> |             |
      | Bulk IND App_12  | <AnnouncementName> |             |
      | Bulk IND App_13  | <AnnouncementName> |             |
      | Bulk IND App_14  | <AnnouncementName> |             |
      | Bulk IND App_15  | <AnnouncementName> |             |
      | Bulk IND App_16  | <AnnouncementName> |             |
      | Bulk IND App_17  | <AnnouncementName> |             |
      | Bulk IND App_18  | <AnnouncementName> |             |
      | Bulk IND App_19  | <AnnouncementName> |             |
      | Bulk IND App_20  | <AnnouncementName> |             |
      | Bulk IND App_21  | <AnnouncementName> |             |
      | Bulk IND App_22  | <AnnouncementName> |             |
      | Bulk IND App_23  | <AnnouncementName> |             |
      | Bulk IND App_24  | <AnnouncementName> |             |
      | Bulk IND App_25  | <AnnouncementName> |             |
      | Bulk IND App_26  | <AnnouncementName> |             |
      | Bulk IND App_27  | <AnnouncementName> |             |
      | Bulk IND App_28  | <AnnouncementName> |             |
      | Bulk IND App_29  | <AnnouncementName> |             |
      | Bulk IND App_30  | <AnnouncementName> |             |
      | Bulk IND App_31  | <AnnouncementName> |             |
      | Bulk IND App_32  | <AnnouncementName> |             |
      | Bulk IND App_33  | <AnnouncementName> |             |
      | Bulk IND App_34  | <AnnouncementName> |             |
      | Bulk IND App_35  | <AnnouncementName> |             |
      | Bulk IND App_36  | <AnnouncementName> |             |
      | Bulk IND App_37  | <AnnouncementName> |             |
      | Bulk IND App_38  | <AnnouncementName> |             |
      | Bulk IND App_39  | <AnnouncementName> |             |
      | Bulk IND App_40  | <AnnouncementName> |             |
      | Bulk IND App_41  | <AnnouncementName> |             |
      | Bulk IND App_42  | <AnnouncementName> |             |
      | Bulk IND App_43  | <AnnouncementName> |             |
      | Bulk IND App_44  | <AnnouncementName> |             |
      | Bulk IND App_45  | <AnnouncementName> |             |
      | Bulk IND App_46  | <AnnouncementName> |             |
      | Bulk IND App_47  | <AnnouncementName> |             |
      | Bulk IND App_48  | <AnnouncementName> |             |
      | Bulk IND App_49  | <AnnouncementName> |             |
      | Bulk IND App_50  | <AnnouncementName> |             |
      | Bulk IND App_51  | <AnnouncementName> |             |
      | Bulk IND App_52  | <AnnouncementName> |             |
      | Bulk IND App_53  | <AnnouncementName> |             |
      | Bulk IND App_54  | <AnnouncementName> |             |
      | Bulk IND App_55  | <AnnouncementName> |             |
      | Bulk IND App_56  | <AnnouncementName> |             |
      | Bulk IND App_57  | <AnnouncementName> |             |
      | Bulk IND App_58  | <AnnouncementName> |             |
      | Bulk IND App_59  | <AnnouncementName> |             |
      | Bulk IND App_60  | <AnnouncementName> |             |
      | Bulk IND App_61  | <AnnouncementName> |             |
      | Bulk IND App_62  | <AnnouncementName> |             |
      | Bulk IND App_63  | <AnnouncementName> |             |
      | Bulk IND App_64  | <AnnouncementName> |             |
      | Bulk IND App_65  | <AnnouncementName> |             |
      | Bulk IND App_66  | <AnnouncementName> |             |
      | Bulk IND App_67  | <AnnouncementName> |             |
      | Bulk IND App_68  | <AnnouncementName> |             |
      | Bulk IND App_69  | <AnnouncementName> |             |
      | Bulk IND App_70  | <AnnouncementName> |             |
      | Bulk IND App_71  | <AnnouncementName> |             |
      | Bulk IND App_72  | <AnnouncementName> |             |
      | Bulk IND App_73  | <AnnouncementName> |             |
      | Bulk IND App_74  | <AnnouncementName> |             |
      | Bulk IND App_75  | <AnnouncementName> |             |
      | Bulk IND App_76  | <AnnouncementName> |             |
      | Bulk IND App_77  | <AnnouncementName> |             |
      | Bulk IND App_78  | <AnnouncementName> |             |
      | Bulk IND App_79  | <AnnouncementName> |             |
      | Bulk IND App_80  | <AnnouncementName> |             |
      | Bulk IND App_81  | <AnnouncementName> |             |
      | Bulk IND App_82  | <AnnouncementName> |             |
      | Bulk IND App_83  | <AnnouncementName> |             |
      | Bulk IND App_84  | <AnnouncementName> |             |
      | Bulk IND App_85  | <AnnouncementName> |             |
      | Bulk IND App_86  | <AnnouncementName> |             |
      | Bulk IND App_87  | <AnnouncementName> |             |
      | Bulk IND App_88  | <AnnouncementName> |             |
      | Bulk IND App_89  | <AnnouncementName> |             |
      | Bulk IND App_90  | <AnnouncementName> |             |
      | Bulk IND App_91  | <AnnouncementName> |             |
      | Bulk IND App_92  | <AnnouncementName> |             |
      | Bulk IND App_93  | <AnnouncementName> |             |
      | Bulk IND App_94  | <AnnouncementName> |             |
      | Bulk IND App_95  | <AnnouncementName> |             |
      | Bulk IND App_96  | <AnnouncementName> |             |
      | Bulk IND App_97  | <AnnouncementName> |             |
      | Bulk IND App_98  | <AnnouncementName> |             |
      | Bulk IND App_99  | <AnnouncementName> |             |
      | Bulk IND App_100 | <AnnouncementName> |             |

    And I Initiated application review for multiple records on announcement
      | AnnouncementName   |
      | <AnnouncementName> |
    And I initiate pre-screen review for announcements with properties "default"
      | AnnouncementName   | ReviewerName             |
      | <AnnouncementName> | {SavedValue:FO Username} |

    And I submit review for announcements with properties "default" for bulk records
      | ReviewName        | AnnouncementName   | ApplicationName  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_1   |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_2   |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_3   |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_4   |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_5   |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_6   |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_7   |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_8   |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_9   |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_10  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_11  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_12  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_13  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_14  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_15  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_16  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_17  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_18  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_19  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_20  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_21  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_22  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_23  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_24  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_25  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_26  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_27  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_28  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_29  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_30  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_31  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_32  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_33  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_34  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_35  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_36  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_37  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_38  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_39  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_40  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_41  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_42  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_43  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_44  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_45  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_46  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_47  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_48  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_49  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_50  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_51  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_52  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_53  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_54  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_55  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_56  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_57  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_58  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_59  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_60  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_61  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_62  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_63  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_64  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_65  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_66  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_67  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_68  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_69  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_70  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_71  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_72  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_73  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_74  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_75  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_76  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_77  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_78  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_79  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_80  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_81  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_82  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_83  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_84  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_85  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_86  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_87  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_88  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_89  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_90  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_91  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_92  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_93  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_94  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_95  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_96  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_97  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_98  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_99  |
      | Pre-Screen Review | <AnnouncementName> | Bulk IND App_100 |

    And I initiate SME review for announcements with properties "default"
      | AnnouncementName   | ReviewerName             | ReviewerName2             | ReviewerName3            |
      | <AnnouncementName> | {SavedValue:FO Username} | {SavedValue:EXE Username} | {SavedValue:PM Username} |

    And I submit review for announcements with properties "default" for bulk records
      | ReviewName | AnnouncementName   | ApplicationName  |
      | SME Review | <AnnouncementName> | Bulk IND App_1   |
      | SME Review | <AnnouncementName> | Bulk IND App_2   |
      | SME Review | <AnnouncementName> | Bulk IND App_3   |
      | SME Review | <AnnouncementName> | Bulk IND App_4   |
      | SME Review | <AnnouncementName> | Bulk IND App_5   |
      | SME Review | <AnnouncementName> | Bulk IND App_6   |
      | SME Review | <AnnouncementName> | Bulk IND App_7   |
      | SME Review | <AnnouncementName> | Bulk IND App_8   |
      | SME Review | <AnnouncementName> | Bulk IND App_9   |
      | SME Review | <AnnouncementName> | Bulk IND App_10  |
      | SME Review | <AnnouncementName> | Bulk IND App_11  |
      | SME Review | <AnnouncementName> | Bulk IND App_12  |
      | SME Review | <AnnouncementName> | Bulk IND App_13  |
      | SME Review | <AnnouncementName> | Bulk IND App_14  |
      | SME Review | <AnnouncementName> | Bulk IND App_15  |
      | SME Review | <AnnouncementName> | Bulk IND App_16  |
      | SME Review | <AnnouncementName> | Bulk IND App_17  |
      | SME Review | <AnnouncementName> | Bulk IND App_18  |
      | SME Review | <AnnouncementName> | Bulk IND App_19  |
      | SME Review | <AnnouncementName> | Bulk IND App_20  |
      | SME Review | <AnnouncementName> | Bulk IND App_21  |
      | SME Review | <AnnouncementName> | Bulk IND App_22  |
      | SME Review | <AnnouncementName> | Bulk IND App_23  |
      | SME Review | <AnnouncementName> | Bulk IND App_24  |
      | SME Review | <AnnouncementName> | Bulk IND App_25  |
      | SME Review | <AnnouncementName> | Bulk IND App_26  |
      | SME Review | <AnnouncementName> | Bulk IND App_27  |
      | SME Review | <AnnouncementName> | Bulk IND App_28  |
      | SME Review | <AnnouncementName> | Bulk IND App_29  |
      | SME Review | <AnnouncementName> | Bulk IND App_30  |
      | SME Review | <AnnouncementName> | Bulk IND App_31  |
      | SME Review | <AnnouncementName> | Bulk IND App_32  |
      | SME Review | <AnnouncementName> | Bulk IND App_33  |
      | SME Review | <AnnouncementName> | Bulk IND App_34  |
      | SME Review | <AnnouncementName> | Bulk IND App_35  |
      | SME Review | <AnnouncementName> | Bulk IND App_36  |
      | SME Review | <AnnouncementName> | Bulk IND App_37  |
      | SME Review | <AnnouncementName> | Bulk IND App_38  |
      | SME Review | <AnnouncementName> | Bulk IND App_39  |
      | SME Review | <AnnouncementName> | Bulk IND App_40  |
      | SME Review | <AnnouncementName> | Bulk IND App_41  |
      | SME Review | <AnnouncementName> | Bulk IND App_42  |
      | SME Review | <AnnouncementName> | Bulk IND App_43  |
      | SME Review | <AnnouncementName> | Bulk IND App_44  |
      | SME Review | <AnnouncementName> | Bulk IND App_45  |
      | SME Review | <AnnouncementName> | Bulk IND App_46  |
      | SME Review | <AnnouncementName> | Bulk IND App_47  |
      | SME Review | <AnnouncementName> | Bulk IND App_48  |
      | SME Review | <AnnouncementName> | Bulk IND App_49  |
      | SME Review | <AnnouncementName> | Bulk IND App_50  |
      | SME Review | <AnnouncementName> | Bulk IND App_51  |
      | SME Review | <AnnouncementName> | Bulk IND App_52  |
      | SME Review | <AnnouncementName> | Bulk IND App_53  |
      | SME Review | <AnnouncementName> | Bulk IND App_54  |
      | SME Review | <AnnouncementName> | Bulk IND App_55  |
      | SME Review | <AnnouncementName> | Bulk IND App_56  |
      | SME Review | <AnnouncementName> | Bulk IND App_57  |
      | SME Review | <AnnouncementName> | Bulk IND App_58  |
      | SME Review | <AnnouncementName> | Bulk IND App_59  |
      | SME Review | <AnnouncementName> | Bulk IND App_60  |
      | SME Review | <AnnouncementName> | Bulk IND App_61  |
      | SME Review | <AnnouncementName> | Bulk IND App_62  |
      | SME Review | <AnnouncementName> | Bulk IND App_63  |
      | SME Review | <AnnouncementName> | Bulk IND App_64  |
      | SME Review | <AnnouncementName> | Bulk IND App_65  |
      | SME Review | <AnnouncementName> | Bulk IND App_66  |
      | SME Review | <AnnouncementName> | Bulk IND App_67  |
      | SME Review | <AnnouncementName> | Bulk IND App_68  |
      | SME Review | <AnnouncementName> | Bulk IND App_69  |
      | SME Review | <AnnouncementName> | Bulk IND App_70  |
      | SME Review | <AnnouncementName> | Bulk IND App_71  |
      | SME Review | <AnnouncementName> | Bulk IND App_72  |
      | SME Review | <AnnouncementName> | Bulk IND App_73  |
      | SME Review | <AnnouncementName> | Bulk IND App_74  |
      | SME Review | <AnnouncementName> | Bulk IND App_75  |
      | SME Review | <AnnouncementName> | Bulk IND App_76  |
      | SME Review | <AnnouncementName> | Bulk IND App_77  |
      | SME Review | <AnnouncementName> | Bulk IND App_78  |
      | SME Review | <AnnouncementName> | Bulk IND App_79  |
      | SME Review | <AnnouncementName> | Bulk IND App_80  |
      | SME Review | <AnnouncementName> | Bulk IND App_81  |
      | SME Review | <AnnouncementName> | Bulk IND App_82  |
      | SME Review | <AnnouncementName> | Bulk IND App_83  |
      | SME Review | <AnnouncementName> | Bulk IND App_84  |
      | SME Review | <AnnouncementName> | Bulk IND App_85  |
      | SME Review | <AnnouncementName> | Bulk IND App_86  |
      | SME Review | <AnnouncementName> | Bulk IND App_87  |
      | SME Review | <AnnouncementName> | Bulk IND App_88  |
      | SME Review | <AnnouncementName> | Bulk IND App_89  |
      | SME Review | <AnnouncementName> | Bulk IND App_90  |
      | SME Review | <AnnouncementName> | Bulk IND App_91  |
      | SME Review | <AnnouncementName> | Bulk IND App_92  |
      | SME Review | <AnnouncementName> | Bulk IND App_93  |
      | SME Review | <AnnouncementName> | Bulk IND App_94  |
      | SME Review | <AnnouncementName> | Bulk IND App_95  |
      | SME Review | <AnnouncementName> | Bulk IND App_96  |
      | SME Review | <AnnouncementName> | Bulk IND App_97  |
      | SME Review | <AnnouncementName> | Bulk IND App_98  |
      | SME Review | <AnnouncementName> | Bulk IND App_99  |
      | SME Review | <AnnouncementName> | Bulk IND App_100 |

    And I initiate management review for announcements with properties "default"
      | AnnouncementName   | ReviewerName             |
      | <AnnouncementName> | {SavedValue:FO Username} |
    And I submit review for announcements with properties "default" for bulk records
      | ReviewName        | AnnouncementName   | ApplicationName  |
      | Management Review | <AnnouncementName> | Bulk IND App_1   |
      | Management Review | <AnnouncementName> | Bulk IND App_2   |
      | Management Review | <AnnouncementName> | Bulk IND App_3   |
      | Management Review | <AnnouncementName> | Bulk IND App_4   |
      | Management Review | <AnnouncementName> | Bulk IND App_5   |
      | Management Review | <AnnouncementName> | Bulk IND App_6   |
      | Management Review | <AnnouncementName> | Bulk IND App_7   |
      | Management Review | <AnnouncementName> | Bulk IND App_8   |
      | Management Review | <AnnouncementName> | Bulk IND App_9   |
      | Management Review | <AnnouncementName> | Bulk IND App_10  |
      | Management Review | <AnnouncementName> | Bulk IND App_11  |
      | Management Review | <AnnouncementName> | Bulk IND App_12  |
      | Management Review | <AnnouncementName> | Bulk IND App_13  |
      | Management Review | <AnnouncementName> | Bulk IND App_14  |
      | Management Review | <AnnouncementName> | Bulk IND App_15  |
      | Management Review | <AnnouncementName> | Bulk IND App_16  |
      | Management Review | <AnnouncementName> | Bulk IND App_17  |
      | Management Review | <AnnouncementName> | Bulk IND App_18  |
      | Management Review | <AnnouncementName> | Bulk IND App_19  |
      | Management Review | <AnnouncementName> | Bulk IND App_20  |
      | Management Review | <AnnouncementName> | Bulk IND App_21  |
      | Management Review | <AnnouncementName> | Bulk IND App_22  |
      | Management Review | <AnnouncementName> | Bulk IND App_23  |
      | Management Review | <AnnouncementName> | Bulk IND App_24  |
      | Management Review | <AnnouncementName> | Bulk IND App_25  |
      | Management Review | <AnnouncementName> | Bulk IND App_26  |
      | Management Review | <AnnouncementName> | Bulk IND App_27  |
      | Management Review | <AnnouncementName> | Bulk IND App_28  |
      | Management Review | <AnnouncementName> | Bulk IND App_29  |
      | Management Review | <AnnouncementName> | Bulk IND App_30  |
      | Management Review | <AnnouncementName> | Bulk IND App_31  |
      | Management Review | <AnnouncementName> | Bulk IND App_32  |
      | Management Review | <AnnouncementName> | Bulk IND App_33  |
      | Management Review | <AnnouncementName> | Bulk IND App_34  |
      | Management Review | <AnnouncementName> | Bulk IND App_35  |
      | Management Review | <AnnouncementName> | Bulk IND App_36  |
      | Management Review | <AnnouncementName> | Bulk IND App_37  |
      | Management Review | <AnnouncementName> | Bulk IND App_38  |
      | Management Review | <AnnouncementName> | Bulk IND App_39  |
      | Management Review | <AnnouncementName> | Bulk IND App_40  |
      | Management Review | <AnnouncementName> | Bulk IND App_41  |
      | Management Review | <AnnouncementName> | Bulk IND App_42  |
      | Management Review | <AnnouncementName> | Bulk IND App_43  |
      | Management Review | <AnnouncementName> | Bulk IND App_44  |
      | Management Review | <AnnouncementName> | Bulk IND App_45  |
      | Management Review | <AnnouncementName> | Bulk IND App_46  |
      | Management Review | <AnnouncementName> | Bulk IND App_47  |
      | Management Review | <AnnouncementName> | Bulk IND App_48  |
      | Management Review | <AnnouncementName> | Bulk IND App_49  |
      | Management Review | <AnnouncementName> | Bulk IND App_50  |
      | Management Review | <AnnouncementName> | Bulk IND App_51  |
      | Management Review | <AnnouncementName> | Bulk IND App_52  |
      | Management Review | <AnnouncementName> | Bulk IND App_53  |
      | Management Review | <AnnouncementName> | Bulk IND App_54  |
      | Management Review | <AnnouncementName> | Bulk IND App_55  |
      | Management Review | <AnnouncementName> | Bulk IND App_56  |
      | Management Review | <AnnouncementName> | Bulk IND App_57  |
      | Management Review | <AnnouncementName> | Bulk IND App_58  |
      | Management Review | <AnnouncementName> | Bulk IND App_59  |
      | Management Review | <AnnouncementName> | Bulk IND App_60  |
      | Management Review | <AnnouncementName> | Bulk IND App_61  |
      | Management Review | <AnnouncementName> | Bulk IND App_62  |
      | Management Review | <AnnouncementName> | Bulk IND App_63  |
      | Management Review | <AnnouncementName> | Bulk IND App_64  |
      | Management Review | <AnnouncementName> | Bulk IND App_65  |
      | Management Review | <AnnouncementName> | Bulk IND App_66  |
      | Management Review | <AnnouncementName> | Bulk IND App_67  |
      | Management Review | <AnnouncementName> | Bulk IND App_68  |
      | Management Review | <AnnouncementName> | Bulk IND App_69  |
      | Management Review | <AnnouncementName> | Bulk IND App_70  |
      | Management Review | <AnnouncementName> | Bulk IND App_71  |
      | Management Review | <AnnouncementName> | Bulk IND App_72  |
      | Management Review | <AnnouncementName> | Bulk IND App_73  |
      | Management Review | <AnnouncementName> | Bulk IND App_74  |
      | Management Review | <AnnouncementName> | Bulk IND App_75  |
      | Management Review | <AnnouncementName> | Bulk IND App_76  |
      | Management Review | <AnnouncementName> | Bulk IND App_77  |
      | Management Review | <AnnouncementName> | Bulk IND App_78  |
      | Management Review | <AnnouncementName> | Bulk IND App_79  |
      | Management Review | <AnnouncementName> | Bulk IND App_80  |
      | Management Review | <AnnouncementName> | Bulk IND App_81  |
      | Management Review | <AnnouncementName> | Bulk IND App_82  |
      | Management Review | <AnnouncementName> | Bulk IND App_83  |
      | Management Review | <AnnouncementName> | Bulk IND App_84  |
      | Management Review | <AnnouncementName> | Bulk IND App_85  |
      | Management Review | <AnnouncementName> | Bulk IND App_86  |
      | Management Review | <AnnouncementName> | Bulk IND App_87  |
      | Management Review | <AnnouncementName> | Bulk IND App_88  |
      | Management Review | <AnnouncementName> | Bulk IND App_89  |
      | Management Review | <AnnouncementName> | Bulk IND App_90  |
      | Management Review | <AnnouncementName> | Bulk IND App_91  |
      | Management Review | <AnnouncementName> | Bulk IND App_92  |
      | Management Review | <AnnouncementName> | Bulk IND App_93  |
      | Management Review | <AnnouncementName> | Bulk IND App_94  |
      | Management Review | <AnnouncementName> | Bulk IND App_95  |
      | Management Review | <AnnouncementName> | Bulk IND App_96  |
      | Management Review | <AnnouncementName> | Bulk IND App_97  |
      | Management Review | <AnnouncementName> | Bulk IND App_98  |
      | Management Review | <AnnouncementName> | Bulk IND App_99  |
      | Management Review | <AnnouncementName> | Bulk IND App_100 |

    And I create FDM records with status "Created" using "default" properties for bulk records
      | AnnouncementName   | ApplicationName  |
      | <AnnouncementName> | Bulk IND App_1   |
      | <AnnouncementName> | Bulk IND App_2   |
      | <AnnouncementName> | Bulk IND App_3   |
      | <AnnouncementName> | Bulk IND App_4   |
      | <AnnouncementName> | Bulk IND App_5   |
      | <AnnouncementName> | Bulk IND App_6   |
      | <AnnouncementName> | Bulk IND App_7   |
      | <AnnouncementName> | Bulk IND App_8   |
      | <AnnouncementName> | Bulk IND App_9   |
      | <AnnouncementName> | Bulk IND App_10  |
      | <AnnouncementName> | Bulk IND App_11  |
      | <AnnouncementName> | Bulk IND App_12  |
      | <AnnouncementName> | Bulk IND App_13  |
      | <AnnouncementName> | Bulk IND App_14  |
      | <AnnouncementName> | Bulk IND App_15  |
      | <AnnouncementName> | Bulk IND App_16  |
      | <AnnouncementName> | Bulk IND App_17  |
      | <AnnouncementName> | Bulk IND App_18  |
      | <AnnouncementName> | Bulk IND App_19  |
      | <AnnouncementName> | Bulk IND App_20  |
      | <AnnouncementName> | Bulk IND App_21  |
      | <AnnouncementName> | Bulk IND App_22  |
      | <AnnouncementName> | Bulk IND App_23  |
      | <AnnouncementName> | Bulk IND App_24  |
      | <AnnouncementName> | Bulk IND App_25  |
      | <AnnouncementName> | Bulk IND App_26  |
      | <AnnouncementName> | Bulk IND App_27  |
      | <AnnouncementName> | Bulk IND App_28  |
      | <AnnouncementName> | Bulk IND App_29  |
      | <AnnouncementName> | Bulk IND App_30  |
      | <AnnouncementName> | Bulk IND App_31  |
      | <AnnouncementName> | Bulk IND App_32  |
      | <AnnouncementName> | Bulk IND App_33  |
      | <AnnouncementName> | Bulk IND App_34  |
      | <AnnouncementName> | Bulk IND App_35  |
      | <AnnouncementName> | Bulk IND App_36  |
      | <AnnouncementName> | Bulk IND App_37  |
      | <AnnouncementName> | Bulk IND App_38  |
      | <AnnouncementName> | Bulk IND App_39  |
      | <AnnouncementName> | Bulk IND App_40  |
      | <AnnouncementName> | Bulk IND App_41  |
      | <AnnouncementName> | Bulk IND App_42  |
      | <AnnouncementName> | Bulk IND App_43  |
      | <AnnouncementName> | Bulk IND App_44  |
      | <AnnouncementName> | Bulk IND App_45  |
      | <AnnouncementName> | Bulk IND App_46  |
      | <AnnouncementName> | Bulk IND App_47  |
      | <AnnouncementName> | Bulk IND App_48  |
      | <AnnouncementName> | Bulk IND App_49  |
      | <AnnouncementName> | Bulk IND App_50  |
      | <AnnouncementName> | Bulk IND App_51  |
      | <AnnouncementName> | Bulk IND App_52  |
      | <AnnouncementName> | Bulk IND App_53  |
      | <AnnouncementName> | Bulk IND App_54  |
      | <AnnouncementName> | Bulk IND App_55  |
      | <AnnouncementName> | Bulk IND App_56  |
      | <AnnouncementName> | Bulk IND App_57  |
      | <AnnouncementName> | Bulk IND App_58  |
      | <AnnouncementName> | Bulk IND App_59  |
      | <AnnouncementName> | Bulk IND App_60  |
      | <AnnouncementName> | Bulk IND App_61  |
      | <AnnouncementName> | Bulk IND App_62  |
      | <AnnouncementName> | Bulk IND App_63  |
      | <AnnouncementName> | Bulk IND App_64  |
      | <AnnouncementName> | Bulk IND App_65  |
      | <AnnouncementName> | Bulk IND App_66  |
      | <AnnouncementName> | Bulk IND App_67  |
      | <AnnouncementName> | Bulk IND App_68  |
      | <AnnouncementName> | Bulk IND App_69  |
      | <AnnouncementName> | Bulk IND App_70  |
      | <AnnouncementName> | Bulk IND App_71  |
      | <AnnouncementName> | Bulk IND App_72  |
      | <AnnouncementName> | Bulk IND App_73  |
      | <AnnouncementName> | Bulk IND App_74  |
      | <AnnouncementName> | Bulk IND App_75  |
      | <AnnouncementName> | Bulk IND App_76  |
      | <AnnouncementName> | Bulk IND App_77  |
      | <AnnouncementName> | Bulk IND App_78  |
      | <AnnouncementName> | Bulk IND App_79  |
      | <AnnouncementName> | Bulk IND App_80  |
      | <AnnouncementName> | Bulk IND App_81  |
      | <AnnouncementName> | Bulk IND App_82  |
      | <AnnouncementName> | Bulk IND App_83  |
      | <AnnouncementName> | Bulk IND App_84  |
      | <AnnouncementName> | Bulk IND App_85  |
      | <AnnouncementName> | Bulk IND App_86  |
      | <AnnouncementName> | Bulk IND App_87  |
      | <AnnouncementName> | Bulk IND App_88  |
      | <AnnouncementName> | Bulk IND App_89  |
      | <AnnouncementName> | Bulk IND App_90  |
      | <AnnouncementName> | Bulk IND App_91  |
      | <AnnouncementName> | Bulk IND App_92  |
      | <AnnouncementName> | Bulk IND App_93  |
      | <AnnouncementName> | Bulk IND App_94  |
      | <AnnouncementName> | Bulk IND App_95  |
      | <AnnouncementName> | Bulk IND App_96  |
      | <AnnouncementName> | Bulk IND App_97  |
      | <AnnouncementName> | Bulk IND App_98  |
      | <AnnouncementName> | Bulk IND App_99  |
      | <AnnouncementName> | Bulk IND App_100 |

    Examples:
      | AnnouncementName                                      |
      | Automation Permanent Announcement for Bulk Award_Comp |

################################################################
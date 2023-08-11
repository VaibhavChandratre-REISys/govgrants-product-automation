package com.ggproduct.automation.handlers;

import com.testingblaze.objects.InstanceRecording;

public class govgrants {
    public static GovGrantsLibrary perform() {
        return InstanceRecording.getInstance(GovGrantsLibrary.class);
    }
}

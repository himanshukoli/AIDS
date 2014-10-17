package org.shunya.shared.taskSteps;

import org.shunya.shared.TaskStep;
import org.shunya.shared.annotation.InputParam;
import org.shunya.shared.annotation.OutputParam;
import org.shunya.shared.annotation.PunterTask;

import java.nio.file.Paths;
import java.util.logging.Level;

@PunterTask(author = "munishc", name = "DiscSpaceTaskStep", description = "Echo's the input data to SOP", documentation = "docs/TextSamplerDemoHelp.html")
public class DiscSpaceTaskStep extends TaskStep {
    @InputParam(required = true, displayName = "Drive Path", type = "textarea", description = "enter your name here")
    private String drive;

    @OutputParam(displayName = "percentFree")
    private long percentFree = 0;

    @OutputParam(displayName = "totalSpace")
    private long totalSpace = 0;

    @OutputParam(displayName = "freeSpace")
    private long freeSpace = 0;

    @Override
    public boolean run() {
        freeSpace = Paths.get(drive).toFile().getUsableSpace();
        totalSpace = Paths.get(drive).toFile().getTotalSpace();
        percentFree = 100 * freeSpace / totalSpace;
        LOGGER.get().log(Level.INFO, "Free Space = " + percentFree +"%");
        return true;
    }
}
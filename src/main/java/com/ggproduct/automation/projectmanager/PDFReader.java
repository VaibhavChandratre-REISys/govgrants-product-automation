package com.ggproduct.automation.projectmanager;

import com.testingblaze.controller.DeviceBucket;
import com.testingblaze.objects.InstanceRecording;
import com.testingblaze.register.I;
import org.apache.commons.io.FilenameUtils;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Objects;

/**
 * @author Jitendra Pisal
 */
public class PDFReader {

    private PDDocument document = null;
    private String content = null;

    public PDFReader(){

    }

    /**
     * This method downloads the file opened in browser in target folder/
     */
    public void downloadAnyFile(){
        String aa = "(function downloadURI(uri, name)\n" +
                "        {\n" +
                "            var link = document.createElement(\"a\");\n" +
                "            link.download = name;\n" +
                "            link.href = uri;\n" +
                "            link.click();\n" +
                "        })(\""+I.amPerforming().actionToGet().currentURL()+"\",\"anynameofile.pdf\");";

        WebDriver driver = InstanceRecording.getInstance(DeviceBucket.class).getDriver();
        JavascriptExecutor jj = (JavascriptExecutor) driver;
        jj.executeScript(aa);
    }

    /**
     * This method deletes the pdf file from target folder
     * @param fileName FileName e.g govgrants
     */
    public void deletePDFile(String fileName){
        File pdfFile = new File(System.getProperty("user.dir") + "/target/"+fileName+".pdf");
        pdfFile.delete();
    }

    /**
     *  This method returns the content of downloaded file from it's specific page
     * @param pageNumber
     * @return Content of file on page.
     * @throws IOException
     */
    public String getPdfContent(int pageNumber) throws IOException {
        downloadAnyFile();
        String appUrl = "file:///"+System.getProperty("user.dir") + "/target/"+renameDownloadedFile();
        URL url = new URL(appUrl);
        InputStream input = url.openStream();
        BufferedInputStream fileToParse = new BufferedInputStream(input);
        try {
            document = PDDocument.load(fileToParse);
            PDFTextStripper pdfTextStripper = new PDFTextStripper();
            pdfTextStripper.setStartPage(pageNumber);
            pdfTextStripper.setEndPage(pageNumber);
            content = pdfTextStripper.getText(document);
            System.out.println(content);
        } finally {
            if (document != null) {
                document.close();
            }
            fileToParse.close();
            input.close();
        }
        return content;
    }

    /**
     * Rename downloaded folder.
     * @return : name of new file i.e govgrants.pdf
     */
    public String renameDownloadedFile(){
        File var10000 = null;
        String downloadedfileName = ((File) Objects.requireNonNull(getDownloadedFileFromCurrentFolder())).getName();
        if (FilenameUtils.getExtension(downloadedfileName).contains("pdf")) {
            var10000 = getDownloadedFileFromCurrentFolder();
            String var10003 = System.getProperty("user.dir");
            var10000.renameTo(new File(var10003 + "/target/govgrants." + FilenameUtils.getExtension(downloadedfileName)));
        }

        return ((File) Objects.requireNonNull(var10000)).getName();
    }

    /**
     * Get the downloaded file from current folder.
     * @return
     */
    public File getDownloadedFileFromCurrentFolder(){
        String downloadLocation = System.getProperty("user.dir");
        File dir = new File(downloadLocation + "/target/");
        File[] files = dir.listFiles();
        if (files != null && files.length != 0) {
            File lastModifiedFile = files[0];

            for(int i = 1; i < files.length; ++i) {
                if (lastModifiedFile.lastModified() < files[i].lastModified()) {
                    lastModifiedFile = files[i];
                }
            }
            return lastModifiedFile;
        } else {
            return null;
        }
    }
}

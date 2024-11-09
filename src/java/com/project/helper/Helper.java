package com.project.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {

    public static boolean deleteFile(String path) {
        boolean f = false;
        try {

            File file = new File(path);
            f = file.delete();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

//    public static boolean saveFile(InputStream is, String path) {
//        boolean f = false;
//        try {
//
//            byte b[] = new byte[is.available()];
//
//            is.read(b);
//
//            FileOutputStream fos = new FileOutputStream(path);
//
//            fos.write(b);
//
//            fos.flush();
//            fos.close();
//
//            f = true;
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return f;
//    }
    public static boolean saveFile(InputStream is, String path) {
        boolean f = false;
        try {
            // Create a buffer of 4KB for reading chunks of data
            byte[] buffer = new byte[4096];
            int bytesRead = -1;

            // Create FileOutputStream to write the file
            FileOutputStream fos = new FileOutputStream(path);

            // Read from InputStream and write to FileOutputStream in chunks
            while ((bytesRead = is.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }

            // Flush and close the streams
            fos.flush();
            fos.close();
            is.close(); // Always close the InputStream when done

            f = true; // Indicate success

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

}

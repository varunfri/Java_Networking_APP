package java_codes;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class SystemInfo {
    public static void main(String[] args) {
        try {
            // Get OS Name
            String os = System.getProperty("os.name");

            // Get Java Version
            String javaVersion = System.getProperty("java.version");

            // Get Hostname
            String hostname = InetAddress.getLocalHost().getHostName();

            // Display the information
            System.out.println("Operating System: " + os);
            System.out.println("Java Version: " + javaVersion);
            System.out.println("Hostname: " + hostname);

        } catch (UnknownHostException e) {
            System.out.println("Unable to get hostname");
            e.printStackTrace();
        }
    }
}

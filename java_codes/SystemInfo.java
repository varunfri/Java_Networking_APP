package java_codes;

import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;

public class SystemInfo {
    public static void main(String[] args) {
        try {
            String os = System.getProperty("os.name");
            String javaVersion = System.getProperty("java.version");
            String hostname = InetAddress.getLocalHost().getHostName();

            Map<String, String> data = new HashMap<>();
            data.put("OS", os);
            data.put("JavaVersion", javaVersion);
            data.put("Hostname", hostname);

            // Convert to JSON-like string
            System.out.println("{");
            int count = 0;
            for (Map.Entry<String, String> entry : data.entrySet()) {
                count++;
                String comma = count < data.size() ? "," : "";
                System.out.println("  \"" + entry.getKey() + "\": \"" + entry.getValue() + "\"" + comma);
            }
            System.out.println("}");

        } catch (Exception e) {
            System.err.println("{\"error\": \"" + e.getMessage() + "\"}");
        }
    }
}

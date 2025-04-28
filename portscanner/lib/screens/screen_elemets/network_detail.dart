import 'package:intl/intl.dart' show DateFormat;
import 'package:portscanner/export.dart';

class NetworkDetails extends StatelessWidget {
  const NetworkDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final sysInfo = Provider.of<SystemInfo>(context);
    final netInfo = Provider.of<Netinfoprovider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "System Details",
              size: 20,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        Gap(20),

        Consumer<LocalTimeProvider>(
          builder: (_, localTime, child) {
            var timeDate = DateFormat(
              "dd-MM-yyyy hh:mm:ss a",
            ).format(localTime.dateTime);
            return CustomText(text: "Time: $timeDate", size: 18);
          },
        ),
        CustomText(text: "Host Name: ${sysInfo.hostName}", size: 18),
        CustomText(text: "OS: ${sysInfo.os}", size: 18),
        CustomText(text: "Java Version: ${sysInfo.javaVersion}", size: 18),

        Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "Network Details",
              size: 20,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),

        Gap(20),

        CustomText(text: "Local IP: ${netInfo.localip}", size: 18),

        CustomText(text: "Public IP: ${netInfo.publicip} ", size: 18),
        CustomText(text: "Interface Connected: ${netInfo.interface}", size: 18),
      ],
    );
  }
}

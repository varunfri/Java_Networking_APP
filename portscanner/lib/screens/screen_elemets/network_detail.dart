import 'package:intl/intl.dart' show DateFormat;
import 'package:portscanner/export.dart';
 

class NetworkDetails extends StatelessWidget {
  const NetworkDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        Consumer<LocalTimeProvider>(
          builder: (_, localTime, child) {
            var timeDate = DateFormat("dd-MM-yyyy hh:mm:ss a").format(localTime.dateTime);
            return Text("Time: $timeDate");
          },
        ),
        Gap(20),
        CustomText(
          text: "Interface Connected:",
          size: 15,
          fontWeight: FontWeight.bold,
        ),
        Gap(10),
        CustomText(text: "Local IP:", size: 15, fontWeight: FontWeight.bold),
        Gap(10),
        CustomText(text: "Public IP: ", size: 15, fontWeight: FontWeight.bold),
      ],
    );
  }
}

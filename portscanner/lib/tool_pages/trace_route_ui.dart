import 'package:portscanner/export.dart';

class TraceRouteUi extends StatefulWidget {
  const TraceRouteUi({super.key});

  @override
  State<TraceRouteUi> createState() => _TraceRouteUiState();
}

class _TraceRouteUiState extends State<TraceRouteUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trace Route Tool"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber[200],
                  ),
                  child: _Tool(),
                ),
                Gap(20),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber[200],
                  ),
                  child: _Info(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Center(
        child: Column(
          children: [
            CustomText(
              text: "Trace Route Tool",
              size: 20,
              fontWeight: FontWeight.bold,
            ),
            Gap(20),
            CustomText(
              text:
                  "A traceroute provides a map of how data on the internet travels from its source to its destination.\n\nWhen you connect with a website, the data you get must travel across multiple devices and networks along the way, particularly routers.",
              size: 16,
              fontWeight: FontWeight.w500,
            ),
            Gap(25),
            OutlinedButton.icon(
              onPressed: () async{
                final Uri url = Uri.parse('https://en.wikipedia.org/wiki/Traceroute');

                if (!await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                )) {
                  throw 'Could not launch $url';
                }
              },
              icon: Icon(Icons.launch),
              iconAlignment: IconAlignment.end,
              label: Text("Read More About Trace Route Tool"),
            ),
          ],
        ),
      ),
    );
  }
}

class _Tool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(30));
  }
}

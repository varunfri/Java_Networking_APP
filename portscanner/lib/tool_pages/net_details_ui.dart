import 'package:portscanner/export.dart';

class NetDetailsUi extends StatefulWidget {
  const NetDetailsUi({super.key});

  @override
  State<NetDetailsUi> createState() => _NetDetailsUiState();
}

class _NetDetailsUiState extends State<NetDetailsUi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() async {
      ShowIndicator().indicate(context: context);
      await Future.delayed(Duration(seconds: 3));
      Provider.of<GeoProvider>(context, listen: false).getLocation();
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Network Details"), centerTitle: true),
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
  const _Info();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          // spacing: 20.0,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
              text: "Network Lookup",
              size: 20,
              fontWeight: FontWeight.bold,
            ),
            Gap(20),
            CustomText(
              text:
                  "It's the process of linking a device's physical location and address with the digital device ID to maintain transparency, traceability, and accountability for online activities",
              size: 16,
              fontWeight: FontWeight.w500,
            ),
            Gap(5),
            CustomText(
              text:
                  "Lookup details about an IP address including location, ISP, hostname, type, proxy, blacklist status and more. Trace, Track and Locate an IP address.",
              size: 16,
              fontWeight: FontWeight.w500,
            ),
            Gap(30),
            OutlinedButton.icon(
              onPressed: () async {
                final Uri url = Uri.parse('https://foundation.wikimedia.org/wiki/Legal:Wikimedia_IP_Information_Tool_Policy');

                if (!await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                )) {
                  throw 'Could not launch $url';
                }
              },
              label: Text("Read more about IP Lookup"),
              icon: Icon(Icons.launch_outlined),
              iconAlignment: IconAlignment.end,
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
    return Padding(
      padding: EdgeInsets.all(40),
      child: Consumer<GeoProvider>(
        builder: (context, geo, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              CustomText(
                text: "Your Internet Details",
                size: 24,
                fontWeight: FontWeight.bold,
              ),
              Gap(10),
              CustomText(
                text: "IP Address: ${geo.query}",
                size: 16,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: "Country: ${geo.country}",
                size: 16,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: "Country Code: ${geo.countryCode}",
                size: 16,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: "Region: ${geo.region}",
                size: 16,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: "Region Name: ${geo.regionName}",
                size: 16,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: "City: ${geo.city}",
                size: 16,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: "Zip: ${geo.zip}",
                size: 16,
                fontWeight: FontWeight.w700,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Live Location: ",
                    size: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  OutlinedButton.icon(
                    onPressed: () async {
                      final Uri url = Uri.parse(
                        'https://maps.google.com/?q=${geo.lat},${geo.lon}',
                      );

                      if (!await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      )) {
                        throw 'Could not launch $url';
                      }
                    },
                    iconAlignment: IconAlignment.end,
                    icon: Icon(Icons.launch_outlined),
                    label: CustomText(
                      text: "Launch in Goole Maps",
                      size: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              CustomText(
                text: "Time Zone: ${geo.timeZone}",
                size: 16,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: "ISP(Internet Service Provider): ${geo.isp}",
                size: 16,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: "Organization: ${geo.org}",
                size: 16,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: "Autonomous System (AS): ${geo.as}",
                size: 16,
                fontWeight: FontWeight.w700,
              ),
            ],
          );
        },
      ),
    );
  }
}

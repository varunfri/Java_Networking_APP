import 'package:portscanner/export.dart';

class ReverseIpUi extends StatefulWidget {
  const ReverseIpUi({super.key});

  @override
  State<ReverseIpUi> createState() => _ReverseIpUiState();
}

class _ReverseIpUiState extends State<ReverseIpUi> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ReverseIpProvider>(
        context,
        listen: false,
      ).getReverseIP(domain: _Tool().domain.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reverse IP Lookup Tool"), centerTitle: true),
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
      floatingActionButton: FloatingActionButton.extended(onPressed: (){}, label: Text("Retest"),icon: Icon(Icons.refresh_sharp),),
    );
  }
}

class _Tool extends StatelessWidget {
  final domain = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final reverseProvider = Provider.of<ReverseIpProvider>(context);
    return Padding(
      padding: EdgeInsets.all(45),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Enter Domain/IPV4/IPV6 Address",
              size: 25,
              fontWeight: FontWeight.bold,
            ),
            Text("(ex:google.com/ 192.168.521.24/ 2404:6800:4007:80b::200e)"),
            Gap(20),
            SizedBox(
              width: 400,
              child: TextField(
                controller: domain,
                decoration: InputDecoration(
                  hintText: "Domain/IPV4/IPV6",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Gap(20),
            FilledButton.tonalIcon(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white),
              ),
              onPressed: () async {
                if (domain.text.isNotEmpty) {
                  ShowIndicator().indicate(context: context);
                  await Provider.of<ReverseIpProvider>(
                    context,
                    listen: false,
                  ).getReverseIP(domain: domain.text);
                  await Future.delayed(Duration(seconds: 2));
                  Navigator.pop(context);
                } else {
                  ToastNotify().toastMessage(
                    title: "Enter Domain",
                    type: ToastificationType.error,
                    context: context,
                  );
                }
              },
              label: CustomText(text: "Start Lookup", size: 15),
            ),
            Gap(20),
            Visibility(
              visible: reverseProvider.hostIp!.isNotEmpty ? true : false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: "Finder Address: ${reverseProvider.finderInfo}",   
                    size: 20,
                    fontWeight: FontWeight.w500,
                  ),CustomText(
                    text: "Host Address: ${reverseProvider. hostAddress}",   
                    size: 20,
                    fontWeight: FontWeight.w500,
                  ),CustomText(
                    text: "Host IP: ${reverseProvider.hostIp}",   
                    size: 20,
                    fontWeight: FontWeight.w500,
                  ),CustomText(
                    text: "Host Name: ${reverseProvider.hostName}",   
                    size: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
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
      child: Column(
        children: [
          CustomText(
            text: "Reverse IP Lookup",
            size: 20,
            fontWeight: FontWeight.bold,
          ),
          Gap(10),
          CustomText(
            text:
                "The Reverse Lookup tool will do a reverse IP lookup.\nIf you type in an IP address, we will attempt to locate a dns PTR record for that IP address.\nPlease note that in general, your ISP must setup and maintain these Reverse DNS records (i.e. PTR records) for you.",
            size: 18,
            fontWeight: FontWeight.w500,
          ),
          Gap(20),
          OutlinedButton.icon(
            onPressed: () async {
              final Uri url = Uri.parse(
                'https://www.cloudflare.com/en-gb/learning/dns/glossary/reverse-dns/',
              );

              if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                throw 'Could not launch $url';
              }
            },
            icon: Icon(Icons.launch),
            iconAlignment: IconAlignment.end,
            label: Text("Read More About Reverse Lookup"),
          ),
        ],
      ),
    );
  }
}

import 'package:portscanner/code_providers/whois_provider.dart';
import 'package:portscanner/export.dart';

class WhoisLookup extends StatefulWidget {
  const WhoisLookup({super.key});

  @override
  State<WhoisLookup> createState() => _WhoisLookupState();
}

class _WhoisLookupState extends State<WhoisLookup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WHOIS Lookup Tool"), centerTitle: true),
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
                  height: MediaQuery.of(context).size.height * 0.6,
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

class _Tool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final whoisProvider = Provider.of<WhoisProvider>(context, listen: false);
    final domain = TextEditingController();
    return Padding(
      padding: EdgeInsets.all(40),
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
                  await Provider.of<WhoisProvider>(
                    context,
                    listen: false,
                  ).getWhois(domain.text);
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
              visible: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: "Domain Name: ${whoisProvider.domainName}",
                    size: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    text: "Creation Date: ${whoisProvider.creationDate}",
                    size: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    text: "Expiray Date: ${whoisProvider.expiryDate}",
                    size: 20,
                    fontWeight: FontWeight.w500,
                  ), CustomText(
                    text: "Registrar: ${whoisProvider.registrar}",
                    size: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    text: "Name Servers: ${whoisProvider.nameServers}",
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
      child: Center(
        child: Column(
          children: [
            CustomText(
              text: "Whois Lookup",
              size: 20,
              fontWeight: FontWeight.bold,
            ),
            Gap(20),
            CustomText(
              text:
                  "A Whois domain lookup allows you to trace the ownership and tenure of a domain name. \nSimilar to how all houses are registered with a governing authority, all domain name registries maintain a record of information about every domain name purchased through them, along with who owns it, and the date till which it has been purchased.",
              size: 18,
              fontWeight: FontWeight.w500,
            ),
            Gap(30),
            OutlinedButton.icon(
              onPressed: () async {
                final Uri url = Uri.parse(
                  'https://en.wikipedia.org/wiki/WHOIS',
                );

                if (!await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                )) {
                  throw 'Could not launch $url';
                }
              },
              label: Text("Read More About WHOIS Lookup"),
              icon: Icon(Icons.launch_outlined),
            ),
          ],
        ),
      ),
    );
  }
}

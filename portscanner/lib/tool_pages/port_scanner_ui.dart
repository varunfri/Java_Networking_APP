import 'package:portscanner/export.dart';

class PortScannerUi extends StatefulWidget {
  const PortScannerUi({super.key});

  @override
  State<PortScannerUi> createState() => _PortScannerUiState();
}

class _PortScannerUiState extends State<PortScannerUi> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<PortScan>(context, listen: false).cleardata();
    });
  }

  @override
  Widget build(BuildContext context) {
    final portProvider = Provider.of<PortScan>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Port Scanner Tool"), centerTitle: true),
      body: SingleChildScrollView(
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {});
          portProvider.cleardata();
        },
        label: Text("Retest"),
        icon: Icon(Icons.refresh),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  const _Info();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 5,
        children: [
          CustomText(
            text: "Common Ports",
            size: 20,
            fontWeight: FontWeight.bold,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: "21 FTP", size: 16),
                  CustomText(text: "22 SSH", size: 16),
                  CustomText(text: "23 TELNET", size: 16),
                  CustomText(text: "25 SMTP", size: 16),
                  CustomText(text: "53 DNS", size: 16),
                  CustomText(text: "80 HTTP", size: 16),
                  CustomText(text: "110 POP3", size: 16),
                  CustomText(text: "115 SFTP", size: 16),
                  CustomText(text: "5632 PCAnywhere", size: 16),
                  CustomText(text: "25565 Minecraft", size: 16),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: "135 RPC", size: 16),
                  CustomText(text: "139 NetBIOS", size: 16),
                  CustomText(text: "143 IMAP", size: 16),
                  CustomText(text: "194 IRC", size: 16),
                  CustomText(text: "443 SSL", size: 16),
                  CustomText(text: "445 SMB", size: 16),
                  CustomText(text: "1433 MSSQL", size: 16),
                  CustomText(text: "3306 MySQL", size: 16),
                  CustomText(text: "3389 Remote Desktop", size: 16),
                  CustomText(text: "5900 VNC", size: 16),
                ],
              ),
            ],
          ),
          Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                onPressed: () async {
                  final Uri url = Uri.parse(
                    'https://en.wikipedia.org/wiki/Port_scanner',
                  );

                  if (!await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  )) {
                    throw 'Could not launch $url';
                  }
                },
                label: Text("Read More About Commom Ports"),
                icon: Icon(Icons.link_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Tool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final portProvider = Provider.of<PortScan>(context);
    final domain = TextEditingController();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Enter Domain Name ",
                size: 20,
                fontWeight: FontWeight.bold,
              ),

              Text("(ex:www.google.com / IPV4 / IPV6 Address)", style: TextStyle(fontSize: 16)),
              Gap(10),
              SizedBox(
                width: 500,
                child: TextField(
                  controller: domain,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Gap(20),
              FilledButton.icon(
                style: ButtonStyle(
                  // foregroundColor: WidgetStatePropertyAll(Colors.black),
                  // backgroundColor:  WidgetStatePropertyAll(Colors.white),
                ),
                onPressed: () async {
                  if (domain.text.isEmpty) {
                    ToastNotify().toastMessage(
                      title: "Enter Correct Domain",
                      type: ToastificationType.warning,
                      context: context,
                    );
                  } else {
                    portProvider.url = domain.text;
                    debugPrint("url:${domain.text}");
                    ShowIndicator().indicate(context: context);
                    await portProvider.getPorts();
                    Navigator.pop(context);

                    if (portProvider.ports.isNotEmpty) {
                      ToastNotify().toastMessage(
                        context: context,
                        title: "Port Scanned Successful",
                        type: ToastificationType.success,
                      );
                    } else {
                      // Navigator.pop(context);
                      ToastNotify().toastMessage(
                        context: context,
                        title: "No Ports Found!",
                        type: ToastificationType.error,
                      );
                    }
                  }
                },
                icon: Icon(Icons.search_outlined),
                label: Text("Start Scanning"),
              ),
              Gap(10),
              Visibility(
                visible: portProvider.ports.isEmpty ? false : true,
                child: Column(
                  children: [
                    CustomText(text: "Opened Ports are:", size: 20),
                    Gap(10),
                    CustomText(
                      text: portProvider.ports.join(', '),
                      size: 20,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

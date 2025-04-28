import 'package:portscanner/export.dart';

class NetworkToolUI extends StatelessWidget {
  const NetworkToolUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: "Welcome to Network Testing Tool",
          size: 20,
          fontWeight: FontWeight.bold,
        ),
        Gap(20),
        Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.amber[200],
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.78,
          child: Column(
            spacing: 20,
            children: [
              ContainerButton(
                iconName: Icons.lan_outlined,
                title: "Port Scanner",
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PortScannerUi()),
                  );
                },
              ),

              ContainerButton(
                iconName: Icons.timeline_outlined,
                title: "Trace Route Details",
                onClick: () {
                  ToastNotify().toastMessage(
                    title: "Launching Soon....",
                    type: ToastificationType.info,
                    context: context,
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (_) => TraceRouteUi()),
                  // );
                },
              ),

              ContainerButton(
                iconName: Icons.cell_tower_outlined,
                title: "Get Network Details",
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => NetDetailsUi()),
                  );
                },
              ),

              ContainerButton(
                iconName: Icons.travel_explore_outlined,
                title: "WHOIS Lookup",
                onClick: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (_) => WhoisLookup()),
                  // );
                  ToastNotify().toastMessage(
                    title: "Launching Soon....",
                    type: ToastificationType.info,
                    context: context,
                  );
                },
              ),
              ContainerButton(
                iconName: Icons.flip_camera_android_outlined,
                title: "Reverse IP Lookup",
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ReverseIpUi()),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ContainerButton extends StatelessWidget {
  final String title;
  final IconData iconName;
  final Function()? onClick;
  const ContainerButton({
    super.key,
    required this.title,
    required this.onClick,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            Icon(iconName, size: 30),
            Gap(20),
            CustomText(text: title, size: 20),
            Spacer(),
            IconButton(
              onPressed: onClick,
              icon: Icon(Icons.keyboard_arrow_right_outlined),
            ),
          ],
        ),
      ),
    );
  }
}

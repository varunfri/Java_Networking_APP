import 'package:portscanner/export.dart';

class WelcomeWrap extends StatelessWidget {
  const WelcomeWrap({super.key});

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
                  runJavaCode();
                },
              ),

              ContainerButton(
                iconName: Icons.device_hub_outlined,
                title: "System Interface Details",
                onClick: () {
                  SystemInfo().getSystemInfo();
                },
              ),

              ContainerButton(
                iconName: Icons.language_outlined,
                title: "Get Network Details",
                onClick: () {},
              ),

              ContainerButton(
                iconName: Icons.wifi,
                title: "Wifi Scanning",
                onClick: () {},
              ),
              ContainerButton(
                iconName: Icons.flip_camera_android_outlined,
                title: "Reverse IP Lookup",
                onClick: () {},
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
            Icon(iconName),
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

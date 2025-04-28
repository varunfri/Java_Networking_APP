import 'package:portscanner/export.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  void initState() {
    super.initState();
    debugPrint("initState called!");
    // checkStatus();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkStatus();
    });
    Future.microtask(() {
      Provider.of<SystemInfo>(context, listen: false).getSystemInfo();
      Provider.of<Netinfoprovider>(context, listen: false).getNetInfo();
      Provider.of<LocationAccess>(context, listen: false).getLocation();
    });
  }

  Future<void> checkStatus() async {
    dynamic result;
    Position? location;
    ShowIndicator().indicate(context: context);
    await Future.delayed(Duration(seconds: 5), () async {
      result = await NetworkStatus().status();
      location = await Geolocator.getCurrentPosition();
    });

    // Future.delayed(Duration(seconds: 10));
    //close the indicator

    if (result == 200) {
      debugPrint("Network Connected");
      debugPrint("Location Access $location");

      try {   
        Position position = await Geolocator.getCurrentPosition();
        debugPrint("Location Access: $position");
      
        if (context.mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        debugPrint("Location access failed: $e");
        showDialog(
        context: context,
        barrierDismissible: false,
        builder:
            (_) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Internet is connected!!"),
                  Text("Location service is not enabled!!"),
                ],
              ),
              actions: [
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    checkStatus();
                  },
                  label: Text("Reconnect"),
                  icon: Icon(Icons.autorenew_outlined),
                ),
              ],
            ),
      );
      }
    } else {
      debugPrint("Please Connect internet");
      //show dialog to reconnect and check
      showDialog(
        context: context,
        barrierDismissible: false,
        builder:
            (_) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Internet is not connected!!"),
                  Text("Location service is not enabled!!"),
                ],
              ),
              actions: [
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    checkStatus();
                  },
                  label: Text("Reconnect"),
                  icon: Icon(Icons.autorenew_outlined),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Networking Tool"),
      //   centerTitle: false,
      //   // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      // ),
      // drawer: Drawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    // color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width * 0.69,
                  height: MediaQuery.of(context).size.height * 0.9,
                  //child
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: NetworkToolUI(),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.amber[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: SingleChildScrollView(child: NetworkDetails()),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {});
          ShowIndicator().indicate(context: context);
        },
        label: Text("Reload"),
        icon: Icon(Icons.refresh_outlined),
      ),
    );
  }
}

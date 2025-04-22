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
  }

  void checkStatus() async {
    ShowIndicator().indicate(context: context);
    final result = await NetworkStatus().status();
    //close the indicator
    Navigator.pop(context);

    if (result == 200) {
      debugPrint("Network Connected");
    } else {
      debugPrint("Please Connect internet");
      //show dialog to reconnect and check
      showDialog(
        context: context,
        barrierDismissible: false,
        builder:
            (_) => AlertDialog(
              content: Text("Internet is not connected!!"),
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
                    child: WelcomeWrap(),
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
    );
  }
}

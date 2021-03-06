import 'package:flutter/material.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final remoteconfig = FirebaseRemoteConfig.instance;
  

  Future Getremotevalues() async {
    final updatevalues = remoteconfig.fetchAndActivate();
    await remoteconfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(seconds: 1),
      minimumFetchInterval: Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back)),
                SizedBox(
                  width: 80,
                ),
                Text('Notifications',
                    style: TextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 120,
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text('${remoteconfig.getString('notification')}',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.normal) ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

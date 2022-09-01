import 'package:allshayri/firstpage.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();

    gonext();
  }

  gonext() async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
    }

    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return firstpage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(90.0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          margin: EdgeInsets.all(5),
          // child: Image(
          //   image: AssetImage("myimages/img_17.png"),
          //   fit: BoxFit.none,
          // ),
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("myimages/img_17.png"),fit: BoxFit.contain),borderRadius: BorderRadius.circular(50),),
        ),
      ),
    );
  }
}

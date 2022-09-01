import 'package:allshayri/Model.dart';
import 'package:allshayri/secondpage.dart';
import 'package:flutter/material.dart';

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("myimages/img_15.png"),fit: BoxFit.fill)),
            child: Column(
              children: [
                Container(
                  height: 100,
                  margin: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Container(
                        margin:EdgeInsets.only(left: 6, top: 10, right: 15, bottom: 0),
                        height: 75,
                        width: 217,
                        alignment: Alignment.center,
                        child: Text(
                          "Choose Your Language",
                          style: TextStyle(
                              fontSize: 27,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,letterSpacing: 0.5),
                        ),
                      ),
                      InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: 50,
                            margin: EdgeInsets.only(top: 10,left: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Icon(
                              Icons.notifications,
                              size: 30,
                            ),
                          )
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(top: 10,left: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Icon(
                            Icons.favorite_rounded,
                            size: 30,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                      itemCount: Model.language.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 15,
                          margin: EdgeInsets.all(12.5),
                          color: Model.clr[index],
                          shadowColor: Colors.black,
                          child: InkWell(
                            onTap: () {},
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context) {
                                    return secondpage(index);
                                  },
                                ));
                              },
                              child: ListTile(
                                  title: Text(
                                    Model.language[index],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.5),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                        );
                      },
                    ))
              ],
            ),
          )),
    ), onWillPop: goback);
  }

  Future<bool> goback()
  {
    Navigator.pop(context);
    return Future.value();
  }
}


import 'package:allshayri/firstpage.dart';
import 'package:allshayri/thirdpage.dart';
import 'package:flutter/material.dart';
import 'Model.dart';

class secondpage extends StatefulWidget {
  int index;

  @override
  State<secondpage> createState() => _secondpageState();

  secondpage(this.index);
}

class _secondpageState extends State<secondpage> {
  List<String> temp = [];

  @override
  void initState() {
    super.initState();

    if (widget.index == 0) {
      temp = Model.English;
    } else if (widget.index == 1) {
      temp = Model.Hindi;
    } else if (widget.index == 2) {
      temp = Model.Gujarati;
    } else if (widget.index == 3) {
      temp = Model.Marathi;
    } else if (widget.index == 4) {
      temp = Model.Tamil;
    } else if (widget.index == 5) {
      temp = Model.Kannada;
    } else if (widget.index == 6) {
      temp = Model.Malayalam;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Container(
                  height: 70,
                  width: double.infinity,
                  color: Colors.purple,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          "Choose Your Category",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        margin: EdgeInsets.all(18),
                      ),
                    ],
                  )),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 45,
                  width: 320,
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "TODAY'S SPECIAL.......",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                    color: Colors.transparent,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: GridView.builder(
                        itemBuilder: (context, index) {
                          return GridTile(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                    return thirdpage(index,widget.index);
                                  },));
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      margin: EdgeInsets.all(10),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(temp[index]),
                                              fit: BoxFit.fill),
                                          borderRadius: BorderRadius.circular(14)),
                                    ),
                                    Container(
                                        height: 25,
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                            top: 128.5, left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(14),
                                              bottomRight: Radius.circular(14)),
                                          color: Colors.blue[100],
                                        ),
                                        child: Text(
                                          Model.stateTitle[index],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18),
                                          textAlign: TextAlign.center,
                                        )),
                                  ],
                                ),
                              ));
                        },
                        itemCount: temp.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.2,
                            crossAxisSpacing: 1)),
                  )),
            ],
          )),
    ), onWillPop: goback);
  }
  Future<bool> goback()
  {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return firstpage();
    },));
    return Future.value();
  }
}

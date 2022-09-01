import 'package:allshayri/editpage.dart';
import 'package:allshayri/secondpage.dart';
import 'package:flutter/material.dart';
import 'Model.dart';

class thirdpage extends StatefulWidget {
  int index;
  int cnt;

  thirdpage(this.index, this.cnt);

  @override
  State<thirdpage> createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {
  List<String> temp1 = [];

  @override
  void initState() {
    super.initState();

    if (widget.cnt == 0) {
      if (widget.index == 0) {
        temp1 = Model.englishgn;
      } else if (widget.index == 1) {
        temp1 = Model.englishgm;
      } else if (widget.index == 2) {
        temp1 = Model.englishge;
      } else if (widget.index == 3) {
        temp1 = Model.englishga;
      } else if (widget.index == 4) {
        temp1 = Model.englishemo;
      } else if (widget.index == 5) {
        temp1 = Model.englishcute;
      } else if (widget.index == 6) {
        temp1 = Model.englishboys;
      } else if (widget.index == 7) {
        temp1 = Model.englishideas;
      } else if (widget.index == 8) {
        temp1 = Model.englishbirthday;
      } else if (widget.index == 9) {
        temp1 = Model.englishlove;
      } else if (widget.index == 10) {
        temp1 = Model.englishsad;
      } else if (widget.index == 11) {
        temp1 = Model.englishmahakal;
      }
    }

    if(widget.cnt == 1)
    {
      if(widget.index == 0)
      {
        temp1 = Model.hindigm;
      }
      else if(widget.index == 1)
      {
        temp1 = Model.hindigm;
      }
    }

    if(widget.cnt == 2)
    {
      if(widget.index == 0)
      {
        temp1 = Model.gujaratign;
      }
      else if(widget.index == 1)
      {
        temp1 = Model.gujaratigm;
      }
    }

    if(widget.cnt == 3)
    {
      if(widget.index == 0)
      {
        temp1 = Model.marathign;
      }
      else if(widget.index == 1)
      {
        temp1 = Model.marathigm;
      }
    }

    if(widget.cnt == 4)
    {
      if(widget.index == 0)
      {
        temp1 = Model.tamilgn;
      }
      else if(widget.index == 1)
      {
        temp1 = Model.tamilgm;
      }
    }

    if(widget.cnt == 5)
    {
      if(widget.index == 0)
      {
        temp1 = Model.kannadagn;
      }
      else if(widget.index == 1)
      {
        temp1 = Model.kannadagm;
      }
    }

    if(widget.cnt == 6)
    {
      if(widget.index == 0)
      {
        temp1 = Model.malayalamgn;
      }
      else if(widget.index == 1)
      {
        temp1 = Model.malayalamgm;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: SafeArea(
              child: ListView.builder(
                itemCount: temp1.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.black,
                    child: Column(
                      children: [
                        InkWell(onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return editpage(temp1,index);
                          },));
                        },
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              height: 350,
                              width: double.infinity,
                              padding:EdgeInsets.all(7),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Model.clrr[index]),
                              margin: EdgeInsets.all(10),
                              child: Text(
                                "${temp1[index]}",
                                style: TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )),
        ),
        onWillPop: goback);
  }

  Future<bool> goback() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return secondpage(widget.cnt);
      },
    ));
    return Future.value();
  }
}

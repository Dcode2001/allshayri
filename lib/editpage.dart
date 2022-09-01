import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:allshayri/Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';

class editpage extends StatefulWidget {
  List<String> temp1;
  int index;

  editpage(this.temp1, this.index);

  @override
  State<editpage> createState() => _editpageState();
}

class _editpageState extends State<editpage> {
  GlobalKey _globalKey = GlobalKey();

  String favrite = "";

  Gradient randomcolor = LinearGradient(colors: [
    Colors.blue.shade100,
    Colors.blue.shade100,
  ], transform: GradientRotation(10));

  TextAlign textformat = TextAlign.center;
  Color bgcolor = Colors.blue;
  FontStyle _fontStyle = FontStyle.normal;
  FontWeight _fontWeight = FontWeight.w500;
  TextDecoration _textDecoration = TextDecoration.none;
  Color _textcolor = Colors.black;
  double _textsize = 23;

  String _fontfamily = "";
  List<String> fonts = [
    "family1",
    "family2",
    "family3",
    "family4",
    "family5",
    "family6",
    "family7",
    "family8",
    "family9",
    "family10",
    "family11",
    "family12",
    "family13"
  ];

  @override
  void initState() {
    super.initState();
    createFolder();
  }

  String folderpath = "";

  createFolder() async {
    String path = "storage/emulated/0/Download/All Shayri";

    Directory directory = Directory(path);

    bool status = await directory.exists();

    if (status) {
      print("Already Exits");
    } else {
      await directory.create();
      print("Created");
    }

    folderpath = directory.path;
  }

  Color pickerColor = Color(0xff443a49); // color picker
  Color currentColor = Color(0xff443a49);

  void changeColor(Color color) { // color picker
    randomcolor = LinearGradient(colors: [
      color,
      color,
    ]);
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Shayri"),
      ),
      body: Container(
        color: Colors.blueGrey.shade900,
        child: Column(children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(gradient: randomcolor),
              alignment: Alignment.center,
              child: ListView(shrinkWrap: true, children: [
                RepaintBoundary(
                  key: _globalKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // height: double.infinity,
                      // width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(gradient: randomcolor),
                      // decoration: BoxDecoration(color: bgcolor, borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "${widget.temp1[widget.index]}",
                        style: TextStyle(
                          fontSize: _textsize,
                          color: _textcolor,
                          letterSpacing: 0.7,
                          fontStyle: _fontStyle,
                          fontWeight: _fontWeight,
                          decoration: _textDecoration,
                          fontFamily: _fontfamily,
                        ),
                        textAlign: textformat,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Container(
              height: 80,
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueAccent[100]),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            textformat = TextAlign.left;
                          });
                        },
                        icon: Icon(
                          Icons.format_align_right_outlined,
                          size: 33,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            textformat = TextAlign.center;
                          });
                        },
                        icon: Icon(
                          Icons.format_align_center,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            Model.clrofbg.shuffle();
                            randomcolor = LinearGradient(colors: [
                              Model.clrofbg[widget.index],
                              Model.clrofbg[widget.index],
                            ]);
                          });
                        },
                        icon: Icon(
                          Icons.autorenew_rounded,
                          size: 35,
                        )),
                    IconButton(
                        onPressed: () {
                          showDialog(
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Pick a color!'),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    hexInputBar: false,
                                    paletteType: PaletteType.hslWithHue,
                                    portraitOnly: true,
                                    pickerColor: pickerColor,
                                    onColorChanged: changeColor,
                                  ),
                                ),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: const Text('Got it'),
                                    onPressed: () {

                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                            context: context,
                          );
                        },
                        icon: Icon(
                          Icons.color_lens_outlined,
                          size: 35,
                        )),
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            builder: (context) {
                              return Container(
                                height: 600,
                                width: double.infinity,
                                color: Colors.blue[100],
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(10),
                                child: GridView.builder(
                                  itemCount: Model.randomlist.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          randomcolor = Model.randomlist[index];
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        margin: EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          gradient: Model.randomlist[index],
                                        ),
                                        child: Text(
                                          "Shayri",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    );
                                  },
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                ),
                              );
                            },
                            context: context,
                          );
                        },
                        icon: Icon(
                          Icons.zoom_out_map_outlined,
                          size: 35,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            textformat = TextAlign.justify;
                          });
                        },
                        icon: Icon(
                          Icons.format_align_justify_outlined,
                          size: 33,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            textformat = TextAlign.right;
                          });
                        },
                        icon: Icon(
                          Icons.format_align_left_sharp,
                          size: 30,
                        )),
                  ]),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 55,
                  width: 55,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent[100], shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          _fontWeight = FontWeight.w800;
                        });
                      },
                      icon: Icon(
                        Icons.format_bold_rounded,
                        size: 35,
                      )),
                ),
                Container(
                  height: 55,
                  width: 55,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent[100], shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          _fontStyle = FontStyle.italic;
                        });
                      },
                      icon: Icon(
                        Icons.format_italic,
                        size: 35,
                      )),
                ),
                Container(
                  height: 55,
                  width: 55,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent[100], shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            builder: (context) {
                              return Container(
                                height: 270,
                                width: double.infinity,
                                color: Colors.black,
                                alignment: Alignment.center,
                                child: GridView.builder(
                                  itemCount: Model.clrofbg.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          randomcolor = LinearGradient(colors: [
                                            Model.clrofbg[index],
                                            Model.clrofbg[index]
                                          ]);
                                        });
                                      },
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        margin: EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Model.clrofbg[index]),
                                      ),
                                    );
                                  },
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    childAspectRatio: 1,
                                    mainAxisSpacing: 1,
                                  ),
                                ),
                              );
                            },
                            context: context);
                      },
                      icon: Icon(
                        Icons.colorize,
                        size: 35,
                      )),
                ),
                Container(
                  height: 55,
                  width: 55,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent[100], shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            builder: (context) {
                              return Container(
                                height: 270,
                                width: double.infinity,
                                color: Colors.black,
                                alignment: Alignment.center,
                                child: GridView.builder(
                                  itemCount: Model.clrofbg.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          _textcolor = Model.clroftext[index];
                                        });
                                      },
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        margin: EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Model.clrofbg[index]),
                                      ),
                                    );
                                  },
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    childAspectRatio: 1,
                                    mainAxisSpacing: 1,
                                  ),
                                ),
                              );
                            },
                            context: context);
                      },
                      icon: Icon(
                        Icons.format_color_text_outlined,
                        size: 32,
                      )),
                ),
                Container(
                  height: 55,
                  width: 55,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent[100], shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          builder: (context) {
                            return Container(
                              height: 200,
                              child: StatefulBuilder(
                                builder: (context, setState1) {
                                  return Slider(
                                    min: 20,
                                    max: 50,
                                    onChanged: (value) {
                                      setState(() {
                                        _textsize = value;
                                      });

                                      setState1(() {});
                                      print(value);
                                    },
                                    value: _textsize,
                                  );
                                },
                              ),
                            );
                          },
                          context: context,
                        );
                      },
                      icon: Icon(
                        Icons.format_size,
                        size: 32,
                      )),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 55,
                  width: 55,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent[100], shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "Add To Favorite....",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      size: 35,
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: 55,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent[100], shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isDismissible: false,
                          builder: (context) {
                            return Container(
                              height: 250,
                              width: double.infinity,
                              color: Colors.black,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: GridView.builder(
                                    itemCount: 13,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            _fontfamily = fonts[index];
                                          });
                                        },
                                        child: Container(
                                          height: 20,
                                          width: 60,
                                          color: Colors.deepPurple[200],
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(10),
                                          child: Text(
                                            "SHAYARI",
                                            style: TextStyle(
                                                fontFamily: fonts[index],
                                                fontSize: 20,
                                                letterSpacing: 0.5),
                                          ),
                                        ),
                                      );
                                    },
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1,
                                            childAspectRatio: 5),
                                  )),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                            );
                          },
                          context: context,
                        );
                      },
                      icon: Icon(
                        Icons.font_download,
                        size: 35,
                      )),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent[100]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          // _capturePng().then((value) async {
                          //   print(value);
                          //
                          //   DateTime dt = DateTime.now();
                          //
                          //   String time =
                          //       "${dt.year}${dt.month}${dt.day}${dt.hour}${dt.minute}${dt.second}";
                          //
                          //   String imagepath = "${folderpath}/Shayri$time.jpg";
                          //
                          //   File file = File(imagepath);
                          //
                          //   file.writeAsBytes(value);

                          // String path =file.path;

                          // file.readAsBytesSync(path);
                          // });
                          // GallerySaver.saveImage(recordedImage.path);


                          Fluttertoast.showToast(
                              msg: "Saved",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          child: Column(
                            children: [
                              Icon(
                                Icons.save_alt_outlined,
                                size: 35,
                              ),
                              Text("save"),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Clipboard.setData(ClipboardData(
                              text: "${widget.temp1[widget.index]}"));

                          Fluttertoast.showToast(
                              msg: "Copied......",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          child: Column(
                            children: [
                              Icon(
                                Icons.copy,
                                size: 35,
                              ),
                              Text("copy"),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _capturePng().then((value) async {
                            print(value);

                            DateTime dt = DateTime.now();

                            String time =
                                "${dt.year}${dt.month}${dt.day}${dt.hour}${dt.minute}${dt.second}";

                            String imagepath = "${folderpath}/Shayri$time.jpg";

                            File file = File(imagepath);

                            await file.create();

                            file.writeAsBytesSync(value);

                            String path = file.path;

                            Share.shareFiles([path],
                                text: 'Best Shayri Picture');
                          });
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          child: Column(
                            children: [
                              Icon(
                                Icons.share,
                                size: 35,
                              ),
                              Text("share"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary? boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(bs64);
      return pngBytes;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }
}

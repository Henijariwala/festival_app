import 'dart:typed_data';
import 'dart:ui';

import 'package:festival_flutter/util/festival_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;
class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  List fontList = ['Simple', 'Font1', 'Font2', 'Extra'];
  Color selected = Colors.black;
  String? selectFont = 'Simple';
  bool select = true;
  String selectImg = "assets/image/img1.jpg";

  List imageList =[
  "assets/image/img1.jpg",
  "assets/image/img2.jpg",
  "assets/image/img3.jpg",
  "assets/image/img4.jpg",
  "assets/image/img5.jpg",
  "assets/image/img6.jpg",
  "assets/image/img7.jpeg"
  ];

  bool colorOn = false;
  bool imageOn = false;
  bool fontOn = false;
  bool fieldOn = false;

  FontWeight isWeight = FontWeight.normal;
  FontStyle isStyle = FontStyle.normal;
  TextDecoration isUnder = TextDecoration.none;
  TextAlign isCenter = TextAlign.justify;

  GlobalKey repaintKey = GlobalKey();
  @override
  Widget build(BuildContext context) {

    FestivalModal model = ModalRoute.of(context)!.settings.arguments as FestivalModal;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
      ),
      body: Column(
        children: [
          Center(
            child: RepaintBoundary(
              key: repaintKey,
              child: Container(
                height: MediaQuery.sizeOf(context).width * 0.90,
                width: MediaQuery.sizeOf(context).width * 0.90,
                color: Colors.amber.withOpacity(0.5),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      '${selectImg}',
                      height: 400,
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${model.name}",
                        style: TextStyle(
                          fontFamily: selectFont,
                          color: selected,
                          fontSize: 25 ,
                          fontStyle: isStyle,
                          fontWeight: isWeight,
                          decoration: isUnder,
                        ),
                        textAlign: isCenter,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "${model.author}",
                        style: TextStyle(
                          fontFamily: selectFont,
                          color: selected,
                          fontSize: 25 ,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filledTonal(
                    onPressed: () {
                      setState(() {
                        fieldOn=!fieldOn;
                        fontOn=false;
                        imageOn=false;
                        colorOn=false;
                      });
                    },
                    icon: const Icon(Icons.text_fields)),
                const SizedBox(
                  width: 20,
                ),
                IconButton.filledTonal(
                    onPressed: () {
                      setState(() {
                        fontOn = !fontOn;
                        colorOn = false;
                        imageOn = false;
                        fieldOn=false;
                      });
                    },
                    icon: const Icon(Icons.text_format)),
                const SizedBox(
                  width: 20,
                ),
                IconButton.filledTonal(
                    onPressed: () {
                      setState(() {
                        colorOn = !colorOn;
                        imageOn = false;
                        fontOn = false;
                        fieldOn=false;
                      });
                    },
                    icon: const Icon(Icons.color_lens)),
                const SizedBox(
                  width: 20,
                ),
                IconButton.filledTonal(
                    onPressed: () {
                      setState(() {
                        imageOn = !imageOn;
                        colorOn = false;
                        fontOn = false;
                        fieldOn=false;
                      });
                    },
                    icon: const Icon(Icons.image)),
                const SizedBox(
                  width: 20,
                ),
                IconButton.filledTonal(
                    onPressed: () async{
                      SaveImage();
                    },
                    icon: const Icon(Icons.save)),
                const SizedBox(
                  width: 20,
                ),
                // IconButton.filledTonal(onPressed: () async{
                //
                //   String? path = await SaveImage();
                //   await Share.shareXFiles([XFile('$path')]);
                //
                // },
                //     icon: Icon(Icons.share)),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          //color
          Visibility(
            visible: colorOn,
            child: Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
                itemCount: Colors.accents.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selected = Colors.accents[index];
                      });
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.all(10),
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.accents[index],
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          //image
          Visibility(
            visible: imageOn,
            child: Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectImg = imageList[index];
                      });
                    },
                    child: Container(
                        height: 50,
                        margin: const EdgeInsets.all(10),
                        width: 50,
                        child: Image.asset(imageList[index])),
                  );
                },
              ),
            ),
          ),
          //fonts
          Visibility(
            visible: fontOn,
            child: Expanded(
              child: ListView.builder(
                itemCount: fontList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectFont = fontList[index];
                      });
                    },
                    child: Container(
                      height: 100,
                      child: Text(
                        "Hello everyone",
                        style: TextStyle(
                            fontFamily: fontList[index], fontSize: 25),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          //textField
          Visibility(
            visible: fieldOn,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.filledTonal(onPressed: () {
                      setState(() {
                        if(isWeight==FontWeight.normal)
                        {
                          isWeight=FontWeight.bold;
                        }
                        else
                        {
                          isWeight=FontWeight.normal;
                        }
                      });
                    }, icon: const Icon(Icons.format_bold)),
                    IconButton.filledTonal(onPressed: () {
                      setState(() {
                        if(isStyle==FontStyle.normal)
                        {
                          isStyle=FontStyle.italic;
                        }
                        else
                        {
                          isStyle=FontStyle.normal;
                        }
                      });
                    }, icon: const Icon(Icons.format_italic)),
                    IconButton.filledTonal(onPressed: () {
                      setState(() {
                        if(isUnder==TextDecoration.none)
                        {
                          isUnder=TextDecoration.underline;
                        }
                        else
                        {
                          isUnder=TextDecoration.none;
                        }
                      });
                    }, icon: const Icon(Icons.format_underline)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.filledTonal(onPressed: () {
                      setState(() {
                        isCenter=TextAlign.left;
                      });
                    }, icon: const Icon(Icons.format_align_left)),
                    IconButton.filledTonal(onPressed: () {
                      setState(() {
                        isCenter=TextAlign.center;
                      });
                    }, icon: const Icon(Icons.format_align_center)),
                    IconButton.filledTonal(onPressed: () {
                      setState(() {
                        isCenter=TextAlign.right;
                      });
                    }, icon: const Icon(Icons.format_align_right)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Future<String?> SaveImage()
  async{
    RenderRepaintBoundary boundary =
    repaintKey.currentContext!.findRenderObject()
    as RenderRepaintBoundary;

    ui.Image image = await boundary.toImage();

    ByteData? byteData = await image.toByteData
      (format: ui.ImageByteFormat.png);

    var bytes = byteData!.buffer.asUint8List();

    String name="${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}:${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";

    if(Platform.isAndroid)
    {
      await File("/storage/emulated/0/Download/$name.png").writeAsBytes(bytes);
      return "/storage/emulated/0/Download/$name.png";
    }
    else
    {
      //IOS
      Directory? dir = await getDownloadsDirectory();

      await File("${dir!.path}/.png");
      return "${dir!.path}/.png";
    }
  }
}

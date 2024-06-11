import 'dart:io';
import 'package:festival_flutter/util/category_modal.dart';
import 'package:festival_flutter/util/globle.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGrid = true;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPoP){
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => (AlertDialog(
              title: const Text("Do you want to leave"),
              content: const FlutterLogo(size: 50,),
              actions: [
                TextButton(onPressed: () {
                  Navigator.pop(context);
                }, child: const Text("No")),
                TextButton(onPressed: () {
                  exit(0);
                }, child: const Text("Yes")),
              ],
            )),);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Festival"),
          actions: [
            ElevatedButton(onPressed: () {
              setState(() {
                isGrid = !isGrid;
              });
            }, child: const Text("Click")),
          ],
          backgroundColor: Colors.amber,
        ),
        body:  isGrid ?GridView.builder(
            itemCount: festivalList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return tile(index);
            },):
            ListView.builder(
              itemCount: festivalList.length,
                itemBuilder: (context, index) {
                  return tile(index);
                },)
      ),
    );
  }
  Widget tile(int index)
  {
    return InkWell(
      onTap: () {
        List mainList=[
          diwali,
          holi,
          dussehra,
          ganesh,
          janmashtami,
          eid,
          christmas,
          navratri
        ];

        Navigator.pushNamed(context, 'create',arguments: mainList[index]);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 250,
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('${festivalList[index].image}'),fit: BoxFit.cover),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
              child: Container(
                color: Colors.white.withOpacity(0.5),
                  child: Text("${festivalList[index].name}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold
                  ),))),
        ),
      ),
    );
  }
}

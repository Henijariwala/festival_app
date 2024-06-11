import 'package:flutter/material.dart';
import '../../util/festival_modal.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  List<FestivalModal> l1 = [];

  Widget build(BuildContext context) {

    l1 = ModalRoute.of(context)!.settings.arguments as List<FestivalModal>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore"),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: l1.length,
        itemBuilder: (context, index) {
          return fname(index);
        },
      ),
    );
  }

  Widget fname(int index) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'edit',arguments: l1[index]);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 150,
        decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.5),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("${l1[index].name}",style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'simple',
              ),),
              Align(
                alignment: Alignment.bottomRight,
                child: Text("${l1[index].author}",style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

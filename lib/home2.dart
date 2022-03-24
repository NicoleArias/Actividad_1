import 'dart:async';
import 'package:flutter/material.dart';


class MyHomePageTwo extends StatefulWidget {
  const MyHomePageTwo({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePageTwo> createState() => _MyHomePageTwoState();
}

class _MyHomePageTwoState extends State<MyHomePageTwo> {

  StreamController<String> namesStream = StreamController();

  final TextEditingController _name = TextEditingController();
  List<Map> listName = [];
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
              children: [
                StreamBuilder<String>(
                  stream: namesStream.stream,
                  builder: (context, snapshot) {
                    // if (snapshot.hasData) {
                    //   listName.add({'name': name});
                    //   return ListView.builder(
                    //     itemCount: listName.length,
                    //     itemBuilder: (context, index) => Text(
                    //       listName[index]['name'].toUpperCase(),
                    //     ),
                    //   );
                    // }
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    // return ListView.builder(
                    //   itemCount: listName.length,
                    //   itemBuilder: (context, index) => Text(
                    //     listName[index]['name'].toUpperCase(),
                    //   ),
                    // );
                    return Text(name);
                  },
                ),
                const SizedBox(
                  height: 100,
                ),
                textFiel(),
                const SizedBox(
                  height: 20,
                ),
                button1(),
                const SizedBox(
                  height: 5,
                ),
                button2(),
              ],
            ),
        ),
      ),
    );
  }

  Widget textFiel(){
    return TextFormField(
      controller: _name,
      maxLines: 1,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(34.0)),
        ),
        labelText: 'Nombre',
      ),
    );
  }

  Widget button1(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          30.0,
        ),
      ),
      child: ElevatedButton(
        child: const Text(
          'AÑADIR',
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.blueAccent,
        ),
        onPressed: () {
          name = _name.text;
          namesStream.sink.add(name);
          _name.text = '';
        },
      ),
    );
  }

  Widget button2(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          30.0,
        ),
      ),
      child: ElevatedButton(
        child: const Text(
          'LIMPIAR',
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: const Color.fromARGB(255, 204, 207, 207),
        ),
        onPressed: () {
          setState(() {
            listName = [];
          });
        },
      ),
    );
  }
}
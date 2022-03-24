import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listName.length,
                  itemBuilder: (context, index) {
                    return Text(
                      listName[index]['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
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
      textCapitalization: TextCapitalization.words,
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
          name= _name.text;
          setState(() {
            listName.add({'name': name});
            _name.text = '';
          });
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
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController textEditingController = TextEditingController();
  GoogleTranslator translator = GoogleTranslator();

  String text = 'How Are You!';
  var output;

  void translate() {
    translator
        .translate(textEditingController.text, from: 'en', to: "gu")
        .then((value) {
      setState(() {
        output = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: const Icon(CupertinoIcons.back),
      //   title: const Text('MyTranslator'),
      //   backgroundColor: Colors.teal,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: ListView(
            children: [
              // Text(text.toString()),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  maxLines: 15,
                  controller: textEditingController,
                  decoration: InputDecoration(
                    // icon: Icon(Icons.translate_outlined),
                    hintText: 'Type here',
                    hintStyle: TextStyle(
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey.shade300),
                    border: InputBorder.none,
                  ),
                  onTap: () {
                    translate();
                  },
                ),
              ),

              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  translate();
                  // Text(output.toString());
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                        vertical: 17.0, horizontal: 30.0),
                  ),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                child: const Text('Translate'),
              ),
              const SizedBox(height: 50.0),
              // const Text('Translated Data'),
              // const SizedBox(
              //   height: 20.0,
              // ),
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [Text(
                  output == null ? "Please Select Language" : output.toString(),
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w400),
                              ),]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

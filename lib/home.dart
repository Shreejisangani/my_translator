// this is sample code for trying soomthing new or improve to  transaltor

import 'package:flutter/material.dart';


import 'package:translator/translator.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController textEditingController = TextEditingController();
  GoogleTranslator translator = GoogleTranslator();
  var output;
  late String dropdownValue;

  static const Map<String, String> lang = {
    "Hindi": "hi",
    "English": "en",
    "Urdu": "ur",
  };

  void trans() {
    translator
        .translate(textEditingController.text, to: "$dropdownValue")
        .then((value) {
      setState(() {
        output = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Multi Language Translator"),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                style: const TextStyle(fontSize: 24),
                controller: textEditingController,
                onTap: () {
                  trans();
                },
                decoration: const InputDecoration(
                    labelText: 'Type Here',
                    labelStyle: TextStyle(fontSize: 15)),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Select Language here =>"),
                DropdownButton<String>(
                  value: dropdownValue,
                  // ignore: prefer_const_constructors
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue.toString();
                      trans();
                    });
                  },
                  items: lang
                      .map((string, value) {
                        return MapEntry(
                          string,
                          DropdownMenuItem<String>(
                            value: value,
                            child: Text(string),
                          ),
                        );
                      })
                      .values
                      .toList(),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Text('Translated Text'),
            const SizedBox(
              height: 10,
            ),
            Text(
              output == null ? "Please Select Language" : output.toString(),
              style: const TextStyle(
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ));
  }
}

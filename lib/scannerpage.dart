import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _myText = TextEditingController();
  final firstController = TextEditingController();

  // Create a controller for the second text field
  final secondController = TextEditingController();

  String textValue = '';

  @override
  void dispose() {
    // Dispose the controller when not needed
    firstController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
title: Text("QR generate") ,

      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QrImageView(
              data: "$textValue",
              version: QrVersions.auto,
              size: 320,
              gapless: false,
              //embeddedImage: AssetImage('assets/images/logo.png'),
              embeddedImageStyle: QrEmbeddedImageStyle(
                size: Size(80, 80),
              ),
            ),
            Text(
              'You have pushed the button this many times:',
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: firstController,
              ),
            ),
            ElevatedButton(
              child: Text('Generate QR'),
              onPressed: () {


                String text = firstController.text;
                // Set the text value to the state variable
                setState(() {
                  textValue = text;

                });
              },
            ),
          ],
        ),
      ),
   // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

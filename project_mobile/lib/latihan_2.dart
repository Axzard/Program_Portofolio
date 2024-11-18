import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Hello World',
      home: Scaffold(
        appBar: AppBar(
          title: FlutterLogo(size: 100),),
        body: Center(
          child: Container(
            child: Row(
              children: [
                ElevatedButton(onPressed: () {}, child: 
                Text('tekan saya'),),
              ],
            ),
            height: 200,
            width: 200,
            ),
          ),
      ),
  ));
}

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar()
//     ),
//   ));
// }
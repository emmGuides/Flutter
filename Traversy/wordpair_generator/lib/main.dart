import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: Text("Hello World!",
        style: TextStyle(color: Colors.lightBlueAccent, fontSize: 40.5)
        ,),
    );
  }
}

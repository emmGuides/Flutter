import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Register')) ,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            if (kDebugMode) {
              print("[PRESS] Balls");
            }
          },
          onLongPress: () {
            if (kDebugMode) {
              print('[LONG PRESS] Ballserist');
            }
          },
          child: const Text('Register'),
        ),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variables
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    // binding?
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Register')) ,
      ),
      body: Center(
        child: Column(
          children: [
            TextField( // email
              controller: _email,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Enter Email',
              ),
            ),
            TextField( // password
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                hintText: 'Enter Password',
              ),
            ),
            TextButton(
              onPressed: () async {
                if (kDebugMode) {
                  print("[PRESS] Balls");
                }
                final email = _email.text;
                final password = _password.text;
                // TODO initialize firebase 8:49:09
                final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email, password: password
                );
                print(userCredential);
              },
              onLongPress: () {
                if (kDebugMode) {
                  print('[LONG PRESS] Ballserist');
                }
              },
              child: const Text('Register'),
            ),
          ], // children
        ),
      ),
    );
  }
}

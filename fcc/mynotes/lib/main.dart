import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/views/login_view.dart';
import 'package:mynotes/views/register_view.dart';

import 'firebase_options.dart';

void main() {
  // initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
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
        title: const Center(child: Text('HOMEPAGE'), heightFactor: 240, widthFactor: 240) ,
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState){
            case ConnectionState.none:
              return Text('None oh no');
              break;
            case ConnectionState.waiting:
              return Text('Loading . . .');
              break;
            case ConnectionState.active:
              return Text('oopsie 3');
              break;
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              final emailVerifiedCheck = user?.emailVerified ?? false;
              if(emailVerifiedCheck) {
                print('[VERIFIED] User is Verified');
              } else {
                print('[UNVERIFIED] User is not verified');
              }
              return const Center(child: Text('BRO DONEZA'));
            default:
              return const Center(child: Text('Loading . . . '));
          }
        },
      ),
    );
  }
}





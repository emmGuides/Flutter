import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mynotes/views/login_view.dart';
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
      home: const LoginView(),
    );
  }
}

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState){
            case ConnectionState.none:
            // TODO: Handle this case.
              return Text('oopsie1');
              break;
            case ConnectionState.waiting:
            // TODO: Handle this case.
              return Text('oopsie 2');
              break;
            case ConnectionState.active:
            // TODO: Handle this case.
              return Text('oopsie 3');
              break;
            case ConnectionState.done:
              return Center(
                child: Column(
                  children: [
                    TextField( // email
                      controller: _email,
                      autocorrect: false,
                      enableSuggestions: false,
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
                        // TODO Register Exceptions 9:39:57
                        // initialize firebase

                        final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: email, password: password
                        );
                        if (kDebugMode) {
                          print(userCredential);
                        }
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
              );
            default:
              return const Center(child: Text('Loading . . . '));
          }
        },
      ),
    );
  }
}




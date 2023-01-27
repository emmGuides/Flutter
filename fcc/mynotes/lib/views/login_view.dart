import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mynotes/firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

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
        title: const Center(child: Text('Login')) ,
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
                        // TODO initialize firebase 8:49:09
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
                      child: const Text('Login'),
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
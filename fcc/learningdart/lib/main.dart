import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void getFullName(String name1, String name2){
  if (kDebugMode) {
    print("$name1 $name2");
  }
}

void main() {
  runApp(const MyApp());
}

class LivingThing {
  var species;
  LivingThing(this.species);

  void whatSpeciesAmI(){
    if (kDebugMode) {
      print("HELLO! I am of the species $species");
    }
  }
}
class Person extends LivingThing{
  var firstName, lastName, age, species;
  Person(this.firstName, this.lastName,this.age, this.species) : super(species);

  // factory constructor format
  factory Person.emman() {
    return Person("Emman", "dedis", 23, 'hooman');
  }

  void run(){
    if (kDebugMode) {
      print("running");
    }
  }

  void breathing(){
    if (kDebugMode) {
      print("breathing");
    }
  }

  void inhale(){
    if (kDebugMode) {
      print("inhaling. . . .");
    }
  }

  void introduce(){
    if (kDebugMode) {
      print("Hello! My name is $firstName $lastName, $age years old, and you can call me $firstName");
    }
  }

  @override
  bool operator ==(covariant Person other) => other.firstName == firstName && other.lastName == lastName;

  @override
  int get hashCode => firstName.hashCode;

}

extension extend on Person{
  void balls(){
    print("[extension] BALLS! exclaimed $firstName $lastName");
  }
  //fullName getter
  String get fullName => "$firstName $lastName";
}

extension bork on LivingThing{
  void dogBork(){
    print("[extension] $species borks");
  }
}

Future<int> willBeMultiplying (int num) {
  return Future.delayed(const Duration(seconds: 5), () => num*2);
}

Stream<String> willBeSendingString () {
  return Stream.periodic(const Duration(seconds: 1), (value) => "balls!");
}

void test() async {
  var emman = Person.emman();
  emman.introduce();
  emman.whatSpeciesAmI();
  var dog = LivingThing("doggo");
  dog.whatSpeciesAmI();
  emman.balls();
  dog.dogBork();
  String fullName = emman.fullName;
  print("[extension] fullname is $fullName");
  var res = await willBeMultiplying(69);
  print("[async] the answer is $res");

  int counto = 0;
  await for (var word in willBeSendingString()){
    counto = counto + 1;
    print("[STREAM yo] $counto: $word");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    getFullName("Emman", "well gedis");
    test();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:flutter/material.dart';
import 'package:frutter_item_box_1/List_view.dart';
import 'My_IconButton.dart';
void main() {
  runApp(const MyApp(
  ));
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(

        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {


  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final List<String> items;

  MyIconButton myiconButton = MyIconButton();


  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body:
      //TODO LIST VIEW
      MyListView()

      //TODO BUTTON
      // Column(
      //   // Standard IconButton
      //   children: <Widget>[
      //     ///IconButton
      //     myiconButton.Create_Button(),
      //     myiconButton.Create_Material_Button(),
      //   ],
      // ),


    );
  }
}

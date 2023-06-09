import 'package:flutter/material.dart';
import 'package:frutter_item_box_1/ItemPackage/Loading.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'MY_ListView.dart';
import 'My_ListView.dart';
import 'My_IconButton.dart';

void main() {
  runApp(const MyApp());
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

  // late LoadingAnimationWidget loadingAnimationWidget;
  Loading loading = const Loading();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body:

            /// fallingDot or waveDots
            // TODO Loading Widget
            // Center(child: LoadingAnimationWidget.waveDots(color: Colors.black, size: 100)),
            // loading,

        //TODO a test Button used
    //         Center(
    //   child: TextButton(
    //     onPressed: null,
    //     child: Text("TextButton", style: TextStyle(fontSize: 30))
    //     // Loading_Item()
    //     ,
    //   ),
    // )

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

import 'package:flutter/material.dart';



class Testclass extends StatefulWidget{
  const Testclass({super.key});

  @override
  State<StatefulWidget> createState() {
    //TODO: implement createState
    return _Testclass();
  }

}



class _Testclass extends State<Testclass>{

  var count  = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Row(children: [
      Text("data"),
      IconButton(
          onPressed: null,
          icon: Icon(Icons.ice_skating))]);

  }

}
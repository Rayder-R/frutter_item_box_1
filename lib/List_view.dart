import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyListView();
  }
}

class _MyListView extends State<MyListView> {
  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  final List MyList = List<String>.generate(100, (i) {
    return "Item $i";
  });


  //State狀態
  @override
  void initState() {
    super.initState();
    //TODO
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    return ListView.builder(
          // shrinkWrap: true,
          itemCount: MyList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(MyList[index]),
            );
          },
        );


  }
}

Widget box() {
  return ListView.builder(
      itemCount: 100,
      itemExtent: 50.0, //强制高度为50.0
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      });
}

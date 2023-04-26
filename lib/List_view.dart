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


  var initCounter = 0;
  var plusCounter = 10;

  final List MyListItems = List<String>.generate(100, (i) {
    return "Item: $i";
    // return Data_modle(x: 'Item: $i');
  });
  var items = [];


  //TODO State狀態
  //init 是在剛開始創建State就會被呼叫一次
  @override
  void initState() {
    super.initState();
    //TODO
    print('initState');
    _update_listdata();
  }

  void _update_listdata() {
    //TODO setState
    setState(() {
        print('_update_listdata');
        items.addAll(MyListItems.getRange(initCounter, initCounter + plusCounter));
        initCounter = initCounter + plusCounter;
        print(initCounter);
        print(items);
    });
  }


  // @override
  // void setState(VoidCallback fn) {
  //   print('setState');
  //
  // }


  // @override
  // void setState(VoidCallback fn) {
  //   print('setState');
  //   items.addAll(MyListItems.getRange(initCounter, initCounter + plusCounter));
  //   initCounter = initCounter + plusCounter;
  //   print(initCounter);
  //   print(items);
  // }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    return ListView.builder(
      // shrinkWrap: true,
      itemCount: initCounter,
      itemBuilder: (context, index) {
        return
          Container(
          child:
          Column(children: [

            ListTile(
              // title: Text(MyListItems[index].x.toString()),
              title: Text(items[index]),
            ),
            (index+1 == initCounter) ?
            Container(
              child: TextButton(
                onPressed: _update_listdata,
                child: Text("顯示更多"),),
            ) : Container()
          ]
          )
        );
      },
    );
  }
}




class Data_modle{

  final String x;
  Data_modle({required this.x});

}

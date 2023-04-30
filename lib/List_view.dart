import 'package:flutter/material.dart';
import 'package:frutter_item_box_1/Loading_Item.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
  bool _isLoading = false;
  var items = [];

  List MyListItems = List<String>.generate(26, (i) {
    i = i+1; // index 0~1
    return "Item: $i";
  });

  Widget useLoading() {
    return LoadingAnimationWidget.stretchedDots(color: Colors.yellow, size: 100);
  }

  void show() {
    setState(() {
      _isLoading = true;
    });
  }

  void hide() {
    setState(() {
      _isLoading = false;
    });
  }

  //TODO initState狀態是在剛開始創建State就會被呼叫一次
  @override
  void initState() {
    super.initState();

    print('initState()');
    _update_listdata();

    String message = MyListItems.length.toString();
    print("讀取資料總比數: $message");
  }

  //TODO Loading
  // ignore: unused_element
  Future _loading_item() async {
    setState(() {
      show();
      print("1.setState $_isLoading");
    });

    await Future.delayed(const Duration(seconds: 3), hide);
    print("2.setState $_isLoading");
  }
  Future _update_dataModle() async {

    ///讀取原本的 [MyListItems] List資料 addAll進顯示用 [items] List 資料
    Future.value(true).then((value) {
      return setState(() {
        print('_update_listdata()');
        if (MyListItems.length >= (items.length + plusCounter)) {
          items.addAll(
              MyListItems.getRange(initCounter, initCounter + plusCounter));
          initCounter = initCounter + plusCounter;
        } else {
          items.addAll(MyListItems.getRange(initCounter, MyListItems.length));
          initCounter = initCounter + (MyListItems.length - initCounter);
        }

        print("目前已加入總比數: $initCounter");
        print("目前顯示資料:  $items ");
      });
    });

  }

  void _update_listdata() async {
    await _loading_item();
    _update_dataModle();
  }

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

            ((index+1 == initCounter) & (items.length < MyListItems.length) & (!_isLoading)) ?
            Container(
              child: TextButton(
                onPressed: _update_listdata,
                child: Text("顯示更多"),
              )
            ) :
            Container(),


          ((index+1 == initCounter) & (items.length < MyListItems.length) &(_isLoading))
              ?
              useLoading()
              :
            Container(),
          ]
          )
        );
      },
    );
  }
}


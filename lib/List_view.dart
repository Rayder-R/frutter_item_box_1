import 'package:flutter/material.dart';
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
  var plusCounter = 20;
  bool _isLoading = false;
  var items = [];

  List MyListItems = List<String>.generate(56, (i) {
    i = i+1; // index 0~1
    return "Item: $i";
  });
  /// fallingDot | waveDots | stretchedDots
  Widget useLoading() {
    return LoadingAnimationWidget.stretchedDots(color: const Color.fromRGBO(246, 194, 5, 1), size: 50);
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
    _get_dataModle();

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

    await Future.delayed(const Duration(seconds: 2), hide);
    print("2.setState $_isLoading");
  }
  Future _get_dataModle() async {

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

  void _update_data() async {
    await _loading_item();
    _get_dataModle();
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
              height: 70,
              width: double.infinity,
              child: TextButton(
                onPressed: _update_data,
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


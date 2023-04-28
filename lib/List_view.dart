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

  final List MyListItems = List<String>.generate(26, (i) {
    return "Item: $i";
  });
  var items = [];


  bool _isLoading = false;

  void show() {
    setState(() {
      _isLoading = true;

    });
  }

  Widget useLoading() {
    return LoadingAnimationWidget.stretchedDots(color: Colors.yellow, size: 100);
  }

  void hide() {
    setState(() {
      _isLoading = false;
    });
  }


  //TODO State狀態
  //init 是在剛開始創建State就會被呼叫一次
  @override
  void initState() {
    super.initState();
    //TODO
    print('initState');
    _update_listdata();
  }


  // ignore: unused_element
  void _loading_item() async {
    setState(() {
      show();
      print(_isLoading);
      // const Loading_Item();
    });
    await Future.delayed(const Duration(seconds: 3));
    hide();
    print(_isLoading);

  }


  void _update_listdata()  {
    //TODO setState
    setState(() {
        print('_update_listdata');

        if(MyListItems.length >= (items.length + plusCounter)){
        items.addAll(MyListItems.getRange(initCounter, initCounter + plusCounter));
        initCounter = initCounter + plusCounter;

        }else{
          items.addAll(MyListItems.getRange(initCounter, MyListItems.length));
          initCounter = initCounter + (MyListItems.length - initCounter);

        }

        print(initCounter);
        print(items);
        print(MyListItems.length);

    });

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

            ((index+1 == initCounter) & (items.length < MyListItems.length)) ?
            Container(
              child: TextButton(
                onPressed: _loading_item,
                // (_isLoading)? LoadingAnimationWidget.stretchedDots(color: Colors.yellow, size: 100):,
                child: Text("顯示更多"),
              )
            ) :
            Container(),
            (_isLoading)?
            useLoading():
            Container(),
          ]
          )
        );
      },
    );
  }
}


import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// ignore: camel_case_types
class Loading_Item extends StatefulWidget{
  const Loading_Item({super.key,});
  ///fallingDot and  twoRotatingArc and strechedDots

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _Loading_Item();
  }

}

// ignore: camel_case_types
class _Loading_Item extends State<Loading_Item>{

  bool _isLoading = false;

  void show() {
    setState(() {
      _isLoading = true;
      // LoadingAnimationWidget.stretchedDots(color: Colors.yellow, size: 100)

    });
  }

  void hide() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    // return (_isLoading) ?  xxx() : Container();
  return xxx();
  }


  Widget xxx(){
    // _incrementCounter();
    return LoadingAnimationWidget.stretchedDots(color: Colors.yellow, size: 100);
  }

}

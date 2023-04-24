// ignore: camel_case_types
import 'package:flutter/material.dart';


final items = List<String>.generate(10000, (i) => "Item $i");

class List_view{

  late final List<String> items;

  Widget box(){

    return ListView .builder (
      itemCount : items.length,
      itemBuilder : (context, index) {
        return  ListTile (
          title : Text ( items[index] ),
        );
      },
    );

  }



}



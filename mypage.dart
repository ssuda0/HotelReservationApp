import 'package:flutter/material.dart';
import 'model/product.dart';
import 'package:carousel_slider/carousel_slider.dart';


class MyPageArguments{
  List<Product> _saved = <Product>[];
  MyPageArguments(this._saved);
}

class MyPageScreen extends StatelessWidget{
  static const routeName = '/mypageScreen';
  @override
  Widget build(BuildContext context){
    final MyPageArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args._saved[0].name),
      ),
    );
  }
}

//class MyPageScreen extends StatefulWidget{
//  static const routeName = '/mypageScreen';
//  @override
//
//  MyPageScreenState createState() => MyPageScreenState();
//}
//
//class MyPageScreenState extends State<MyPageScreen>{
//  @override
//  Widget build(BuildContext context){
//    final MyPageArguments args = ModalRoute.of(context).settings.arguments;
//    return Scaffold(
//      appBar : AppBar(
//          title : Text(args._saved[0]),
//      ),
////      body : CarouselSlider(
////        height: 400.0,
////        items: [1,2,3,4,5].map((i) {
////          return Builder(
////            builder: (BuildContext context) {
////              return Container(
////                  width: MediaQuery.of(context).size.width,
////                  margin: EdgeInsets.symmetric(horizontal: 5.0),
////                  decoration: BoxDecoration(
////                      color: Colors.amber
////                  ),
////                  child: Text('text $i', style: TextStyle(fontSize: 16.0),)
////              );
////            },
////          );
////        }).toList(),
////      )
//    );
//  }
//}
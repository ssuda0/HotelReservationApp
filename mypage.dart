import 'package:flutter/material.dart';
import 'model/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'detail.dart';

class MyPageArguments{
  List<Product> _saved = <Product>[];
  MyPageArguments(this._saved);
}


class MyPageScreen extends StatefulWidget{
  static const routeName = '/mypageScreen';
  @override
  MyPageScreenState createState() => MyPageScreenState();
}

class MyPageScreenState extends State<MyPageScreen>{
  @override
  Widget build(BuildContext context){
    final MyPageArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar : AppBar(
        title : Text("My Page"),
      ),
      body : Container(
        margin: EdgeInsets.symmetric(vertical: 40.0),
        child : Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child : Text("My Favorite Hotel List"),
            ),
            _makeCarousel(args._saved),
          ],
        ),

      ),
    );
  }
}
class _makeCarousel extends StatefulWidget{
  List<Product> _saved = <Product>[];
  _makeCarousel(this._saved);
  @override
  _makeCarouselState createState() => _makeCarouselState(_saved);
}

class _makeCarouselState extends State<_makeCarousel>{
  List<Product> _saved = <Product>[];
  _makeCarouselState(this._saved);
  Widget build(BuildContext context){
    return Stack(
        children: [
          CarouselSlider(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            scrollDirection: Axis.horizontal,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            height: 400.0,
            items: _saved.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            new MyCustomRoute(builder: (context) =>DetailScreen(),
                              settings: RouteSettings(
                                arguments: DetailArguments(item, _saved),
                              ),
                            ),
                          );
                          //_createRoute(item, _saved);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: AspectRatio(
                            aspectRatio: 18.0/11.0,
                            child: Image.asset(
                              item.assetName,
                              package: item.assetPackage,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        child : Text(
                            item.name,
                            style : TextStyle(color:Colors.white, fontWeight:FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          )
        ]
    );
  }
}


class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);
  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    Animation<Offset> custom = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)).animate(animation);
    if (settings.isInitialRoute)
      return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new SlideTransition(position: custom, child: child);
  }
}

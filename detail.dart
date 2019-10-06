
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/product.dart';


class DetailArguments{
  List<Product> _saved = <Product>[];
  Product product;
  DetailArguments(this.product, this._saved);
}

class DetailScreen extends StatelessWidget {
  static const routeName = '/detailScreen';

  @override
  Widget build(BuildContext context) {
    final DetailArguments args = ModalRoute.of(context).settings.arguments;
    print('detail$args.product.name');
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 6.0),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 25.0),
                      Icon(Icons.star, color: Colors.yellow, size: 25.0),
                      Icon(Icons.star, color: Colors.yellow, size: 25.0),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 6.0),
                  child: Text(
                    args.product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.blueGrey,
                      ),
                      Text(
                          args.product.location,
                          style:  TextStyle(color:Colors.blueGrey),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(1.0, 0.0, 1.0, 0.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        color: Colors.blueGrey,
                      ),
                      Text(
                          '+42 22 318 28 00',
                          style:  TextStyle(color:Colors.blueGrey)
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        args.product.detailDescription,
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Detail',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
          leading: new IconButton(
            icon: new Icon(Icons.keyboard_backspace),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          children: [
            Stack(
              children: <Widget>[
                Hero(
                  tag: args.product.name,
                  child: Image.asset(
                    args.product.assetName,
                    package: args.product.assetPackage,
                    width: 600,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),

                Container(
                    child : FavoriteWidget(args.product, args._saved),
                )
              ],
            ),

            titleSection,
            Divider(height: 1.0, color: Colors.black),
            textSection,
          ],
        ),
      ),
    );

  }
}


class FavoriteWidget extends StatefulWidget{
  List<Product> _saved = <Product>[];
  Product product;
  FavoriteWidget(this.product, this._saved);
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState(product, _saved);
}

class _FavoriteWidgetState extends State<FavoriteWidget>{
  List<Product> _saved = <Product>[];
  Product product;
  _FavoriteWidgetState(this.product, this._saved);

  Widget build(BuildContext context){
    print(product.assetName);
    bool alreadySaved = _saved.contains(product);
    print(alreadySaved);
    return IconButton(
      padding : EdgeInsets.fromLTRB(350.0, 0.0, 0.0, 0.0),
      icon : (alreadySaved? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
      color: Colors.red,
      onPressed:(){
        setState((){
          if(alreadySaved){
            _saved.remove(product);

          }else{
            _saved.add(product);
          }
        });
      },
    );
  }
}

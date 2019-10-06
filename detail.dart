
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/product.dart';
import 'home.dart';


List<Product> _saved = <Product>[];

class DetailArguments{
  Product product;
  DetailArguments(this.product, _saved);
  //DetailArguments(this.product);
}

class DetailScreen extends StatelessWidget {
  static const routeName = '/detailScreen';
  @override
  Widget build(BuildContext context) {
    final DetailArguments args = ModalRoute.of(context).settings.arguments;

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
                  margin: EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 5.0),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 25.0),
                      Icon(Icons.star, color: Colors.yellow, size: 25.0),
                      Icon(Icons.star, color: Colors.yellow, size: 25.0),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(1.0, 5.0, 0.0, 0.0),
                  child: Row(

                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.blue,
                      ),
                      Text('al. Jerozolimaskie 45, 00-692 Warszawa,'),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(1.0, 0.0, 1.0, 0.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        color: Colors.blue,
                      ),
                      Text('+42 22 318 28 00'),
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
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
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
                  tag: 'detail$this.id',
                  child: Image.asset(
                    args.product.assetName,
                    package: args.product.assetPackage,
                    width: 600,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                    child : FavoriteWidget(args.product),
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
  Product product;
  FavoriteWidget(this.product);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState(this.product);
}

class _FavoriteWidgetState extends State<FavoriteWidget>{
  Product product;
  _FavoriteWidgetState(this.product);


  Widget build(BuildContext context){
    bool alreadySaved = _saved.contains(this.product);

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

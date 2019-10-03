
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget{
  final int id;
  final String assetName;
  final String assetPackage;
  DetailScreen(this.id, this.assetName, this.assetPackage);
  @override
  Widget build(BuildContext context) {
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
                  margin : EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 5.0),
                  child: Row(
                    children: [
                      Icon(Icons.star, color:Colors.yellow, size:25.0),
                      Icon(Icons.star, color:Colors.yellow, size:25.0),
                      Icon(Icons.star, color:Colors.yellow, size:25.0 ),
                    ],
                  ),
                ),
                Container(
                  margin : EdgeInsets.fromLTRB(3.0, 0.0, 5.0, 0.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 0.0),
                  child : Row(

                    children: <Widget> [
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
                    children: <Widget> [
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
          FavoriteWidget(),
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
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
            title: Text('Flutter layout demo'),
            leading : new IconButton(
                icon : new Icon(Icons.keyboard_backspace),
                onPressed:() {
                  Navigator.pop(context);
                },
            ),
        ),
        body: ListView(
          children: [
            Hero(
              tag : 'detail$this.id',
              child : Image.asset(
                this.assetName,
                package: this.assetPackage,
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            titleSection,
            Divider(height:1.0, color:Colors.black),
            textSection,
          ],
        ),
      ),
    );
  }


  }
}


class FavoriteWidget extends StatefulWidget{
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget>{
  bool _isFavorited = true;

  Widget build(BuildContext context){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children:[
        Container(
          padding: EdgeInsets.all((0)),
          child: IconButton(
            icon : (_isFavorited? Icon(Icons.favorite_border) : Icon(Icons.favorite)),
            color: Colors.red,
            onPressed: _toggleFavorite,
          )
        )
      ],
    );
  }

  void _toggleFavorite(){
    setState((){
      if(_isFavorited){
        _isFavorited = false;
      }else{
        _isFavorited = true;
      }
    });
  }

}
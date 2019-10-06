import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'model/product.dart';


class FavoriteHotelArguments{
  List<Product> _saved = <Product>[];
  FavoriteHotelArguments(this._saved);
}

class FavoriteHotelScreen extends StatefulWidget{
  static const routeName = '/favoriteHotelScreen';
  @override
  FavoriteHotelScreenState createState() => FavoriteHotelScreenState();
}


class FavoriteHotelScreenState extends State<FavoriteHotelScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title : Text('Favorite Hotel Screen'),
      ),
      body: _makeListView(),
    );

  }


  Widget _makeListView(){
    final FavoriteHotelArguments args = ModalRoute.of(context).settings.arguments;
    return ListView.builder(
        itemCount: args._saved.length,
        itemBuilder: (context, index){
          //return _buildRow(args._saved[index].name, index);
          return _buildRow(args._saved, index);
        }
    );
  }

  Widget _buildRow(List<Product> _saved, int index){
    String assetName = _saved[index].name;
    return Dismissible(
      key : Key(assetName),
      onDismissed: (direction) {
        // Remove the item from the data source.
        setState(() {
          _saved.removeAt(index);
        });

        // Then show a snackbar.
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("$assetName dismissed")));
      },
      // Show a red background as the item is swiped away.
      background: Container(color: Colors.red),
      child: ListTile(title: Text('$assetName')),
    );
  }
}


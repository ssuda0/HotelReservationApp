import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'model/product.dart';

List<Product> _saved = <Product>[];
class FavoriteHotelArguments{
  FavoriteHotelArguments(_saved);
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
        itemCount: _saved.length,
        itemBuilder: (context, index){
          //return _buildRow(args._saved[index].name, index);
          return _buildRow(_saved, index);
        }
    );
  }

  Widget _buildRow(List<Product> _saved, int index){
    return Dismissible(
      key : Key(_saved[index].name),
      onDismissed: (direction) {
        // Remove the item from the data source.
        setState(() {
          _saved.removeAt(index);
        });

        // Then show a snackbar.
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("$_saved[index].name dismissed")));
      },
      // Show a red background as the item is swiped away.
      background: Container(color: Colors.red),
      child: ListTile(title: Text('$_saved[index].name')),
    );
  }
}


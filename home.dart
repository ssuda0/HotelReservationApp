// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/products_repository.dart';
import 'model/product.dart';


class HomePage extends StatelessWidget {
  // TODO: Make a collection of cards (102)
  List<Card> _buildGridCards(BuildContext context){
    List<Product> products = ProductsRepository.loadProducts(Category.all);
    if(products == null || products.isEmpty){
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString()
    );

    return products.map((product){
      return  Card(
        clipBehavior: Clip.antiAlias, //align the text to the leading edge
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
          children: <Widget>  [
            AspectRatio(
              aspectRatio: 18.0/11.0,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child : Padding(
                padding: EdgeInsets.fromLTRB(2.0, 3.0, 0.0, 7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin : EdgeInsets.fromLTRB(13.0, 0.0, 0.0, 0.0),
                      child: Row(
                        children: [
                          Icon(Icons.star, color:Colors.yellow, size:15.0),
                          Icon(Icons.star, color:Colors.yellow, size:15.0),
                          Icon(Icons.star, color:Colors.yellow, size:15.0 ),
                        ],
                      ),
                    ),
                    Container(
                      margin : EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 0.0),
                      child: Text(
                        product.name,
                        //style: theme.textTheme.title,
                        style: TextStyle(
                          fontSize : 15,
                          fontWeight : FontWeight.bold,
                        ),
                        maxLines:1,
                      ),
                    ), //SizedBox(height:3.0),
                    Row(
                      children :[
                        Container(
                            margin : EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 0.0),
                            child: Icon(Icons.location_on, color:Colors.blue)
                        ),
                        Text(
                          //formatter.format(product.price),
                          "this hotel is fantastic",
                          //style: theme.textTheme.subtitle,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),

                    Flexible(
                      child:Row(
                        children:<Widget>[
                          SizedBox(width:90.0, height:2.0),
                          FlatButton(
                              child: Text("more", style:TextStyle(color:Colors.blue)),
                              onPressed:() {
                                Navigator.pushNamed(context, "/detailScreen");
                              }
                          ),
                        ],
                      ),

                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  ListTile _getListTile(BuildContext context, String iconName, IconData  iconThis, String pushContext){
    return ListTile(
      leading : Icon(
        iconThis,
        semanticLabel : iconName,
      ),
      title: Text(iconName),
      onTap: () {
        if (pushContext == 'home') {
          Navigator.pop(context);
        } else {
          Navigator.pushNamed(context, pushContext);
        }
      },
    );
  }

  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    return Scaffold(
      // TODO: Add app bar (102)
      appBar: AppBar(
//        leading : IconButton(
//          icon : Icon(
//            Icons.menu,
//            semanticLabel : 'menu',
//          ),
//          onPressed: (){
//            print('Menu button');
//          },
//        ),
        title: Text('SHRINE'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: (){
              Navigator.pushNamed(context, "/searchScreen");
            },
          ),
          IconButton(
            icon: Icon(
              Icons.language,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              Navigator.pushNamed(context, "/websiteScreen");
            },
          ),
        ],
      ),
      // TODO: Add a grid view (102)
      body: OrientationBuilder(
        builder: (context, orientation){
          return GridView.count(
              crossAxisCount: orientation == Orientation.portrait? 2 : 3,
              padding: EdgeInsets.all(16.0),
              childAspectRatio: 8.0 / 9.0,
              //TODO: Build a grid of cards (102)
              children : _buildGridCards(context)
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding :EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Pages'),
              decoration : BoxDecoration(
                color : Colors.blue,
              ),
            ),
            _getListTile(context, "Home", Icons.home, 'home'),
            _getListTile(context, "Search", Icons.search, '/searchScreen'),
            _getListTile(context, "Favorite Motel", Icons.location_city, '/favoriteMotelScreen'),
            _getListTile(context, "Website", Icons.language, '/websiteScreen'),
            _getListTile(context, "My Page", Icons.person, '/mypageScreen'),
          ],
        ),
      ),
      // TODO: Set resizeToAvoidBottomInset (101)
      resizeToAvoidBottomInset:  false,
    );
  }
}


class DetailScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
          title : Text('Detail Screen')
      ),
    );
  }
}

class SearchScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
          title : Text('Search Screen')
      ),
    );
  }
}

class FavoriteMotelScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
          title : Text('FavoriteMotel Screen')
      ),
    );
  }
}

class WebsiteScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
          title : Text('Website Screen')
      ),
    );
  }
}


class MyPageScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
          title : Text('Mypage Screen')
      ),
    );
  }
}
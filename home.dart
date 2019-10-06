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

import 'package:Shrine/favorite.dart';
import 'package:Shrine/mypage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/products_repository.dart';
import 'model/product.dart';

import 'detail.dart';

final List<Product> _saved = <Product>[];

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage> {
  List<Card> _buildGridCards(BuildContext context){
    List<Product> products = ProductsRepository.loadProducts(Category.accessories);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>  [
            Hero(
              tag : product.name,
              child : AspectRatio(
                aspectRatio: 18.0/11.0,
                child: Image.asset(
                  product.assetName,
                  package: product.assetPackage,
                  fit: BoxFit.fitWidth,
                ),
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
                    ),
                    Flexible(
                      child : Row(
                        children :[
                          Container(
                              margin : EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 0.0),
                              child: Icon(Icons.location_on, color:Colors.blue)
                          ),
                          Text(
                            product.location,
                            //style: theme.textTheme.subtitle,
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child:Row(
                        children:<Widget>[
                          SizedBox(width:90.0, height:2.0),
                          FlatButton(
                            child: Text("more", style:TextStyle(color:Colors.blue)),
                            onPressed:() {
                              //Navigator.pushNamed(context, DetailScreen.routeName, arguments: DetailArguments(product ,_saved));
                              Navigator.pushNamed(context, DetailScreen.routeName, arguments: DetailArguments(product, _saved));
                            },
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

  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MakeDrawer(),
      appBar: AppBar(
        leading : IconButton(
          icon : Icon(
            Icons.menu,
          ),
          onPressed:(()=>_scaffoldKey.currentState.openDrawer()),
        ),
        title: Center(
          child : Text('Main'),
        ),
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
      resizeToAvoidBottomInset:  false,
    );
  }
}


class MakeDrawer extends StatelessWidget{
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              margin: EdgeInsets.only(top: 90.0, left: 20.0),
              child: Text(
                'Pages',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          _getListTile(context, "Home", Icons.home, 'home', null),
          _getListTile(context, "Search", Icons.search, '/searchScreen', null),
          _getListTile(context, "Favorite Hotel", Icons.location_city,
              '/favoriteHotelScreen', FavoriteHotelArguments(_saved)),
          _getListTile(
              context, "Website", Icons.language, '/websiteScreen', null),
          _getListTile(context, "My Page", Icons.person, '/mypageScreen',
              MyPageArguments(_saved)),
        ],
      ),
    );
  }
  ListTile _getListTile(BuildContext context, String iconName, IconData  iconThis, String pushContext, argument){
    return ListTile(
      leading : Icon(
        iconThis,
        color: Colors.blue,
        semanticLabel : iconName,
      ),
      title: Text(
        iconName,
        style :TextStyle(color:Colors.grey),
      ),
      onTap: () {
        if (pushContext == 'home') {
          Navigator.pop(context);
        } else {
          Navigator.pushNamed(context, pushContext, arguments:argument);
        }
      },
    );
  }
}

class RadialExpansion extends StatelessWidget {
  RadialExpansion({
    Key key,
    this.maxRadius,
    this.child,
  }) : clipRectSize = 2.0 * (maxRadius),
        super(key: key);

  final double maxRadius;
  final clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,  // Photo
          ),
        ),
      ),
    );
  }
}
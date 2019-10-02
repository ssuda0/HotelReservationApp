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
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18/11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child : Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.name,
                      style: theme.textTheme.title,
                      maxLines:1,
                    ),
                    SizedBox(height:8.0),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.body2,
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
        title: Text('SHRINE'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: (){
              print('Search buton');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: (){
              print('Filter button');
            },
          ),
        ],
      ),
      // TODO: Add a grid view (102)
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        //TODO: Build a grid of cards (102)
        children : _buildGridCards(context)
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
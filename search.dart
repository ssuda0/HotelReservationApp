
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
          title : Text('Search'),
      ),
      body : Criterias(),
    );
  }
}


class Criterias extends StatefulWidget {
  CriteriaState createState() => new CriteriaState();
}

class NewItem {
  bool isExpanded;
  final String header;
  final Widget body;
  NewItem(this.isExpanded, this.header, this.body);
}

double discretevalue = 2.0;
double hospitaldiscretevalue = 25.0;

class CriteriaState extends State<Criterias> {
  List<NewItem> items = <NewItem>[
    new NewItem(
      false,
      'Location',
      new Padding(
          padding: new EdgeInsets.all(20.0),
          child: new Column(
              children: <Widget>[

                Text("select location"),
                MakeRadioButton(),
              ])
      ),
    ),

    new NewItem(
      false,
      'Class',
      new Padding(
          padding: new EdgeInsets.all(20.0),
          child: new Column(
              children: <Widget>[
                Text("select hotel Classes"),

                //put the children here
              ])
      ),
    ), //give all your items here
  ];

  ListView List_Criteria;
  Widget build(BuildContext context) {
    List_Criteria = new ListView(
      children: [
          new ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                items[index].isExpanded = !items[index].isExpanded;
              });
            },
            children: items.map((NewItem item) {
              return new ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return new ListTile(
                      title: new Text(
                        item.header,
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ));
                },
                isExpanded: item.isExpanded,
                body: item.body,
              );
            }).toList(),
          ),
      ],
    );

    Scaffold scaffold = new Scaffold(
      body: List_Criteria,
    );
    return scaffold;
  }
}

class MakeRadioButton extends StatefulWidget {
  @override
  _MyRadioButtonState createState() => _MyRadioButtonState();
}
enum SingingCharacter { Seoul, Busan, Daegu }
class _MyRadioButtonState extends State<MakeRadioButton>{
  SingingCharacter _character = SingingCharacter.Seoul;
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Seoul'),
            leading: Radio(
              value: SingingCharacter.Seoul,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Busan'),
            leading: Radio(
              value: SingingCharacter.Busan,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Daegu'),
            leading: Radio(
              value: SingingCharacter.Daegu,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title : Text('Search'),
      ),
      body : ConditionSearch(),
    );
  }
}
class ConditionSearch extends StatefulWidget {
  ConditonSearchState createState() => new ConditonSearchState();
}

class NewItem {
  bool isExpanded;
  final String header;
  final Widget body;
  NewItem(this.isExpanded, this.header, this.body);
}

double discretevalue = 2.0;
double hospitaldiscretevalue = 25.0;

class ConditonSearchState extends State<ConditionSearch> {
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
                MakeCheckBox(),
                //put the children here
              ])
      ),
    ), //give all your items here

    new NewItem(
      false,
      'Date',
      new Padding(
        padding: new EdgeInsets.all(20.0),
        child : MakeTimeDatePicker(),
      ),
    ), //give all your items here

    new NewItem(
      false,
      'Fee',
      new Padding(
        padding: new EdgeInsets.all(20.0),
      ),
    ),
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

class MakeTimeDatePicker extends StatefulWidget{
  @override
  _MakeTimeDatePickerState createState() => _MakeTimeDatePickerState();
}

class _MakeTimeDatePickerState extends State<MakeTimeDatePicker>{
  Widget build(BuildContext context){
    return Column(
      children : <Widget>[
        MakePicker("check-in"),
        MakePicker("check-out"),
      ],
    );
  }
}

class MakePicker extends StatelessWidget{
  final String checkinout;
  MakePicker(this.checkinout);
  Widget build(BuildContext context){
    return Row(
      children: <Widget>[
        Column(
          children : <Widget>[
            Row(
              children : <Widget>[
                Icon(Icons.calendar_today, color:Colors.pinkAccent, size:25.0),
                Text(this.checkinout),
              ],
            ),
            Text("2018.10.05(FRI)\n9:30am"),
          ],
        ),
        Column(
            children :<Widget>[
              RaisedButton(
                child : Text('select date'),
                onPressed: (){
                  return showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2018),
                    lastDate: DateTime(2030),
                    builder: (BuildContext context, Widget child) {
                      return Theme(
                        data: ThemeData.light(),
                        child: child,
                      );
                    },
                  );
                },
              ),
              RaisedButton(
                child: Text('select time'),
                onPressed: (){
                  return showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    builder: (BuildContext context, Widget child) {
                      return Theme(
                        data: ThemeData.light(),
                        child: child,
                      );
                    },
                  );
                },
              ),
            ]
        ),
      ],
    );
  }
}

class MakeCheckBox extends StatefulWidget{
  @override
  _MakeCheckBoxState createState() => _MakeCheckBoxState();
}

class _MakeCheckBoxState extends State<MakeCheckBox>{
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;
  bool _value5 = false;

  void _value1Changed(bool value) => setState(() => _value1 = value);
  void _value2Changed(bool value) => setState(() => _value2 = value);
  void _value3Changed(bool value) => setState(() => _value3 = value);
  void _value4Changed(bool value) => setState(() => _value4 = value);
  void _value5Changed(bool value) => setState(() => _value5 = value);

  Widget build(BuildContext context){
    return new Column(
      children: <Widget>[
        new CheckboxListTile(
          value: _value1,
          onChanged: _value1Changed,
          title: new Row(
            children: <Widget>[
              Icon(Icons.star, color:Colors.yellow, size:25.0),
              Icon(Icons.star, color:Colors.yellow, size:25.0),
              Icon(Icons.star, color:Colors.yellow, size:25.0 ),
              Icon(Icons.star, color:Colors.yellow, size:25.0 ),
              Icon(Icons.star, color:Colors.yellow, size:25.0 ),
            ],
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        new CheckboxListTile(
          value: _value2,
          onChanged: _value2Changed,
          title: new Row(
            children: <Widget>[
              Icon(Icons.star, color:Colors.yellow, size:25.0),
              Icon(Icons.star, color:Colors.yellow, size:25.0),
              Icon(Icons.star, color:Colors.yellow, size:25.0 ),
              Icon(Icons.star, color:Colors.yellow, size:25.0 ),
            ],
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        new CheckboxListTile(
          value: _value3,
          onChanged: _value3Changed,
          title: new Row(
            children: <Widget>[
              Icon(Icons.star, color:Colors.yellow, size:25.0),
              Icon(Icons.star, color:Colors.yellow, size:25.0),
              Icon(Icons.star, color:Colors.yellow, size:25.0 ),
            ],
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        new CheckboxListTile(
          value: _value4,
          onChanged: _value4Changed,
          title: new Row(
            children: <Widget>[
              Icon(Icons.star, color:Colors.yellow, size:25.0),
              Icon(Icons.star, color:Colors.yellow, size:25.0),
            ],
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        new CheckboxListTile(
          value: _value5,
          onChanged: _value5Changed,
          title: new Row(
            children: <Widget>[
              Icon(Icons.star, color:Colors.yellow, size:25.0),
            ],
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),

      ],
    );
  }
}

class MakeRadioButton extends StatefulWidget {
  @override
  _MakeRadioButtonState createState() => _MakeRadioButtonState();
}
enum SingingCharacter { Seoul, Busan, Daegu }
class _MakeRadioButtonState extends State<MakeRadioButton>{
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

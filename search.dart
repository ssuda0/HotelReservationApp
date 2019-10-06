
import 'package:flutter/material.dart';
import 'dart:async';

int slider_value = 0;
DateTime selectedDateStart = DateTime.now();
TimeOfDay selectedTimeStart = TimeOfDay.now();
DateTime selectedDateEnd = DateTime.now();
TimeOfDay selectedTimeEnd = TimeOfDay.now();
String start_date = "${selectedDateStart.year.toString()}-${selectedDateStart.month.toString().padLeft(2,'0')}-${selectedDateStart.day.toString().padLeft(2,'0')}";
String start_time = "${selectedTimeStart.hour}:${selectedTimeStart.minute}";
String end_date = "${selectedDateEnd.year.toString()}-${selectedDateEnd.month.toString().padLeft(2,'0')}-${selectedDateEnd.day.toString().padLeft(2,'0')}";
String end_time = "${selectedTimeEnd.hour}:${selectedTimeEnd.minute}";
String location = "Seoul";
bool value1 = false;
bool value2 = false;
bool value3 = false;
bool value4 = false;
bool value5 = false;



class SearchScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title : Text('Search'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ConditionSearch(),
          ),
          MakeRaisedButton(),
        ],
      ) ,
    );
  }
}


class MakeRaisedButton extends StatefulWidget{
  @override
  MakeRaisedButtonState createState() => MakeRaisedButtonState();
}

class MakeRaisedButtonState extends State<MakeRaisedButton> {
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: () {
        _ackAlert(context);
      },
      child: const Text("Search"),
    );
  }

  Future<void> _ackAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Please check your choice:)'),
          content: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.location_on, color: Colors.blue, size: 25.0),
                  Expanded(
                    child : Text(location),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Icon(Icons.star, color: Colors.yellow, size: 25.0),
                    padding : new EdgeInsets.only(right :10),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child : Row(
                      children: <Widget>[
                        value1==true? Container(
                          child : Row(
                            children: <Widget>[
                              Icon(Icons.star, color:Colors.yellow, size:20.0),
                              Icon(Icons.star, color:Colors.yellow, size:20.0),
                              Icon(Icons.star, color:Colors.yellow, size:20.0 ),
                              Icon(Icons.star, color:Colors.yellow, size:20.0 ),
                              Icon(Icons.star, color:Colors.yellow, size:20.0 ),
                            ],
                          ),
                          padding : new EdgeInsets.only(right :10),
                        ) : Text(""),
                        value2==true? Container(
                          child : Row(
                            children: <Widget>[
                              Icon(Icons.star, color:Colors.yellow, size:20.0),
                              Icon(Icons.star, color:Colors.yellow, size:20.0),
                              Icon(Icons.star, color:Colors.yellow, size:20.0 ),
                              Icon(Icons.star, color:Colors.yellow, size:20.0 ),
                            ],
                          ),
                          padding : new EdgeInsets.only(right :10),
                        ) : Text(""),
                        value3==true?  Container(
                          child : Row(
                            children: <Widget>[
                              Icon(Icons.star, color:Colors.yellow, size:20.0),
                              Icon(Icons.star, color:Colors.yellow, size:20.0),
                              Icon(Icons.star, color:Colors.yellow, size:20.0 ),
                            ],
                          ),
                          padding : new EdgeInsets.only(right :10),
                        ) : Text(""),
                        value4==true? Container(
                          child : Row(
                            children: <Widget>[
                              Icon(Icons.star, color:Colors.yellow, size:20.0),
                              Icon(Icons.star, color:Colors.yellow, size:20.0),
                            ],
                          ),
                          padding : new EdgeInsets.only(right :10),
                        ) : Text(""),
                        value5==true?  Container(
                          child : Row(
                            children: <Widget>[
                              Icon(Icons.star, color:Colors.yellow, size:20.0),
                            ],
                          ),
                          padding : new EdgeInsets.only(right :10),
                        ) : Text(""),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: <Widget>[
                  Icon(Icons.date_range, color : Colors.blue, size : 25.0),
                  Column(
                    children: <Widget>[
                          Text("IN  $start_date $start_time"),
                          Text("OUT  $end_date $end_time"),
                    ],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.attach_money, color : Colors.blue, size : 25.0),
                  Text("$slider_value"),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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

class ConditonSearchState extends State<ConditionSearch> {
  List<NewItem> items = <NewItem>[
    new NewItem(
      false,
      'Location',
      new Container(
        //padding: new EdgeInsets.all(20.0),
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
    ),

    new NewItem(
      false,
      'Fee',
      new Padding(
        padding: new EdgeInsets.all(20.0),
        child : MakeSlider(),
      ),
    ),
  ];

  Widget build(BuildContext context){
    return Container(
      child : _buildPanel(),
    );
  }

  //ListView List_Criteria;
  Widget _buildPanel() {
    return ListView(
      children: [
        new ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              items[index].isExpanded = !items[index].isExpanded;
            });
          },
          children: items.map<ExpansionPanel>((NewItem item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(
                    item.header,
                  ),
                );

              },
              isExpanded: item.isExpanded,
              body: item.body,
            );
          }).toList(),
        ),
      ],
    );
  }
}

class MakeSlider extends StatefulWidget{
  @override
  _MakeSliderState createState() => _MakeSliderState();
}
class _MakeSliderState extends State<MakeSlider>{
  int _duelCommandment = 4;
  @override
  Widget build(BuildContext context) {
    return Center(
      child : Column(
        children : <Widget>[
          Text("\$$_duelCommandment"),
          Slider(
            value: _duelCommandment.toDouble(),
            min: 1.0,
            max: 200.0,
            divisions: 200,
            label: '$_duelCommandment',
            onChanged: (double newValue) {
              setState(() {
                _duelCommandment = newValue.round();
                slider_value = _duelCommandment;
              });
            },
          ),
        ],
      ),
    );
  }
}


class MakeTimeDatePicker extends StatefulWidget{
  @override
  _MakeTimeDatePickerState createState() => _MakeTimeDatePickerState();
}

class _MakeTimeDatePickerState extends State<MakeTimeDatePicker> {
  Future<Null> _selectDate(BuildContext context, int start) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if(picked!=null)
      setState(() {
        if(start==1)
          selectedDateStart = picked;
        else
          selectedDateEnd = picked;
      });
  }

  Future<Null> _selectTime(BuildContext context, int start) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now());
    if(picked!=null)
      setState(() {
        if(start==1)
          selectedTimeStart = picked;
        else
          selectedTimeEnd = picked;
      });
  }

  Widget MakePicker(BuildContext context, String checkinout, int start) {
    start_date =  "${selectedDateStart.year.toString()}-${selectedDateStart.month.toString().padLeft(2,'0')}-${selectedDateStart.day.toString().padLeft(2,'0')}";
    start_time = "${selectedTimeStart.hour}:${selectedTimeStart.minute}";
    end_date = "${selectedDateEnd.year.toString()}-${selectedDateEnd.month.toString().padLeft(2,'0')}-${selectedDateEnd.day.toString().padLeft(2,'0')}";
    end_time = "${selectedTimeEnd.hour}:${selectedTimeEnd.minute}";
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(Icons.date_range,color:Colors.pinkAccent, size:25.0),
                    (start==1)?Text("$start_date\n$start_time"):Text("$end_date\n$end_time"),
                  ],
                ),
                Column(
                    children: <Widget>[
                      RaisedButton(
                        child: Text('select date'),
                        onPressed: () => _selectDate(context, start),
                      ),
                      RaisedButton(
                        child: Text('select time'),
                        onPressed: () => _selectTime(context, start),
                      ),
                    ]
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MakePicker(context, "check-in", 1),
        MakePicker(context, "check-out", 0),
      ],
    );
  }
}

class MakeCheckBox extends StatefulWidget{
  @override
  _MakeCheckBoxState createState() => _MakeCheckBoxState();
}

class _MakeCheckBoxState extends State<MakeCheckBox>{


  void _value1Changed(bool value) => setState(() => value1 = value);
  void _value2Changed(bool value) => setState(() => value2 = value);
  void _value3Changed(bool value) => setState(() => value3 = value);
  void _value4Changed(bool value) => setState(() => value4 = value);
  void _value5Changed(bool value) => setState(() => value5 = value);

  Widget build(BuildContext context){
    return new Column(
      children: <Widget>[
        new CheckboxListTile(
          value: value1,
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
          value: value2,
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
          value: value3,
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
          value: value4,
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
          value: value5,
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
                  location = 'Seoul';
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
                  location = 'Busan';
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
                  location = 'Daegu';
                });
              },
            ),
          ),
        ],
      ),
    );
  }

}

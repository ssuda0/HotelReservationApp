
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';

int slider_value = 0;

DateTime selectedDateStart = DateTime.now();
TimeOfDay selectedTimeStart = TimeOfDay.now();
DateTime selectedDateEnd = DateTime.now();
TimeOfDay selectedTimeEnd = TimeOfDay.now();
DateTime date = DateTime.now();
String start_date = DateFormat('yyyy-MM-dd (E)').format(date);
String start_time = DateFormat('hh:mm').format(date);
String end_date =DateFormat('yyyy-MM-dd (E)').format(date);
String end_time = DateFormat('hh:mm').format(date);
String location = "Seoul";
bool value1 = false;
bool value2 = false;
bool value3 = false;
bool value4 = false;
bool value5 = false;



class SearchScreen extends StatelessWidget{
  static const routeName = '/searchScreen';
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title : Center(
          child : Text('Search'),
        ),
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
      child: Center(
        child : const Text("Search"),
      ),
    );
  }

  Future<void> _ackAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Container(
            //height : MediaQuery.of(context).size.height,
            //width: MediaQuery.of(context).size.width,
            color:Colors.blue,
            child : Text(
              'Please check your choice:)',
              style : TextStyle(color: Colors.white),
            ),

          ),
          content: Container(
            width : MediaQuery.of(context).size.width,
            height : 200.0,
            child : Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding : EdgeInsets.only(bottom:5.0,right:20.0),
                      child : Icon(Icons.location_on, color: Colors.blue, size: 25.0),
                    ),
                    Expanded(
                      child : Center(
                        child : Text(location),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: Icon(Icons.star, color: Colors.amber, size: 25.0),
                      padding : new EdgeInsets.only(bottom:5.0,right:20.0),
                    ),
                     Row(
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
                  ],
                ),

                Row(
                  children: <Widget>[
                    Container(
                      margin : EdgeInsets.only(bottom:5.0,right:20.0 ),
                      child : Icon(Icons.date_range, color : Colors.blue, size : 25.0),
                    ),

                    Expanded(
                      child : Column(
                        children: <Widget>[
                          Text("IN $start_date $start_time"),
                          Text("OUT $end_date $end_time"),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding : new EdgeInsets.only(bottom:5.0,right:20.0),
                      child : Icon(Icons.attach_money, color : Colors.blue, size : 25.0),
                    ),
                    Expanded(
                      child :Center(
                        child : Text("$slider_value"),
                      ),
                    ),

                  ],
                ),
              ],
            ),
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
  final String subHeader;
  final Widget body;
  NewItem(this.isExpanded, this.header,  this.subHeader, this.body);
}

class ConditonSearchState extends State<ConditionSearch> {
  List<NewItem> items = <NewItem>[
    new NewItem(
      false,
      'Location',
      'select location',
      new Container(
        //padding: new EdgeInsets.all(20.0),
          child: new Column(
              children: <Widget>[
                MakeRadioButton(),
              ])
      ),
    ),

    new NewItem(
      false,
      'Class',
      'select hotel classes',
      new Padding(
          padding: new EdgeInsets.all(20.0),
          child: new Column(
              children: <Widget>[
                MakeCheckBox(),
                //put the children here
              ])
      ),
    ), //give all your items here

    new NewItem(
      false,
      'Date',
      ' ',
      new Padding(
        padding: new EdgeInsets.all(20.0),
        child : MakeTimeDatePicker(),
      ),
    ),

    new NewItem(
      false,
      'Fee',
      ' ',
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
                  title: Row(
                    children: <Widget>[
                      Text(item.header, style:TextStyle(fontWeight:FontWeight.bold)),
                      Expanded(
                        child : Center(
                          child : Text(
                            item.subHeader,
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ],
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
    TimeOfDay selectedTimeStart = TimeOfDay.now();
    TimeOfDay selectedTimeEnd = TimeOfDay.now();
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now());
    if(picked!=null)
      setState(() {
        if(start==1) {
          selectedTimeStart = picked;
          selectedDateStart = DateTime(selectedDateStart.year, selectedDateStart.month, selectedDateStart.day, selectedTimeStart.hour, selectedTimeStart.minute);
        }
        else {
          selectedTimeEnd = picked;
          selectedDateEnd = DateTime(selectedDateEnd.year, selectedDateEnd.month, selectedDateEnd.day, selectedTimeEnd.hour, selectedTimeEnd.minute);
        }
      });
  }

  Widget MakePicker(BuildContext context, String checkinout, int start) {
    start_date = DateFormat('yyyy-MM-dd (E)').format(selectedDateStart);
    start_time = DateFormat('hh:mm').format(selectedDateStart);
    end_date =DateFormat('yyyy-MM-dd (E)').format(selectedDateEnd);
    end_time = DateFormat('hh:mm').format(selectedDateEnd);
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left:10.0, right:30.0),
                  child : Column(
                    children: <Widget>[
                      Icon(Icons.date_range,color:Colors.pinkAccent, size:25.0),
                      (start==1)?Text("$start_date\n$start_time"):Text("$end_date\n$end_time"),
                    ],
                  ),
                ),

                Column(
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: 200.0,
                        child : RaisedButton(
                          child: Text('select date'),
                          onPressed: () => _selectDate(context, start),
                          color: Colors.white70,
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 200.0,
                        child : RaisedButton(
                          child: Text('select time'),
                          onPressed: () => _selectTime(context, start),
                          color: Colors.white70,
                        ),
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
        SizedBox(height:15.0, width:2.0),
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
    return Container(
      padding : EdgeInsets.only(left:70.0),
      child : Column(
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
      ),
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
      child: Container(
        padding : EdgeInsets.only(left:70.0),
        child :Column(
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
      ),
    );
  }

}

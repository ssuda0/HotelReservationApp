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

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: Add text editing controllers (101)
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0),
                Text('SHRINE'),
              ],
            ),
            SizedBox(height: 120.0),
            // TODO: Wrap Username with AccentColorOverride (103)
            // TODO: Remove filled: true values (103)
            // TODO: Wrap Password with AccentColorOverride (103)
            // TODO: Add TextField widgets (101)

            TextField(
              controller: _usernameController,
              decoration : InputDecoration(
                filled : true,
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration : InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText:  true,
            ),

            // TODO: Add button bar (101)
            ButtonBar(
              mainAxisSize: MainAxisSize.max,
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("CACNCEL"),
                  onPressed:(){
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                FlatButton(
                    child: Text("Sign Up"),
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpRoute()),
                      );
                    }
                ),
                RaisedButton(
                  child: Text('NEXT'),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpRoute extends StatefulWidget {
  @override
  SignUpRouteState createState() {
    return SignUpRouteState();
  }
}

class SignUpRouteState extends State<SignUpRoute>{
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  TextFormField _makeTextField(BuildContext context, String label, bool flag, TextEditingController controllers) {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter ' + label;
        }
        return null;
      },
      controller: controllers,
      decoration: InputDecoration(
        filled: true,
        labelText: label,
      ),
      obscureText: flag,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              SizedBox(height: 100.0),
              _makeTextField(context,'Username',false, _usernameController),
              SizedBox(height: 12.0),
              _makeTextField(context,'Password', true, _passwordController),
              SizedBox(height: 12.0),
              _makeTextField(context,'Confirm Password', true, _confirmController),
              SizedBox(height: 12.0),
              _makeTextField(context, 'Email Address', false, _emailController),
              ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    child: Text('SIGN UP'),
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}

// TODO: Add AccentColorOverride (103)

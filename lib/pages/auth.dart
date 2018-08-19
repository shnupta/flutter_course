import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _email;
  String _password;
  bool _acceptValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (String value) {
              setState(() {
                _email = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            obscureText: true,
            onChanged: (String value) {
              setState(() {
                _password = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Accept Terms'),
            onChanged: (bool value) {
              setState(() {
                _acceptValue = value;
              });
            },
            value: _acceptValue,
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text('LOGIN'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/products');
            },
          ),
        ]),
      ),
    );
  }
}

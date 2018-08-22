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
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
            image: AssetImage('assets/background.jpg'),
          ),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                fillColor: Colors.white,
                filled: true,
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (String value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                fillColor: Colors.white,
                filled: true,
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
          ])),
        ),
      ),
    );
  }
}

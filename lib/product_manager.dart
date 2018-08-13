import 'package:flutter/material.dart';

import 'products.dart';

class ProductManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = ['Food Tester'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          child: RaisedButton(
            child: Text('Add Button'),
            onPressed: () {
              setState(() {
                _products.add('Advanced Food Tester');
              });
            },
          ),
        ),
        Products(_products),
      ],
    );
  }
}

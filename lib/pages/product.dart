import 'package:flutter/material.dart';

import 'dart:async';

import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_course/scoped-models/main.dart';

import 'package:flutter_course/models/product.dart';
import 'package:flutter_course/widgets/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;

  ProductPage(this.productIndex);

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This action cannot be undone'),
            actions: <Widget>[
              FlatButton(
                child: Text('Delete'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ),
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Widget _buildProductDetailsView(Product product) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TitleDefault(product.title),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0),
              child: Text(
                "${product.location} | \$${product.price}",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Oswald',
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Text(product.description),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed!');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget widget, MainModel model) {
          final Product product = model.products[productIndex];
          return Scaffold(
            appBar: AppBar(
              title: Text(
                product.title,
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _showWarningDialog(context),
                ),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(product.image),
                ),
                _buildProductDetailsView(product),
              ],
            ),
          );
        },
      ),
    );
  }
}

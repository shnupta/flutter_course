import 'package:flutter/material.dart';

import 'package:flutter_course/pages/product_edit.dart';

import 'package:flutter_course/scoped-models/main.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductListPage extends StatelessWidget {
  Widget _buildEditButton(BuildContext context, int index, MainModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.selectProduct(index);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ProductEditPage();
            },
          ),
        ).then((_) => model.selectProduct(null));
      },
    );
  }

  Widget _buildDismissibleBackground() {
    return Container(
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              onDismissed: (DismissDirection dismissDirection) {
                if (dismissDirection == DismissDirection.startToEnd) {
                  model.selectProduct(index);
                  model.deleteProduct();
                }
              },
              direction: DismissDirection.startToEnd,
              background: _buildDismissibleBackground(),
              key: Key(model.allproducts[index].title),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(model.allproducts[index].image),
                    ),
                    title: Text(model.allproducts[index].title),
                    subtitle:
                        Text('\$${model.allproducts[index].price.toString()}'),
                    trailing: _buildEditButton(context, index, model),
                  ),
                  Divider(),
                ],
              ),
            );
          },
          itemCount: model.allproducts.length,
        );
      },
    );
  }
}

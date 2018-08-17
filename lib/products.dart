import 'package:flutter/material.dart';

import 'pages/product.dart';

class Products extends StatelessWidget {
  Products(this.products, {this.deleteProduct}) {
    print("[Products Widget] Constructor");
  }

  final List<Map<String, String>> products;
  final Function deleteProduct;

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          Text(products[index]['image']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Details',
                ),
                onPressed: () => Navigator
                        .pushNamed<bool>(
                      context,
                      '/product/' + index.toString(),
                    )
                        .then((bool value) {
                      if (value) {
                        deleteProduct(index);
                      }
                    }),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductLists() {
    Widget productCards = Center(
      child: Text('No products found.'),
    );
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    }

    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    print("[Products Widget] build()");

    return _buildProductLists();
  }
}

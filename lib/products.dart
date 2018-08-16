import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  Products([this.products = const []]) {
    print("[Products Widget] Constructor");
  }

  final List<String> products;

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          Text(products[index]),
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

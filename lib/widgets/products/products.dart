import 'package:flutter/material.dart';

import 'product_card.dart';


class Products extends StatelessWidget {
  Products(this.products) {
    print("[Products Widget] Constructor");
  }

  final List<Map<String, dynamic>> products;

  Widget _buildProductLists() {
    Widget productCards = Center(
      child: Text('No products found.'),
    );
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) => ProductCard(products[index], index),
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

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'product_card.dart';
import '../../models/product.dart';
import 'package:flutter_course/scoped-models/products.dart';

class Products extends StatelessWidget {
  Widget _buildProductLists(List<Product> products) {
    Widget productCards = Center(
      child: Text('No products found.'),
    );
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index], index),
        itemCount: products.length,
      );
    }

    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    print("[Products Widget] build()");

    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        return _buildProductLists(model.products);
      },
    );
  }
}

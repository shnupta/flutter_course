import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  Products(this.products);

  final List<String> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: products
          .map(
            (element) => Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/food.jpg'),
                      Text(element),
                    ],
                  ),
                ),
          )
          .toList(),
    );
  }
}

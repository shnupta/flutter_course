import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final String location = 'Union Square, San Francisco';
  final String image;
  final double price;

  Product(
      {@required this.title,
      @required this.description,
      @required this.image,
      @required this.price});
}

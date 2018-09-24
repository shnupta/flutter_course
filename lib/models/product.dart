import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final String location = 'Union Square, San Francisco';
  final String image;
  final double price;
  final bool isFavourite;
  final String userEmail;
  final String userId;

  Product(
      {@required this.title,
      @required this.description,
      @required this.image,
      @required this.price,
      @required this.userEmail,
      @required this.userId,
      this.isFavourite = false});
}

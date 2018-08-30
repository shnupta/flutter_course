import 'package:flutter/material.dart';


class AddressTag extends StatelessWidget {
  AddressTag(this.location);

  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(6.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
      child: Text(location),
    );
  }
}
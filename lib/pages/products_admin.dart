import 'package:flutter/material.dart';

import 'products.dart';

class ProductsAdminPage extends StatelessWidget {
  final Map<String,String> products;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(children: <Widget>[
          AppBar(title: Text('Choose'), automaticallyImplyLeading: false,),
          ListTile(title: Text('Products Page'), onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProductsPage()));
          },)
        ],)
      ),
      appBar: AppBar(
        title: Text('Product Admin'),
      ),
      body: Center(
        child: Text('Product Admin Page'),
      ),
    );
  }
}

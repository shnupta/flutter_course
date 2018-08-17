import 'package:flutter/material.dart';

import 'products.dart';
import 'product_create.dart';
import 'product_list.dart';

class ProductsAdminPage extends StatelessWidget {
  final Map<String, String> products;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
            child: Column(
          children: <Widget>[
            AppBar(
              title: Text('Choose'),
              automaticallyImplyLeading: false,
            ),
            ListTile(
              title: Text('Products Page'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            )
          ],
        )),
        appBar: AppBar(
          title: Text('Product Admin'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Create Product',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'My Products',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductCreatePage(),
            ProductListPage(),
          ],
        )
      ),
    );
  }
}

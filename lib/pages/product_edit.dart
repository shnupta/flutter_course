import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_course/scoped-models/products.dart';

import 'package:flutter_course/widgets/helpers/ensure-visible.dart';
import 'package:flutter_course/models/product.dart';

class ProductEditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/food.jpg',
    'location': 'Union Square, San Francisco',
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final titleFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();
  final priceFocusNode = FocusNode();

  Widget _buildTitleTextField(Product product) {
    return EnsureVisibleWhenFocused(
      focusNode: titleFocusNode,
      child: TextFormField(
        focusNode: titleFocusNode,
        initialValue: product != null ? product.title : '',
        decoration: InputDecoration(
          labelText: 'Title',
        ),
        validator: (String value) {
          if (value.isEmpty || value.length < 5)
            return 'The title must be 5+ characters long';
        },
        onSaved: (String value) {
          _formData['title'] = value;
        },
      ),
    );
  }

  Widget _buildDescriptionTextField(Product product) {
    return EnsureVisibleWhenFocused(
      focusNode: descriptionFocusNode,
      child: TextFormField(
        focusNode: descriptionFocusNode,
        initialValue: product != null ? product.description : '',
        maxLines: 10,
        decoration: InputDecoration(
          labelText: 'Description',
        ),
        validator: (String value) {
          if (value.isEmpty || value.length < 10)
            return 'The description must be 10+ characters long';
        },
        onSaved: (String value) {
          _formData['description'] = value;
        },
      ),
    );
  }

  Widget _buildPriceTextField(Product product) {
    return EnsureVisibleWhenFocused(
      focusNode: priceFocusNode,
      child: TextFormField(
        focusNode: priceFocusNode,
        initialValue:
            product != null ? product.price.toString() : '',
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Price',
        ),
        validator: (String value) {
          if (value.isEmpty ||
              !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value))
            return 'The price must be a number';
        },
        onSaved: (String value) {
          _formData['price'] = double.parse(value);
        },
      ),
    );
  }

  void _submitForm(Function addProduct, Function updateProduct, [int selectedProductIndex]) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if (selectedProductIndex == null)
      addProduct(Product(
          title: _formData['title'],
          description: _formData['description'],
          image: _formData['image'],
          price: _formData['price']));
    else
      updateProduct(
          Product(
              title: _formData['title'],
              description: _formData['description'],
              image: _formData['image'],
              price: _formData['price']));
    Navigator.pushReplacementNamed(context, '/products');
  }

  Widget _buildSubmitButton(ProductsModel model) {
        return RaisedButton(
          child: Text('Save'),
          textColor: Colors.white,
          onPressed: () => _submitForm(model.addProduct, model.updateProduct, model.selectedProductIndex),
        );
  }

  Widget _buildPageContent(BuildContext context, ProductsModel model) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = (deviceWidth - targetWidth) / 2;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        width: targetWidth,
        margin: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding),
            children: <Widget>[
              _buildTitleTextField(model.selectedProduct),
              _buildDescriptionTextField(model.selectedProduct),
              _buildPriceTextField(model.selectedProduct),
              SizedBox(
                height: 10.0,
              ),
              _buildSubmitButton(model),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget widget, ProductsModel model) {
        final Widget pageContent = _buildPageContent(context, model);
        return model.selectedProductIndex == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(title: Text('Edit Product')),
            body: pageContent,
          );
      },
    );
  }
}

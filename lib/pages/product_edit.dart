import 'package:flutter/material.dart';

import '../widgets/helpers/ensure-visible.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Map<String, dynamic> product;
  final int productIndex;

  ProductEditPage(
      {this.addProduct, this.updateProduct, this.product, this.productIndex});

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
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final titleFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();
  final priceFocusNode = FocusNode();

  Widget _buildTitleTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: titleFocusNode,
      child: TextFormField(
        focusNode: titleFocusNode,
        initialValue: widget.product != null ? widget.product['title'] : '',
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

  Widget _buildDescriptionTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: descriptionFocusNode,
      child: TextFormField(
        focusNode: descriptionFocusNode,
        initialValue:
            widget.product != null ? widget.product['description'] : '',
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

  Widget _buildPriceTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: priceFocusNode,
      child: TextFormField(
        focusNode: priceFocusNode,
        initialValue:
            widget.product != null ? widget.product['price'].toString() : '',
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

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if (widget.product == null)
      widget.addProduct(_formData);
    else
      widget.updateProduct(widget.productIndex, _formData);
    Navigator.pushReplacementNamed(context, '/products');
  }

  Widget _buildPageContent(BuildContext context) {
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
              _buildTitleTextField(),
              _buildDescriptionTextField(),
              _buildPriceTextField(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text('Save'),
                textColor: Colors.white,
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    

    final Widget pageContent = _buildPageContent(context);

    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(title: Text('Edit Product')),
            body: pageContent,
          );
  }
}

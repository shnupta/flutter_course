import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_course/models/product.dart';

class ProductsModel extends Model {
  List<Product> _products = [];
  int _selectedProductIndex;
  bool _showFavourites = false;

  List<Product> get products {
    return List.from(_products);
  }

  List<Product> get displayedProducts {
    if(_showFavourites) {
      return _products.where((Product product) => product.isFavourite).toList();
    }

    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selectedProductIndex;
  }

  Product get selectedProduct {
    if(_selectedProductIndex == null) return null;
    return _products[_selectedProductIndex];
  }

  bool get displayFavouritesOnly {
    return _showFavourites;
  }

  void addProduct(Product product) {
    _products.add(product);
    _selectedProductIndex = null;
    notifyListeners();
  }

  void updateProduct( Product product) {
    _products[_selectedProductIndex] = product;
    _selectedProductIndex = null;
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(_selectedProductIndex);
    _selectedProductIndex = null;
    notifyListeners();
  }

  void selectProduct(int index) {
    _selectedProductIndex = index;
    notifyListeners();
  }

  void toggleFavouriteStatus() {
    final bool isCurrentlyFavourite = selectedProduct.isFavourite;
    final bool newStatus = !isCurrentlyFavourite;
    final Product updated = new Product(
      title: selectedProduct.title,
      image: selectedProduct.image,
      description: selectedProduct.description,
      price: selectedProduct.price,
      isFavourite: newStatus
    );
    updateProduct(updated);
    notifyListeners();
  }

  void toggleDisplayMode() {
    _showFavourites = !_showFavourites;
    notifyListeners();
  }
}

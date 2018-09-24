import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_course/models/product.dart';
import 'package:flutter_course/models/user.dart';

class ConnectedProductsModel extends Model {
  List<Product> _products = [];
  User _authenticatedUser;
  int _selProductIndex;

  void addProduct(String title, String description, double price, String image) {
    final Product product = Product(title: title, description: description, image: image, price: price, userEmail: _authenticatedUser.email, userId: _authenticatedUser.id);
    _products.add(product);
    notifyListeners();
  }
}

class ProductsModel extends ConnectedProductsModel {
  bool _showFavourites = false;

  List<Product> get allproducts {
    return List.from(_products);
  }

  List<Product> get displayedProducts {
    if (_showFavourites) {
      return _products.where((Product product) => product.isFavourite).toList();
    }

    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selProductIndex;
  }

  Product get selectedProduct {
    if (selectedProductIndex == null) return null;
    return _products[selectedProductIndex];
  }

  bool get displayFavouritesOnly {
    return _showFavourites;
  }

  void updateProduct(
      String title, String description, double price, String image) {
    final Product product = Product(
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId);
    _products[selectedProductIndex] = product;
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(selectedProductIndex);
    notifyListeners();
  }

  void selectProduct(int index) {
    _selProductIndex = index;
    if(_selProductIndex != null)
    {
      notifyListeners();
    }
  }

  void toggleFavouriteStatus() {
    final bool isCurrentlyFavourite = selectedProduct.isFavourite;
    final bool newStatus = !isCurrentlyFavourite;
    updateProduct(selectedProduct.title, selectedProduct.description,
        selectedProduct.price, selectedProduct.image);
    notifyListeners();
  }

  void toggleDisplayMode() {
    _showFavourites = !_showFavourites;
    notifyListeners();
  }
}

class UserModel extends ConnectedProductsModel {

  void login(String email, String password) {
    _authenticatedUser = new User(id: 'asdfsad', email: email, password:  password);
  }
}
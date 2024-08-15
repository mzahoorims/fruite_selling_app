import 'package:flutter/material.dart';
import 'cart_model.dart';


class CartProvider with ChangeNotifier {
  final List<Cart> _cartItems = [];
  double _totalPrice = 0.0;

  List<Cart> get cartItems => _cartItems;
  double get totalPrice => _totalPrice;

  void addItem(Cart item) {
    final existingItemIndex = _cartItems.indexWhere((i) => i.productId == item.productId);
    if (existingItemIndex >= 0) {
      // Item already exists in the cart, update quantity
      final existingItem = _cartItems[existingItemIndex];
      _updateItemQuantity(existingItem, existingItem.quantity! + 1);
    } else {
      _cartItems.add(item);
      _totalPrice += item.productPrice!.toDouble();
      notifyListeners();
    }
  }

  void _updateItemQuantity(Cart item, int newQuantity) {
    _totalPrice -= item.productPrice!.toDouble() * item.quantity!.toDouble();
    item.quantity = newQuantity;
    _totalPrice += item.productPrice!.toDouble() * newQuantity.toDouble();
    notifyListeners();
  }

  void increaseQuantity(Cart item) {
    _updateItemQuantity(item, item.quantity! + 1);
  }

  void decreaseQuantity(Cart item) {
    if (item.quantity! > 1) {
      _updateItemQuantity(item, item.quantity! - 1);
    } else {
      // Remove item if quantity is 1 and decrease
      removeItem(item);
    }
  }

  void removeItem(Cart item) {
    _totalPrice -= item.productPrice!.toDouble() * item.quantity!.toDouble();
    _cartItems.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    _totalPrice = 0.0;
    notifyListeners();
  }

  int getCounter() {
    return _cartItems.length;
  }
}
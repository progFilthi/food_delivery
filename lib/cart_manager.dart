import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final int quantity;
  final double price;
  final String vendor;
  final String image;

  CartItem({
    required this.name,
    required this.quantity,
    required this.price,
    required this.vendor,
    required this.image,
  });
}

class CartManager extends ChangeNotifier {
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;
  CartManager._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

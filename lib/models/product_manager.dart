import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojaflutter/models/product.dart';

class ProductManager extends ChangeNotifier {
  final Firestore _firestore = Firestore.instance;

  ProductManager() {
    _loadingAllProducts();
  }

  List<Product> _allProducts = [];
  String _search = '';
  String get search => _search;

  set search(String value) {
    _search = value;
    notifyListeners();
  }

  List<Product> get filteredProducts {
    final List<Product> filteredProducts = [];
    if (search.isEmpty) {
      filteredProducts.addAll(_allProducts);
    } else {
      filteredProducts.addAll(_allProducts.where((products) =>
          products.name.toLowerCase().contains(search.toLowerCase())));
    }

    return filteredProducts;
  }

  Future<void> _loadingAllProducts() async {
    final QuerySnapshot querySnapshot =
        await _firestore.collection('products').getDocuments();

    _allProducts = querySnapshot.documents
        .map((document) => Product.fromDocument(document))
        .toList();

    notifyListeners();
  }
}

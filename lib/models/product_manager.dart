import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojaflutter/models/product.dart';

class ProductManager extends ChangeNotifier {
  final Firestore _firestore = Firestore.instance;

  ProductManager() {
    _loadingAllProducts();
  }

  List<Product> allProducts = [];

  Future<void> _loadingAllProducts() async {
    final QuerySnapshot querySnapshot =
        await _firestore.collection('products').getDocuments();

    allProducts = querySnapshot.documents
        .map((document) => Product.fromDocument(document))
        .toList();

    notifyListeners();
  }
}

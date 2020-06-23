import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  Product.fromDocument(final DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.documentID;
    name = documentSnapshot['name'] as String;
    description = documentSnapshot['description'] as String;
    images =
        List<String>.from(documentSnapshot.data['images'] as List<dynamic>);
  }
  String id;
  String name;
  String description;
  List<String> images;
}

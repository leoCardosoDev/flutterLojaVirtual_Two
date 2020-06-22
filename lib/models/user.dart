import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({this.id, this.name, this.email, this.password, this.confirmedPassword});
  User.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    name = snapshot.data['name'] as String;
    email = snapshot.data['email'] as String;
  }

  final Firestore _collUser = Firestore.instance;

  String id;
  String name;
  String email;
  String password;
  String confirmedPassword;

  DocumentReference get firestoreRef => _collUser.document('users/$id');

  Future<void> saveData() async {
    await firestoreRef.setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}

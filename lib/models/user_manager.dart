import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lojaflutter/helpers/firebase_errors.dart';
import 'package:lojaflutter/models/user.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadCurrentUser();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _loading = false;
  FirebaseUser user;

  bool get loading => _loading;

  Future<void> signIn({User user, Function onFail, Function onSuccess}) async {
    loading = true;
    try {
      final AuthResult result = await _auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      this.user = result.user;
      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser() async {
    final FirebaseUser currentUser = await _auth.currentUser();
    if (currentUser != null) {
      user = currentUser;
      debugPrint(user.uid);
    }
    notifyListeners();
  }
}

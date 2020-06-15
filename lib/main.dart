import 'package:flutter/material.dart';
import 'package:lojaflutter/config/config.dart';
import 'package:lojaflutter/models/user_manager.dart';
import 'package:lojaflutter/screens/base/base_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserManager(),
      child: MaterialApp(
        title: 'Loja Virtual',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: primaryColor,
        ),
        home: BaseScreen(),
      ),
    );
  }
}

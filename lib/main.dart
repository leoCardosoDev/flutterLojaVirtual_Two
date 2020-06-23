import 'package:flutter/material.dart';
import 'package:lojaflutter/config/config.dart';
import 'package:lojaflutter/models/product.dart';
import 'package:lojaflutter/models/product_manager.dart';
import 'package:lojaflutter/models/user_manager.dart';
import 'package:lojaflutter/screens/base/base_screen.dart';
import 'package:lojaflutter/screens/login/login_screen.dart';
import 'package:lojaflutter/screens/products/product/product_screen.dart';
import 'package:lojaflutter/screens/signup/signup_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserManager(), lazy: false),
        ChangeNotifierProvider(create: (_) => ProductManager(), lazy: false),
      ],
      child: MaterialApp(
        title: 'Loja Virtual',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
          accentColor: secondaryColor,
          primaryTextTheme: TextTheme(
            headline6: TextStyle(color: secondaryColor),
          ),
          scaffoldBackgroundColor: primaryColor,
        ),
        initialRoute: '/base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginScreen());
              break;
            case '/signup':
              return MaterialPageRoute(builder: (_) => SignUpScreen());
              break;
            case '/product':
              return MaterialPageRoute(
                  builder: (_) => ProductScreen(settings.arguments as Product));
              break;
            case '/base':
            default:
              return MaterialPageRoute(builder: (_) => BaseScreen());
          }
        },
      ),
    );
  }
}

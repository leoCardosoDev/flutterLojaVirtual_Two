import 'package:flutter/material.dart';
import 'package:lojaflutter/common/custom_drawer/custom_drawer.dart';
import 'package:lojaflutter/config/config.dart';
import 'package:lojaflutter/models/page_manager.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home'),
              iconTheme: IconThemeData(color: secondaryColor),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Produtos'),
              iconTheme: IconThemeData(color: secondaryColor),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Meus Pedidos'),
              iconTheme: IconThemeData(color: secondaryColor),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Lojas'),
              iconTheme: IconThemeData(color: secondaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lojaflutter/common/custom_drawer/custom_drawer.dart';
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
            ),
          ),
          Container(color: Colors.red),
          Container(color: Colors.blue),
          Container(color: Colors.amber),
        ],
      ),
    );
  }
}

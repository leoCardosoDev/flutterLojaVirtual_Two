import 'package:flutter/material.dart';
import 'package:lojaflutter/common/custom_drawer/custom_drawer.dart';
import 'package:lojaflutter/config/config.dart';
import 'package:lojaflutter/models/product_manager.dart';
import 'package:lojaflutter/screens/products/components/product_list_tile.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Produtos'),
        iconTheme: IconThemeData(color: secondaryColor),
      ),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __) {
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(4, 6, 4, 6),
            itemCount: productManager.allProducts.length,
            itemBuilder: (_, index) {
              return ProductListTile(
                product: productManager.allProducts[index],
              );
            },
          );
        },
      ),
    );
  }
}

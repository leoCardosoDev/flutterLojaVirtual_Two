import 'package:flutter/material.dart';
import 'package:lojaflutter/common/custom_drawer/custom_drawer.dart';
import 'package:lojaflutter/config/config.dart';
import 'package:lojaflutter/models/product_manager.dart';
import 'package:lojaflutter/screens/products/components/product_list_tile.dart';
import 'package:lojaflutter/screens/products/components/search_dialog.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  Future<void> _searchForm(
      BuildContext context, ProductManager productManager) async {
    final search = await showDialog<String>(
        context: context,
        builder: (_) => SearchDialog(
              initialText: productManager.search,
            ));
    if (search != null) {
      productManager.search = search;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Consumer<ProductManager>(
          builder: (_, productManager, __) {
            if (productManager.search.isEmpty) {
              return const Text('Produtos');
            } else {
              return LayoutBuilder(
                builder: (_, constraints) {
                  return GestureDetector(
                    onTap: () {
                      _searchForm(context, productManager);
                    },
                    child: Container(
                        width: constraints.biggest.width,
                        child: Text(productManager.search)),
                  );
                },
              );
            }
          },
        ),
        iconTheme: IconThemeData(color: secondaryColor),
        actions: <Widget>[
          Consumer<ProductManager>(
            builder: (_, productManager, __) {
              if (productManager.search.isEmpty) {
                return IconButton(
                  onPressed: () {
                    _searchForm(context, productManager);
                  },
                  icon: Icon(Icons.search),
                );
              } else {
                return IconButton(
                  onPressed: () {
                    productManager.search = '';
                  },
                  icon: Icon(Icons.clear),
                );
              }
            },
          ),
        ],
      ),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __) {
          final filteredProducts = productManager.filteredProducts;
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(4, 6, 4, 6),
            itemCount: filteredProducts.length,
            itemBuilder: (_, index) {
              return ProductListTile(
                product: filteredProducts[index],
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lojaflutter/config/config.dart';
import 'package:lojaflutter/models/product.dart';

class ProductListTile extends StatelessWidget {
  final Product product;
  const ProductListTile({this.product});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(product.images.first),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'A partir de: ',
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  Text(
                    'R\$ 19.99',
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

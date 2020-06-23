import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:lojaflutter/config/config.dart';
import 'package:lojaflutter/models/product.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        iconTheme: IconThemeData(color: secondaryColor),
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: Carousel(
              images: product.images
                  .map((urlImage) => NetworkImage(urlImage))
                  .toList(),
              dotSize: 4,
              dotColor: secondaryColor,
              dotBgColor: Colors.transparent,
              autoplayDuration: const Duration(seconds: 5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: secondaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'A partir de ',
                    style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                  ),
                ),
                Text(
                  'R\$ 19.99',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: secondaryColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Descrição',
                    style: TextStyle(
                        color: secondaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  product.description,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

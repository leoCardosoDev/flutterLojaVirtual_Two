import 'package:flutter/material.dart';
import 'package:lojaflutter/common/custom_drawer/custom_drawer_header.dart';
import 'package:lojaflutter/common/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.grey[300],
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          ListView(
            children: <Widget>[
              CustomDrawerHeader(),
              const Divider(
                color: Colors.black,
                height: 1.8,
              ),
              DrawerTile(iconData: Icons.home, title: 'Home', page: 0),
              DrawerTile(iconData: Icons.list, title: 'Produtos', page: 1),
              DrawerTile(
                  iconData: Icons.playlist_add_check,
                  title: 'Meus Pedidos',
                  page: 2),
              DrawerTile(iconData: Icons.location_on, title: 'Lojas', page: 3),
            ],
          ),
        ],
      ),
    );
  }
}

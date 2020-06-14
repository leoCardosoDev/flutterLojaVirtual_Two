import 'package:flutter/material.dart';
import 'package:lojaflutter/config/config.dart';
import 'package:lojaflutter/models/page_manager.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final int page;

  const DrawerTile({this.iconData, this.title, this.page});

  @override
  Widget build(BuildContext context) {
    final int curPage = context.watch<PageManager>().page;
    return InkWell(
      onTap: () {
        context.read<PageManager>().setPage(page);
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Icon(
                iconData,
                size: 32,
                color: curPage == page ? secondaryColor : Colors.grey[700],
              ),
            ),
            const SizedBox(width: 23),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: curPage == page ? secondaryColor : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

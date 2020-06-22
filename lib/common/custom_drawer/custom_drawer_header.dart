import 'package:flutter/material.dart';
import 'package:lojaflutter/config/config.dart';
import 'package:lojaflutter/models/user_manager.dart';
import 'package:provider/provider.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 24, 16, 8),
      height: 180,
      child: Consumer<UserManager>(builder: (_, userManager, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'App Loja Virtual',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Olá ${userManager.user?.name ?? 'Tudo bem? Não tem conta?'}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            Container(
              child: userManager.isLoggedIn
                  ? RaisedButton.icon(
                      onPressed: () {
                        userManager.signOut();
                      },
                      color: secondaryColor,
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Sair',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/login');
                      },
                      child: Text(
                        'Entre ou cadastre-se',
                        style: TextStyle(
                            color: tertiaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
            ),
          ],
        );
      }),
    );
  }
}

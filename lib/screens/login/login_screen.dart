import 'package:flutter/material.dart';
import 'package:lojaflutter/config/config.dart';
import 'package:lojaflutter/helpers/validators.dart';
import 'package:lojaflutter/models/user.dart';
import 'package:lojaflutter/models/user_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Consumer<UserManager>(
              builder: (_, userManager, child) {
                return Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 50),
                          Text(
                            'Bem-Vindo!',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: secondaryColor),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Entre para continuar',
                            style: TextStyle(
                              fontSize: 20,
                              color: secondaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 75),
                      Column(
                        children: <Widget>[
                          TextFormField(
                            enabled: !userManager.loading,
                            controller: _emailController,
                            style: TextStyle(color: secondaryColor),
                            cursorColor: secondaryColor,
                            decoration: InputDecoration(
                              labelText: 'E-mail',
                              labelStyle: TextStyle(
                                  fontSize: 14, color: secondaryColor),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: secondaryColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            validator: (email) {
                              if (!emailValidator(email)) {
                                return 'E-mail inválido!';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            enabled: !userManager.loading,
                            controller: _passwordController,
                            style: TextStyle(color: secondaryColor),
                            cursorColor: secondaryColor,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              labelStyle: TextStyle(
                                  fontSize: 14, color: secondaryColor),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: secondaryColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ),
                            autocorrect: false,
                            obscureText: true,
                            validator: (pass) {
                              if (pass.isEmpty || pass.length < 5) {
                                return 'Senha inválida';
                              } else {
                                return null;
                              }
                            },
                          ),
                          child,
                          const SizedBox(height: 20),
                          Container(
                            height: 50,
                            width: double.infinity,
                            child: FlatButton(
                              disabledColor: primaryColor,
                              onPressed: userManager.loading
                                  ? null
                                  : () {
                                      if (_formKey.currentState.validate()) {
                                        userManager.signIn(
                                          user: User(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text),
                                          onFail: (e) {
                                            _scaffoldKey.currentState
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                'Falha ao entrar: $e',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              backgroundColor: Colors.red,
                                            ));
                                          },
                                          onSuccess: () {
                                            // TODO: Fechar tela de login
                                          },
                                        );
                                      }
                                    },
                              padding: const EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      secondaryColor,
                                      tertiaryColor,
                                      secondaryColor,
                                    ],
                                  ),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: userManager.loading
                                      ? const CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.white),
                                        )
                                      : Text(
                                          'Entrar',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            height: 50,
                            width: double.infinity,
                            child: FlatButton(
                              onPressed: () {},
                              color: Colors.indigo.shade50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'images/facebook.png',
                                    height: 18,
                                    width: 18,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Entre com o Facebook',
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Novo por aqui? ',
                              style: TextStyle(color: secondaryColor),
                            ),
                            FlatButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              child: Text(
                                ' Crie uma conta!',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: secondaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Align(
                alignment: Alignment.topRight,
                child: FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Text(
                    'Esqueceu a Senha?',
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

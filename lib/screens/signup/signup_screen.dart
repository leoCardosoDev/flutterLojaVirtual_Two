import 'package:flutter/material.dart';
import 'package:lojaflutter/config/config.dart';
import 'package:lojaflutter/helpers/validators.dart';
import 'package:lojaflutter/models/user.dart';
import 'package:lojaflutter/models/user_manager.dart';
import 'package:lojaflutter/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Consumer<UserManager>(
              builder: (_, userMannager, __) {
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
                            'Criar conta',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: secondaryColor),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Column(
                        children: <Widget>[
                          TextFormField(
                            enabled: !userMannager.loading,
                            style: TextStyle(color: secondaryColor),
                            cursorColor: secondaryColor,
                            decoration: InputDecoration(
                              labelText: 'Nome Completo',
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
                            validator: (name) {
                              if (name.isEmpty) {
                                return 'Campo obrigatório';
                              } else if (name.trim().split(' ').length <= 1) {
                                return 'Preencha seu nome completo';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (name) => user.name = name,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            enabled: !userMannager.loading,
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
                              if (email.isEmpty) {
                                return 'E-mail obrigatório';
                              } else if (!emailValidator(email)) {
                                return 'E-mail inválido!';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (email) => user.email = email,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            enabled: !userMannager.loading,
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
                              if (pass.isEmpty) {
                                return 'Campo obrigatório';
                              } else if (pass.isEmpty || pass.length < 5) {
                                return 'Senha inválida';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (pass) => user.password = pass,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            enabled: !userMannager.loading,
                            style: TextStyle(color: secondaryColor),
                            cursorColor: secondaryColor,
                            decoration: InputDecoration(
                              labelText: 'Repita a Senha',
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
                              if (pass.isEmpty) {
                                return 'Campo obrigatório';
                              } else if (pass.isEmpty || pass.length < 5) {
                                return 'Senha inválida';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (pass) => user.confirmedPassword = pass,
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 50,
                            width: double.infinity,
                            child: FlatButton(
                              disabledColor: primaryColor,
                              onPressed: userMannager.loading
                                  ? null
                                  : () {
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();
                                        if (user.password !=
                                            user.confirmedPassword) {
                                          _scaffoldKey.currentState
                                              .showSnackBar(SnackBar(
                                            content: const Text(
                                              'Senhas não coincidem',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            backgroundColor: Colors.red,
                                          ));
                                        }
                                        userMannager.signUp(
                                          user: user,
                                          onFail: (e) {
                                            _scaffoldKey.currentState
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                'Erro: $e',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              backgroundColor: Colors.red,
                                            ));
                                          },
                                          onSuccess: () {
                                            Navigator.of(context).pop();
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
                                  child: userMannager.loading
                                      ? const CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.white),
                                        )
                                      : Text(
                                          'Criar Conta',
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
                                    'Criar conta com o Facebook',
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
                              'Já tem conta? ',
                              style: TextStyle(color: secondaryColor),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => LoginScreen()));
                              },
                              padding: EdgeInsets.zero,
                              child: Text(
                                ' Faça o login!',
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
            ),
          ),
        ),
      ),
    );
  }
}

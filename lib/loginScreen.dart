import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter_tp5/MyTheme.dart';
import 'package:flutter_tp5/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isDark = false;
  final formKey = GlobalKey<FormState>();
  final String emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final String passwordPattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
          appBar: AppBar(
            title: Column(
              children: [
                const Text("Connexion"),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ThemeSwitcher(
                  builder: (context) => DayNightSwitcherIcon(
                    isDarkModeEnabled: isDark,
                    onStateChanged: (val) {
                      setState(() {
                        isDark = val;
                        isDark
                            ? ThemeSwitcher.of(context)
                                .changeTheme(theme: MyTheme.defaultTheme)
                            : ThemeSwitcher.of(context)
                                .changeTheme(theme: MyTheme.darkTheme);
                      });
                    },
                  ),
                ),
              )
            ],
            centerTitle: true,
          ),
          body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    inputField("Adresse email", "me@example.com", Icons.email,
                        emailController,
                        inputType: TextInputType.emailAddress,
                        typePass: false,
                        msgVide: "veuillez saisir votre adresse email",
                        validateur: emailPattern,
                        msgValide: "veuillez saisir une adresse email valide."),
                    inputField(
                        "Mot de passe", "****", Icons.lock, passwordController,
                        typePass: true,
                        msgVide: "veuillez saisir votre mot de passe",
                        validateur: passwordPattern,
                        msgValide:
                            "Minimum huit caractères, au moins une lettre et un chiffre"),
                    ElevatedButton(
                      child: Text("login"),
                      onPressed: () {
                        final snackBar;
                        formKey.currentState!.validate()
                            ? {
                                snackBar = snackbar(
                                    'success',
                                    'vos coordonnées sont correctes',
                                    ContentType.success),
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBar),
                              }
                            : {
                                snackBar = snackbar(
                                    'erreur',
                                    'vos coordonées sont erronés',
                                    ContentType.failure),
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBar)
                              };
                      },
                    ),
                  ],
                ),
              ))),
    );
  }
}

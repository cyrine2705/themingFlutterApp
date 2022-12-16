import 'package:flutter/material.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter_tp5/MyTheme.dart';
import 'package:flutter_tp5/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: MyTheme.defaultTheme,
      builder: (_, theme) {
        return MaterialApp(
            theme: theme,
            title: "theming a flutter app",
            debugShowCheckedModeBanner: false,
            home: const LoginScreen());
      },
    );
  }
}

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social App',
      theme: FlexThemeData.light(scheme: FlexScheme.deepBlue, fontFamily: 'Montserrat'),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.aquaBlue, fontFamily: 'Montserrat'),
      themeMode: ThemeMode.light,
    ).modular();
  }
}

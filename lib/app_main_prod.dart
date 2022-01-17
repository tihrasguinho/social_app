import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_app/app_module.dart';
import 'package:social_app/app_widget.dart';
import 'package:social_app/core/others/consts/firebase_options_dev.dart';
import 'package:social_app/core/others/intialization/firebase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseConfig.init(options);

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

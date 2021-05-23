import 'package:flutter/material.dart';

import 'package:preferencia_usuario/src/pages/home_pages.dart';
import 'package:preferencia_usuario/src/pages/settings_pages.dart';

import 'package:preferencia_usuario/src/share_pref/preferencias_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasUsuarios();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = PreferenciasUsuarios();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: prefs.ultimaPagina,
      routes: {
        'home': (BuildContext context) => HomePage(),
        'settings': (BuildContext context) => SettingsPage(),
      },
    );
  }
}

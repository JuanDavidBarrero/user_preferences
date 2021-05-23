import 'package:flutter/material.dart';

import 'package:preferencia_usuario/src/share_pref/preferencias_user.dart';

import 'package:preferencia_usuario/src/widget/drawer_widger.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = PreferenciasUsuarios();
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencia del usuario'),
        centerTitle: true,
        backgroundColor: (prefs.colorSecundario) ? Colors.red : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Color Secundario: ${prefs.colorSecundario}'),
            Divider(),
            Text('Genero: ${prefs.genero}'),
            Divider(),
            Text('Nombre del Usuario: ${prefs.nombreUsuario}'),
          ],
        ),
      ),
    );
  }
}

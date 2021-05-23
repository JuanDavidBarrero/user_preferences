import 'package:flutter/material.dart';

import 'package:preferencia_usuario/src/widget/drawer_widger.dart';

import 'package:preferencia_usuario/src/share_pref/preferencias_user.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final titleStyle = TextStyle(fontSize: 40, fontWeight: FontWeight.bold);

  bool _colorSecundadrio;
  int _genero;

  TextEditingController _textController;

  final prefs = new PreferenciasUsuarios();

  @override
  void initState() {
    super.initState();
    _genero = prefs.genero;
    _colorSecundadrio = prefs.colorSecundario;
    _textController = new TextEditingController(text: prefs.nombreUsuario);
  }

  _setSelectedRadio(int valor) {
    prefs.genero = valor;
    setState(() {
      _genero = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          centerTitle: true,
          backgroundColor: (prefs.colorSecundario) ? Colors.red : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                'Settings',
                style: titleStyle,
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundadrio,
              title: Text('Color secundario'),
              onChanged: (value) {
                setState(() {
                  _colorSecundadrio = value;
                  prefs.colorSecundario = value;
                });
              },
            ),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    icon: Icon(Icons.people_alt_outlined),
                    hintText: 'Ingrese su nombre',
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona usando el telefono'),
                onChanged: (value) {
                  prefs.nombreUsuario = value;
                },
              ),
            )
          ],
        ));
  }
}

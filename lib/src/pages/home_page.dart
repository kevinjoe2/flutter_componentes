import 'package:flutter/material.dart';
import 'package:flutter_componentes/src/providers/menu_provider.dart';
import 'package:flutter_componentes/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),
      body: _lista(context),
    );
  }

  Widget _lista(BuildContext context) {
    return FutureBuilder(
      future: menuProvider.cargaData(),
      initialData: [],
      builder: (context,snapshot) {
        return ListView(
          children: _listaItems(snapshot.data,context),
        );
      },
    );
  }

  List<Widget> _listaItems(Object? data,BuildContext context) {

    final List<Widget> opciones = [];

    try {

      for (var opt in data as List<dynamic>) {
        final widgetTemp = ListTile(
          title: Text( opt['texto'] ),
          leading: getIcon( opt['icon'] ),
          trailing: Icon( Icons.keyboard_arrow_right, color: Colors.blueGrey, ),
          onTap: () { 

            Navigator.pushNamed(context, opt['ruta']);

          },
        );

        opciones..add( widgetTemp )..add( Divider() );
      }

      return opciones;

    } catch (e) {

      opciones.add( Text( "Error interno" ) );
      return opciones;

    }
  }
}
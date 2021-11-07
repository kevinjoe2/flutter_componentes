import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlertPage"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Mostrar Alerta"),
          onPressed: () => _mostrarAlerta(context),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: StadiumBorder()
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add_location ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  _mostrarAlerta(BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (builder) {

        return AlertDialog(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
          title: Text("Titulo"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("data"),
              FlutterLogo(size: 50.0,)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancelar")
            ),
            TextButton(
              onPressed: () {}, 
              child: Text("Aceptar")
            ),
          ],
        );

      }
    );

  }
}
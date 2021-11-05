import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Cards Page" ),
      ),
      body: ListView(
        padding: EdgeInsets.all( 20 ),
        children: [
          _cardTipo1()
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon( Icons.photo_album, color: Colors.blue, ),
            title: Text( "Soy el titulo de la tarjeta" ),
            subtitle: Text( "Soy la descripcion de la tarjeta" ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {}, 
                child: Text( "Cancelar" )
              ),
              TextButton(
                onPressed: () {}, 
                child: Text( "Aceptar" )
              )
            ],
          )
        ],
      ),
    );
  }
}
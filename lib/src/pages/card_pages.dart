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
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
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

  Widget _cardTipo2() {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"),
            image: NetworkImage("https://www.cose.ec/wp-content/uploads/2021/01/travel-landscape-01.jpg"),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("No tengo idea de que poner")
          ),
        ],
      ),
    );
  }
}
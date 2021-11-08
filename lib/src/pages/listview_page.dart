import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key? key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _sc = ScrollController();
  List<int> _listaNumeros = [];
  bool _estaCargando = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _agregar10();
    
    _sc.addListener(() {

      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _sc.dispose();
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _obtenerPrimeraPagina,
      child: ListView.builder(
        controller: _sc,
        itemCount: _listaNumeros.length,
        itemBuilder: (bc, index) { 
    
          final numeroImagen = _listaNumeros[index];
    
          return FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"), 
            image: NetworkImage("https://picsum.photos/id/$numeroImagen/350/300")
          );
    
        },
      ),
    );
  }

  _agregar10() {
    setState(() {
      for (var i = 1; i <= 10; i++) {
        _listaNumeros.add(_listaNumeros.length + i);
      }
    });
  }

  Future<Null> _fetchData() async {
    setState(() {
      _estaCargando = true;
    });

    final duration = Duration( seconds: 2);

    Timer(
      duration,
      respuestaHttp
    );
  }

  void respuestaHttp() {

    _estaCargando = false;

    _sc.animateTo(
      _sc.position.pixels + 150,
      curve: Curves.fastOutSlowIn,
      duration: Duration( milliseconds: 100 ),
    );

    _agregar10();

  }

  Widget _crearLoading() {

    if ( _estaCargando ) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator()
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    }
    else {
      return Container();
    }

  }

  Future<void> _obtenerPrimeraPagina() async {
    final duration = Duration(milliseconds: 2000);
    Timer(
      duration,
      () {
        _listaNumeros.clear();
        _agregar10();
      }
    );

    return Future.delayed(duration);
  }
}
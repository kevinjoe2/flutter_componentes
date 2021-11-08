import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 20;
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders"),
      ),
      body: Container(
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: "Tamaño de la imagen",
      value: _valorSlider, 
      min: 20.0,
      max: 100.0,
      onChanged: (!_checkbox) ? ( valor ) => setState(() { _valorSlider = valor; }) : null
    );
  }

  Widget _crearImagen() {
    return Image(
      width: _valorSlider * 3,
      fit: BoxFit.contain,
      image: NetworkImage("https://static0.srcdn.com/wordpress/wp-content/uploads/2021/11/Christopher-reeves-superman-and-michael-keaton-batman-same-universe.jpg")
    );
  }

  Widget _crearCheckBox() {
    return CheckboxListTile(
      title: Text("Bloquear Slider"),
      value: _checkbox,
      onChanged: ( valor ) => setState(() { _checkbox = valor as bool; })
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text("Bloquear Slider"),
      value: _checkbox,
      onChanged: ( valor ) => setState(() { _checkbox = valor as bool; })
    );
  }
}
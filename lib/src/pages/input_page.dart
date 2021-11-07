import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombrePersona = '';
  String _emailPersona = '';
  String _pwdPersona = '';
  String _fechaPersona = '';

  TextEditingController _textEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPwd(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearPersona() {
    return Column(
      children: [
        ListTile(
          title: Text("Nombre es: $_nombrePersona"),
        ),
        ListTile(
          title: Text("Email es: $_emailPersona"),
        ),
        ListTile(
          title: Text("Password es: $_pwdPersona"),
        ),
      ],
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text("Letras ${_nombrePersona.length}"),
        hintText: "Nombre de persona",
        labelText: "Nombre",
        helperText: "Solo es el nombre",
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.account_circle )
      ),
      onChanged: (valor) {
        setState(() {
          _nombrePersona = valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      // autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text("Letras ${_emailPersona.length}"),
        hintText: "Email de persona",
        labelText: "Email",
        helperText: "Solo es el email",
        suffixIcon: Icon( Icons.alternate_email_sharp),
        icon: Icon( Icons.email_outlined )
      ),
      onChanged: (valor) {
        setState(() {
          _emailPersona = valor;
        });
      },
    );
  }

  Widget _crearPwd() {
    return TextField(
      // autofocus: true,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text("Letras ${_pwdPersona.length}"),
        hintText: "Password de persona",
        labelText: "Password",
        helperText: "Solo es el password",
        suffixIcon: Icon( Icons.lock),
        icon: Icon( Icons.security )
      ),
      onChanged: (valor) {
        setState(() {
          _pwdPersona = valor;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {

    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.words,
      controller: _textEditController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text("Letras ${_fechaPersona.length}"),
        hintText: "Fecha de nacimiento persona",
        labelText: "Fecha de nacimiento",
        helperText: "Solo es el Fecha de nacimiento",
        suffixIcon: Icon( Icons.calendar_view_day ),
        icon: Icon( Icons.calendar_today )
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectFecha(context);
      },

    );
  }

  void _selectFecha(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2018), 
      lastDate: DateTime(2025),
      locale: Locale('es','ES')
    );

    if ( picked != null ) {
      setState(() {
        _fechaPersona = picked.toString();
        _textEditController.text = _fechaPersona;
      });
    }
  }
}
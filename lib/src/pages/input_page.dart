import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {

  @override
  createState() => _InputPage();

}

class _InputPage extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _pass = '';
  String _fecha = '';

  String _opcionSeleccionada = 'volar';
  List<String> _poderes = ['volar', 'fuerza', 'super aliento', 'rayos x'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput(){

    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Name',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.star),
        icon: Icon(Icons.access_alarm)
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );
    
  }

  Widget _crearEmail() {

    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (valor) => setState(() {
          _email = valor;
      })
      
    );

  }

  Widget _crearPassword() {

    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (valor) => setState(() {
          _pass = valor;
      })
      
    );

  }


  Widget _crearFecha(BuildContext context) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha',
        labelText: 'Fecha',
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );

  }

  _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2021),
      locale: Locale('es', 'ES')
    );

    if(picked != null){
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }

  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder){
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  Widget _crearDropdown() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada ,
            items: getOpcionesDropdown(),
            onChanged: (valor) {
              setState(() {
                _opcionSeleccionada = valor;
              });
            },
          ),
        )
      ],
    );
    
  }
  
  Widget _crearPersona() {
    
    return ListTile(
      title: Text('Nombre es: ' + _nombre),
      subtitle: Text('El email es: ' + _email),
      trailing: Text(_opcionSeleccionada),
    );

  }

}
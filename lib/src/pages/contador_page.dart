import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {

  @override
  createState() => _ContadorPageState();

}

class _ContadorPageState extends State<ContadorPage> {

  final TextStyle _textStyle = new TextStyle(fontSize: 24);
  int _conteo = 100;
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('la cabecita '),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('numero de tocadas: ', style: _textStyle,),
            Text('$_conteo', style: _textStyle),
          ],
        )
      ),

      floatingActionButton: _crearBotones()

    );
    
  }

  Widget _crearBotones(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30,),
        FloatingActionButton( child: Icon(Icons.home), onPressed: _home ),
        Expanded(child: SizedBox(),),
        FloatingActionButton( child: Icon(Icons.edit), onPressed: _quitar ),
        SizedBox(width: 5,),
        FloatingActionButton( child: Icon(Icons.add), onPressed: _agregar ),
      ],
    );
    
  }

  void _agregar(){
    setState(() {
      print('hola bro, nice dick');
      _conteo++;
    });
  }

  void _quitar(){
    setState(() {
      print('hola bro, bad dick');
      _conteo--;
    });
  }

  void _home(){
    setState(() {
      _conteo = 0;
    });
  }

}

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final option = ['UNO', 'DoS', 'TRES', 'CUATRO', 'CINCO'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: ListView(
        children: _crearItemsCorta()
      )
    );
  }

  List<Widget> _crearItems() {
    
    List<Widget> list = new List<Widget>();
    for(String opt in option){
      final tempWidget = ListTile(
        title: Text(opt),
      );

      list..add(tempWidget)
          ..add(Divider());
    }

    return list;
  }

  List<Widget> _crearItemsCorta() {
    
    return option.map((opt){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(opt + '!'),
            subtitle: Text('subtitle'),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider()
        ],
      );

    }).toList();

  }
}
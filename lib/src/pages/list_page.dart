import 'package:demoapp/src/pages/alert_page.dart';
import 'package:flutter/material.dart'; 

import 'package:demoapp/src/utils/icono_string_util.dart';
import 'package:demoapp/src/providers/menu_provider.dart';

class ListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
      body: _lista()
    );
  }

  Widget _lista() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        
        return ListView(
          children: _listItems(snapshot.data, context),
        );

      },
    );

  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    
    final List<Widget> opciones = [];
    data.forEach((opt){
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getICon(opt['icon']),
        trailing: Icon(Icons.chevron_right, color: Colors.green,),
        onTap: (){
          
          // final route = MaterialPageRoute(builder: (context) => AlertPage());
          // Navigator.push(context, route);
          Navigator.pushNamed(context, opt['ruta']);

        },
      );

      opciones..add(widgetTemp)
              ..add(Divider());
    });
    
    return opciones;
  }

}
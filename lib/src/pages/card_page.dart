import 'package:flutter/material.dart'; 

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 20,),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1(){

    return Card(
      elevation: 6.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            leading: Icon(Icons.photo_album),
            title: Text('Acerca de este curso'),
            subtitle: Text('Una guía para empezar el camino en este poderoso framework'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Acpetar'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2(){

    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://i.redd.it/1w6s6g3613f31.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 1000),
            height: 300.0,
            fit: BoxFit.cover
          ),
          // Image(
          //   image: NetworkImage('https://i.redd.it/1w6s6g3613f31.jpg'),
          // ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text('EEeeeeemuuuuuasdasa')
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 8.0),
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
    );
  }
}
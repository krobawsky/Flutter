import 'dart:async';

import 'package:flutter/material.dart';

class ListviewPage extends StatefulWidget {
  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listaNum = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _agregar10(); 

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //_agregar10();
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista(){
    return RefreshIndicator(

        onRefresh: refrescar,

        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNum.length,
        itemBuilder: (BuildContext context, int Index){

          final imageId = _listaNum[Index];

          return FadeInImage(
            image: NetworkImage('https://picsum.photos/id/$imageId/500/300'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future<Null> refrescar() async {
    
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      _listaNum.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  void _agregar10(){
    for(var i = 1; i < 10; i++){
      _ultimoItem++;
      _listaNum.add(_ultimoItem);
    }
    
    setState(() {});
  }

  Future fetchData() async {

    _isLoading = true;
    setState(() {});

    final duration = new Duration( seconds:2);
    return new Timer(duration, respuestaHttp);

  }

  void respuestaHttp(){
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 150,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 500)
    );
    _agregar10();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _crearLoading(){
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }

}
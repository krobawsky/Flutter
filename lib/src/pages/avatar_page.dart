import 'package:flutter/material.dart'; 

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://cdn3.iconfinder.com/data/icons/business-avatar-1/512/7_avatar-512.png'),
              radius: 20,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0, top: 2),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://cdn3.iconfinder.com/data/icons/business-avatar-1/512/7_avatar-512.png'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(microseconds: 200),
        ),
      ),
    );
  }

}
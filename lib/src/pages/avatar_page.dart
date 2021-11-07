import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AvatarPage"),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("KCH"),
              backgroundColor: Colors.blueGrey,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              foregroundImage: NetworkImage("https://media.gq.com.mx/photos/6064ba9f40c44aa45469e33f/4:3/w_1824,h_1368,c_limit/jeff%20bezos-813883140.jpg"),
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage("assets/jar-loading.gif"), 
          image: NetworkImage("https://media.gq.com.mx/photos/6064ba9f40c44aa45469e33f/4:3/w_1824,h_1368,c_limit/jeff%20bezos-813883140.jpg"),
        ),
      ),
    );
  }
}
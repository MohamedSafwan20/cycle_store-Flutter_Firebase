import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.jpg", fit: BoxFit.cover,),
      ),
      body: Center(
        child: Text("HELLLOOOO", style: TextStyle(fontSize: 40),),
      ),
    );
  }
}

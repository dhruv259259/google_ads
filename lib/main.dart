import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: g_mod(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
  ));
}

class g_mod extends StatefulWidget {
  const g_mod({Key? key}) : super(key: key);

  @override
  State<g_mod> createState() => _g_modState();
}

class _g_modState extends State<g_mod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google ad mode"),
      ),
      body: Column(children: [
        
      ]),
    );
  }
}

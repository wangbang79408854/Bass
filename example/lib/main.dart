import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';


import 'midi_page.dart';
import 'mixer_page.dart';

void main() => runApp(new MaterialApp(home: MyApp(),));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  void navigatorMidi(){
    Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>MidiPage()));
  }

  void navigateMixer(){
    Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>MixerPage()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BassPluginExample'),
        ),
        body: Center(
          child: Column(children: <Widget>[
            RaisedButton(onPressed: navigatorMidi, child:Text("midi 模块") ),
            RaisedButton(onPressed: navigateMixer, child: Text("mixer 模块"))
          ],),
        ),
      ),
    );
  }
}

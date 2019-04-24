import 'package:flutter/material.dart';

void main() => runApp(MainEntry());
class MainEntry extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.white70,
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tutorials',
      home:Entry(),
    );
  }
}


class Entry extends StatefulWidget {
  @override
  _EntryState createState() => _EntryState();
}

class _EntryState extends State<Entry> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuperino Navigation"),
      ),
      body: Container(
        child: Center(
          child: Icon(IconData(0xF3E1,fontFamily: "CupertinoIcons"),size: 35.0,color: Colors.red,),
        ),
      ),
    ) ;
  }
}









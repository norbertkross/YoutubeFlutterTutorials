import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue
      ),
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
   final String title;
  MyHomePage({ this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

int theriGroupVakue = 0;

final Map<int, Widget> logoWidgets = const<int,Widget>{

  0:Text("Head1"),
  1:Text("Head2"),
  2:Text("Head3")

};

static Widget giveCenter(String yourText){
  return Center(
    child: Text("Text: $yourText",style: TextStyle(color: Colors.blue,fontSize: 20.0),),
  );
}

List<Widget> bodies = [
  giveCenter("Home Page"),
  giveCenter("Search Page"),
  giveCenter("Chat Room")
];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body:bodies[theriGroupVakue],
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Title",style: TextStyle(color: Colors.black),),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 45.0),
          child: Padding(
            padding: EdgeInsets.only(top: 5.0,bottom: 10.0),child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15.0,
                ),

                Expanded(
                  child: CupertinoSegmentedControl(
                    groupValue:theriGroupVakue,
                    onValueChanged: (changeFromGroupValue){
                      setState(() {
                        theriGroupVakue =changeFromGroupValue;
                      });
                    },
                    children: logoWidgets,
                  ),
                ),

                SizedBox(
                  width: 15.0,
                ),                
              ],
            ),
          ),
        ),
      ),
    );
  }
}






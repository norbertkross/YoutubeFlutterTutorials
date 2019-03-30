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
List<Widget> myPageClasses = [
HomePage1(),
FindPage(),
ChatRoom(),
];

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body:
       CupertinoTabScaffold(
      tabBuilder: (BuildContext context,currentIndex){
        return CupertinoPageScaffold(

          child: myPageClasses[currentIndex],
        );
      },
      tabBar: CupertinoTabBar(
        activeColor: CupertinoColors.activeGreen,
        items:[
        BottomNavigationBarItem(
          icon:Icon( CupertinoIcons.home),
          title: Text("Home"),
               ),  

        BottomNavigationBarItem(
          icon:Icon( CupertinoIcons.search),
          title: Text("Find"),
               ), 

        BottomNavigationBarItem(
          icon:Icon( CupertinoIcons.conversation_bubble),
          title: Text("Chat"),
               ),                                           
            ] ,
            
          
           )
    
      ),
   )
     ;
  }
}





class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
         child: Text(
           "Home Page"
         ),
       ),
    );
  }
}





class FindPage extends StatefulWidget {
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {

  final Map<int, Widget> logoWidgets = const <int, Widget>{
    0:Text("Head1"),
    1:Text("Head2"),
    2:Text("Head3"),
  };
  int theirGroupValue = 0;
static Widget giveCenter(yourText){
  return Center(
    child: Text("Text: $yourText"),
  );
}
List<Widget> bodies =[
  giveCenter("One"),
  giveCenter("Two"),
  giveCenter("Three"),
];



  Navigator.of(context)
  .push(CupertinoPageRoute(builder: (BuildContext context)=>
  UserPostActivity()));

  Navigator.of(context)
  .push(MaterialPageRoute(builder: (BuildContext context)=>
  UserPostActivity()));




  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Title", style: TextStyle(color: Colors.black)),
        bottom: PreferredSize(
           preferredSize: Size(double.infinity, 40.0),
          child: Padding(
            padding:EdgeInsets.only(top: 5.0, bottom: 10.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child:  CupertinoSegmentedControl(
                    children: logoWidgets,
                    groupValue: theirGroupValue,
                    onValueChanged: (chanfedGrpValue){
                      setState(() {
                      theirGroupValue =chanfedGrpValue; 
                      });
                    },
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
      body: bodies[theirGroupValue],
    );

  }
}


class ChatRoom extends StatefulWidget {
  final Widget child;

  ChatRoom({Key key, this.child}) : super(key: key);

  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
TextEditingController controller1 = TextEditingController(); 


  tryActionSheet(BuildContext context)async{
   showCupertinoModalPopup(
     context:  context,
     builder: (context){
       return CupertinoActionSheet(
         title: Text("Title"),
         message: Text("Your message body goes here"),
         actions: <Widget>[
           CupertinoActionSheetAction(
         onPressed:(){} ,
          child: Text("One"),
           ),
           CupertinoActionSheetAction(
         onPressed:(){} ,
          child: Text("Two"),
           ),
           CupertinoActionSheetAction(
         onPressed:(){} ,
          child: Text("Three"),
           ),                      
          //  Text("One"),
          //  Text("Two"),
          //  Text("Three"),
         ],
        cancelButton:CupertinoActionSheetAction(
          onPressed:(){} ,
          child: Text("Cancel"),
        ) ,
       );
     },
   );
}
  @override
  Widget build(BuildContext context) {
    // return Container(
    //    child: Center(
    //      child: Text(
    //        "Chat Room"
    //      ),
    //    ),
    // );

    return Scaffold(
      body: Column(
      children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
        
                   CupertinoButton(
             child: Text("Press Chat"),
             color: CupertinoColors.activeBlue,
             onPressed: (){
               tryActionSheet(context);
               print("Hello Printed");
               },
           ),

                SizedBox(
                  height: 50.0,
                ),
CupertinoTextField(controller: controller1),
                SizedBox(
                  height: 50.0,
                ),           
      ],
    ),
    ) ;
  }
}





class HomePage1 extends StatefulWidget {
  final Widget child;

  HomePage1({Key key, this.child}) : super(key: key);

  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  bool switchvalue =false;
  double sliderValue = 0.0;
  int selected_item = 0;

List<String> items = ["Aberor","Jesse","Hey "," You",
"How","Are ","Yours","Doing","Today","Now"];


Widget _buildItemPicker() {
    return CupertinoPicker(
      itemExtent: 60.0,
      backgroundColor: CupertinoColors.white,
      onSelectedItemChanged: (index) {
        setState(() {
          selected_item = index;
        });
        print(index);
      },
      children: new List<Widget>.generate(items.length, (index) {
        return new Center(child:
         Text(items[index],style: TextStyle(fontSize: 22.0),),
        );
      }),
    );
  }





  @override
  Widget build(BuildContext context) {

    //////////////////Cupertino Navigation
    return Container(
       child: Column(
         children:<Widget>[
           SizedBox(
             height: 150.0,
           ),
           CupertinoButton(
             child: Text("Press Me"),
             color: CupertinoColors.activeBlue,
             onPressed: (){
               cupertinodialog(context);
               print("Hello Printed");
               },
           ),
           SizedBox(
             height: 30.0,
           ),
           CupertinoButton(
             child: Text("Press Me"),
             color: CupertinoColors.activeGreen,
             onPressed: (){
               cupertinodialog(context);
               print("Hello Printed");
               },
           ),
           CupertinoButton(
             child: Text("Press Me"),
             //color: CupertinoColors.activeBlue,
             onPressed: ()async{
                  await showModalBottomSheet<int>(
                    context: context,
                    builder: (BuildContext context) {
                      return _buildItemPicker();
                    },
                  );
               print("Hello Printed");
               },
           ), 


                     
         ] ,
       ),
    );
  }
}


































































































































































    Future<Null> cupertinodialog(BuildContext context) async{

      await showDialog(
        context: context,
        //child:MyDialogClass(),
        builder: (BuildContext context){
            return MyDialogClass1();
            
        }
      );
    }


class MyDialogClass1 extends StatefulWidget {
  MyDialogClass1({this.hotel,this.hotelName,this.hotelLink});
  final String hotel;
  final String hotelName;
  final String hotelLink;
  _MyDialogClass1State createState() => _MyDialogClass1State();
}

class _MyDialogClass1State extends State<MyDialogClass1> {


  TextEditingController uniqueID = TextEditingController();

  dynamic dialogLoader = false;
  String dialogoaderString = ' status...Loading .....';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return  CupertinoAlertDialog(
                      title:Text(' Where The Title Goes',style:TextStyle(
                        color: CupertinoColors.activeBlue
                      ),) ,
                      content:Container(
                        child: Column(
                          children: <Widget>[
                            Text('Some Giberish Data Som Giberish Data',style:TextStyle(
                        color: CupertinoColors.activeBlue
                      ),),
                      Padding(
                        padding:EdgeInsets.all(5.0),
                      ),
                         ],
                        ),
                      ) ,
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Verify',style: TextStyle(color: CupertinoColors.activeBlue)),
                          onPressed: (){
                            print("Verified");
                             },
                        ),
                         FlatButton(
                          child: Text('Cancel',style: TextStyle(color: CupertinoColors.activeBlue)),
                          onPressed: (){
                            Navigator.of(context).pop(context);
                            },
                        ),
                      ],

                    );
  }
    @override
  void dispose() {
      // TODO: implement dispose
      super.dispose();
    }
}









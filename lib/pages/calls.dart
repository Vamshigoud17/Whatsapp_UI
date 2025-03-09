import 'package:flutter/material.dart';
import 'package:sampleflutter/main.dart';
import 'package:intl/intl.dart';
import 'package:sampleflutter/pages/Communities.dart';
import 'package:sampleflutter/pages/update.dart';

class Calls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _calls(),
    );
  }
}

class _calls extends StatefulWidget{
  _callstate createState() => _callstate();
}

class _callstate extends State<_calls>{
  int _isactive_nav = 3;
  List<String> name = [
    "Vamshi", "Nithanya", "Akshith", "Adarsh", "Meghana", "Sravanthi",
    "Sathwika", "Sriram", "Raj Kiran", "Abhinav", "Vishal",
    "Vyshnavi", "Pramod"
  ];
  List<IconData> navicons = [Icons.chat, Icons.update, Icons.group_add_outlined, Icons.call];
  List<String> bottomNav = ["Chats", "Updates", "Communities", "Calls"];
  List<String> channelsnames = ["BVG CREATIONS", "Mr beast", "dropuutarts", "student tribe"];
  List<String> status_names =  [
    "Vamshi", "Nithanya", "Akshith", "Adarsh", "Meghana", "Sravanthi",
    "Sathwika", "Sriram", "Raj Kiran", "Abhinav", "Vishal",
    "Vyshnavi", "Pramod"
  ];
  String date = DateFormat('dd MMM').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    // Header
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Calls", style: TextStyle(color: Colors.white)),
            Row(
              children: [
                Icon(Icons.qr_code_scanner, color: Colors.white),
                SizedBox(width: 20),
                Icon(Icons.camera_alt_outlined, color: Colors.white),
                SizedBox(width: 20),
                Icon(Icons.more_vert, color: Colors.white),
              ],
            )
          ],
        ),
      ),
      //scrollable area
      body: Expanded(
        child: SingleChildScrollView(
          child: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        child: Column(
        children: [
                                                                                 //title
          SizedBox(height: 10),
          Padding(
          padding: EdgeInsets.only(left: 20),
          child:  Container(
            alignment: Alignment.topLeft,
            color: Colors.black,
            child: Text("Favorites",style: TextStyle(color: Colors.white,fontSize: 20),),
          ),
         ),
         SizedBox(height: 10),
         Container(
          child: ListTile(
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.green,
                  child:Icon(Icons.favorite,color: const Color.fromARGB(255, 0, 0, 0),size: 20,),
                ),
                
              ],
            ),
            title: Text( "Add favorites",style: TextStyle(color: Colors.white),),
          )
         )                                                         
        ],
      ),
      ),
      )
      ),
                                                                                                    //bottom nav  
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(bottomNav.length, (index) {
            bool _isactive = _isactive_nav == index;
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isactive_nav = index;
                  });

                  
                 if (index == 0) {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => MyApp(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                    ),
                    ); 
                 }
                 else if(index==1){
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => Updates(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                    ),
                    ); 
                 }
                 else if(index==2){
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => Communities(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                    ),
                    ); 
                 }
                 
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _isactive ? Colors.black : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                        decoration: BoxDecoration(
                          color: _isactive ? const Color.fromARGB(43, 99, 196, 102) : const Color.fromARGB(0, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(navicons[index], color: _isactive ? Colors.green : Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(bottomNav[index], style: TextStyle(color: _isactive ? Colors.green : Colors.grey)),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
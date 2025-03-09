import 'package:flutter/material.dart';
import 'package:sampleflutter/main.dart';
import 'package:intl/intl.dart';
import 'package:sampleflutter/pages/calls.dart';
import 'package:sampleflutter/pages/update.dart';

class Communities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _communities(),
    );
  }
}

class _communities extends StatefulWidget{
  _comstate createState() => _comstate();
}

class _comstate extends State<_communities>{
  int _isactive_nav = 2;
  List<IconData> navicons = [Icons.chat, Icons.update, Icons.group_add_outlined, Icons.call];
  List<String> bottomNav = ["Chats", "Updates", "Communities", "Calls"];
  List<String> com_names = ["cse", "kits", "friends", "student_news"];
  List<String> groups = ["group1", "group2"];

  String date = DateFormat('dd MMM').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
                                                                                                           // heading
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Communities", style: TextStyle(color: Colors.white)),
            Row(
              children: [
                Icon(Icons.qr_code_scanner, color: Colors.white),
                SizedBox(width: 20),
                Icon(Icons.more_vert, color: Colors.white),
              ],
            )
          ],
        ),
      ),
      
      body: Expanded(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(height: 10),
                Container(
                  child: Stack(
                    children: [
                      
                      ListTile(
                        leading: Container(
                          
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey
                          ),
                          child: Icon(Icons.group,color: const Color.fromARGB(255, 216, 215, 215),size: 30),
                        ),
                        title: Text("New community",style: TextStyle(color: Colors.white),),
                      ),

                    ],
                  ),
                  ),
                
                Container(
                padding: EdgeInsets.all(10),
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                children: [
                for (var name in com_names) ...[
                  Container(
                 decoration: BoxDecoration(
                     border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: const Color.fromARGB(131, 255, 255, 255)
                      )
                     ), 
                    ),
                 margin: EdgeInsets.symmetric(vertical: 5), 
                 child: ListTile(
                 contentPadding: EdgeInsets.symmetric(vertical: 5),
                 leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                 ),
                 title: Text(
                     name,
                     style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  ),
                  ),
                  for (var gname in groups)
                    ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20), 
                    leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.blueGrey, 
                       ),
                    title: Text(
                         gname,
                         style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                    subtitle: Text(
                         "Hello from group!",
                         style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                     trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                              Text(
                                   date,
                                  style: TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                              SizedBox(height: 4),
                              Icon(Icons.circle, color: Colors.green, size: 10),
                           ],
                        ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text("   >   View all", style: TextStyle(color: Colors.grey),),
                          )
                        ],
                      ),
                    )
                  ],
                  ]
                 ),
                ),
               ),
              ],
            ),
          ),
        ),
      ),
                                                                                                              //bottom nav bar
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
                 else if(index == 1)
                 {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => Updates(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                    ),
                    ); 
                 }
                 else if(index == 3)
                  {
                    Navigator.push(
                    context,
                    PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => Calls(),
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
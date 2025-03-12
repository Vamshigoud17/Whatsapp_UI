import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sampleflutter/pages/calls.dart';
import 'package:sampleflutter/pages/update.dart';
import 'package:sampleflutter/pages/Communities.dart';

void main() {
  runApp(Calls());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/updates': (context) => Updates(),
        '/Communities': (context) => Communities() 
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _isactive_nav = 0;
  int _isactive_filter = 0;
  List<String> name = [
    "Vamshi", "Nithanya", "Akshith", "Adarsh", "Meghana", "Sravanthi",
    "Sathwika", "Sriram", "Raj Kiran", "Abhinav", "Vishal",
    "Vyshnavi", "Pramod"
  ];
  List<IconData> navicons = [Icons.chat, Icons.update, Icons.group_add_outlined, Icons.call];
  List<String> filter = ["All", "Unread", "Favorites", "Groups", "+"];
  List<String> bottomNav = ["Chats", "Updates", "Communities", "Calls"];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
                                                                       //heading
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("WhatsApp", style: TextStyle(color: Colors.white)),
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
      body: Column(
        children: [
                                                                        // Search Bar
          Container(
            color: Colors.black,
            height: 60,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.97,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 43, 43, 43),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 20),
                      Text("Ask Meta AI or Search", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ],
            ),
          ),
                                                                              // Filter Bar
          Container(
            height: 40,
            color: Colors.black,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filter.length,
              itemBuilder: (context, index) {
                bool _isactive_F = _isactive_filter == index;
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        _isactive_filter = index;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: _isactive_F ? const Color.fromARGB(43, 99, 196, 102) : Color.fromARGB(255, 43, 43, 43),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(filter[index], style: TextStyle(color: _isactive_F ? Colors.green : Colors.grey, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ));
              },
            ),
          ),
                                                                  // Chat List
          Expanded(
            child: Container(
              color: Colors.black,
              child: ListView.builder(
                itemCount: name.length,
                itemBuilder: (context, index) {
                  String date = DateFormat('dd MMM').format(DateTime.now());
                  return ListTile(
                    title: Text(name[index], style: TextStyle(color: Colors.white)),
                    subtitle: Text("Hello!", style: TextStyle(color: Colors.grey)),
                    leading: Icon(Icons.circle, size: 50, color: Colors.grey),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(date, style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Icon(Icons.circle, color: Colors.green)
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
                                                             // Bottom Navigation Bar
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

                 
                  if (index == 1) {
                    Navigator.push(
                    context,
                    PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => Updates(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                    ),
                    );
                  }
                  else if (index == 2)
                  {
                    Navigator.push(
                    context,
                    PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => Communities(),
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
                  setState(() {
                    _isactive_nav = index;
                  });
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

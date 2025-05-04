import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sampleflutter/pages/calls.dart';
import 'package:sampleflutter/pages/chat.dart';
import 'package:sampleflutter/pages/update.dart';
import 'package:sampleflutter/pages/Communities.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/updates': (context) => Updates(),
        '/communities': (context) => Communities(),
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

  List<IconData> navicons = [
    Icons.chat, Icons.update, Icons.group_add_outlined, Icons.call
  ];

  List<String> filter = ["All", "Unread", "Favorites", "Groups", "+"];
  List<String> bottomNav = ["Chats", "Updates", "Communities", "Calls"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("WhatsApp", style: TextStyle(color: Colors.white)),
            Row(
              children: const [
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
                    color: const Color.fromARGB(255, 43, 43, 43),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: const [
                      SizedBox(width: 20),
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 20),
                      Text(
                        "Ask Meta AI or Search",
                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
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
                bool isActive = _isactive_filter == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _isactive_filter = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: isActive
                            ? const Color.fromARGB(43, 99, 196, 102)
                            : const Color.fromARGB(255, 43, 43, 43),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          filter[index],
                          style: TextStyle(
                            color: isActive ? Colors.green : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Chatscreen(name: name[index]),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(name[index], style: const TextStyle(color: Colors.white)),
                      subtitle: const Text("Hello!", style: TextStyle(color: Colors.grey)),
                      leading: const Icon(Icons.circle, size: 50, color: Colors.grey),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                          const Icon(Icons.circle, color: Colors.green, size: 10),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(bottomNav.length, (index) {
            bool isActive = _isactive_nav == index;
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isactive_nav = index;
                  });

                  Widget? targetPage;
                  switch (index) {
                    case 1:
                      targetPage = Updates();
                      break;
                    case 2:
                      targetPage = Communities();
                      break;
                    case 3:
                      targetPage = Calls();
                      break;
                  }

                  if (targetPage != null) {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => targetPage!,
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isActive ? Colors.black : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                        decoration: BoxDecoration(
                          color: isActive
                              ? const Color.fromARGB(43, 99, 196, 102)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          navicons[index],
                          color: isActive ? Colors.green : Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        bottomNav[index],
                        style: TextStyle(
                          color: isActive ? Colors.green : Colors.grey,
                        ),
                      ),
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

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<String> name = [
    "Vamshi", "Pandi", "Akshith", "Adarsh", "Meghana", "Sravanthi",
    "Sathwika", "Sriram", "Raj Kiran", "Abhinav", "Vishal",
    "Vyshnavi", "Pramod"
  ];
  List<IconData> navicons = [Icons.chat , Icons.update , Icons.group_add_outlined , Icons.call];
  List<String> filter = ["All", "Unread", "Favorites", "Groups", "+"];
  List<String> bottomNav = ["Chats", "Updates", "Communities", "Calls"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                        Text("Ask Meta AI or Search", style: TextStyle(color: Colors.grey))
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
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 43, 43, 43),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(filter[index], style: TextStyle(color: Colors.grey)),
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
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              bottomNav.length,
              (index) => GestureDetector(
                
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      navicons[index],
                      color: Colors.grey,
                    ),
                    SizedBox(height: 4),
                    Text(
                      bottomNav[index],
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

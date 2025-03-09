import 'package:flutter/material.dart';
import 'package:sampleflutter/main.dart';
import 'package:intl/intl.dart';

class Updates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _updates(),
    );
  }
}

class _updates extends StatefulWidget{
  _updatestate createState() => _updatestate();
}

class _updatestate extends State<_updates>{
  int _isactive_nav = 1;
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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Updates", style: TextStyle(color: Colors.white)),
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
      
      body: Expanded(
        child: SingleChildScrollView(
          child: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        child: Column(
        children: [
          SizedBox(height: 10),
         Padding(
          padding: EdgeInsets.only(left: 20),
          child:  Container(
            alignment: Alignment.topLeft,
            color: Colors.black,
            child: Text("Status",style: TextStyle(color: Colors.white,fontSize: 20),),
          ),
         ),SizedBox(height: 10),
         Container(
          height: 180,
          width:double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: status_names.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                          width: 90,
                          height: 150,
                          decoration: BoxDecoration(
                            color:  Color.fromARGB(255, 43, 43, 43),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10,top: 10),
                          child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                        ),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(status_names[index],style: TextStyle(color: Colors.white, fontSize: 12),
                        overflow: TextOverflow.ellipsis,)
                  ],
                )
              );
            },
          ),
         ),SizedBox(height: 10,),
         Container(
          child: Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Channels",style: TextStyle(color: Colors.white,fontSize: 20),),
              Text("Explore  >",style: TextStyle(color: Colors.green),textAlign: TextAlign.left,)
            ],
          ),
          ),
         ),
         Container(
          padding: EdgeInsets.all(10),
          child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
            for (var name in channelsnames)
              ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey, // Placeholder for profile pic
              ),
              title: Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              subtitle: Text(
                "Hello!",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    date,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Icon(Icons.circle, color: Colors.green, size: 12),
                ],
              ),
             ),
            ],
           ),
          ),
          ),
          SizedBox(height: 10),
          Container(
             alignment: Alignment.centerLeft,
             child: Row(
             children: [
              SizedBox(width: 10,),
              Text("Find channels to follow",style: TextStyle(color: Colors.grey, fontSize: 12),),
             ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  for(var names in channelsnames)
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey,
                    ),
                    title: Text(
                      names,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "27 M followers",
                      style: TextStyle(color: Colors.grey)
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(80, 99, 196, 102)
                      ),
                      child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      child: Text(
                        "Follow",
                        style: TextStyle(color: const Color.fromARGB(255, 193, 217, 194),fontWeight:FontWeight.bold),
                      ),
                       ),
                    )
                  )
                ],
              ),
              ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                SizedBox(width: 10,),
                Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: const Color.fromARGB(110, 255, 255, 255),
                width: 1,
                
              ),
              ),
              child: Padding(
              padding:EdgeInsets.symmetric(vertical: 5,horizontal: 15),
              child: Text("Explore More",style: TextStyle(color: Colors.green,fontSize: 13),), 
            ),
          )
              ],
            )
            )
        ],
      ),
      ),
      )
      ),
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
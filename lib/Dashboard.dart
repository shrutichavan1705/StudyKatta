import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/SemesterPage.dart';
// import 'package:login_page/demo.dart';
import 'package:login_page/main.dart';
//
// void main() {
//   runApp(MyApp());
// }

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

Color fy = Colors.orange.shade600;
Color sy = Colors.red.shade300;
Color ty = Colors.deepPurple.shade400;
Color bt = Colors.yellow.shade700;

Color bgfy = Colors.deepOrange.shade100;
Color bgsy = Colors.red.shade100;
Color bgty = Colors.deepPurple.shade100;
Color bgbt = Colors.yellow.shade100;



class _DashboardPageState extends State<DashboardPage> {
  String unm="";
  _DashboardPageState(){
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user != null) {
        String temp=user.email!;
        unm=temp.substring(0,temp.indexOf("@gmail"));
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  AppBar(
          title: Row(
        children:  [
          Icon(Icons.menu_book_sharp),
          Text(
            'Study Katta',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      )),
      drawer: Drawer(
          child: ListView(
        children: [
           DrawerHeader(
              child: UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.white70),
            accountName: Text(
              ""+unm,
              style: TextStyle(color: Colors.black87),
            ),
            accountEmail: Text(
              "email",
              style: TextStyle(color: Colors.black87),
            ),
            currentAccountPicture: CircleAvatar(
              child: Text('U'),
            ),
            currentAccountPictureSize: Size.square(40),
          )),
          ListTile(
            title: Text('CSE'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('CSIT'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Mechanical'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Civil'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Mechatronics'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('ELectrical'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('E&TC'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('BBA'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('MBA'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.login_outlined),
            title: Text('Logout'),
            onTap: () async{
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));

            },
          )
        ],
      )),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/dashbimg.jpg',
                  fit: BoxFit.cover,
                  width: 300,
                  height: 220,
                ),
                Positioned(
                  top: 80.0, // Adjust position as needed
                  // left: 60.0, // Adjust position as needed
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.white60,
                    padding: EdgeInsets.all(30),
                    child: const Text(
                      "Computer Science Engineering",
                      style: TextStyle(
                          color: Colors.black,
                          // backgroundColor: Colors.black12,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(left: 30, right: 15, top: 20, bottom: 20),
                  child: SizedBox(
                    width: 130,
                    height: 130,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SemesterDataPage(year: "First Year", color:  fy, bgcolor: bgfy,)));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange.shade600,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: const Text(
                          'FIRST\nYEAR',
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300
                          ),
                        )),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 15, right: 25, top: 20, bottom: 20),
                  child: SizedBox(
                    width: 130,
                    height: 130,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SemesterDataPage(year: "Second Year", color: sy, bgcolor: bgsy)));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade300,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: const Text(
                          'SECOND\n   YEAR',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300
                          ),
                        )),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(left: 30, right: 15, top: 10, bottom: 10),
                  child: SizedBox(
                    width: 130,
                    height: 130,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SemesterDataPage(year: "Third Year", color: ty, bgcolor: bgty)));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple.shade400,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: const Text(
                          'THIRD\n YEAR',
                          style: TextStyle(fontSize: 18,
                          fontWeight: FontWeight.w300),
                        )),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 15, right: 30, top: 10, bottom: 10),
                  child: SizedBox(
                    width: 130,
                    height: 130,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SemesterDataPage(year: "Final Year", color: bt, bgcolor: bgbt)));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow.shade700,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: const Text(
                          'FINAL\nYEAR',
                          style: TextStyle(fontSize: 18,
                          fontWeight: FontWeight.w300),
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

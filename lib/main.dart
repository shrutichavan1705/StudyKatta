import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_page/demo.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:login_page/signUp_page.dart';
import 'package:login_page/Dashboard.dart';
import 'package:login_page/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'StudyMaterialPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }

}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNm= TextEditingController();
  TextEditingController password= TextEditingController();
  String _selectedRole ="";
  final List<String> _roles = ["CSE", "E&TC","Electrical", "CSIT", "Mechanical", "Mechatronics", "AI","Civil","BBA","MBA"];

  @override
  void initState() {
    super.initState();
    checkIsLoggedIn();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Row(children: [
          Icon(Icons.menu_book_sharp),
          Text('Study Katta',style: TextStyle(fontStyle: FontStyle.italic),),
        ],)
      ),
      body:SingleChildScrollView(
        child: Center(
          child: SizedBox(
            height: 800,
            width: 400,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login",style: TextStyle(fontSize: 30),),
                  Container(
                    child: Image(image: AssetImage('assets/logimg.jpg'),
                      height: 200,
                      width: 250,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child:TextField(
                      controller: userNm,
                      decoration: InputDecoration(
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        labelText: "Username",
                      ),
                    )
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child:TextField(
                      controller: password,
                      decoration: InputDecoration(
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        labelText: "Password",
                        isDense: true,
                      ),
                      obscureText: true,
                    ),
                  ),
        
                  Container(
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        String unm=userNm.text.toString();
                        String pass=password.text.toString();
                        if(unm=="" || pass=="") {
                          Fluttertoast.showToast(msg: "Please enter valid Details" ,toastLength: Toast.LENGTH_SHORT);
                          return;
                        }
                        signIn();

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        elevation: 5.0,
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      child: Text("Login",style: TextStyle(fontSize: 15),),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(right: 80),
                        child:InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage())),
                          child: Text("Sign Up", style: TextStyle(color: Colors.blue),),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(left: 80),
                        child: InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyMaterialPage(subject: 'Physics'))),
                          child: Text("Forgot Password?", style: TextStyle(color: Colors.blue),),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }

  void signIn()async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userNm.text.toString()+"@gmail.com",
          password: password.text.toString()
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashboardPage()));
    }  catch (e) {
        Fluttertoast.showToast(msg:'Invalid details ');
        return;
      }
    }

  void checkIsLoggedIn() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user != null)
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashboardPage()));
      }
    });
  }

}


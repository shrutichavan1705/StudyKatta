import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_page/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

//
// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  MyApp () {
    firebaseConfigure();
  }

  void firebaseConfigure() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _selectedRole ="";
  final List<String> _roles = ["CSE", "E&TC","Electrical", "CSIT", "Mechanical", "Mechatronics", "AI","Civil","BBA","MBA"];
  TextEditingController usernm =TextEditingController();
  TextEditingController pass =TextEditingController();
  TextEditingController cpass =TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(children: [
            Icon(Icons.menu_book_sharp),
            Text('Study Katta',style: TextStyle(fontStyle: FontStyle.italic),),
          ],)
        ),
        body:SingleChildScrollView(
          child: Center(
            child: SizedBox(
              height: 600,
              width: 400,
              child: Container(
                margin: EdgeInsets.only(top: 0),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image(image: AssetImage('assets/sign.jpg'),
                        height: 200,
                        width: 250,
                      ),
                    ),
                    Container(
                        // margin: EdgeInsets.only(bottom: 15, top: 15, right: 20,left: 20),
                        margin: EdgeInsets.all(10),
                        child:TextField(
                          controller: usernm,
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            ),
                            labelText: "Username",
                          ),
                        )
                    ),
                    //
                    // Container(
                    //   margin: EdgeInsets.all(10),
                    //   child: DropdownButtonFormField<String>(
                    //
                    //     items: _roles
                    //         .map((role) => DropdownMenuItem(
                    //       value: role,
                    //       child: Text(role),
                    //     ))
                    //         .toList(),
                    //     onChanged: (value) {
                    //       setState(() {
                    //         _selectedRole = value!;
                    //       });
                    //     },
                    //     decoration: InputDecoration(
                    //       labelText: "Department",
                    //     ),
                    //   ),
                    // ),
                    Container(
                      // margin: EdgeInsets.only(bottom: 15, top: 15, right: 20,left: 20),
                      margin: EdgeInsets.all(10),
                      child:TextField(
                        controller: pass,
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
                      // margin: EdgeInsets.only(bottom: 15, top: 15, right: 20,left: 20),
                      margin: EdgeInsets.all(10),
                      child:TextField(
                        controller: cpass,
                        decoration: InputDecoration(
                          border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          labelText: "Confirm Password",
                          isDense: true,
                        ),
                        obscureText: true,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          String unm=usernm.text.toString();
                          String password=pass.text.toString();
                          String cpassword=cpass.text.toString();

                          if(unm=="" || password=="" || cpassword=="") {
                            Fluttertoast.showToast(msg: "Please enter valid Details" ,toastLength: Toast.LENGTH_SHORT);
                            return;
                          }
                          if(password.length<6) {
                            Fluttertoast.showToast(msg: "Password should br greater than 6",toastLength: Toast.LENGTH_SHORT);
                            return;
                          }
                          if(password != cpassword) {
                            Fluttertoast.showToast(msg: "Password do not match",toastLength: Toast.LENGTH_SHORT);
                            return;
                          }
                          signUp();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            elevation: 5.0,
                            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                        ),
                        child: Text("Sign In",style: TextStyle(fontSize: 15),),
                      ),
                    ),
          
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }

  void signUp() async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: usernm.text.toString()+"@gmail.com",
        password: pass.text.toString()
      );
      Fluttertoast.showToast(msg: "User registerd succesfully ! Go to Login");

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "Password too weak");
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: "The username already exists !");
      }
    } catch (e) {
      print(e);
    }
  }
}

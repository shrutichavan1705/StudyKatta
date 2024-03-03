import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Demo(subject: "Subject",),
    );
  }
}

class Demo extends StatefulWidget {
  final String subject;

  const Demo({Key? key, required this.subject});

  @override
  State<Demo> createState() => _DemoState();
}
 String text="";
class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject),
      ),
      body: Center(
        child: Container(
          width: 400,
          color: Colors.blue.shade100,
          child: Column(
            children: [
              Container(
                height: 140,
                width: 350,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child:
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child:
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [

                              Container(
                                width:100,
                                height: 100,
                                margin: EdgeInsets.only(bottom: 20,left: 10),

                                  child: ElevatedButton(
                                    onPressed: () {
                                      text= "Unit 1";
                                    },
                                    child: Text("UNIT I",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blueAccent,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)),
                                        // padding: EdgeInsets.symmetric(vertical: 50, horizontal: 45)
                                      ),
                                  ),
                              ),
                              Container(
                                width:100,
                                height: 100,
                                margin: EdgeInsets.only(bottom: 20,left: 10),
                                child: ElevatedButton(
                                  onPressed: () {
                                     text= "Unit 2";
                                  },
                                  child: Text("UNIT II",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),textAlign: TextAlign.center,),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.teal.shade300,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                      // padding: EdgeInsets.symmetric(
                                      //     vertical: 50, horizontal: 42)
                                  ),
                                ),
                              ),
                              Container(
                                width:100,
                                height: 100,
                                margin: EdgeInsets.only(bottom: 20,left: 10),
                                child: ElevatedButton(
                                  onPressed: () {text= "sem sum 2";},
                                  child: Text("ESE (SUM)",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16)),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueAccent,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                      // padding: EdgeInsets.symmetric(
                                      //     vertical: 40, horizontal: 35)
                                  ),
                                ),
                              ),
                              Container(
                                width:100,
                                height: 100,
                                margin: EdgeInsets.only(bottom: 20,left: 10,right: 10),
                                child: ElevatedButton(
                                  onPressed: () {text= "win sem 2";},
                                  child: Text("ESE (WIN)",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16)),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.teal.shade300,

                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                      // padding: EdgeInsets.symmetric(
                                      //     vertical: 40, horizontal: 40)
                                  ),
                                ),
                              ),

                            ],

                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

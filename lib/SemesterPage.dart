import 'package:flutter/material.dart';

// void main() {
//   runApp(Myapp());
// }

Color color = Colors.orange.shade600;
Color bgcolor = Colors.deepOrange.shade100;

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Semesters',
      home: SemesterDataPage(year: "First Year", color: color,bgcolor: bgcolor),
    );
  }
}

class SemesterDataPage extends StatefulWidget {
  final String year;
  final Color color;
  final Color bgcolor;

  const SemesterDataPage({Key? key, required this.year, required this.color, required this.bgcolor})
      : super(key: key);

  @override
  State<SemesterDataPage> createState() => _SemesterDataPageState();
}

class _SemesterDataPageState extends State<SemesterDataPage> {
  bool _isStateOnSem1 = true;
  bool _isStateOnSem2 = false;
  final ListTile list = ListTile();

  void _toggleStateSem1() {
    if(!_isStateOnSem1){
      setState(() {
        _isStateOnSem1 = true;
        _isStateOnSem2 = false;
      });
    }
  }

  void _toggleStateSem2() {
    if(!_isStateOnSem2){
      setState(() {
        _isStateOnSem2 = true;
        _isStateOnSem1 = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.menu_book_sharp),
            Text(
              widget.year,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
      body: Container(
        color: widget.bgcolor,
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 350,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _toggleStateSem1,
                      child: Container(
                        width: 150,
                        height: 80,
                        decoration: BoxDecoration(
                          color: _isStateOnSem1 ? widget.color : Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            'Sem I',
                            style: TextStyle(
                              color: _isStateOnSem1 ? Colors.white : widget.color,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: _toggleStateSem2,
                      child: Container(
                        width: 150,
                        height: 80,
                        decoration: BoxDecoration(
                          color: _isStateOnSem2 ? widget.color : Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            'Sem II',
                            style: TextStyle(
                              color: _isStateOnSem2 ? Colors.white : widget.color,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
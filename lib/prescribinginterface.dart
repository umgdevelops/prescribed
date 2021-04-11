import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:prescribed/patienthistory.dart';
import 'package:prescribed/doctorform.dart';
//import 'package:prescribed/patienthistory.dart';
import 'package:flutter/material.dart';

//import 'doctorform.dart';

class BottomNavBar1 extends StatefulWidget {
  final int index;
  BottomNavBar1(this.index);

  @override
  _BottomNavBarState1 createState() => _BottomNavBarState1();
}

class _BottomNavBarState1 extends State<BottomNavBar1> {
  int _page1 = 0;
  int _page2 = 0;

  final _pageoption1 = [
    Doctorform(),
  ];
  final _pageoption2 = [
    //Doctorform(),
    Patienthistory(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(primarySwatch: Colors.deepPurple),
        // appBar: AppBar(
        //   title: Text("prescribing interface"),
        // ),
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar( actions: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                      // ignore: unnecessary_statements
                      () => Navigator.of(context).pop();
                },
              )
            ],
              toolbarHeight: 60,
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: "Prescrption",
                  ),
                  Tab(
                    text: "Patient History",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                _pageoption1[_page1],
                _pageoption2[_page2],
              ],
            ),
          ),
        )
        //resizeToAvoidBottomPadding: false,
        // bottomNavigationBar: CurvedNavigationBar(
        //   items: <Widget>[
        //     Icon(Icons.medical_services_outlined, size: 20),
        //     Icon(Icons.history, size: 20),
        //   ],
        //   color: Colors.white,
        //   buttonBackgroundColor: Colors.white,
        //   backgroundColor: Colors.deepPurpleAccent,
        //   animationCurve: Curves.easeInOut,
        //   animationDuration: Duration(milliseconds: 250),
        //   onTap: (index) {
        //     setState(() {
        //       _page1 = index;
        //     });
        //   },
        // ),
        // body: _pageoption1[_page1],

        );
  }
}

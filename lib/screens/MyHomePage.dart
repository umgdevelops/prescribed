import 'package:prescribed/constant.dart';
import 'package:prescribed/screens/home_page.dart';
import 'package:prescribed/screens/prescription_list.dart';
import 'package:prescribed/screens/profile_page.dart';
import 'package:prescribed/screens/reminder_page.dart';
import 'package:prescribed/screens/search_doctor_screen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String patientUsername;
  MyHomePage({Key key, @required this.patientUsername}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomePage(patientUsername: widget.patientUsername),
      PrescriptionList(),
      SearchDoctorScreen(patientUsername: widget.patientUsername),
      ReminderPage(),
      ProfilePage(patientUsername: widget.patientUsername),
    ];
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          elevation: 0,
          backgroundColor: kDarkBlueColor,
          unselectedIconTheme: IconThemeData(color: Colors.white54),
          selectedIconTheme: IconThemeData(color: Colors.white),
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 2.0,
                        color: _selectedIndex == 0
                            ? Colors.white
                            : kDarkBlueColor),
                  ),
                ),
                child: Container(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: ImageIcon(AssetImage('assets/icons/home.png'))),
              ),
              label: 'Home',
              backgroundColor: kDarkBlueColor,
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 2.0,
                        color: _selectedIndex == 1
                            ? Colors.white
                            : kDarkBlueColor),
                  ),
                ),
                child: Container(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: ImageIcon(
                        AssetImage('assets/icons/medical-records.png'))),
              ),
              label: 'Prescriptions',
              backgroundColor: kDarkBlueColor,
            ),
            BottomNavigationBarItem(
              icon: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 2.0,
                          color: _selectedIndex == 2
                              ? Colors.white
                              : kDarkBlueColor),
                    ),
                  ),
                  child: Container(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child:
                          ImageIcon(AssetImage('assets/icons/zoom-in.png')))),
              label: 'Search',
              backgroundColor: kDarkBlueColor,
            ),
            BottomNavigationBarItem(
              icon: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 2.0,
                          color: _selectedIndex == 3
                              ? Colors.white
                              : kDarkBlueColor),
                    ),
                  ),
                  child: Container(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: ImageIcon(AssetImage('assets/icons/alarm.png')))),
              label: 'Reminders',
              backgroundColor: kDarkBlueColor,
            ),
            BottomNavigationBarItem(
              icon: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 2.0,
                          color: _selectedIndex == 4
                              ? Colors.white
                              : kDarkBlueColor),
                    ),
                  ),
                  child: Container(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child:
                          ImageIcon(AssetImage('assets/icons/profile2.png')))),
              label: 'Profile',
              backgroundColor: kDarkBlueColor,
            ),
          ],
        ),
      ),
    );
  }
}

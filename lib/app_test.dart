import 'package:prescribed/screens/home_page.dart';
import 'package:prescribed/screens/prescription_list.dart';
import 'package:prescribed/screens/profile_page.dart';
import 'package:prescribed/screens/reminder_page.dart';
import 'package:prescribed/screens/search_doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'tab_item.dart';
import 'bottom_navigation.dart';

const String prescription_with_pen = 'assets/icons/prescription_with_pen.svg';

class MyApp extends StatefulWidget {
  final String activeUser;
  // MyApp(this.activeUser);
  MyApp({Key key, @required this.activeUser}) : super(key: key);
  @override
  // _MyAppState createState() => _MyAppState();
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static int currentTab = 0;
  final profileIcon = SvgPicture.asset('assets/icons/user.svg');

  void _selectTab(int index, List<TabItem> tabs) {
    print('Select tab passed INDEX  IS ---- $index');
    print('Select tab passed INDEX  IS ---- $currentTab');
    if (index == currentTab) {
      print('INSIDE SELECTtAB() IF');
      tabs[index].key.currentState.popUntil((route) => route.isFirst);
    } else {
      print('INSIDE SELECTtAB() ELSE');
      setState(() => currentTab = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<TabItem> tabs = [
      TabItem(
        tabName: "Home",
        icon: AssetImage('assets/icons/home.png'),
        page: HomePage(),
      ),
      TabItem(
        tabName: "Consultations",
        icon: AssetImage('assets/icons/medical-records.png'),
        page: PrescriptionList(),
      ),
      TabItem(
        tabName: "Search Doctor",
        // icon: Icons.search_rounded,
        icon: AssetImage('assets/icons/med_search.png'),
        // page: SearchDoctor(),
        page: SearchDoctorScreen(patientUsername: widget.activeUser),
      ),
      TabItem(
        tabName: "Reminder",
        // icon: Icons.notifications,
        icon: AssetImage('assets/icons/alarm.png'),
        page: ReminderPage(),
      ),
      TabItem(
        tabName: "Profile",
        // icon: Icons.person_rounded,
        icon: AssetImage('assets/icons/profile2.png'),
        page: ProfilePage(),
      ),
    ];

    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await tabs[currentTab].key.currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (currentTab != 0) {
            // select 'main' tab
            _selectTab(0, tabs);
            // back button handled by app
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: currentTab,
          children: tabs.map((e) => e.page).toList(),
        ),
        bottomNavigationBar: BottomNavigation(
          onSelectTab: (_indexname) => {
            print('Current INDEX  IS ---- $_indexname'),
            _selectTab(_indexname, tabs),
          },
          tabs: tabs,
        ),
      ),
    );
  }
}

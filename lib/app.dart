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

class App extends StatefulWidget {
  App({Key key, @required this.user}) : super(key: key);
  final String user;
  @override
  State<StatefulWidget> createState() => AppState(this.user, tabs);
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
      page: SearchDoctorScreen(patientUsername: 'umang'),
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
}

class AppState extends State<App> {
  static int currentTab = 0;
  final profileIcon = SvgPicture.asset('assets/icons/user.svg');

  AppState(user, tabs) {
    print(
        ' LOGGED IN USER NAME IS : ----------------------------------- $user');
    tabs.asMap().forEach((index, details) {
      details.setIndex(index);
    });
  }

  void _selectTab(int index, List<TabItem> tabs) {
    // print(
    //     ' -------------------------------- TABS ARE THESE ----------------------------:-' +
    //         tabs);
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
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await widget.tabs[currentTab].key.currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          // print(' --------------- INDEX NUMBER -----------------:  $currentTab');

          if (currentTab != 0) {
            // select 'main' tab
            _selectTab(0, widget.tabs);
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
          children: widget.tabs.map((e) => e.page).toList(),
        ),
        bottomNavigationBar: BottomNavigation(
          onSelectTab: (_indexname) => {
            print('seleted index is ========================== $_indexname'),
            // print(_selectTab),
            _selectTab(_indexname, widget.tabs),
          },
          tabs: widget.tabs,
        ),
      ),
    );
  }
}

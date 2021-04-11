import 'package:prescribed/constant.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'tab_item.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    this.onSelectTab,
    this.tabs,
  });
  final ValueChanged<int> onSelectTab;
  final List<TabItem> tabs;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      // selectedIconTheme: ,
      backgroundColor: kDarkBlueColor,
      elevation: 8.0,
      items: tabs
          .map(
            (e) => _buildItem(
              index: e.getIndex(),
              icon: e.icon,
              tabName: e.tabName,
            ),
          )
          .toList(),
      onTap: (index) => onSelectTab(
        index,
      ),
    );
  }

  BottomNavigationBarItem _buildItem({int index, icon, String tabName}) {
    print('PASSED CURRENT TAB = ${AppState.currentTab}');
    print('PASSED INDEX= $index');
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: 2.0,
                color: AppState.currentTab == index
                    ? Colors.white
                    : kDarkBlueColor),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Container(
            child: ImageIcon(
              icon,
              color: _tabColor(index: index),
            ),
          ),
        ),
      ),
      label: '',
      // title: Text(
      //   tabName,
      //   style: TextStyle(
      //     color: _tabColor(index: index),
      //     fontSize: 12,
      //   ),
      // ),
    );
  }

  Color _tabColor({int index}) {
    return AppState.currentTab == index ? Colors.white : Colors.white54;
  }
}

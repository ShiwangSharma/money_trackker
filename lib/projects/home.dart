import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rate_my_app/rate_my_app.dart';

import 'app_pages/analysis.dart';
import 'app_pages/calendar.dart';
import 'app_pages/input.dart';
import 'app_pages/others.dart';
import 'classes/constants.dart';
import 'database_management/sqflite_services.dart';
import 'localization/methods.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List<Widget> myBody = [
    AddInput(),
    Analysis(),
    Calendar(),
    Other(),
  ];
  BottomNavigationBarItem bottomNavigationBarItem(
      IconData iconData, String label) =>
      BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.only(bottom: 0.h),
          child: Icon(
            iconData,
          ),
        ),
        label: getTranslated(context, label),
      );
  @override
  void initState() {
    super.initState();
    DB.init();
    var rateMyApp = RateMyApp(
        minDays: 0,
        // Will pop up the first time users launch the app
        minLaunches: 1,
        remindDays: 4,
        remindLaunches: 15,
        googlePlayIdentifier: 'com.mmas.money_assistant_2608',
        appStoreIdentifier: '1582638369',
    );
  }
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> bottomItems = <BottomNavigationBarItem>[
      bottomNavigationBarItem(Icons.add, 'Input'),
      bottomNavigationBarItem(Icons.analytics_outlined, 'Analysis'),
      bottomNavigationBarItem(Icons.calendar_today, 'Calendar'),
      bottomNavigationBarItem(Icons.account_circle, 'Other'),
    ];
    return Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: grey,
              ),
            ],
          ),
          child: BottomNavigationBar(
            iconSize: 27.sp,
            selectedFontSize: 16.sp,
            unselectedFontSize: 14.sp,
            backgroundColor: white,
            selectedItemColor: Colors.amber[800],
            unselectedItemColor: Colors.black87,
            type: BottomNavigationBarType.fixed,
            items: bottomItems,
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
        body: myBody[_selectedIndex]
    );
  }
}

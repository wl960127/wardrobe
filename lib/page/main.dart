
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wardrobe/page/note/note.dart';
import 'package:wardrobe/page/trend/trend.dart';
import 'package:wardrobe/page/wardrobe/wardrobe.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  NotePage _notePage;
  WardrobePage _wardrobePage;
  TrendPage _trendPage;

  //界面切换
  currentPage() {
    switch (_currentIndex) {
      case 0:
        if (_notePage == null) {
          _notePage = new NotePage();
        }
        return _notePage;
      case 1:
        if (_wardrobePage == null) {
          _wardrobePage = new WardrobePage();
        }
        return _wardrobePage;
      case 2:
        if (_trendPage == null) {
          _trendPage = new TrendPage();
        }
        return _trendPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // 设置这一属性即可
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.white,
            color: Colors.blueAccent,
            items: <Widget>[
              Icon(Icons.calendar_today, size: 30),
              Icon(Icons.list, size: 30),
              Icon(Icons.trending_up, size: 30),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          body: currentPage(),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'note/note.dart';
import 'trend/trend.dart';
import 'wardrobe/wardrobe.dart';

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  DateTime _lastPressedAt; //上次点击时间

  static List<Widget> _widgetOptions = <Widget>[
    NotePage(),
    WardrobePage(),
    TrendPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              title: Text('记录'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('衣柜'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              title: Text('个人'),
            ),
          ],
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.grey,
          fixedColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 2)) {
          //两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          Fluttertoast.showToast(msg: '再按一次退出');
          return false;
        }
        return true;
      },
    );
  }
}

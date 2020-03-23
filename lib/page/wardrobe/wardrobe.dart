// 衣柜分类

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wardrobe/page/wardrobe/wardrobe_info.dart';

class WardrobePage extends StatefulWidget {
  @override
  _WardrobePageState createState() => _WardrobePageState();
}

class _WardrobePageState extends State<WardrobePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("类别"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: _getTypeItem(),
        ));
  }

  Widget getItemContainer(String list, int index) {
    return InkWell(
      onTap: () {
        print(list);
      },
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))), //设置圆角
        margin: EdgeInsets.all(10),
        elevation: 10, // 阴影
        child: Center(
            child: Text(
          list,
          textAlign: TextAlign.center,
        )),
      ),
    );
  }

  _getTypeItem() {
    List<Widget> widgets = [];
    for (int i = 0; i < 10; i++) {
      widgets.add(
        Container(
            child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Row $i"),
              leading: Icon(Icons.mail),
            ),
            SizedBox(
                height: 100,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    children: _getItemInfo()))
          ],
        )),
      );
    }
    return widgets;
  }

  _getItemInfo() {
    List<Widget> widgets = [];
    for (int i = 0; i < 10; i++) {
      widgets.add(new GestureDetector(
        child: SizedBox(
          width: 80,
          height: 80,
          child: Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.0), //边框
                borderRadius:
                    new BorderRadius.all(new Radius.circular(8.0)), //倒圆角
              ),
              child: i == 9
                  ? Icon(Icons.add)
                  : Image(
                      image: NetworkImage(
                          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2274416985,3722917301&fm=26&gp=0.jpg"),
                      fit: BoxFit.fill,
                    )),
        ),
        onTap: () {
          // print('column $i');
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>WardrobeInfoPage()));
          Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
            return new WardrobeInfoPage();
          }));
        },
      ));
    }
    return widgets;
  }
}

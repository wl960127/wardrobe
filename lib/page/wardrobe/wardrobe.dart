// 衣柜分类

import 'package:flutter/material.dart';
import 'package:wardrobe/page/wardrobe/wardrobe_gird.dart';
import 'package:wardrobe/page/wardrobe/wardrobe_info.dart';

class WardrobePage extends StatefulWidget {
  @override
  _WardrobePageState createState() => _WardrobePageState();
}

class _WardrobePageState extends State<WardrobePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _get());
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

  _get() {
    final List<String> lists = [
      'a',
      'b',
      'a',
      'b',
      'a',
      'b',
      'a',
      'b',
      'a',
      'b',
      'a',
      'b',
    ];
    var listView = ListView.builder(
      itemCount: lists.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text("Row $index"),
              trailing: Icon(Icons.tablet),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WardrobeListPage(),
              )),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () => index == 0
                          ? Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => WardrobeInfoPage(),
                            ))
                          : null,
                      child: Container(
                        margin: EdgeInsets.all(6.0),
                        height: 66,
                        width: 80,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black, width: 1.0), //边框
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(8.0)), //倒圆角
                        ),
                        child: index == 0
                            ? Icon(Icons.add)
                            : Image(
                                image: NetworkImage(
                                    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2274416985,3722917301&fm=26&gp=0.jpg"),
                                fit: BoxFit.fill,
                              ),
                      ));
                },
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        );
      },
    );

    return listView;
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
              trailing: Icon(Icons.tablet),
            ),
            SizedBox(
                height: 100,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    children: _getTypeItem()))
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
              child: i == 0
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

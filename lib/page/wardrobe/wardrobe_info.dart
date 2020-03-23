import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WardrobeInfoPage extends StatefulWidget {
  @override
  _WardrobeInfoPageState createState() => _WardrobeInfoPageState();
}

class _WardrobeInfoPageState extends State<WardrobeInfoPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Scaffold(
      appBar: AppBar(
        title: new Text('单品'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: ScreenUtil().width,
              height: ScreenUtil().setHeight(700),
              child: Image(
                image: NetworkImage(
                    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1021073150,417500104&fm=26&gp=0.jpg"),
              ),
            ),
            Text(
              "单品信息",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              width: ScreenUtil().width,
              height: ScreenUtil().setHeight(900),
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int position) {
                  return SizedBox(
                      height: ScreenUtil().setHeight(150),
                      child: GestureDetector(
                        child: Card(
                          color: Colors.red,
                          child: Text(
                            "data + $position",
                            textAlign: TextAlign.left,
                          ),
                        ),
                        onTap: () {
                          showBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      leading: new Icon(Icons.photo_camera),
                                      title: new Text("Camera"),
                                      onTap: () {},
                                    ),
                                      ListTile(
                                      leading: new Icon(Icons.photo_camera),
                                      title: new Text("Camera"),
                                      onTap: () {},
                                    )
                                  ],
                                );
                              });
                        },
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // _getListData() {
  //   List<Widget> list = [];
  //   for (int i = 0; i < 7; i++) {
  //     list.add((GestureDetector(
  //       child: Text(" 类别 + $i"),
  //       onTap: () {
  //         print("object + $i");
  //       },
  //     )));
  //   }
  // }
}

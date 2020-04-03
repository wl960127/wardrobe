// 笔记
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wardrobe/page/note/note_input.dart';

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  void handleNewDate(date) {
    // print("handleNewDate ${date}");
//    Fluttertoast.showToast(
//        msg: "handleNewDate ${date}",
//        toastLength: Toast.LENGTH_SHORT,
//        gravity: ToastGravity.CENTER,
//        timeInSecForIos: 1,
//        backgroundColor: Colors.red,
//        textColor: Colors.white,
//        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: new Container(
        margin: new EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 10.0,
        ),
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            new Calendar(
              onDateSelected: (value) =>
                  {print(value), Fluttertoast.showToast(msg: value.toString())},
//              onSelectedRangeChange: (range) =>
//                  print("Range is ${range.item1}, ${range.item2}"),
              isExpandable: true,
            ),
            SizedBox(
                height: 180,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(new MaterialPageRoute(builder: (_) {
                        return new NoteInputPage();
                      }));
                      //                      setState(() {
//                      });
                    },
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      //设置圆角
                      margin: EdgeInsets.all(20),
                      elevation: 10,
                      // 阴影
                      child: Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: Text(
                                "记录",
                                textAlign: TextAlign.start,
                              ),
                            ),
                            flex: 3,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 180,
                              child: Image.network(
                                // .asset 加载资源图片 .network 网络资源图片 .file 加载本地图片 .memory 加载Uint8List资源图片
                                'http://img.zcool.cn/community/01b078574706206ac72525ae0beaed.jpg@2o.jpg',
                                fit: BoxFit.fill, // 控制图片的拉伸和挤压
                              ),
                            ),
                            flex: 2,
                          )
                        ],
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}

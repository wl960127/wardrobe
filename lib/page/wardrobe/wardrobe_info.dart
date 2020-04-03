import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class WardrobeInfoPage extends StatefulWidget {
  @override
  _WardrobeInfoPageState createState() => _WardrobeInfoPageState();
}

class _WardrobeInfoPageState extends State<WardrobeInfoPage> {
  var _imgPath;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Scaffold(
      // appBar: PreferredSize(
      //     child: Container(
      //       width: double.infinity,
      //       height: double.infinity,
      //       decoration: BoxDecoration(
      //           gradient: LinearGradient(colors: [Colors.yellow, Colors.pink])),
      //       child: SafeArea(child: Text("1212")),
      //     ),
      //     preferredSize: Size(double.infinity, 60)),
      appBar: AppBar(
        title: new Text('单品'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.edit), onPressed: null)
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: ScreenUtil().width,
              height: ScreenUtil().setHeight(700),
              child: _imgPath == null
                  ? Icon(Icons.photo_camera)
                  : Image(image: FileImage(File(_imgPath))),
            ),
            Text(
              "单品信息",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(
              width: ScreenUtil().width,
              height: ScreenUtil().setHeight(900),
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int position) {
                  return ListTile(
                    title: Text('data $position'),
                    trailing: Icon(Icons.ac_unit),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future _openSimpleDialog() async {
  //   //弹出框，返回的是一个类似JS的Promise对象，选中的值在这个返回的变量中
  //   await showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return SimpleDialog(
  //           //标题
  //           title: Text('选择文件'),
  //           //子元素
  //           children: <Widget>[
  //             SimpleDialogOption(
  //               child: Text('图库'),
  //               //点击选项的回调
  //               onPressed: _openGallery(),
  //             ),
  //             SimpleDialogOption(
  //               child: Text('相机'),
  //               //点击选项的回调
  //               onPressed: _takePhoto(),
  //             ),
  //           ],
  //         );
  //       });
  // }

/*拍照*/
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _imgPath = image;
    });
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
  }

  //  showBottomSheet(
  //                             context: context,
  //                             builder: (BuildContext context) {
  //                               return Column(
  //                                 mainAxisSize: MainAxisSize.min,
  //                                 children: <Widget>[
  //                                   ListTile(
  //                                     leading:  Icon(Icons.photo_camera),
  //                                     title:  Text("Camera"),
  //                                     onTap: () {},
  //                                   ),
  //                                     ListTile(
  //                                     leading: new Icon(Icons.photo_camera),
  //                                     title:  Text("Camera"),
  //                                     onTap: () {},
  //                                   )
  //                                 ],
  //                               );
  //                             });
}

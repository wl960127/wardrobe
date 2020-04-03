import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class NoteInputPage extends StatefulWidget {
  @override
  _NoteInputPageState createState() => _NoteInputPageState();
}

class _NoteInputPageState extends State<NoteInputPage> {
  var _imagePath; //返回图片路径
  List _widgets = []; // 初始化类型信息

  Future _getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _imagePath = image;
    });
  }

  Future _getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imagePath = image;
    });
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      _widgets.add(getRow(i));
    }
  }

  // 图片选择
  void getImage() async {
    //图库或者拍照
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            // title: Text("请做出你的选择！"),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("图库"),
                onPressed: () {
                  _getImageFromGallery();
                  Navigator.of(context).pop();
                },
              ),
              SimpleDialogOption(
                child: Text("拍照"),
                onPressed: () {
                  _getImageFromCamera();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void saveEdited() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    List<String> lists = prefs.getStringList("RecordList")??List<String>();
//    lists.add(_text);
//    lists.add(_image_path);
//    showCupertinoDialog(context: context, builder: (BuildContext context){
//      return AlertDialog(
//        title: Text("提示"),
//        content:
//        Text("保存成功"),
//        actions: <Widget>[
//          FlatButton(onPressed: (){
//            // 回到主界面
//            Navigator.of(context).pop();
//            Navigator.of(context).pop();
//          }, child: Text("确定"))
//        ],
//      );
//    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("今日穿搭"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              width: double.infinity,
              height: ScreenUtil().setHeight(700.0),
              color: Colors.black12,
              child: _imagePath == null
                  ? Icon(Icons.add_photo_alternate)
                  : Image.file(_imagePath),
            ),
            onTap: () {
              getImage();
            },
          ),
          SizedBox(
              height:ScreenUtil().setHeight(600),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _widgets.length,
                itemBuilder: (BuildContext context, int position) {
                  return getRow(position);
                },
              ))
        ],
      ),
    );
  }

  Widget getRow(int i) {
    return SizedBox(
        width: 130,
        height: 80,
        child: Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.0), //边框
            borderRadius: new BorderRadius.all(new Radius.circular(8.0)), //倒圆角
          ),
          child: Stack(
            alignment: FractionalOffset(0.5, 0.5),
            children: <Widget>[
              Icon(Icons.add),
              Positioned(
                bottom: 0.0,
                child: Text("$i"),
              )
            ],
          ),
        ));
  }
}

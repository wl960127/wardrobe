import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wardrobe/network/Apis.dart';
import 'package:wardrobe/network/DioManager.dart';
import 'package:wardrobe/network/RequestMethod.dart';


class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  String _name;
  String _pwd;
  String _surePwd;

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  TextEditingController _surePwdController = new TextEditingController();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();


  //注册
  void _register() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
//      DioManager().request<RequestEntity>(RequestMethod.POST,Apis.REGISTER_URL,map: {"name":_name,"password":_pwd},
//          successCallBack: (data){
//            print("xxxx");
//          },errCallBack: (error){
//          Fluttertoast.showToast(msg: error.message);
//          }
//      );

//    Fluttertoast.showToast(
//        msg: "注册成功",
//        toastLength: Toast.LENGTH_SHORT,
//        gravity: ToastGravity.BOTTOM,
//        timeInSecForIos: 1,
//        backgroundColor: Colors.white,
//        textColor: Colors.black,
//        fontSize: 16.0);

//        Navigator.push(
//            context, new MaterialPageRoute(builder: (context) => LoginPage()));
//      }
    }
  }

  @override
  void initState() {
//    _pwdController.addListener(() {
//      pwd = _pwdController.text;
//    });
//
//    _surePwdController.addListener(() {
//      surePwd = _surePwdController.text;
//      print(_surePwdController.text);
//      if (pwd != null && pwd != surePwd) {
//        print(surePwd);
//      }
//    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('注册')),
      body: Container(
//        alignment: Alignment.topLeft,
        margin: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  "请输入手机号码",
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Text.rich(TextSpan(children: [
                      TextSpan(text: '注册即代表阅读并同意'),
                      TextSpan(
                        text: '使用条款',
                        style: TextStyle(color: Colors.green),
                      ),
                      TextSpan(text: '和'),
                      TextSpan(
                        text: '隐私政策',
                        style: TextStyle(color: Colors.green),
                      ),
                    ])),
                    //手机号
                    TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: "账号",
                          hintText: "输入11位手机号码",
                          icon: Icon(Icons.person),
                        ),
                        onSaved: (val) => this._name = val,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return '请输入手机号码';
                          }
                          if (val.length != 11) {
                            return '手机号码为11位数字';
                          }
                          return null;
                        }),
                    //密码
                    TextFormField(
                        controller: _pwdController,
                        decoration: InputDecoration(
                          labelText: "密码",
                          hintText: "输入密码",
                          icon: Icon(Icons.lock),
                        ),
                        onSaved: (val) => this._pwd = val,
                        obscureText: true,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return '请输入密码';
                          }
                          if (val.length > 10 || val.length < 3) {
                            return '密码长度为3-10字符之间';
                          }
                          return null;
                        }),
                    //确认密码
                    TextFormField(
                        controller: _surePwdController,
                        decoration: InputDecoration(
                          labelText: "验证密码",
                          hintText: "请确认密码",
                          icon: Icon(Icons.lock),
                        ),
                        onSaved: (val) => this._surePwd = val,
                        obscureText: true,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return '请确认密码';
                          }
                          if (val.length > 10 || val.length < 3) {
                            return '密码长度为3-10字符之间';
                          }
                          return null;
                        }),
                    Container(
                      margin: const EdgeInsets.all(26.0),
                      child: FlatButton(
                          color: Colors.blue,
                          highlightColor: Colors.blue[700],
                          colorBrightness: Brightness.dark,
                          splashColor: Colors.grey,
                          child: Text("注册"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          onPressed: _register),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomPadding: false, //输入框抵住键盘
    );
  }
}

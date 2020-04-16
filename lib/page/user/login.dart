import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wardrobe/network/Apis.dart';
import 'package:wardrobe/network/DioManager.dart';
import 'package:wardrobe/network/RequestMethod.dart';
import 'package:wardrobe/page/app.dart';
import 'package:wardrobe/page/user/findpwd.dart';
import 'package:wardrobe/page/user/register.dart';

import '../../Config.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  String _name;
  String _pwd;

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void _pushRegister() {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  void _findPasswd() {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => FindPwdPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
        centerTitle: true,
      ),
      body: Container(
        child: Form(
          key: _formKey, //设置globalKey，用于后面获取FormState
          autovalidate: true, //开启自动校验
          child: Column(
            children: <Widget>[
              Container(
//                margin: const EdgeInsets.all(15),
                margin: const EdgeInsets.fromLTRB(10, 36, 10, 10),
                child: CircleAvatar(
                    radius: 48.0,
                    backgroundImage: NetworkImage(
                        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1581258866,3586632575&fm=26&gp=0.jpg")),
              ),
              Container(
//                margin: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                padding: const EdgeInsets.all(20),
//                color: const Color(0xFF00FF00),
                width: 600.0,
                height: 250.0,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        autofocus: true,
                        controller: _nameController,
                        decoration: InputDecoration(
                            labelText: "用户名",
//                            hintText: "用户名或邮箱",
                            icon: Icon(Icons.person)),
                        onSaved: (val) => this._name = val,
                        //获取用户名
                        // 校验用户名
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return '请输入用户名';
                          }
                          if (val.length != 11) {
                            return '输入手机号登录';
                          }
                          return null;
                        }),
                    TextFormField(
                        controller: _pwdController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "密码",
                          hintText: "您的登录密码",
                          icon: Icon(Icons.lock),
                        ),
                        onSaved: (val) => this._pwd = val,
                        //获取用户名
                        // 校验用户名
                        validator: (val) {
                          return val.trim().length > 4 ? null : "密码不能少于五位数";
                        }),
                  ],
                ),
              ),
              FlatButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("Submit"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      login(_name, _pwd);
                    }
                  }),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(10, 60, 10, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                              child: Text("忘记密码"), onPressed: _findPasswd),
                          Container(
                            child: Text("|",
                                style: TextStyle(color: Colors.black)),
                          ),
                          FlatButton(
                            child: Text("注册账号"),
                            onPressed: _pushRegister,
                          )
                        ],
                      ),
                    ),
                    Container(
                        child: Text.rich(TextSpan(children: [
                      TextSpan(text: "登录即代表阅读并同意"),
                      TextSpan(
                        text: "服务条款",
                        style: TextStyle(color: Colors.green),
//                    recognizer:  //省略链接处理器
                      )
                    ]))),
                  ],
                ),
              ),
//
            ],
          ),
        ),
      ),
      resizeToAvoidBottomPadding: false, //输入框抵住键盘
    );
  }

  login(String mobile, String pwd) {
    DioManager().request(
      RequestMethod.GET,
      Apis.AUTH_URL,
      map: {"mobile": _name, "password": _pwd},
      successCallBack: (data) => {
        print("请求成功 " + data.toString()),
        SharedPreferences.getInstance()
            .then((value) => value.getString(Config.TOKEN_KEY)),
        Navigator.pushAndRemoveUntil(
            context, new MaterialPageRoute(builder: (context) => MyApp()), (route) => route == null),
      },
      errCallBack: (err) {
        print("请求异常 " + err.message);
      },
    );
  }
}

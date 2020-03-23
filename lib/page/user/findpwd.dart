import 'package:flutter/material.dart';
import 'package:wardrobe/page/user/login.dart';


class FindPwdPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FindPasswdState();
  }
}

class _FindPasswdState extends State<FindPwdPage> {
  String _name;
  String _pwd;
  String _surePwd;

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  TextEditingController _surePwdController = new TextEditingController();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  //注册
  void _register() {
//    final form = _formKey.currentState;
//    if (form.validate()) {
//      form.save();
    print('用户名是：$_name，验证码是：$_pwd,新密码是：$_surePwd');
//      if (_name.length == 11 && _pwd == _surePwd) {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => LoginPage()));
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
                  "设置新密码",
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
                child: Column(
                  children: <Widget>[
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
                          labelText: "验证码",
                          hintText: "输入验证码",
                          icon: Icon(Icons.lock),
                        ),
                        onSaved: (val) => this._pwd = val,
                        obscureText: true,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return '请输入验证码';
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
                          labelText: "新密码",
                          hintText: "输入新密码",
                          icon: Icon(Icons.lock),
                        ),
                        onSaved: (val) => this._surePwd = val,
                        obscureText: true,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return '输入新密码';
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
                          child: Text("提交"),
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

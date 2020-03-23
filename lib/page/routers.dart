import 'package:flutter/material.dart';

import 'user/findpwd.dart';
import 'user/login.dart';
import 'user/register.dart';

final indexRouter =   <String, WidgetBuilder> {
  '/login' :(context)=>LoginPage(),
  '/register' :(context)=>RegisterPage(),
  '/findpwd' :(context)=>FindPwdPage(),
};
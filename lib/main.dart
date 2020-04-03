import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:wardrobe/page/app.dart';

void main() {
  // initializeDateFormatting().then((_) => runApp(WelcomePage()));
  initializeDateFormatting().then((_) => runApp(MyApp()));
  if (Platform.isAndroid) {
    SystemUiOverlayStyle style = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        // statusBarColor: Colors.black,

        ///这是设置状态栏的图标和字体的颜色
        ///Brightness.light  一般都是显示为白色
        ///Brightness.dark 一般都是显示为黑色
        statusBarIconBrightness: Brightness.light
        );
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wardrobe/page/app.dart';

// import 'package:wardrobe/page/user/login.dart';



class WelcomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    /**动画监听器 */
    _animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        Navigator.pushAndRemoveUntil( context,  MaterialPageRoute(builder: (context) => MyApp()),
                (route) => route == null);
      }
    });
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // routes: indexRouter,
      home: FadeTransition(
        //透明度动画组件
        opacity: _animation, //执行动画
        child: CachedNetworkImage(
          imageUrl:
          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3014643115,1705695335&fm=26&gp=0.jpg",
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

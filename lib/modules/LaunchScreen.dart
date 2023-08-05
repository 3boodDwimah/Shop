
import 'package:flutter/material.dart';
import 'package:shop_app/layout/shop_layout.dart';
import 'package:shop_app/modules/choose/choose.dart';
import 'package:shop_app/modules/on_boarding/on_boarding_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

Widget? widget;

class _LaunchScreenState extends State<LaunchScreen> {
  void delay() {
    Future.delayed(const Duration(seconds: 6), () {
      navigateAndFinish(
        context,
        widget,
      );
    });
  }

  @override
  void initState() {
    delay();
    bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
    token = CacheHelper.getData(key: 'token');

    if (onBoarding != null) {
      if (token != null) {
        widget = ShopLayout();
      } else {
        widget = Choose();
      }
    } else {
      widget = OnBoarding();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5B4DBC),

    );
  }
}

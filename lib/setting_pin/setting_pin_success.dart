import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class SecuritySuccess extends StatelessWidget {
  const SecuritySuccess({super.key, required this.buildContext});

  final BuildContext buildContext;

  static Route route(BuildContext buildContext) {
    return MaterialPageRoute<void>(
        builder: (_) => SecuritySuccess(buildContext: buildContext));
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 500), () {
      Navigator.of(context).pop(context);
    });
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 150.w,
              color: Color.fromARGB(255, 109, 225, 109),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'success',
              style: TextStyle(fontSize: 40.sp),
            ),
          ],
        ),
        // child: Image.asset(
        //   'assets/images/check.png',
        //   width: 128.w,
        // ),
      ),
    );
  }
}

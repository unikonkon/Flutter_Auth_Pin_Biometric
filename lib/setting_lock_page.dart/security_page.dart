import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth_pin_biometric/setting_lock_page.dart/security_numpad.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class SecurityLockPage extends StatelessWidget {
  const SecurityLockPage({super.key});

  static Route route() {
    if (Platform.isAndroid) {
      // Android-specific code
      return PageTransition<void>(
        type: PageTransitionType.rightToLeft,
        child: SecurityLockPage(),
      );
    } else {
      // iOS-specific code
      return MaterialPageRoute<void>(
        builder: (_) => SecurityLockPage(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 150.h,
          ),
          Icon(
            Icons.phonelink_lock,
            size: 80.w,
            color: Color.fromARGB(255, 67, 89, 68),
          ),
          SizedBox(
            height: 20.h,
          ),
          const SecurityLockNumpad(),
        ],
      ),
    );
  }
}

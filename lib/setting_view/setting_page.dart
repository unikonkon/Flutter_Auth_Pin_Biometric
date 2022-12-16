// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: void_checks

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth_pin_biometric/setting_view/setting_security.dart';
import 'package:page_transition/page_transition.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  static Route route() {
    if (Platform.isAndroid) {
      // Android-specific code
      return PageTransition<void>(
        type: PageTransitionType.rightToLeft,
        child: const SettingPage(),
      );
    } else {
      // iOS-specific code
      return MaterialPageRoute<void>(
        builder: (_) => const SettingPage(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: SettingHeader(appBar: AppBar()),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[SettingSecurity()],
        ),
      ),
    );
  }
}
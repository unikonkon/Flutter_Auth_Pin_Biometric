// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth_pin_biometric/setting_pin/setting_pin.dart';
import 'package:flutter_auth_pin_biometric/setting_pin/setting_pin_header.dart';
import 'package:page_transition/page_transition.dart';

class SecurityPinPage extends StatelessWidget {
  const SecurityPinPage({
    super.key,
  });

  static Route route() {
    if (Platform.isAndroid) {
      // Android-specific code
      return PageTransition<void>(
        type: PageTransitionType.rightToLeft,
        child: const SecurityPinPage(),
      );
    } else {
      // iOS-specific code
      return MaterialPageRoute<void>(
        builder: (_) => const SecurityPinPage(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingPinHeader(appBar: AppBar()),
      body: Column(
        children: const [
          SettingsPin(),
          // Text('datsdfsdfsdfefwefsa')
        ],
      ),
    );
  }
}

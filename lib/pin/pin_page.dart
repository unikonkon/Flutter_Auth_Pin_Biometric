import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_auth_pin_biometric/pin/pin_header.dart';
import 'package:flutter_auth_pin_biometric/pin/pin_numpad.dart';
import 'package:page_transition/page_transition.dart';

class PinPage extends StatelessWidget {
  const PinPage({super.key});
  static Route route() {
    if (Platform.isAndroid) {
      // Android-specific code
      return PageTransition<void>(
        type: PageTransitionType.rightToLeft,
        child: const PinPage(),
      );
    } else {
      // iOS-specific code
      return MaterialPageRoute<void>(
        builder: (_) => const PinPage(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PinHeader(appBar: AppBar()),
      body: PinNumpad(),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_auth_pin_biometric/setting_pin/setting_pin_page.dart';

class SettingSecurity extends StatefulWidget {
  const SettingSecurity({super.key});

  @override
  State<SettingSecurity> createState() => _SettingSecurityState();
}

class _SettingSecurityState extends State<SettingSecurity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).push<void>(
            SecurityPinPage.route(),
          );
        },
        child: null,
      ),
    );
  }
}

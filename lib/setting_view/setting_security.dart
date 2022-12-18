import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_auth_pin_biometric/pin/pin_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingSecurity extends StatefulWidget {
  const SettingSecurity({super.key});

  @override
  State<SettingSecurity> createState() => _SettingSecurityState();
}

class _SettingSecurityState extends State<SettingSecurity> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 100.h),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).push<void>(
              PinPage.route(),
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.primary,
            fixedSize: Size(1.sw - 45.w, 70.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.w),
            ),
            padding: EdgeInsets.only(left: 30.w, right: 23.w),
            alignment: Alignment.centerLeft,
          ),
          child: Row(
            children: [
              Icon(
                Icons.lock_outline_rounded,
                size: 30.w,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  'Security',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';


import 'package:flutter_auth_pin_biometric/setting_pin/setting_pin_page.dart';
import 'package:flutter_auth_pin_biometric/setting_view/cubit/security_cubit.dart';
import 'package:flutter_auth_pin_biometric/setting_view/setting_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingSecurity extends StatefulWidget {
  const SettingSecurity({super.key});

  @override
  State<SettingSecurity> createState() => _SettingSecurityState();
}

class _SettingSecurityState extends State<SettingSecurity> {
  @override
  Widget build(BuildContext context) {

    const color = Color(0xFF003640);
    final Color colorCubit;
    final String status;

    final security = context.select((SecurityCubit cubit) => cubit.state);
    if (security) {
      colorCubit = Color.fromARGB(255, 109, 225, 109);
      status = 'ON';
    } else {
      colorCubit = Color.fromARGB(255, 103, 108, 109);
      ;
      status = 'OFF';
    }
    return Padding(
      padding: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
      ),
      child: Card(
        color: Theme.of(context).colorScheme.surfaceVariant,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: SizedBox(
          height: 220.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.lock_person,
                    size: 60.w,
                    color: color,
                  ),
                  // SizedBox(
                  //   width: 40.w,
                  // ),
                  Text(
                    'Security',
                    style: TextStyle(fontSize: 30.sp),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.circle, size: 50.w, color: colorCubit),
                      SizedBox(
                        height: 8.w,
                      ),
                      Row(
                        children: [
                          Text('Status', style: TextStyle(fontSize: 20.sp)),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            status,
                            style: TextStyle(fontSize: 20.sp),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SettingButton(),
            ],
          ),
        ),
      ),
    );
  }
}

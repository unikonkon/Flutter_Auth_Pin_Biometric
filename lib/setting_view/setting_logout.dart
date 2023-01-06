import 'package:flutter/material.dart';
import 'package:flutter_auth_pin_biometric/setting_view/cubit/security_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/security_bloc.dart';

class SettingLogout extends StatelessWidget {
  const SettingLogout({super.key});

  @override
  Widget build(BuildContext context) {
    const color = Color.fromARGB(255, 208, 64, 64);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            fixedSize: Size(390.w, 80.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            )),
        onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Logout'),
                content: const Text('ยืนยันการ Logout รีเซ็ต PIN ใหม่'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => {
                      context.read<SecurityBloc>().add(
                            OnDelete(),
                          ),
                      Navigator.pop(context, 'Cancel'),
                      context.read<SecurityCubit>().none(),
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
        child: Text(
          'Logout',
          style: TextStyle(fontSize: 25.sp),
        ));
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}

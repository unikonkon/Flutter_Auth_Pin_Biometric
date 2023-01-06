import 'package:flutter/material.dart';
import 'package:flutter_auth_pin_biometric/setting_pin/setting_pin_page.dart';
import 'package:flutter_auth_pin_biometric/setting_view/bloc/security_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecurityBloc, SecurityState>(
      builder: (context, state) {
        const text = Color(0xFFE9E9E9);
        const close = Color.fromARGB(255, 103, 108, 109);
        const open = Color.fromARGB(255, 109, 225, 109);
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: open,
                  fixedSize: Size(0.25.sw, 60.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.w),
                  ),
                  padding: EdgeInsets.only(left: 30.w, right: 23.w),
                  alignment: Alignment.center,
                ),
                onPressed: () {
                  if (state.statusOn == SecurityStatus.currentStep) {
                    Navigator.of(context, rootNavigator: true).push<void>(
                      SecurityPinPage.route(),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(milliseconds: 1500),
                        backgroundColor: Theme.of(context).colorScheme.error,
                        content: const Text(
                          'Security เปิดอยู่ ไม่สามารถทำงานได้',
                          style: TextStyle(color: text),
                        ),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  'Open',
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
              SizedBox(
                width: 50.w,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: close,
                  fixedSize: Size(0.25.sw, 60.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.w),
                  ),
                  padding: EdgeInsets.only(left: 30.w, right: 23.w),
                  alignment: Alignment.center,
                ),
                onPressed: () {
                  if (state.statusOn == SecurityStatus.completePin) {
                    Navigator.of(context, rootNavigator: true).push<void>(
                      SecurityPinPage.route(),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(milliseconds: 1500),
                        backgroundColor: Theme.of(context).colorScheme.error,
                        content: const Text(
                          'Security ปิดอยู่ ไม่สามารถทำงานได้',
                          style: TextStyle(color: text),
                        ),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  'Close',
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

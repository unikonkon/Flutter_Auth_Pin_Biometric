import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPin extends StatefulWidget {
  const SettingsPin({super.key});

  @override
  State<SettingsPin> createState() => _SettingsPinState();
}

class _SettingsPinState extends State<SettingsPin> {
  @override
  Widget build(BuildContext context) {
    return NumpadKeyboard();
  }
}

class NumpadKeyboard extends StatelessWidget {
  const NumpadKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    const color2 = Color(0xFFCF374C);

    Widget _renderNumber(String number) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          fixedSize: Size(70.w, 70.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.r),
          ),
          elevation: 0,
        ),
        onPressed: () {
          if (number.isNotEmpty) {
            // _onPressed(number);
          }
        },
        child: number == 'delete'
            ? Icon(
                Icons.backspace_outlined,
                size: 25.w,
                color: color2,
              )
            : Text(number, style: Theme.of(context).textTheme.headline5),
      );
    }

    return Padding(
      padding: EdgeInsets.only(top: 60.h),
      child: SizedBox(
        width: 1.sw,
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 0.1.sh,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _renderNumber('1'),
                      _renderNumber('2'),
                      _renderNumber('3'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.1.sh,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _renderNumber('4'),
                      _renderNumber('5'),
                      _renderNumber('6'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.1.sh,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _renderNumber('7'),
                      _renderNumber('8'),
                      _renderNumber('9'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.1.sh,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 70.w,
                      ),
                      _renderNumber('0'),
                      _renderNumber('delete'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

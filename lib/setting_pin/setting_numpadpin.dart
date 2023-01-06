import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingNumpadPin extends StatefulWidget {
  const SettingNumpadPin({super.key});

  @override
  State<SettingNumpadPin> createState() => _SettingNumpadPinState();
}

class _SettingNumpadPinState extends State<SettingNumpadPin> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NumpadPin extends StatelessWidget {
  const NumpadPin({super.key});

  @override
  Widget build(BuildContext context) {
    const color2 = Color(0xFFCF374C);
    Widget _randerPin() {
      return ElevatedButton(
        onPressed: () {},
        child: null,
        style: ElevatedButton.styleFrom(
          backgroundColor: color2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _randerPin(),
            _randerPin(),
            _randerPin(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _randerPin(),
            _randerPin(),
            _randerPin(),
          ],
        )
      ],
    );
  }
}

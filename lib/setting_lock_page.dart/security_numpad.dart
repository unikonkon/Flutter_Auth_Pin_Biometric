import 'package:flutter/material.dart';
import 'package:flutter_auth_pin_biometric/bottombar/bottombar.dart';
import 'package:flutter_auth_pin_biometric/setting_view/bloc/security_bloc.dart';
import 'package:flutter_auth_pin_biometric/setting_view/cubit/security_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum PinNumpad {
  bio,
  zero,
  one,
  two,
  tree,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  delete,
}

class SecurityLockNumpad extends StatefulWidget {
  const SecurityLockNumpad({super.key});

  @override
  State<SecurityLockNumpad> createState() => _SecurityLockNumpadState();
}

class _SecurityLockNumpadState extends State<SecurityLockNumpad> {
  String _currentPin = '';
  @override
  Widget build(BuildContext context) {
    // const color = Color.fromARGB(255, 208, 64, 64);
    final _currentLocalStorage =
        BlocProvider.of<SecurityBloc>(context).state.pin;
    void _nextStep() {
      if (_currentLocalStorage != _currentPin) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 500),
            backgroundColor: Theme.of(context).colorScheme.error,
            content: Text(
              'PIN ปัจจุบันไม่ถูกต้อง',
              // style: const TextStyle(color: color23),
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        );
        setState(() {
          _currentPin = '';
        });
        // context.read<SecurityCubit>().enabled();
      } else {
        Navigator.of(context, rootNavigator: true).push<void>(
          MyBottomBar.route(),
        );
        context.read<SecurityCubit>().enabled();
        context.read<SecurityBloc>().add(
              OnCompletedPin(),
            );
      }
    }

    void _onPressedCurrentPin(String value) {
      if (_currentPin.length < 6) {
        setState(() {
          _currentPin += value;
        });

        // ignore: invariant_booleans
        if (_currentPin.length == 6) {
          _nextStep();
        }
      }
    }

    Widget _renderDelete() {
      const color = Color.fromARGB(255, 208, 64, 64);
      ElevatedButton? btn;
      if (_currentPin.isNotEmpty) {
        btn = ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            fixedSize: Size(70.w, 70.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35.r),
            ),
            elevation: 0,
          ),
          onPressed: () => {
            setState(() {
              _currentPin = _currentPin.substring(0, _currentPin.length - 1);
            })
          },
          child: Icon(
            Icons.backspace_outlined,
            size: 25.w,
            color: color,
          ),
        );
      } else {
        btn = ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            fixedSize: Size(70.w, 70.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35.r),
            ),
            elevation: 0,
          ),
          onPressed: () {},
          child: Icon(
            Icons.backspace_outlined,
            size: 25.w,
            color: color,
          ),
        );
      }

      return btn;
    }

    Widget _renderNumber(PinNumpad value) {
      var valueText = '';
      switch (value) {
        case PinNumpad.zero:
          valueText = '0';
          break;

        case PinNumpad.one:
          valueText = '1';

          break;
        case PinNumpad.two:
          valueText = '2';

          break;
        case PinNumpad.tree:
          valueText = '3';

          break;
        case PinNumpad.four:
          valueText = '4';

          break;
        case PinNumpad.five:
          valueText = '5';

          break;
        case PinNumpad.six:
          valueText = '6';

          break;
        case PinNumpad.seven:
          valueText = '7';

          break;
        case PinNumpad.eight:
          valueText = '8';
          break;
        case PinNumpad.nine:
          valueText = '9';
          break;

        case PinNumpad.bio:
          return SizedBox(
            width: 70.w,
          );

        case PinNumpad.delete:
          return SizedBox(width: 70.w, child: _renderDelete());
      }
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          fixedSize: Size(70.w, 70.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.r),
          ),
          elevation: 0,
        ),
        onPressed: () => _onPressedCurrentPin(valueText),
        child: Text(
          valueText,
          style: Theme.of(context).textTheme.headline5,
        ),
      );
    }

    Widget _boxInputCircle(bool pin) {
      const colorCircleIn = Color.fromARGB(255, 243, 244, 243);
      const colorCircle = Color.fromARGB(255, 67, 89, 68);
      const colorborder = Color.fromARGB(255, 72, 73, 74);
      return Container(
        width: 20,
        height: 22,
        decoration: BoxDecoration(
          color: pin ? colorCircle : colorCircleIn,
          border: Border.all(
            width: 2.w,
            color: colorborder,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
      );
    }

    Widget _renderRow(PinNumpad left, PinNumpad center, PinNumpad right) {
      return SizedBox(
        height: 0.1.sh,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _renderNumber(left),
            _renderNumber(center),
            _renderNumber(right),
          ],
        ),
      );
    }

    Widget _renderEnterPin() {
      return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 0.12.sh,
              child: Center(
                child: Text(
                  'ใส่ PIN ปัจจุบัน',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
            SizedBox(
              width: 0.6.sw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _boxInputCircle(_currentPin.isNotEmpty),
                  _boxInputCircle(_currentPin.length > 1),
                  _boxInputCircle(_currentPin.length > 2),
                  _boxInputCircle(_currentPin.length > 3),
                  _boxInputCircle(_currentPin.length > 4),
                  _boxInputCircle(_currentPin.length > 5),
                ],
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.red,
                padding: EdgeInsets.only(bottom: 80.h),
                width: 1.sw,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _renderRow(
                      PinNumpad.one,
                      PinNumpad.two,
                      PinNumpad.tree,
                    ),
                    _renderRow(
                      PinNumpad.four,
                      PinNumpad.five,
                      PinNumpad.six,
                    ),
                    _renderRow(
                      PinNumpad.seven,
                      PinNumpad.eight,
                      PinNumpad.nine,
                    ),
                    _renderRow(
                      PinNumpad.bio,
                      PinNumpad.zero,
                      PinNumpad.delete,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return _renderEnterPin();
  }
}

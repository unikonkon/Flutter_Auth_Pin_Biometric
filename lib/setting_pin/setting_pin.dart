import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_auth_pin_biometric/setting_pin/setting_pin_success.dart';
import 'package:flutter_auth_pin_biometric/setting_view/bloc/security_bloc.dart';
import 'package:flutter_auth_pin_biometric/setting_view/cubit/security_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPin extends StatefulWidget {
  const SettingsPin({super.key});

  @override
  State<SettingsPin> createState() => _SettingsPinState();
}

class _SettingsPinState extends State<SettingsPin> {
  @override
  Widget build(BuildContext context) {
    const color21 = Color(0xFFE9E9E9);
    return BlocListener<SecurityBloc, SecurityState>(
      listener: (context, state) {
        if (state.statusOn == SecurityStatus.currentStep &&
            state.pin.length == 6) {
          context.read<SecurityBloc>().add(
                OnNextStep(),
              );
        } else if (state.statusOn == SecurityStatus.pinAgin &&
            state.pinAgin.length == 6) {
          if (state.onStatus) {
            Navigator.of(context).pushReplacement<void, void>(
              SecuritySuccess.route(context),
            );
            context.read<SecurityCubit>().enabled();
            context.read<SecurityBloc>().add(
                  OnCompletedPin(),
                );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(milliseconds: 800),
                backgroundColor: Theme.of(context).colorScheme.error,
                content: const Text(
                  'securityPinErrorPinNotSame',
                  style: TextStyle(color: color21),
                ),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            );
            context.read<SecurityBloc>().add(
                  OnDelete(),
                );
          }
        } else if (state.statusOn == SecurityStatus.completePin &&
            state.currentPin.length == 6) {
          if (state.offStatus) {
            Navigator.of(context).pushReplacement<void, void>(
              SecuritySuccess.route(context),
            );
            context.read<SecurityBloc>().add(
                  OnDelete(),
                );

            context.read<SecurityCubit>().none();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(milliseconds: 800),
                backgroundColor: Theme.of(context).colorScheme.error,
                content: const Text(
                  'securityPinErrorPinNotSame',
                  style: TextStyle(color: color21),
                ),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            );
            context.read<SecurityBloc>().add(
                  OnErrorCurrentPin(),
                );
          }
        }
      },
      child: Column(
        children: [
          PinInput(),
          NumpadKeyboard(),
        ],
      ),
    );
  }
}

class NumpadKeyboard extends StatelessWidget {
  const NumpadKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecurityBloc, SecurityState>(
      builder: (context, state) {
        const color2 = Color(0xFFCF374C);
        void _onPressed(String number) {
          if (state.statusOn == SecurityStatus.currentStep &&
              state.pin.length < 6) {
            if (number == 'delete') {
              if (state.pin.isNotEmpty) {
                final pin = state.pin.substring(0, state.pin.length - 1);
                context.read<SecurityBloc>().add(
                      OnCreatePin(pin: pin),
                    );
              }
            } else {
              final pin = state.pin + number;
              context.read<SecurityBloc>().add(
                    OnCreatePin(pin: pin),
                  );
            }
          } else if (state.statusOn == SecurityStatus.pinAgin &&
              state.pinAgin.length < 6) {
            if (number == 'delete') {
              if (state.pinAgin.isNotEmpty) {
                final pinAgin =
                    state.pinAgin.substring(0, state.pinAgin.length - 1);
                context.read<SecurityBloc>().add(
                      OnConfirmPin(pinAgin: pinAgin),
                    );
              }
            } else {
              final pinAgin = state.pinAgin + number;
              context.read<SecurityBloc>().add(
                    OnConfirmPin(pinAgin: pinAgin),
                  );
            }
          } else if (state.statusOn == SecurityStatus.completePin &&
              state.currentPin.length < 6) {
            if (number == 'delete') {
              if (state.currentPin.isNotEmpty) {
                final currentPin =
                    state.currentPin.substring(0, state.currentPin.length - 1);
                context.read<SecurityBloc>().add(
                      OnCurrentPin(currentPin: currentPin),
                    );
              }
            } else {
              final currentPin = state.currentPin + number;
              context.read<SecurityBloc>().add(
                    OnCurrentPin(currentPin: currentPin),
                  );
            }
          }
          // print(state.pinAgin);
          // print(state.pin);
          print(state.currentPin);
        }

        Widget _renderNumber(String number) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              fixedSize: Size(70.w, 100.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.r),
              ),
              elevation: 0,
            ),
            onPressed: () {
              if (number.isNotEmpty) {
                _onPressed(number);
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
      },
    );
  }
}

class PinInput extends StatelessWidget {
  const PinInput({super.key});

  @override
  Widget build(BuildContext context) {
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

    Widget _boxInput(String pin) {
      return SizedBox(
        width: 0.4.sh,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _boxInputCircle(pin.isNotEmpty),
            _boxInputCircle(pin.length > 1),
            _boxInputCircle(pin.length > 2),
            _boxInputCircle(pin.length > 3),
            _boxInputCircle(pin.length > 4),
            _boxInputCircle(pin.length > 5),
          ],
        ),
      );
    }

    return BlocBuilder<SecurityBloc, SecurityState>(
      builder: (context, state) {
        if (state.statusOn == SecurityStatus.currentStep) {
          return Column(
            children: [
              Icon(
                Icons.phonelink_lock,
                size: 80.w,
                color: Color.fromARGB(255, 67, 89, 68),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'ตั้งค่า Pin',
                style: TextStyle(fontSize: 25.sp),
              ),
              SizedBox(
                height: 50.h,
              ),
              _boxInput(state.pin),
            ],
          );
        } else if (state.statusOn == SecurityStatus.pinAgin) {
          return Column(
            children: [
              Icon(
                Icons.phonelink_lock,
                size: 80.w,
                color: Color.fromARGB(255, 67, 89, 68),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'ใส่ Pin อีกครั้ง',
                style: TextStyle(fontSize: 25.sp),
              ),
              SizedBox(
                height: 50.h,
              ),
              _boxInput(state.pinAgin),
            ],
          );
        } else if (state.statusOn == SecurityStatus.completePin) {
          return Column(
            children: [
              Icon(
                Icons.phonelink_lock,
                size: 80.w,
                color: Color.fromARGB(255, 67, 89, 68),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'ใส่ Pin ปัจจุบัน',
                style: TextStyle(fontSize: 25.sp),
              ),
              SizedBox(
                height: 50.h,
              ),
              _boxInput(state.currentPin),
            ],
          );
        }
        return Container();
      },
    );
  }
}

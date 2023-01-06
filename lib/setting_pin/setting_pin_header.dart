import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth_pin_biometric/setting_view/bloc/security_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPinHeader extends StatelessWidget implements PreferredSizeWidget {
  const SettingPinHeader({super.key, required this.appBar});

  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecurityBloc, SecurityState>(
      builder: (context, state) {
        if (state.statusOn == SecurityStatus.currentStep ||
            state.statusOn == SecurityStatus.pinAgin) {
          return AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: BackButtonCustomCurrentStep().build(context),
            title: Text(
              'ตั้งค่า Pin',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          );
        }
        if (state.statusOn == SecurityStatus.completePin) {
          return AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: BackButtonCustomCompletePin().build(context),
            title: Text(
              'ใส่ Pin ปัจจุบัน',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          );
        }
        return Container();
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height + 30.h);
}

class BackButtonCustomCurrentStep {
  Widget? build(BuildContext context) {
    var icon = Icons.arrow_back_rounded;

    if (Platform.isIOS) {
      icon = Icons.arrow_back_ios_new;
    }

    return Navigator.canPop(context)
        ? IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            padding: EdgeInsets.only(
              left: 20.w,
              right: 8.w,
              top: 8.h,
              bottom: 8.h,
            ),
            icon: Icon(
              icon,
              color: Color(0xFF003640),
              size: 28.w,
            ),
            onPressed: () => {
              if (Navigator.canPop(context))
                {
                  Navigator.of(context).pop(),
                  context.read<SecurityBloc>().add(
                        OnDelete(),
                      )
                }
            },
          )
        : null;
  }
}

class BackButtonCustomCompletePin {
  Widget? build(BuildContext context) {
    var icon = Icons.arrow_back_rounded;

    if (Platform.isIOS) {
      icon = Icons.arrow_back_ios_new;
    }

    return Navigator.canPop(context)
        ? IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            padding: EdgeInsets.only(
              left: 20.w,
              right: 8.w,
              top: 8.h,
              bottom: 8.h,
            ),
            icon: Icon(
              icon,
              color: Color(0xFF003640),
              size: 28.w,
            ),
            onPressed: () => {
              if (Navigator.canPop(context))
                {
                  Navigator.of(context).pop(),
                  context.read<SecurityBloc>().add(
                        OnErrorCurrentPin(),
                      )
                }
            },
          )
        : null;
  }
}

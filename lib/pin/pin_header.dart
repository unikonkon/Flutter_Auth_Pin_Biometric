import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinHeader extends StatelessWidget implements PreferredSizeWidget {
  const PinHeader({super.key, required this.appBar});
  final AppBar appBar;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: BackButtonCustom().build(context),
      title: Text('Security'),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height + 30.h);
}

class BackButtonCustom {
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
              color: Colors.black,
              size: 28.w,
            ),
            onPressed: () => {
              if (Navigator.canPop(context)) {Navigator.of(context).pop()}
            },
          )
        : null;
  }
}

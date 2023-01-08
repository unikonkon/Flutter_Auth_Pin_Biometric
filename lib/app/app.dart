import 'package:flutter/material.dart';

import 'package:flutter_auth_pin_biometric/bottombar/bottombar.dart';
import 'package:flutter_auth_pin_biometric/setting_lock_page.dart/security_page.dart';
import 'package:flutter_auth_pin_biometric/setting_view/bloc/security_bloc.dart';
import 'package:flutter_auth_pin_biometric/setting_view/cubit/security_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SecurityBloc()),
        BlocProvider(create: (_) => SecurityCubit())
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> with WidgetsBindingObserver {
  late int countTime = 0;
  bool isLock = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  // final navigator = _navigatorKey.currentState;
  // final _navigatorKey = GlobalKey<NavigatorState>();

  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        //แอปกลับมาเริ่มทำงาน
        print('resumed');

        onResumed();

        break;
      case AppLifecycleState.inactive:
        print('INcurrentPin ');
        //แอปกลับทำงาน
        break;
      case AppLifecycleState.paused:
        print('paused');
        //หยุดทำงาน
        onPaused();
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  void onResumed() {
    final pauseTime = DateTime.fromMillisecondsSinceEpoch(countTime);
    final nowTime = DateTime.now();
    final difference = nowTime.difference(pauseTime);
    print(difference.inSeconds);
    if (context.read<SecurityCubit>().state) {
      if (countTime != 0) {
        if (difference.inSeconds > 3) {
          // final navigator = _navigatorKey.currentState!;
          // _navigator.pushAndRemoveUntil(
          //   SecurityLockPage.route(),
          //   (route) => false,
          // );
          // navigator.push(SecurityLockPage.route());
          // Navigator.of(context, rootNavigator: true).push<void>(
          //   SecurityLockPage.route(),
          // );
          isLock = true;
        }
      }
    }
  }

  void onPaused() {
    final timeNow = DateTime.now().millisecondsSinceEpoch;
    countTime = timeNow;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) {

          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              backgroundColor: Color.fromARGB(255, 224, 228, 229),
              scaffoldBackgroundColor: Color.fromARGB(255, 224, 228, 229),
            ),
            home: BlocBuilder<SecurityBloc, SecurityState>(
              builder: (context, state) {
                final security =
                    context.select((SecurityCubit cubit) => cubit.state);

                if (security) {
                  return SecurityLockPage();
                } else {
                  // if (isLock) {
                  //   print('object');
                  // }
                  return MyBottomBar();
                }
              },
            ),
          );

        });
  }
}

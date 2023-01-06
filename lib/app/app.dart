import 'package:flutter/material.dart';
import 'package:flutter_auth_pin_biometric/bottombar/bottombar.dart';
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

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: Color.fromARGB(255, 224, 228, 229),
            ),
            home: MyBottomBar(),
          );
        });
  }
}

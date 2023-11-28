import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/homeScreen.dart';
import '../../features/login/data/data_sources/dto.dart';
import '../../features/login/presentation/manager/cubit.dart';
import '../../features/login/presentation/pages/login_screen.dart';

class Routes {
  static const String login = "/";
  static const String home = "homeScreen";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => LoginCubit(RemoteDto()),
              child: const LoginScreen()),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const homeScreen(),
        );
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold(
          body: Center(
            child: Text("UnDefine Route"),
          ),
        ));
    }
  }
}
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';
import 'core/config/routes.dart';
import 'core/utils/cache.dart';
import 'core/utils/observer.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await CacheHelper.init();
  Bloc.observer=MyBlocObserver();
  runApp( MyApp(Routes.login));
}


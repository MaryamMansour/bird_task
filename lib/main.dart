import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'core/utils/observer.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await CacheHelper.init();
  Bloc.observer=MyBlocObserver();
  String route;
  var user = CacheHelper.getData("User");
  if(user == null)
  {
    route= Routes.login;
  }
  else {
    route= Routes.home;
  }
  runApp( MyApp(route));
}


import 'package:e_learning_app/bloc_observer.dart';
import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/runapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/dependcy_injection.dart' as di;

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await di.init();
  await CachHelper.init();
  bool isLogin = CachHelper.getData(key: 'isLogin') ?? false;
  bool isArabic = CachHelper.getData(key: 'isArabic') ?? false;
  bool isDark = CachHelper.getData(key: 'isDark') ?? false;
  
  runApp( MainApp
    (isArabic: isArabic, isDark: isDark, isLogin: isLogin));
}



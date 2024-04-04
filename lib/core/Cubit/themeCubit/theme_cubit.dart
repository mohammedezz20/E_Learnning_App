import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_learning_app/core/cach_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  static ThemeCubit obj(context) => BlocProvider.of(context);

  bool isDark = false;
  changeappmode({bool? isdark}) async {
    if (isdark != null) {
      isDark = isdark;
    } else {
      isDark = !isDark;
    }
        isDark?  emit(changeappthemeToLight()):emit(changeappthemeToDark());

    CachHelper.saveData(key: 'isDark', value: isDark);
          log(CachHelper.getData(key: 'isDark').toString());

  }
}

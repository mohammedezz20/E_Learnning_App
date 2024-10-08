import 'package:e_learning_app/core/Cubit/themeCubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SwitchThemeMode extends StatelessWidget {
  const SwitchThemeMode({super.key, required this.isDarkMode});

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    var cubit = ThemeCubit.obj(context);
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      return Visibility(
        visible: isDarkMode,
        child: Switch(
          thumbIcon: cubit.isDark
              ? const WidgetStatePropertyAll(
                  Icon(
                    FontAwesomeIcons.solidMoon,
                  ),
                )
              : const WidgetStatePropertyAll(
                  Icon(
                    FontAwesomeIcons.solidSun,
                    color: Color(0xff000000),
                  ),
                ),
          inactiveThumbColor: const Color(0xffffffff),
          activeTrackColor: const Color(0xff335ef7),
          inactiveTrackColor: const Color(0xffeeeeee),
          value: cubit.isDark ? true : false,
          onChanged: (value) {
            cubit.changeappmode();
          },
        ),
      );
    });
  }
}

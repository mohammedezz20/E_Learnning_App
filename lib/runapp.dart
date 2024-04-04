import 'package:e_learning_app/config/themes/theme.dart';
import 'package:e_learning_app/core/Cubit/langCubit/lang_cubit.dart';
import 'package:e_learning_app/core/Cubit/themeCubit/theme_cubit.dart';
import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:e_learning_app/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MainApp extends StatelessWidget {
  bool isArabic;
  bool isDark;
  bool isLogin;
  MainApp(
      {super.key,
      required this.isArabic,
      required this.isDark,
      required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LangCubit()..changeLang(false)),
        BlocProvider(
            create: (context) => ThemeCubit()..changeappmode(isdark: isDark)),
      ],
      child: BlocBuilder<LangCubit, LangState>(
        builder: (context, state) {
          return BlocBuilder<ThemeCubit, ThemeState>(
                        buildWhen: (previous, current) => previous != current,

            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lighttheme,
                darkTheme: darktheme,
                themeMode: context.watch<ThemeCubit>().isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                    locale: Locale(LangCubit.get(context).selectedLanguage),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
                home: MyWidget()
              );
            },
          );
        },
      ),
    );
  }
}

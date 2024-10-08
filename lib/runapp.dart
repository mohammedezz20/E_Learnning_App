import 'package:e_learning_app/config/themes/theme.dart';
import 'package:e_learning_app/core/Cubit/langCubit/lang_cubit.dart';
import 'package:e_learning_app/core/Cubit/themeCubit/theme_cubit.dart';
import 'package:e_learning_app/features/my-courses/presentation/pages/my_courses_screen.dart';
import 'package:e_learning_app/features/profile/presentation/cubit/cubit.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(
            create: (context) => ThemeCubit()..changeappmode(isdark: isDark)),
      ],
      child: BlocBuilder<LangCubit, LangState>(
        builder: (context, state) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return ScreenUtilInit(
                  designSize: const Size(428, 926),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  // Use builder only if you need to use library outside ScreenUtilInit context
                  builder: (_, child) {
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
                      home: const MyCoursesScreen(),
                    );
                  });
            },
          );
        },
      ),
    );
  }
}

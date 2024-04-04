import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:e_learning_app/core/Cubit/langCubit/lang_cubit.dart';
import 'package:e_learning_app/core/Cubit/themeCubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyWidget extends StatelessWidget {
  bool isArabic = CachHelper.getData(key: 'isArabic') ?? false;
   MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeState>(
                  buildWhen: (previous, current) => previous != current,

            listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      LangCubit.get(context).changeLang(! isArabic );
                    },
                    child: Text(S.of(context).b1)),
                ElevatedButton(
                    onPressed: () {
                      ThemeCubit.obj(context).changeappmode();
                    },
                    child: Text(S.of(context).b2)),
              ],
            ),
          ),
        );
      },
    );
  }
}

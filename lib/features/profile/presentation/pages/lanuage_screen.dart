import 'package:e_learning_app/core/Cubit/langCubit/lang_cubit.dart';
import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({super.key});

  bool isArabic = CachHelper.getData(key: 'isArabic') ?? false;

  @override
  Widget build(BuildContext context) {
    var cubit = LangCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).language),
      ),
      body: BlocBuilder<LangCubit, LangState>(
        builder: (BuildContext context, state) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  cubit.changeLang(isArabic);
                },
                child: ListTile(
                  title: Text(
                    S.of(context).english,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  trailing: Visibility(
                      visible: !cubit.isArabic,
                      child: const Icon(
                        Icons.check,
                        color: Color(0xff335ef7),
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  cubit.changeLang(!isArabic);
                },
                child: ListTile(
                  title: Text(
                    S.of(context).arabic,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  trailing: Visibility(
                    visible: cubit.isArabic,
                    child: const Icon(
                      Icons.check,
                      color: Color(0xff335ef7),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

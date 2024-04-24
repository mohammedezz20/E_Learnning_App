import 'package:e_learning_app/core/Cubit/langCubit/lang_cubit.dart';
import 'package:e_learning_app/core/utils/extensions/sized_box_extensions.dart';
import 'package:e_learning_app/features/profile/data/models/menu_model.dart';
import 'package:e_learning_app/features/profile/presentation/widgets/switch_themeMode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuItem extends StatelessWidget {
  MenuItem(
      {super.key,
      required this.menuModel,
      this.isDifferent = false,
      this.isDarkMode = false});

  final MenuModel menuModel;
  bool isDifferent;
  bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(
            menuModel.icon,
            size: 28,
            color: isDifferent
                ? const Color(0xfff75555)
                : Theme.of(context).iconTheme.color,
          ),
          20.w.sizedBoxWidth,
          Text(
            menuModel.title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: isDifferent ? const Color(0xfff75555) : null),
          ),
          const Expanded(child: SizedBox()),
          isDifferent || isDarkMode
              ? const SizedBox()
              : Icon(
                  LangCubit.get(context).isArabic
                      ? FontAwesomeIcons.angleLeft
                      : FontAwesomeIcons.angleRight,
                  color: Theme.of(context).iconTheme.color,
                ),
          SwitchThemeMode(isDarkMode: isDarkMode),
        ],
      ),
    );
  }
}

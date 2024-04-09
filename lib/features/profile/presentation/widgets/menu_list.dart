import 'package:e_learning_app/features/profile/presentation/cubit/cubit.dart';
import 'package:e_learning_app/features/profile/presentation/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    List menuList = ProfileCubit.get(context).getMenuList(context);
    return Column(
      children: [
        Column(
          children: List.generate(
            menuList.length,
            (index) {
              if (index == menuList.length - 2) {
                return MenuItem(menuModel: menuList[index], isDarkMode: true);
              } else if (index == menuList.length - 1) {
                return MenuItem(menuModel: menuList[index], isDifferent: true);
              }
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProfileCubit.get(context).screens[index]));
                  },
                  child: MenuItem(menuModel: menuList[index]));
            },
          ),
        ),
      ],
    );
  }
}

import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/core/utils/app_images.dart';
import 'package:e_learning_app/features/profile/presentation/widgets/profile_screen_body.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profile),
        elevation: 0,
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Container(
        //       padding: const EdgeInsets.all(2),
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         border: Border.all(color: AppColor.darkBackgroundColor),
        //         color: Colors.white,
        //       ),
        //       child: const Icon(
        //         Icons.more_horiz,
        //         size: 22,
        //         color: AppColor.darkBackgroundColor,
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: const ProfileScreenBody(),
    );
  }
}

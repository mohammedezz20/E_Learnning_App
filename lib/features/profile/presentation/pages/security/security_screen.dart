import 'package:e_learning_app/core/utils/widgets/custom_button.dart';
import 'package:e_learning_app/features/profile/presentation/widgets/notifications_option_item.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> options = [
      S.of(context).remember_me,
      S.of(context).face_id,
      S.of(context).biometric_id,
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).security),
      ),
      body: Column(
        children: [
          Column(
            children: List.generate(
              options.length,
              (index) => NotificationsOptionsItem(title: options[index]),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          ListTile(
            title: Text(
              S.of(context).google_auth,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: Icon(Icons.arrow_forward_ios,
                size: 18.sp, color: Colors.indigo),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                CustomButton(
                    backgroundColor: Color(0xff35383f),
                    width: double.infinity,
                    text: S.of(context).change_pin,
                    onPressed: () {}),
                CustomButton(
                    backgroundColor: Color(0xff35383f),
                    width: double.infinity,
                    text: S.of(context).change_password,
                    onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

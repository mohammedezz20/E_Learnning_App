import 'package:e_learning_app/features/Cources/presentation/pages/ins%20profile/pages/ins_profile.dart';
import 'package:e_learning_app/features/Cources/presentation/widgets/user_view_widget.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Text(
          'Mentor',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15.h,
        ),
        InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const InsProfile();
                }),
              );
            },
            child: const UserViewWidget()),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Text(
          S.of(context).course_details,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5.h),
        Text(
          'This course is designed to introduce beginners to the world of '
          'programming using Python. Python is a powerful and versatile '
          'programming language known for its simplicity and readability,'
          ' making it an ideal choice for beginners. Throughout the course, '
          'students will learn the fundamentals of programming concepts such as '
          'variables, data types, control structures, functions, and object-oriented programming. '
          'They will also gain hands-on experience by working on various coding exercises and projects, '
          'allowing them to apply what they have learned in real-world scenarios.',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}

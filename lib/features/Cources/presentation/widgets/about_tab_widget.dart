import 'package:e_learning_app/core/utils/extensions/build_context_extensions.dart';
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
        Row(
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage(
                  'assets/mentor-image.jpg'), // Replace 'assets/mentor_image.jpg' with the actual path to the mentor's image
              radius: 25.w,
            ),
            SizedBox(width: context.screenWidth * 0.08),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Software Engineer',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.chat_outlined),
              color: Colors.blue,
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Text(
          'Course Details',
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

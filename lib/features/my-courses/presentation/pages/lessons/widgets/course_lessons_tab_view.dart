import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseLessonsTabView extends StatelessWidget {
  final Widget lessonsTab;
  final Widget certificatesTab;

  const CourseLessonsTabView({
    super.key,
    required this.lessonsTab,
    required this.certificatesTab,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: const Color(0xff3577fe),
            unselectedLabelColor: Colors.grey,
            indicatorColor: const Color(0xff3577fe),
            tabs: const [
              Tab(
                text: 'Lessons',
              ),
              Tab(
                text: 'Certificates',
              ),
            ],
            labelStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: TabBarView(
                children: [
                  lessonsTab,
                  certificatesTab,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

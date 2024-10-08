import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCoursesTabList extends StatelessWidget {
  final Widget onGoingContent;
  final Widget completedContent;

  const MyCoursesTabList({
    super.key,
    required this.onGoingContent,
    required this.completedContent,
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
                text: 'Ongoing',
              ),
              Tab(text: 'Completed'),
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
                  onGoingContent,
                  completedContent,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

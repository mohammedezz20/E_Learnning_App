import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Lesson {
  final String title;
  final String duration;

  Lesson(this.title, this.duration);
}

class CourseData {
  static List<Lesson> section1Lessons = [
    Lesson('Why Using Figma', '10 mins'),
    Lesson('Getting Started with Figma', '20 mins'),
    Lesson('Basic Tools in Figma', '15 mins'),
  ];

  static List<Lesson> section2Lessons = [
    Lesson('Mastering Components', '30 mins'),
    Lesson('Prototyping in Figma', '25 mins'),
    Lesson('Collaboration Features', '20 mins'),
  ];

  static List<Lesson> section3Lessons = [
    Lesson('Building a Landing Page', '40 mins'),
    Lesson('Designing a Mobile App', '35 mins'),
    Lesson('Creating a UI Kit', '45 mins'),
  ];
}

class Lessons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '15 lessons',
                style: TextStyle(fontSize: 20.sp, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  // Handle "See All" button click
                },
                child: Text(
                  'See All',
                  style: TextStyle(fontSize: 18.sp, color: Color(0XFF24BAFF)),
                ),
              ),
            ],
          ),
          _Section(
            sectionTitle: 'Section 1 - Introduction',
            lessons: CourseData.section1Lessons,
          ),
          _Section(
            sectionTitle: 'Section 2 - Advanced Techniques',
            lessons: CourseData.section2Lessons,
          ),
          _Section(
            sectionTitle: 'Section 3 - Projects',
            lessons: CourseData.section3Lessons,
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String sectionTitle;
  final List<Lesson> lessons;

  const _Section({
    Key? key,
    required this.sectionTitle,
    required this.lessons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitle,
          style: TextStyle(fontSize: 17.sp, color: Colors.black),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                width: 35.r,
                height: 35.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0XFF24BAFF), width: 1.5.r),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(fontSize: 20.sp, color: Color(0XFF24BAFF)),
                  ),
                ),
              ),
              title: Text(
                lessons[index].title,
                style: TextStyle(fontSize: 20.sp, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                lessons[index].duration,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: Icon(Icons.play_circle_fill, color: Color(0XFF24BAFF)),
            );
          },
        ),
      ],
    );
  }
}

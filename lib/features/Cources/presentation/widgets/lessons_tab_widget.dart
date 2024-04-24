import 'package:flutter/cupertino.dart';
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
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  // Handle "See All" button click
                },
                child: Text('See All',style: TextStyle(fontSize: 18,color: Color(0XFF24BAFF)),),
              ),
            ],
          ),
          _buildSection('Section 1 - Introduction', CourseData.section1Lessons),
          _buildSection('Section 2 - Advanced Techniques', CourseData.section2Lessons),
          _buildSection('Section 3 - Projects', CourseData.section3Lessons),
        ],
      ),
    );
  }

  Widget _buildSection(String sectionTitle, List<Lesson> lessons) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitle,
          style: TextStyle(fontSize: 17,color: Colors.black),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0XFF24BAFF), width: 1.5),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(fontSize: 20, color: Color(0XFF24BAFF)),
                  ),
                ),
              ),
              title: Text(lessons[index].title,style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.bold),),
              subtitle: Text(lessons[index].duration,style: Theme.of(context).textTheme.labelSmall,),
              trailing: Icon(Icons.play_circle_fill, color: Color(0XFF24BAFF)),
            );
          },
        ),
      ],
    );
  }
}

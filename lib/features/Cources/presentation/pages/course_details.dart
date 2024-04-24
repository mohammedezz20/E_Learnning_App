import 'package:e_learning_app/core/utils/extensions/build_context_extensions.dart';
import 'package:e_learning_app/features/Cources/presentation/widgets/lessons_tab_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/about_tab_widget.dart'; // Import the AboutTab widget
import '../widgets/review_tab_widget.dart'; // Import the Review class

class Course {
  final int id; // Unique identifier for the course
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String mentorName;
  final String mentorTitle;
  final String mentorImageUrl;
  final List<String> tools; // List of tools required for the course
  final double rating;
  final int numRatings;
  final List reviews;

  const Course({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.mentorName,
    required this.mentorTitle,
    required this.mentorImageUrl,
    required this.tools,
    required this.rating,
    required this.numRatings,
    required this.reviews,
  });
}

class CourseDetails extends StatefulWidget {
  final Course course;
  final bool isSaved;
  final Function(bool) onSaveChanged;

  const CourseDetails({
    Key? key, // Add key parameter
    required this.course,
    required this.isSaved,
    required this.onSaveChanged,
  }) : super(key: key);

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  late bool isSaved;

  @override
  void initState() {
    super.initState();
    isSaved = widget.isSaved;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 3, // Number of tabs
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: widget.course.id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        widget.course.imageUrl,
                        width: double.infinity,
                        height: 300.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: context.screenWidth * .8,
                                  child: Text(
                                    widget.course.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                IconButton(
                                  icon: isSaved
                                      ? const Icon(Icons.bookmark)
                                      : const Icon(Icons.bookmark_outline),
                                  color: Colors.blue,
                                  onPressed: () {
                                    setState(() {
                                      isSaved = !isSaved;
                                      widget.onSaveChanged(isSaved);
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5.h),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffEFF3FF),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Text(
                                    'Programming', // Replace 'Your Category' with the actual category
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue[600]),
                                  ),
                                ),
                                SizedBox(width: context.screenWidth * 0.1),
                                const Icon(Icons.star,
                                    size: 16.0, color: Color(0xffFD9D17)),
                                Text(
                                  ' (${widget.course.rating})', // Display course rating
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xffFD9D17)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: context.screenHeight * 0.02,
                            ),
                            Text(
                              '\$${widget.course.price}', // Display course price
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.people,
                                    size: 20.0, color: Colors.blue),
                                Text(
                                  ' ${widget.course.numRatings} students', // Display number of enrolled students
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: context.screenWidth * 0.1),
                                const Icon(Icons.watch_later,
                                    size: 20.0, color: Colors.blue),
                                Text(
                                  ' 25 hours', // Display number of hours
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7.0),
                  TabBar(
                    labelColor: Colors
                        .blue, // Set the color of the active tab label to blue
                    labelStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight
                            .bold), // Adjust the font size of the active tab label
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 4.h,

                    indicatorColor:
                    Colors.blue, // Set the color of the indicator to blue

                    tabs: const [
                      Tab(text: 'About'),
                      Tab(text: 'Lessons'),
                      Tab(text: 'Reviews'),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  // Content for each tab
                  SizedBox(
                    height: 250, // Use a fixed pixel value for predictable layout
                    child: TabBarView(
                      children: [
                        AboutTab(),
                        Lessons(),
                        Reviews(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: SizedBox(
            height: 60.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF24BAFF),
              ),
              child: Text(
                'Enroll - \$${widget.course.price}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

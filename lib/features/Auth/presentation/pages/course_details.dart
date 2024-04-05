import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  final List<Review> reviews;

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

class Review {
  final String reviewerName;
  final String reviewerImageUrl;
  final double rating;
  final String text;

  const Review({
    required this.reviewerName,
    required this.reviewerImageUrl,
    required this.rating,
    required this.text,
  });
}

class CourseDetails extends StatefulWidget {
  final Course course;
  final bool isSaved;
  final Function(bool) onSaveChanged;

  const CourseDetails({required this.course, required this.isSaved, required this.onSaveChanged});

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
              padding: const EdgeInsets.all(16.0),
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
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
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
                                Text(
                                  widget.course.name,
                                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  icon: isSaved ? Icon(Icons.bookmark) : Icon(Icons.bookmark_outline),
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
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue[50],
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Text(
                                    'Programming', // Replace 'Your Category' with the actual category
                                    style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold, color: Colors.blue[700]),
                                  ),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                                Icon(Icons.star, size: 16.0, color: Colors.amber),
                                Text(
                                  ' (${widget.course.rating})', // Display course rating
                                  style: TextStyle(fontSize: 14.0, color: Colors.amber),
                                ),
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                            Text(
                              '\$${widget.course.price}', // Display course price
                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                            Row(
                              children: [
                                Icon(Icons.people, size: 16.0, color: Colors.blue),
                                Text(
                                  ' ${widget.course.numRatings} students', // Display number of enrolled students
                                  style: TextStyle(fontSize: 14.0, color: Colors.blue),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                                Icon(Icons.access_time, size: 16.0, color: Colors.grey),
                                Text(
                                  ' 25 hours', // Display number of hours
                                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.0),
                  TabBar(
                    labelColor: Colors.blue, // Set the color of the active tab label to blue
                    labelStyle: TextStyle(fontSize: 16.0), // Adjust the font size of the active tab label
                    indicatorColor: Colors.blue, // Set the color of the indicator to blue
                    tabs: [
                      Tab(text: 'About'),
                      Tab(text: 'Lessons'),
                      Tab(text: 'Reviews'),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  // Content for each tab
                  SizedBox(
                    height: 230.0, // Adjust height according to content
                    child: TabBarView(
                      children: [
                        ListView(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: MediaQuery.of(context).size.height * 0.015,),

                                Text(
                                  'Mentor',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage('assets/mentor-image.jpg'), // Replace 'assets/mentor_image.jpg' with the actual path to the mentor's image
                                      radius: 25,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'John Doe', // Static name for the mentor
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          'Software Engineer', // Title of the mentor
                                          style: TextStyle(fontSize: 14, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.24),
                                    IconButton(
                                      icon:Icon(Icons.chat_outlined),
                                      color:  Colors.blue , // Change color to blue if isSaved is true
                                      onPressed: () {

                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                                Text(
                                  'Course Details',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'This course is designed to introduce beginners to the world of '
                                      'programming using Python. Python is a powerful and versatile '
                                      'programming language known for its simplicity and readability,'
                                      ' making it an ideal choice for beginners. Throughout the course, '
                                      'students will learn the fundamentals of programming concepts such as '
                                      'variables, data types, control structures, functions, and object-oriented programming. '
                                      'They will also gain hands-on experience by working on various coding exercises and projects, '
                                      'allowing them to apply what they have learned in real-world scenarios.',
                                  style: TextStyle(fontSize: 14),
                                ),

                                // Mentor Details
                              ],
                            ),
                          ],
                        ),
                        Center(child: Text('Lessons section')),
                        Center(child: Text('Reviews section')),
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
          child: ElevatedButton(
            onPressed: () {
              // Add your enrollment logic here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0XFF24BAFF), // Set the background color to blue
            ),
            child: Text(
              'Enroll - \$${widget.course.price}', // Display course price in the button text
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'course_details.dart';

final List<Course> courses = [
  const Course(
    id: 1,
    name: 'Introduction to Programming',
    description:
        'Learn the fundamentals of programming languages and concepts.',
    price: 19.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 5,
    rating: 5,
    reviews: [],
  ),
  const Course(
    id: 2,
    name: 'Data Structures and Algorithms',
    description: 'Explore data structures and algorithms.',
    price: 24.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 10,
    rating: 4.5,
    reviews: [],
  ),
  const Course(
    id: 3,
    name: 'Mobile App Development with Flutter',
    description: 'Build cross-platform mobile apps with Flutter.',
    price: 29.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 8,
    rating: 4.8,
    reviews: [],
  ),
  const Course(
    id: 4,
    name: 'Web Development with React',
    description: 'Learn modern web development with React.js.',
    price: 27.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 7,
    rating: 4.7,
    reviews: [],
  ),
  const Course(
    id: 5,
    name: 'Machine Learning Foundations',
    description: 'Get started with the basics of machine learning.',
    price: 34.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 12,
    rating: 4.9,
    reviews: [],
  ),
  const Course(
    id: 6,
    name: 'Database Management Essentials',
    description: 'Learn essential concepts of database management.',
    price: 22.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 6,
    rating: 4.6,
    reviews: [],
  ),
  const Course(
    id: 7,
    name: 'UI/UX Design Fundamentals',
    description: 'Master the basics of UI/UX design.',
    price: 26.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 9,
    rating: 4.7,
    reviews: [],
  ),
  const Course(
    id: 8,
    name: 'Digital Marketing Strategies',
    description: 'Learn effective digital marketing strategies.',
    price: 31.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 11,
    rating: 4.8,
    reviews: [],
  ),
  const Course(
    id: 9,
    name: 'Cybersecurity Fundamentals',
    description: 'Understand the basics of cybersecurity.',
    price: 28.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 7,
    rating: 4.6,
    reviews: [],
  ),
  const Course(
    id: 10,
    name: 'Business Analytics Essentials',
    description: 'Learn essential analytics skills for business.',
    price: 29.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 9,
    rating: 4.7,
    reviews: [],
  ),
];

class AllCourses extends StatelessWidget {
  const AllCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 0,
          title: const Text('All Courses'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                "${courses.length} courses found",
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
          ],
        ),
        body: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              // shrinkWrap true, prevents the list from taking all the available space
              shrinkWrap: true,
              itemCount: courses.length,
              itemBuilder: (context, index) {
                // Pass the corresponding course to each CourseCard
                return CourseCard(course: courses[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CourseCard extends StatefulWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  _CourseCardState createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // navigate to course details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetails(
              course: widget.course,
              isSaved: isSaved, // Pass the isSaved property
              onSaveChanged: (value) {
                setState(() {
                  isSaved = value; // Update the isSaved property
                });
              },
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      widget.course.imageUrl,
                      width: MediaQuery.of(context).size.height * 0.15,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: Colors.lightBlue[50],
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                'Programming', // Replace 'Your Category' with the actual category
                                style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[700]),
                              ),
                            ),
                            IconButton(
                              icon: isSaved
                                  ? const Icon(Icons.bookmark)
                                  : const Icon(Icons.bookmark_outline),
                              color: Colors
                                  .blue, // Change color to blue if isSaved is true
                              onPressed: () {
                                setState(() {
                                  isSaved =
                                      !isSaved; // Toggle isSaved when the icon is pressed
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          '${widget.course.name} - \$${widget.course.price}', // Display course name and price
                          style: const TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                size: 16.0, color: Colors.amber),
                            Text(
                              '(${widget.course.rating})', // Display course rating
                              style: const TextStyle(
                                  fontSize: 14.0, color: Colors.amber),
                            ),
                            const SizedBox(width: 5.0),
                            const Text(
                              '|', // Separator
                              style:
                                  TextStyle(fontSize: 14.0, color: Colors.grey),
                            ),
                            const SizedBox(width: 5.0),
                            const Icon(Icons.people,
                                size: 16.0, color: Colors.blue),
                            Text(
                              ' ${widget.course.numRatings} students', // Display number of enrolled students
                              style: const TextStyle(
                                  fontSize: 14.0, color: Colors.blue),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

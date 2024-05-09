import 'package:flutter/material.dart';
import 'home_screen.dart';

class AllCategoryCourses extends StatelessWidget {
  int selected_index = 0;
  AllCategoryCourses(selected_index) {
    this.selected_index = selected_index;
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Courses(
                  index: index,
                  selected_index: selected_index,
                  Category: AllCourses[selected_index][index].Category,
                  photo: AllCourses[selected_index][index].photo,
                  title: AllCourses[selected_index][index].title,
                  views: AllCourses[selected_index][index].views,
                  hours: AllCourses[selected_index][index].hours,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Courses extends StatelessWidget {
  final String Category;
  final String photo;
  final String title;
  final String views;
  final int hours;
  final int index;
  final int selected_index;

  Courses(
      {required this.Category,
      required this.photo,
      required this.title,
      required this.views,
      required this.hours,
      required this.index,
      required this.selected_index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        //    elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 250, // Adjust the width to your preference
              height: 200, // Adjust the height to your preference
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  photo, // Replace with your image URL
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 8, top: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(title),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        size: 12,
                        color: Colors.blue,
                      ),
                      Text(
                        views,
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.watch_later,
                        size: 15,
                      ),
                      Text(
                        '${hours} h',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Icon(Icons.bookmark_outline),
            SizedBox(
              width: 30,
            ),
          ],
        ),
      ),
    );
  }
}

List<List<Courses>> AllCourses = [
  //tech
  [
    Courses(
      Category: 'Technology',
      photo: 'assets/tech/cloud.jpg',
      title: 'Cloud Computing',
      views: '80.5k',
      hours: 45,
      index: 0,
      selected_index: 0,
    ),
    Courses(
      Category: 'Technology',
      photo: 'assets/tech/cybersecurity.avif',
      title: 'Cyber Security',
      views: '80.5k',
      hours: 45,
      index: 1,
      selected_index: 0,
    ),
    Courses(
      Category: 'Technology',
      photo: 'assets/tech/DataScience.avif',
      title: 'Data Science',
      views: '80.5k',
      hours: 45,
      index: 1,
      selected_index: 0,
    ),
    Courses(
      Category: 'Technology',
      photo: 'assets/tech/cs50.jpg',
      title: 'CS50',
      views: '50k',
      hours: 30,
      index: 3,
      selected_index: 0,
    ),
    Courses(
      Category: 'Technology',
      photo: 'assets/tech/flutter.webp',
      title: 'Flutter',
      views: '20k',
      hours: 20,
      index: 4,
      selected_index: 0,
    ),
    Courses(
      Category: 'Technology',
      photo: 'assets/tech/robotics.avif',
      title: 'Robotics',
      views: '80.5k',
      hours: 45,
      index: 5,
      selected_index: 0,
    ),
    Courses(
      Category: 'Technology',
      photo: 'assets/tech/web.avif',
      title: 'Web Design',
      views: '100k',
      hours: 25,
      index: 6,
      selected_index: 0,
    ),
    Courses(
      Category: 'Technology',
      photo: 'assets/tech/ccna.png',
      title: 'CCNA',
      views: '11.9k',
      hours: 15,
      index: 7,
      selected_index: 0,
    ),
  ],
  //science
  [
    Courses(
      Category: 'Science',
      photo: 'assets/science/astronomy.jpg',
      title: 'Astronomy',
      views: '250k',
      hours: 70,
      selected_index: 1,
      index: 0,
    ),
    Courses(
      Category: 'Science',
      photo: 'assets/science/biology.jpg',
      title: 'Biology',
      views: '56.2k',
      hours: 62,
      selected_index: 1,
      index: 1,
    ),
    Courses(
      Category: 'Science',
      photo: 'assets/science/chemistry.jpg',
      title: 'Chemistry',
      views: '50.5k',
      hours: 34,
      selected_index: 1,
      index: 2,
    ),
    Courses(
        Category: 'Science',
        photo: 'assets/science/psychology.avif',
        title: 'Psychology',
        views: '50k',
        hours: 10,
        selected_index: 1,
        index: 3),
    Courses(
        Category: 'Science',
        photo: 'assets/science/geology.jpg',
        title: 'Geology',
        views: '20.9k',
        hours: 20,
        selected_index: 1,
        index: 4),
    Courses(
        Category: 'Science',
        photo: 'assets/science/physics.jpg',
        title: 'Physics',
        views: '70.5k',
        hours: 28,
        selected_index: 1,
        index: 5),
    Courses(
        Category: 'Science',
        photo: 'assets/science/ecology.webp',
        title: 'Ecology',
        views: '40k',
        hours: 40,
        selected_index: 1,
        index: 6),
    Courses(
        Category: 'Science',
        photo: 'assets/science/math.jpg',
        title: 'Mathematics',
        views: '68k',
        hours: 36,
        selected_index: 1,
        index: 7),
  ],
  //languages
  [
    Courses(
        Category: 'Language',
        photo: 'assets/language/korean.jpg',
        title: 'Korean',
        views: '52k',
        hours: 44,
        selected_index: 2,
        index: 0),
    Courses(
        Category: 'Language',
        photo: 'assets/language/russian.jpg',
        title: 'Russian',
        views: '15k',
        hours: 10,
        selected_index: 2,
        index: 1),
    Courses(
        Category: 'Language',
        photo: 'assets/language/chinese.jpg',
        title: 'Chinese',
        views: '15k',
        hours: 10,
        selected_index: 2,
        index: 2),
    Courses(
        Category: 'Language',
        photo: 'assets/language/english.jpg',
        title: 'English',
        views: '150k',
        hours: 40,
        selected_index: 2,
        index: 3),
    Courses(
        Category: 'Languages',
        photo: 'assets/language/french.avif',
        title: 'French',
        views: '55.1k',
        hours: 30,
        selected_index: 2,
        index: 4),
    Courses(
        Category: 'Languages',
        photo: 'assets/language/german.jpg',
        title: 'German',
        views: '64k',
        hours: 20,
        selected_index: 2,
        index: 5),
    Courses(
        Category: 'Languages',
        photo: 'assets/language/italian.avif',
        title: 'Italian',
        views: '10k',
        hours: 40,
        selected_index: 2,
        index: 6),
    Courses(
        Category: 'Languages',
        photo: 'assets/language/spanish.jpg',
        title: 'Spanish',
        views: '10.7k',
        hours: 10,
        selected_index: 2,
        index: 7),
  ],
  //marketing
  [
    Courses(
        Category: 'Marketing',
        photo: 'assets/marketing/automation.jpg',
        title: 'Marketing automation',
        views: '36k',
        hours: 10,
        selected_index: 3,
        index: 0),
    Courses(
        Category: 'Marketing',
        photo: 'assets/marketing/content.jpg',
        title: 'Content Strategy',
        views: '70k',
        hours: 10,
        selected_index: 3,
        index: 1),
    Courses(
        Category: 'Marketing',
        photo: 'assets/marketing/marketing.png',
        title: 'Digital Marketing',
        views: '80k',
        hours: 10,
        selected_index: 3,
        index: 2),
    Courses(
        Category: 'Marketing',
        photo: 'assets/marketing/social.jpg',
        title: 'Social Marketing',
        views: '59k',
        hours: 10,
        selected_index: 3,
        index: 3),
    Courses(
        Category: 'Marketing',
        photo: 'assets/marketing/outbound.jpg',
        title: 'Outbound Marketing',
        views: '18k',
        hours: 10,
        selected_index: 3,
        index: 4),
    Courses(
        Category: 'Marketing',
        photo: 'assets/marketing/inbound.jpg',
        title: 'Inbound Marketing',
        views: '20k',
        hours: 10,
        selected_index: 3,
        index: 5),
    Courses(
        Category: 'Marketing',
        photo: 'assets/marketing/brand.avif',
        title: 'Brand Marketing',
        views: '18k',
        hours: 10,
        selected_index: 3,
        index: 6),
    Courses(
        Category: 'Marketing',
        photo: 'assets/marketing/analytics.png',
        title: 'Marketing analytics',
        views: '18k',
        hours: 10,
        selected_index: 3,
        index: 7),
  ],
];

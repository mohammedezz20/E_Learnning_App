import 'package:flutter/material.dart';
import 'package:e_app/all_category_screen.dart';
import 'home_screen.dart';

class PopularRecommended extends StatefulWidget {
  @override
  _PopularRecommendedsState createState() => _PopularRecommendedsState();
}

int _selectedTabIndex = 0;

class _PopularRecommendedsState extends State<PopularRecommended> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          // Popular Courses
          ListTile(
            leading: Text(
              'Popular Courses',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: popularCourses.length,
              itemBuilder: (context, index) {
                return Popular(
                  photo: popularCourses[index].photo,
                  title: popularCourses[index].title,
                  views: popularCourses[index].views,
                  hours: popularCourses[index].hours,
                );
              },
            ),
          ),

          // Recommended Courses
          ListTile(
            leading: Text(
              'Recommended Courses',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black),
            ),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: RecommendedCourses.length,
              itemBuilder: (context, index) {
                return Recommended(
                  photo: RecommendedCourses[index].photo,
                  title: RecommendedCourses[index].title,
                  views: RecommendedCourses[index].views,
                  hours: RecommendedCourses[index].hours,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Popular extends StatelessWidget {
  final String photo;
  final String title;
  final String views;
  final int hours;

  const Popular({
    required this.photo,
    required this.title,
    required this.views,
    required this.hours,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
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
          Padding(
            padding:
                const EdgeInsets.only(left: 0, right: 8, top: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye,
                      size: 12,
                      color: Color(0xff24BAFF),
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
        ],
      ),
    );
  }
}

class Recommended extends StatelessWidget {
  final String photo;
  final String title;
  final String views;
  final int hours;

  const Recommended({
    required this.photo,
    required this.title,
    required this.views,
    required this.hours,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
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
          ),
        ],
      ),
    );
  }
}

List<Popular> popularCourses = [
  const Popular(
    photo: 'assets/tech/cs50.jpg',
    title: 'CS50',
    views: '100k',
    hours: 40,
  ),
  const Popular(
    photo: 'assets/marketing/marketing.png',
    title: 'Marketing',
    views: '50k',
    hours: 30,
  ),
  const Popular(
    photo: 'assets/tech/flutter.webp',
    title: 'Flutter',
    views: '20k',
    hours: 20,
  ),
  const Popular(
    photo: 'assets/tech/ccna.png',
    title: 'CCNA',
    views: '20k',
    hours: 20,
  ),
];
List<Recommended> RecommendedCourses = [
  const Recommended(
    photo: 'assets/language/english.jpg',
    title: 'English',
    views: '100k',
    hours: 40,
  ),
  const Recommended(
    photo: 'assets/science/physics.jpg',
    title: 'Physics',
    views: '50k',
    hours: 30,
  ),
  const Recommended(
    photo: 'assets/marketing/social.jpg',
    title: 'Social Media Marketing',
    views: '20k',
    hours: 20,
  ),
  const Recommended(
    photo: 'assets/language/german.jpg',
    title: 'German',
    views: '100k',
    hours: 40,
  ),
];

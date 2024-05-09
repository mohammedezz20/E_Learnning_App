import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../pages/home_screen.dart';

class PopularRecommended extends StatefulWidget {
  const PopularRecommended({super.key});

  @override
  _PopularRecommendedsState createState() => _PopularRecommendedsState();
}

int _selectedTabIndex = 0;

class _PopularRecommendedsState extends State<PopularRecommended> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          // Popular Courses
          const ListTile(
            leading: Text(
              'Popular Courses',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
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
          const ListTile(
            leading: Text(
              'Recommended Courses',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
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
    super.key,
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
          SizedBox(
            width: 200,
            height: 130,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                photo,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(title),
          Row(
            children: [
              const Icon(
                Icons.remove_red_eye,
                size: 12,
                color: Color(0xff24BAFF),
              ),
              Text(
                views,
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.watch_later,
                size: 15,
              ),
              Text(
                '$hours h',
                style: const TextStyle(fontSize: 12),
              ),
            ],
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
    super.key,
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
          SizedBox(
            width: 200, // Adjust the width to your preference
            height: 130, // Adjust the height to your preference
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(photo),
                )),
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
                      const Icon(
                        Icons.remove_red_eye,
                        size: 12,
                        color: Colors.blue,
                      ),
                      Text(
                        views,
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.watch_later,
                        size: 15,
                      ),
                      Text(
                        '$hours h',
                        style: const TextStyle(fontSize: 12),
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

getdata({
  String username = '',
}) {
  print(username);
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_learning_app/popular_recommended.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'all_category_courses.dart';
import 'category_courses.dart';

int selectedIndex = 0;
String? name = "Sara";

final List<Mentor> mentors = [
  Mentor(name: 'John', photoAsset: 'assets/mentor1.jpg'),
  Mentor(name: 'Sara ', photoAsset: 'assets/mentor2.jpg'),
  Mentor(name: 'David ', photoAsset: 'assets/mentor5.jpg'),
  Mentor(name: 'Smith ', photoAsset: 'assets/mentor1.jpg'),
  Mentor(name: 'Elsa ', photoAsset: 'assets/mentor5.jpg'),
  Mentor(name: 'Johnson ', photoAsset: 'assets/mentor1.jpg'),
  Mentor(name: 'Doe ', photoAsset: 'assets/mentor5.jpg'),
  Mentor(name: 'Lina ', photoAsset: 'assets/mentor2.jpg'),
  Mentor(name: 'Piter ', photoAsset: 'assets/mentor1.jpg'),
];

final TextEditingController _searchController = TextEditingController();

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9fbff),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, ${name}!",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Find your lessons today!",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff343636),
                      ),
                    ),
                  ],
                ),
                InkResponse(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/avatar.jpg"),
                    )),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white, // Set background color
                  borderRadius:
                      BorderRadius.circular(15.0), // Set border radius
                ),
                height: 50,
                width: 340,
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle:
                        TextStyle(color: Colors.black26), // Set hint text color
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.black26,
                        size: 20, // Set icon size
                      ),
                      onPressed: () => _searchController.clear(),
                    ),
                    prefixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.black26,
                        size: 20, // Set icon size
                      ),
                      onPressed: () {},
                    ),
                    border: InputBorder.none, // Remove border
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/rate.PNG',
              height: 130,
              width: 340,
              fit: BoxFit
                  .cover, // Adjust how the image should be fitted within the widget
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      ' Top Mentors',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //HorizontalTabs(),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: mentors.length,
                      itemBuilder: (context, index) {
                        return MentorCard(mentor: mentors[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      ' Categories',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //HorizontalTabs(),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _cats.length,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 6),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xff24BAFF),
                                ),
                                borderRadius: BorderRadius.circular(15),
                                color: selectedIndex == index
                                    ? Color(0xff24BAFF)
                                    : Colors.transparent,
                              ),
                              child: Text(
                                _cats[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Color(0xff24BAFF),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          displaySelectedWidget(selectedIndex),
          SizedBox(height: 15),
        ],
      ),
    );

    bottomNavigationBar:
    CurvedNavigationBar(
      height: 50,
      color: Colors.grey.shade50,
      backgroundColor: const Color(0xff24BAFF).withOpacity(.2),
      items: const [
        Icon(
          Icons.home,
          size: 30,
          color: Color(0xff24BAFF),
        ),
        Icon(
          Icons.person,
          size: 30,
          color: Color(0xff24BAFF),
        ),
        Icon(
          Icons.bookmark_outline_outlined,
          size: 30,
          color: Color(0xff24BAFF),
        ),
      ],
    );
  }
}

Widget displaySelectedWidget(int index) {
  switch (index) {
    case 0:
      return PopularRecommended();
    case 1:
      return CategoryCourses(0);
    case 2:
      return CategoryCourses(1);
    case 3:
      return CategoryCourses(2);
    case 4:
      return CategoryCourses(3);
    default:
      return CategoryCourses(
          0); // Alternatively, return a default widget if index is out of range.
  }
}

List<String> _cats = [
  ' All ',
  ' Programming ',
  ' Technologies ',
  ' Languages ',
  ' Marketing ',
];

class Mentor {
  final String name;
  final String photoAsset;

  Mentor({required this.name, required this.photoAsset});
}

class MentorCard extends StatelessWidget {
  final Mentor mentor;

  MentorCard({required this.mentor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          InkResponse(
              onTap: () {},
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(mentor.photoAsset),
              )),
          SizedBox(height: 8.0),
          Text(mentor.name),
        ],
      ),
    );
  }
}

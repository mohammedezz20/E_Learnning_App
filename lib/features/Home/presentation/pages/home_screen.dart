import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_learning_app/features/Home/presentation/widgets/popular_recommended.dart';
import 'package:e_learning_app/features/Home/presentation/widgets/title_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'all_category_courses.dart';
import '../widgets/category_courses.dart';

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
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9fbff),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, $name!",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Text(
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
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/avatar.jpg"),
                    )),
              ],
            ),
            SizedBox(height: 20.h),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: 'Search now...',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 18.sp),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              ),
              cursorColor: Colors.grey,
              style: TextStyle(color: Colors.black, fontSize: 18.sp),
            ),
            SizedBox(
              height: 15.h,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/Frame 1.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            TitleItem(
              mainText: 'Top Mentors',
              onpressed: () {},
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 100.h,
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: mentors.length,
                  itemBuilder: (context, index) {
                    return MentorCard(mentor: mentors[index]);
                  },
                ),
              ),
            ),
            TitleItem(
              mainText: 'Categories',
              onpressed: () {},
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 40.h,
              child: ListView.builder(
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
                            color: const Color(0xff24BAFF),
                          ),
                          borderRadius: BorderRadius.circular(15),
                          color: selectedIndex == index
                              ? const Color(0xff24BAFF)
                              : Colors.transparent,
                        ),
                        child: Text(
                          _cats[index],
                          style: TextStyle(
                            fontSize: 16,
                            color: selectedIndex == index
                                ? Colors.white
                                : const Color(0xff24BAFF),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            displaySelectedWidget(selectedIndex),
            const SizedBox(height: 15),
          ],
        ),
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
      return const PopularRecommended();
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

  const MentorCard({super.key, required this.mentor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          InkResponse(
              onTap: () {},
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(mentor.photoAsset),
              )),
          const SizedBox(height: 8.0),
          Text(mentor.name),
        ],
      ),
    );
  }
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'all_category_courses.dart';
import 'category_courses.dart';
import 'home_screen.dart';

class AllCategory extends StatelessWidget {
  int selected_index = 0;
  int _index = 0;
  AllCategory(selected_index) {
    this.selected_index = selected_index;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Color(0xff24BAFF),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Row(
            children: [
              Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText:
                        '${AllCourses[selected_index][0].Category} Courses',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.more_vert),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          // Popular Courses
          ListTile(
            leading: Text(
              'All ${AllCourses[selected_index][0].Category} Courses',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            trailing: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0),
              ),
              onPressed: () {
                // Do something when the button is pressed.
              },
              child: Text(
                'Filter',
                style: TextStyle(color: Color(0xff24BAFF)),
              ),
            ),
          ),
          AllCategoryCourses(selected_index),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
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
      ),
    );
  }
}

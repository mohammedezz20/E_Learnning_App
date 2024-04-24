import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Reviews extends StatefulWidget {
  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber),
            Text(
              ' 4.8 (4,479 reviews)',
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
              child: Text(
                'See All',
                style: TextStyle(fontSize: 18, color: Color(0XFF24BAFF)),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 35.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6, // One extra tab for "All Reviews"
                itemBuilder: (context, index) {
                  final reversedIndex = 5 - index; // Reversing the index
                  if (reversedIndex == 5) {
                    // Add tab for "All Reviews"
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        margin: EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          color: _selectedTabIndex == index ? Color(0XFF24BAFF) :Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Color(0XFF24BAFF)), // Blue border
                        ),
                        child: Text(
                          'All Reviews',
                          style: TextStyle(color: _selectedTabIndex == index ?Colors.white: Color(0XFF24BAFF), fontSize: 14), // Blue label
                        ),
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        margin: EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          color: _selectedTabIndex == index ? Color(0XFF24BAFF) : Colors.white, // White background
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Color(0XFF24BAFF)), // Blue border
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${reversedIndex + 1} stars',
                              style: TextStyle(color: _selectedTabIndex == index ?Colors.white: Color(0XFF24BAFF), fontSize: 14), // Blue label
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 16.h),
            // Add reviews based on selected tab
            // Here, you can generate reviews based on the selected tab
            // For simplicity, I'll just display some sample reviews
            _buildReview(
              'John Doe',
              5,
              'Great course! I learned a lot about Figma and improved my design skills.',
            ),
            _buildReview(
              'Jane Smith',
              4,
              'The course content was excellent, but I wish there were more interactive exercises.',
            ),
            _buildReview(
              'David Johnson',
              3,
              'Decent course, but some sections were a bit confusing. Could use more explanations.',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildReview(String reviewerName, int rating, String reviewText) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: const AssetImage(
            'assets/mentor-image.jpg'), // Replace 'assets/mentor_image.jpg' with the actual path to the mentor's image
        radius: 25.w,
      ),
      title: Row(
        children: [
          Text(
            reviewerName,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Spacer(),
          _buildRatingWidget(rating),
          SizedBox(width: 5.w),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4.h),
          Text(
            reviewText,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }

  Widget _buildRatingWidget(int rating) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$rating',
            style: TextStyle(color: Colors.blue, fontSize: 12.sp),
          ),
          Icon(Icons.star, color: Colors.blue, size: 12.sp),
        ],
      ),
    );
  }
}

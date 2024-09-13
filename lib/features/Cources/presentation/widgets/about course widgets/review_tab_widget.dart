import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});
  
  // final String userName;
  // final String userImage;
  // final String userComment;
  // final int rating;
  // const Reviews({super.key,
  // required this.userName, 
  // required this.userImage,
  // required this.userComment,
  // required this.rating});

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
            const Icon(Icons.star, color: Colors.amber),
            Text(
              ' 4.8 (4,479 reviews)',
              style: TextStyle(fontSize: 20.sp, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                // Handle "See All" button click
              },
              child: Text(
                'See All',
                style: TextStyle(fontSize: 18.sp, color: Color(0XFF24BAFF)),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6, // One extra tab for "All Reviews"
                itemBuilder: (context, index) {
                  final reversedIndex = 5 - index; // Reversing the index
                  if (reversedIndex == 5) {
                    // Add tab for "All Reviews"
                    return AllReviewsTab(
                      isSelected: _selectedTabIndex == index,
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = index;
                        });
                      },
                    );
                  } else {
                    return StarRatingTab(
                      isSelected: _selectedTabIndex == index,
                      rating: reversedIndex + 1,
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = index;
                        });
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 16.h),
            // Add reviews based on selected tab
            // Here, you can generate reviews based on the selected tab
            // For simplicity, I'll just display some sample reviews
            const ReviewItem(
              reviewerName: 'John Doe',
              rating: 5,
              reviewText:
              'Great course! I learned a lot about Figma and improved my design skills.',
            ),
            const ReviewItem(
              reviewerName: 'Jane Smith',
              rating: 4,
              reviewText:
              'The course content was excellent, but I wish there were more interactive exercises.',
            ),
            const ReviewItem(
              reviewerName: 'David Johnson',
              rating: 3,
              reviewText:
              'Decent course, but some sections were a bit confusing. Could use more explanations.',
            ),
          ],
        ),
      ],
    );
  }
}

class AllReviewsTab extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const AllReviewsTab({
    Key? key,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0.r, vertical: 4.0.r),
        margin: EdgeInsets.only(right: 8.0.r),
        decoration: BoxDecoration(
          color: isSelected ? Color(0XFF24BAFF) : Colors.white,
          borderRadius: BorderRadius.circular(20.0.r),
          border: Border.all(color: Color(0XFF24BAFF), width: 1.5.r), // Blue border
        ),
        child: Text(
          'All Reviews',
          style: TextStyle(
              color: isSelected ? Colors.white : Color(0XFF24BAFF),
              fontSize: 14.sp), // Blue label
        ),
      ),
    );
  }
}

class StarRatingTab extends StatelessWidget {
  final bool isSelected;
  final int rating;
  final VoidCallback onTap;

  const StarRatingTab({
    Key? key,
    required this.isSelected,
    required this.rating,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0.r, vertical: 4.0.r),
        margin: EdgeInsets.only(right: 8.0.r),
        decoration: BoxDecoration(
          color: isSelected ? Color(0XFF24BAFF) : Colors.white,
          borderRadius: BorderRadius.circular(20.0.r),
          border: Border.all(color: Color(0XFF24BAFF), width: 1.5.r), // Blue border
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$rating stars',
              style: TextStyle(
                  color: isSelected ? Colors.white : Color(0XFF24BAFF),
                  fontSize: 14.sp), // Blue label
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  final String reviewerName;
  final int rating;
  final String reviewText;

  const ReviewItem({
    Key? key,
    required this.reviewerName,
    required this.rating,
    required this.reviewText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: const AssetImage(
            'assets/mentor-image.jpg'), // Replace 'assets/mentor_image.jpg' with the actual path to the mentor's image
        radius: 25.r,
      ),
      title: Row(
        children: [
          Text(
            reviewerName,
            style: TextStyle(fontSize: 20.sp, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          RatingWidget(rating: rating),
          SizedBox(width: 5.w),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4.h),
          Text(
            reviewText,
            style: TextStyle(fontSize: 16.sp, color: Colors.black26),
          ),
        ],
      ),
    );
  }
}

class RatingWidget extends StatelessWidget {
  final int rating;

  const RatingWidget({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0.r, vertical: 2.0.r),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue, width: 1.0.r),
        borderRadius: BorderRadius.circular(10.0.r),
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

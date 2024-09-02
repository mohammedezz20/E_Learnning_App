import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/core/utils/widgets/custom_button.dart';
import 'package:e_learning_app/features/Auth/presentation/pages/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoarding extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<onBoarding> {
  int _currentPageIndex = 0;
  final _controller = PageController();

  final List<String> _imagePaths = [
    "assets/vec1.png",
    "assets/vec2.png",
    "assets/vec3.png",
  ];

  final List<String> _descriptions = [
    "We provide the best \n learning courses & \n great mentors !",
    "Learn any time and \n anywhere easily \n and conveniently",
    "Let's improve your \n skills together with \n Elera right now !",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: _imagePaths.length,
              itemBuilder: (context, index) {
                return _buildPage(index);
              },
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _descriptions[_currentPageIndex],
              style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 60.h),
          Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: _imagePaths.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.blue,
                dotColor: Colors.grey.shade300,
                dotHeight: 12.h,
                dotWidth: 12.w,
                spacing: 8.sp,
                expansionFactor: 4,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height/15),
         
          Container(
            padding: EdgeInsets.all(15.0.sp),
            child:CustomButton(
            backgroundColor: AppColor.buttonColor,
            height: 65.h,
            padding: 0,
            width: double.infinity,
            text: 'Next',
           onPressed: (){
                if(_currentPageIndex==_imagePaths.length-1){
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const start(),
                ),
              );
              }
             _nextPage();
           },
           ), ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    return Image.asset(
      _imagePaths[index],
      height: 450,
    );
  }

  void _nextPage() {
    setState(() {
      _currentPageIndex = (_currentPageIndex + 1) % _imagePaths.length;
      _controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
   
    });

  }
}

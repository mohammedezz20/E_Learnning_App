import 'package:flutter/material.dart';
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
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 60),
          Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: _imagePaths.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.blue,
                dotColor: Colors.grey.shade300,
                dotHeight: 12,
                dotWidth: 12,
                spacing: 8,
                expansionFactor: 4,
              ),
            ),
          ),
          SizedBox(height: 60),
          Container(
            width: double.infinity,
            height: 80,
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _nextPage();
              },
              child: Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
          ),
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
      _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}

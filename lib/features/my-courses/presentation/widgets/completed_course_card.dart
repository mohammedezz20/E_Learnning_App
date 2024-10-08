import 'package:e_learning_app/core/utils/extensions/sized_box_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CompletedCourseCard extends StatelessWidget {
  const CompletedCourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: const Color(0xff1f222a),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(2.0, 2.0),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              'assets/3d.jpg',
              width: 140.w,
              height: 110.h,
            ),
          ),
          // CachedNetworkImage(
          //   imageUrl: doctor.imageUrl!,
          //   width: width?.w ?? 95.w,
          //   height: height?.h ?? 120.h,
          //   fit: BoxFit.cover,
          //   progressIndicatorBuilder: (context, url, downloadProgress) =>
          //       Center(
          //     child:
          //         CircularProgressIndicator(value: downloadProgress.progress),
          //   ),
          //   errorWidget: (context, url, error) => const Icon(Icons.error),
          // ),
          16.sizedBoxWidth,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '3D Design Illustration',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                5.sizedBoxHeight,
                Text(
                  '2 hrs 25 mins',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
            child: CircularPercentIndicator(
              radius: 37.r,
              lineWidth: 12,
              percent: 20 / 100,
              animation: true,
              animationDuration: 3000,
              backgroundColor: Colors.white.withOpacity(.02),
              progressColor: Colors.blue,
              center: Text(
                '20%',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

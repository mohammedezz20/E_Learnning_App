import 'package:e_learning_app/core/utils/extensions/sized_box_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonCardWidget extends StatelessWidget {
  const LessonCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: const Color(0xff1f222a),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundColor: const Color(0xff21273b),
            child: Text(
              '01',
              style: TextStyle(color: const Color(0xff335ef7), fontSize: 20.sp),
            ),
          ),
          10.sizedBoxWidth,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Why Using 3D Blender',
                    style: Theme.of(context).textTheme.bodyMedium),
                5.sizedBoxHeight,
                Text(
                  '10 mins',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.white.withOpacity(0.8),
                      ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 15.r,
            backgroundColor: const Color(0xff335ef7),
            child: Icon(
              Icons.play_arrow_rounded,
              color: const Color(0xff1f222a),
              size: 25.r,
            ),
          ),
        ],
      ),
    );
  }
}

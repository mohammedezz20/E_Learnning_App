import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/themes/colors.dart';
import '../../../../../../core/utils/widgets/custom_button.dart';

class CertificateTab extends StatelessWidget {
  const CertificateTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: SizedBox()),
        Container(
          padding: EdgeInsets.only(top: 20.h),
          child: const CustomButton(
              backgroundColor: AppColor.buttonColor,
              width: double.infinity,
              text: 'Download Certificate'),
        ),
      ],
    );
  }
}

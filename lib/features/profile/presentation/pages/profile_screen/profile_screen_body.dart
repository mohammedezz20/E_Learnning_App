import 'package:e_learning_app/core/utils/extensions/sized_box_extensions.dart';
import 'package:e_learning_app/features/profile/presentation/widgets/menu_list.dart';
import 'package:e_learning_app/features/profile/presentation/widgets/pick_profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var pickedImage;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.w),
        child: Column(
          children: [
            const Center(
              child: PickProfilePhoto(),
            ),
            13.h.sizedBoxHeight,
            Text(
              'Andrew Ainsley',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            10.h.sizedBoxHeight,
            Text(
              'andrew_ainsley@yourdomain.com',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            20.h.sizedBoxHeight,
            const Divider(color: Color(0xfff6f6f6), height: 0.5, thickness: 1),
            20.h.sizedBoxHeight,
            const MenuList(),
          ],
        ),
      ),
    );
  }
}

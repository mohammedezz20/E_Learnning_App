import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/features/profile/presentation/cubit/cubit.dart';
import 'package:e_learning_app/features/profile/presentation/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PickProfilePhoto extends StatelessWidget {
  const PickProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ProfileCubit.get(context);
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 60.r,
              backgroundImage: cubit.pickedImage == null
                  ? null
                  : FileImage(cubit.pickedImage!),
              backgroundColor: Colors.grey,
              child: cubit.pickedImage == null
                  ? const Icon(
                      Icons.person,
                      size: 60,
                    )
                  : null,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            cubit.pickImageFromCamera();
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            size: 40,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            cubit.pickImageFromGallery();
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.photo_library_outlined,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                  color: AppColor.newmeetingColor,
                ),
                child: const Icon(
                  FontAwesomeIcons.pencil,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

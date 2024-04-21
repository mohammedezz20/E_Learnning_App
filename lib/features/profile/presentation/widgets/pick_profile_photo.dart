import 'dart:io';

import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/core/utils/widgets/ImageUtil.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PickProfilePhoto extends StatelessWidget {
  const PickProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    var pickedImage;
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: pickedImage == null ? null : FileImage(pickedImage!),
          backgroundColor: Colors.grey,
          child: pickedImage == null
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
                      onPressed: () async {
                        File? temp = await ImageUtil.cameraImage();
                        if (temp != null) {
                          pickedImage = temp;
                        }

                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        size: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        File? temp = await ImageUtil.galleryImage();
                        if (temp != null) {
                          pickedImage = temp;
                        }
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
              )),
        ),
      ],
    );
  }
}

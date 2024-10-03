import 'package:e_learning_app/core/utils/extensions/build_context_extensions.dart';
import 'package:e_learning_app/features/Cources/presentation/pages/message%20instructor/pages/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserViewWidget extends StatelessWidget {
  const UserViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
            children: [
              CircleAvatar(
                backgroundImage: const AssetImage(
                    'assets/mentor-image.jpg'), // Replace 'assets/mentor_image.jpg' with the actual path to the mentor's image
                radius: 25.w,
              ),
              SizedBox(width: context.screenWidth * 0.08),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Doe',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Software Engineer',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.chat_outlined),
                color: Colors.blue,
                onPressed: () {
                    Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context){ 
                         return  ChatScreen();
                         }
                     ),
                   );
                },
              ),
            ],
          );
  }
}
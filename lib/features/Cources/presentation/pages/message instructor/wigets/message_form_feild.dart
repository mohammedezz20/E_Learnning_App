import 'package:e_learning_app/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFeild extends StatelessWidget {
   const TextFormFeild({
       required this.messageController,
       required this.controller,
    super.key});
      final TextEditingController messageController;
      final ScrollController controller;
void scrollDown(){
    controller.jumpTo(1);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
           padding: const EdgeInsets.all(10.0),
           child: SizedBox(
            height: MediaQuery.of(context).size.height/11,
             child: TextField(
               keyboardType: TextInputType.multiline,
               controller: messageController,
               onSubmitted: (data) {},
               decoration: InputDecoration(
                 suffixIcon: IconButton(
                   onPressed: () {
                   messageController.clear();
                 },
                   icon:  Icon(Icons.send,
                     size: 30.sp,
                     color: AppColor.blueColor,),),
                 hintText: 'Send Message',
                 hintStyle:Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 4.5,
                  color: Colors.grey),
                 border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10)
                 ),
               ),
             ),
           ),
         );
  }
}
import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/features/Cources/presentation/pages/message%20instructor/wigets/message_form_feild.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, 
});
  final TextEditingController messageController=TextEditingController();
  final ScrollController _controller = ScrollController();
  void scrollDownUsingArrow(){
    _controller.animateTo
      (
          _controller.position.maxScrollExtent,
          duration: const Duration(seconds: 1),
           curve: Curves.fastEaseInToSlowEaseOut,
    );
  }
  void scrollDown(){
    _controller.jumpTo(1);

  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
       appBar: AppBar(
         leading: IconButton(
           onPressed: () {
             Navigator.pop(context);
           },
           icon: const Icon(Icons.arrow_back_ios,color: AppColor.darkBackgroundColor,),
         ),
         automaticallyImplyLeading: false,
         title:const Text('John Doe',
         style: TextStyle(
           color: AppColor.darkBackgroundColor,
         ),
         ),
         centerTitle: true,
         backgroundColor: AppColor.lightBackgroundColor
         ),
         body: Column(
             children: [
              const Spacer(),
             TextFormFeild(
               messageController:messageController,
               controller:_controller
             )
             ],
           ),
         );
  }
}

import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/core/utils/widgets/CustomFormField.dart';
import 'package:e_learning_app/features/profile/data/models/chat_model.dart';
import 'package:e_learning_app/features/profile/presentation/pages/help_center/ChatItemCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBotScreen extends StatelessWidget {
  String transcriptionText = '';

  ChatBotScreen({super.key, required this.transcriptionText});

  final List<ChatModel> chatList = [];
  List<Map<String, String>> messages = [];
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            chatList.clear();
            messages = [];
            transcriptionText = '';
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ChatItemCard(chatItem: chatList[index]);
              },
              itemCount: chatList.length,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Row(
              children: [
                Expanded(
                  child: CustomFormField(
                    backgroundColor: !CachHelper.getData(key: 'isDark')
                        ? const Color(0xfffafafa)
                        : const Color(0xff1f222a),
                    controller: textController,
                    hintText: 'ask anything...',
                    onTapOutside: (_) {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
                IconButton(
                  onPressed: () async {},
                  icon: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff3a64f8),
                    ),
                    child: const Icon(
                      Icons.send,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}

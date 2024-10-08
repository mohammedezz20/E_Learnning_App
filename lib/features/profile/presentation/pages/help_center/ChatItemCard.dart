import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/features/profile/data/models/chat_model.dart';
import 'package:flutter/material.dart';

class ChatItemCard extends StatefulWidget {
  final ChatModel chatItem;

  const ChatItemCard({
    super.key,
    required this.chatItem,
  });

  @override
  State<ChatItemCard> createState() => _ChatItemCardState();
}

class _ChatItemCardState extends State<ChatItemCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Row(
      mainAxisAlignment: widget.chatItem.chat == 0
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (widget.chatItem.chat == 1)
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.8,
                margin: const EdgeInsets.only(left: 0, right: 10, top: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: widget.chatItem.chatType == ChatType.error
                      ? Colors.red.withOpacity(0.5)
                      : widget.chatItem.chat == 0
                          ? const Color(0xff3f68f9)
                          : CachHelper.getData(key: 'isDark')
                              ? const Color(0xff35383f)
                              : const Color(0xfff5f5f5),
                  borderRadius: widget.chatItem.chatType == ChatType.error
                      ? const BorderRadius.all(Radius.circular(30))
                      : widget.chatItem.chat == 0
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(10),
                            )
                          : const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(10),
                            ),
                ),
                child: Column(
                  crossAxisAlignment: widget.chatItem.chatType == ChatType.error
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    if (widget.chatItem.chatType == ChatType.loading)
                      const SizedBox(
                        height: 50,
                        width: 50,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Color(0xff4068f9),
                          ),
                        ),
                      ),
                    if (widget.chatItem.chatType != ChatType.loading)
                      Text(
                        widget.chatItem.message,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                  ],
                ),
              ),
            ),
          ),
      ],
    ));
  }

  TextSpan formatText(String text) {
    RegExp regex = RegExp(r'\*\*(.*?)\*\*');
    List<TextSpan> spans = [];

    text.splitMapJoin(
      regex,
      onMatch: (Match match) {
        spans.add(TextSpan(
          text: match.group(1),
          style: widget.chatItem.chat == 0
              ? Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white)
              : Theme.of(context).textTheme.titleSmall,
        ));
        return '';
      },
      onNonMatch: (String text) {
        spans.add(TextSpan(text: text));
        return '';
      },
    );
    return TextSpan(children: spans);
  }
}

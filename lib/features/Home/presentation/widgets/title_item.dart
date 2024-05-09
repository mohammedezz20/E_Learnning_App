import 'package:flutter/material.dart';

class TitleItem extends StatelessWidget {
  final String mainText;
  final VoidCallback onpressed;

  const TitleItem({super.key, required this.mainText, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          mainText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black87,
          ),
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.start,
        ),
        const Spacer(),
        TextButton(
          onPressed: onpressed,
          child: const Text(
            'See All',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blue,
            ),
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}

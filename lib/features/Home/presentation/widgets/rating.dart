import 'package:flutter/material.dart';

class BehaviorRatingBar extends StatefulWidget {
  final int maxRating;
  final Function(int) onChanged;

  BehaviorRatingBar({
    Key? key,
    required this.maxRating,
    required this.onChanged,
  }) : super(key: key);

  @override
  _BehaviorRatingBarState createState() => _BehaviorRatingBarState();
}

class _BehaviorRatingBarState extends State<BehaviorRatingBar> {
  int _currentRating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.maxRating, (index) {
        return IconButton(
          icon: Icon(
            index < _currentRating ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
          onPressed: () {
            setState(() {
              _currentRating = index + 1;
              widget.onChanged(_currentRating);
            });
          },
        );
      }),
    );
  }
}

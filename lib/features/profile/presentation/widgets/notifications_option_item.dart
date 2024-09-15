import 'package:flutter/material.dart';

class NotificationsOptionsItem extends StatefulWidget {
  const NotificationsOptionsItem({super.key, required this.title});

  final String title;

  @override
  State<NotificationsOptionsItem> createState() =>
      _NotificationsOptionsItemState();
}

class _NotificationsOptionsItemState extends State<NotificationsOptionsItem> {
  final bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Switch(
        inactiveThumbColor: const Color(0xffffffff),
        activeTrackColor: const Color(0xff335ef7),
        inactiveTrackColor: const Color(0xffeeeeee),
        value: true,
        onChanged: (value) {
          value = isChecked;
          setState(() {});
        },
      ),
    );
  }
}

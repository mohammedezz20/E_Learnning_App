import 'package:flutter/material.dart';

class NotificationsOptionsItem extends StatelessWidget {
  const NotificationsOptionsItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Switch(
        inactiveThumbColor: const Color(0xffffffff),
        activeTrackColor: const Color(0xff335ef7),
        inactiveTrackColor: const Color(0xffeeeeee),
        value: true,
        onChanged: (value) {},
      ),
    );
  }
}

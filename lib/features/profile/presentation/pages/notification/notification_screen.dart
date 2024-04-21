import 'package:e_learning_app/features/profile/presentation/widgets/notifications_option_item.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> notifications = [
      S.of(context).general_notifications,
      S.of(context).sound,
      S.of(context).vibrate,
      S.of(context).special_offers,
      S.of(context).promo_discount,
      S.of(context).payment,
      S.of(context).cashback,
      S.of(context).app_updates,
      S.of(context).new_service_available,
      S.of(context).new_tips_available,
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).notifications),
      ),
      body: Column(
        children: List.generate(notifications.length,
            (index) => NotificationsOptionsItem(title: notifications[index])),
      ),
    );
  }
}

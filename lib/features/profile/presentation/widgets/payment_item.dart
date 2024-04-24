import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.title, required this.icon});

  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: CachHelper.getData(key: 'isDark')
              ? const Color(0xff1f222a)
              : const Color(0xfffafafa),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: icon,
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: Text(
            S.of(context).connected,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: const Color(0xff335ef7)),
          ),
        ),
      ),
    );
  }
}

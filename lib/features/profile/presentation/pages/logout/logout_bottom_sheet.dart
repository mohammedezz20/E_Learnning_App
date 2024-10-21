import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/core/utils/widgets/custom_button.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CachHelper.getData(key: 'isDark')
            ? const Color(0xff1f222a)
            : const Color(0xffffffff),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                color: CachHelper.getData(key: 'isDark')
                    ? const Color(0xff30333a)
                    : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              S.of(context).logout,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: const Color(0xfff75555)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(
                color: Color(0xff30333a),
              ),
            ),
            Text(
              S.of(context).logout_sentence,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: const Color(0xff35383f),
                    text: S.of(context).no_cancel,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      // TODO: Implement logout logic here.
                    },
                    backgroundColor: const Color(0xff335ef7),
                    text: S.of(context).yes_logout,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:e_learning_app/features/profile/presentation/pages/profile_screen/profile_screen_body.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profile),
        elevation: 0,
      ),
      body: const ProfileScreenBody(),
    );
  }
}

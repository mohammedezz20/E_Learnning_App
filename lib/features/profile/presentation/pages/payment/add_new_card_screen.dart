import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/core/utils/widgets/CustomFormField.dart';
import 'package:e_learning_app/core/utils/widgets/custom_button.dart';
import 'package:e_learning_app/features/profile/presentation/pages/payment/card_item.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddNewCardScreen extends StatelessWidget {
  AddNewCardScreen({super.key});

  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).add_new_card),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CardItem(),
              const SizedBox(height: 20),
              Text(S.of(context).card_name,
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 8),
              CustomFormField(
                controller: nameController,
                backgroundColor: !CachHelper.getData(key: 'isDark')
                    ? const Color(0xfffafafa)
                    : const Color(0xff1f222a),
                sizedBoxHeight: 20,
              ),
              Text(S.of(context).card_number,
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 8),
              CustomFormField(
                controller: nameController,
                backgroundColor: !CachHelper.getData(key: 'isDark')
                    ? const Color(0xfffafafa)
                    : const Color(0xff1f222a),
                sizedBoxHeight: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).expiry_date,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 8),
                        CustomFormField(
                          controller: nameController,
                          backgroundColor: !CachHelper.getData(key: 'isDark')
                              ? const Color(0xfffafafa)
                              : const Color(0xff1f222a),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).cvv,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 8),
                        CustomFormField(
                          controller: nameController,
                          backgroundColor: !CachHelper.getData(key: 'isDark')
                              ? const Color(0xfffafafa)
                              : const Color(0xff1f222a),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.145,
              ),
              CustomButton(
                backgroundColor: const Color(0xff335ef7),
                width: double.infinity,
                text: S.of(context).add_new_card,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddNewCardScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

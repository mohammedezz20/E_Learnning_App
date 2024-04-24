import 'package:e_learning_app/core/utils/widgets/custom_button.dart';
import 'package:e_learning_app/features/profile/presentation/pages/payment/add_new_card_screen.dart';
import 'package:e_learning_app/features/profile/presentation/widgets/payment_item.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> payments = [
      {
        'title': 'Paypal',
        'icon': Icons.paypal,
      },
      {
        'title': 'Google Pay',
        'icon': FontAwesomeIcons.google,
      },
      {
        'title': 'Apple Pay',
        'icon': FontAwesomeIcons.apple,
      },
      {
        'title': 'Credit Card',
        'icon': FontAwesomeIcons.creditCard,
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).payment),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: List.generate(
                  payments.length,
                  (index) => PaymentItem(
                    title: payments[index]['title'],
                    icon: Icon(
                      payments[index]['icon'],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
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

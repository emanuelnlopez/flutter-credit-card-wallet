import 'package:credit_card_wallet/src/model/model.dart';
import 'package:credit_card_wallet/src/theme/theme.dart';
import 'package:credit_card_wallet/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardDetailsScreen extends StatelessWidget {
  const CardDetailsScreen({
    required this.card,
    Key? key,
  }) : super(key: key);

  final PaymentCard card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(card.company),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(
          Spacing.medium,
        ),
        child: Column(
          children: [
            PaymentCardWidget(card: card),
          ],
        ),
      ),
    );
  }
}

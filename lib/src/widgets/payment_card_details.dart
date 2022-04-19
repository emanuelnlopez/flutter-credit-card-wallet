import 'package:credit_card_wallet/generated/l10n.dart';
import 'package:credit_card_wallet/src/core/app_constants.dart';
import 'package:credit_card_wallet/src/model/model.dart';
import 'package:credit_card_wallet/src/theme/theme.dart';
import 'package:dart_utils/dart_utils.dart';
import 'package:flutter/material.dart';

class PaymentCardDetails extends StatelessWidget {
  const PaymentCardDetails({
    required this.card,
    Key? key,
  }) : super(key: key);

  final PaymentCard card;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: Spacing.medium,
        right: Spacing.medium,
        top: Spacing.medium,
      ),
      child: Table(
        columnWidths: const <int, TableColumnWidth>{
          0: IntrinsicColumnWidth(),
          1: IntrinsicColumnWidth(),
          2: FlexColumnWidth(),
        },
        children: [
          TableRow(
            children: [
              Text(
                appLocalizations.cardCompany,
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 1.2,
              ),
              const SizedBox(width: Spacing.medium),
              Text(
                card.company,
                textScaleFactor: 1.2,
              ),
            ],
          ),
          TableRow(
            children: [
              Text(
                appLocalizations.cardNumber,
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 1.2,
              ),
              const SizedBox(width: Spacing.medium),
              Text(
                card.number,
                textScaleFactor: 1.2,
              ),
            ],
          ),
          TableRow(
            children: [
              Text(
                appLocalizations.cardExpirationDate,
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 1.2,
              ),
              const SizedBox(width: Spacing.medium),
              Text(
                DateTimeFormat.format(
                  dateTime: card.expirationDate,
                  format: AppConstants.creditCardExpirationDateFormat,
                )!,
                textScaleFactor: 1.2,
              ),
            ],
          ),
          TableRow(
            children: [
              Text(
                appLocalizations.cardVerificationValue,
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 1.2,
              ),
              const SizedBox(width: Spacing.medium),
              Text(
                card.verificationValue,
                textScaleFactor: 1.2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

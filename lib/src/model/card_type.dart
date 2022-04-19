import 'package:credit_card_wallet/generated/l10n.dart';
import 'package:flutter/widgets.dart';

enum CardType {
  credit,
  debit,
  prepaid,
}

extension CardTypeExtension on CardType {
  String getDescription(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    String result;
    switch (this) {
      case CardType.credit:
        result = appLocalizations.cardTypeCredit;
        break;
      case CardType.debit:
        result = appLocalizations.cardTypeDedit;
        break;
      case CardType.prepaid:
        result = appLocalizations.cardTypePrepaid;
        break;
    }
    return result;
  }
}

import 'package:credit_card_wallet/src/model/model.dart';
import 'package:json_class/json_class.dart';

class PaymentCard extends JsonClass {
  PaymentCard({
    this.color,
    required this.company,
    required this.expirationDate,
    required this.holderName,
    required this.number,
    required this.type,
    required this.verificationValue,
  });

  factory PaymentCard.fromDynamic(Map? map) => PaymentCard(
        color: map![_AttributesKeys.color],
        company: map[_AttributesKeys.company],
        expirationDate: DateTime.fromMillisecondsSinceEpoch(
          JsonClass.parseInt(
            map[_AttributesKeys.expirationDate],
          )!,
        ),
        holderName: map[_AttributesKeys.holderName],
        number: map[_AttributesKeys.number],
        type: CardType.values.byName(map[_AttributesKeys.type]),
        verificationValue: map[_AttributesKeys.verificationValue],
      );

  static const storeName = 'paymentCard';

  final String? color;
  final String company;
  final DateTime expirationDate;
  final String holderName;
  final String number;
  final CardType type;
  final String verificationValue;

  static List<PaymentCard> fromDynamicList(dynamic list) {
    var result = <PaymentCard>[];

    if (list != null) {
      result = [];
      for (dynamic map in list) {
        result.add(
          PaymentCard.fromDynamic(map.value),
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() => {
        _AttributesKeys.color: color,
        _AttributesKeys.company: company,
        _AttributesKeys.expirationDate: expirationDate.millisecondsSinceEpoch,
        _AttributesKeys.holderName: holderName,
        _AttributesKeys.number: number,
        _AttributesKeys.type: type.name,
        _AttributesKeys.verificationValue: verificationValue,
      };
}

abstract class _AttributesKeys {
  static const color = 'color';
  static const company = 'company';
  static const expirationDate = 'expirationDate';
  static const holderName = 'holderName';
  static const number = 'number';
  static const type = 'type';
  static const verificationValue = 'verificationValue';
}

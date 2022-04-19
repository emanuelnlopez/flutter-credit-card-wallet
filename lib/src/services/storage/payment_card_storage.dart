import 'package:credit_card_wallet/src/model/model.dart';

abstract class PaymentCardStorage {
  Future<void> delete(PaymentCard paymentCard);

  Future<List<PaymentCard>> getAll();

  Future<void> store(PaymentCard paymentCard);

  Future<void> update(PaymentCard paymentCard);
}

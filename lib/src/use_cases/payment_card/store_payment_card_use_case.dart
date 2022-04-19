import 'package:credit_card_wallet/src/core/core.dart';
import 'package:credit_card_wallet/src/services/storage/payment_card_storage.dart';
import 'package:dartz/dartz.dart';

class StorePaymentCardUseCase extends UseCase<bool> {
  StorePaymentCardUseCase({
    required PaymentCardStorage paymentCardStorage,
  }) : _paymentCardStorage = paymentCardStorage;

  final PaymentCardStorage _paymentCardStorage;

  @override
  Future<Either<Failure, bool>> execute({
    required Map<String, dynamic> arguments,
  }) async {
    final card = arguments[StorePaymentCardUseCaseAttributesKeys.card];
    await _paymentCardStorage.store(card);
    return Right(true);
  }
}

abstract class StorePaymentCardUseCaseAttributesKeys {
  static const card = 'card';
}

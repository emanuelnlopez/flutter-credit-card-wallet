import 'package:credit_card_wallet/src/core/core.dart';
import 'package:credit_card_wallet/src/model/model.dart';
import 'package:credit_card_wallet/src/services/storage/payment_card_storage.dart';
import 'package:dartz/dartz.dart';

class ListPaymentCardUseCase extends UseCase<List<PaymentCard>> {
  ListPaymentCardUseCase({
    required PaymentCardStorage paymentCardStorage,
  }) : _paymentCardStorage = paymentCardStorage;

  final PaymentCardStorage _paymentCardStorage;

  @override
  Future<Either<Failure, List<PaymentCard>>> execute({
    required Map<String, dynamic> arguments,
  }) async {
    final result = await _paymentCardStorage.getAll();
    return Right(result);
  }
}

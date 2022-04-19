import 'package:credit_card_wallet/src/core/core.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Success> {
  Future<Either<Failure, Success>> execute({
    required Map<String, dynamic> arguments,
  });
}

import 'package:credit_card_wallet/src/core/core.dart';
import 'package:dartz/dartz.dart';

abstract class Encryptor {
  Either<Failure, String?> encrypt(
    String? data,
  );
}

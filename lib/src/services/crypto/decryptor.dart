import 'package:credit_card_wallet/src/core/core.dart';
import 'package:dartz/dartz.dart';

abstract class Decryptor {
  Either<Failure, String?> decrypt({
    required String? base64Encrypted,
  });
}

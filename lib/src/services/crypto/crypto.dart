import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:credit_card_wallet/src/core/core.dart';
import 'package:credit_card_wallet/src/services/crypto/decryptor.dart';
import 'package:credit_card_wallet/src/services/crypto/encryptor.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:pointycastle/pointycastle.dart';

@immutable
class Crypto implements Decryptor, Encryptor {
  Crypto({
    required String base64Key,
  })  : _cipher = PaddedBlockCipher('AES/CBC/PKCS7'),
        _key = base64.decode(base64Key);

  static final Logger _logger = Logger('Crypto');

  final BlockCipher _cipher;
  final Uint8List _key;
  final Random _random = Random.secure();

  @override
  Either<Failure, String?> decrypt({
    required String? base64Encrypted,
  }) {
    var result = base64Encrypted;
    try {
      if (base64Encrypted != null) {
        var pipe = base64Encrypted.indexOf('|');
        if (pipe >= 0) {
          var iv = base64.decode(base64Encrypted.substring(0, pipe));
          _cipher
            ..reset()
            ..init(
              false,
              PaddedBlockCipherParameters(
                ParametersWithIV<KeyParameter>(
                  KeyParameter(_key),
                  iv,
                ),
                null,
              ),
            );
          var cipherText = base64.decode(
            base64Encrypted.substring(pipe + 1),
          );
          final decrypted = _cipher.process(cipherText);
          result = utf8.decode(decrypted);
        }
      }
    } catch (e, stack) {
      _logger.severe('Error when trying to decrypt value', e, stack);
      return Left(
        Failure(description: 'Error when trying to decrypt value'),
      );
    }
    return Right(result);
  }

  @override
  Either<Failure, String?> encrypt(
    String? data, {
    @visibleForTesting String? iv,
  }) {
    String? result;
    if (data != null) {
      var realIv = iv ?? _createIv();
      _cipher
        ..reset()
        ..init(
          true,
          PaddedBlockCipherParameters(
            ParametersWithIV<KeyParameter>(
              KeyParameter(_key),
              base64.decode(realIv),
            ),
            null,
          ),
        );
      var encrypted = base64.encode(
        _cipher.process(
          Uint8List.fromList(
            utf8.encode(data),
          ),
        ),
      );
      result = '$realIv|$encrypted';
    }
    return Right(result);
  }

  String _createIv() {
    var iv = <int>[];
    for (var i = 0; i < 16; i++) {
      iv.add(_random.nextInt(256));
    }
    return base64Encode(iv);
  }
}

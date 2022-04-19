import 'dart:async';
import 'dart:convert';

import 'package:credit_card_wallet/src/features/home/home_view_model.dart';
import 'package:credit_card_wallet/src/model/model.dart';
import 'package:credit_card_wallet/src/services/storage/payment_card_storage.dart';
import 'package:credit_card_wallet/src/services/storage/payment_card_storage_impl.dart';
import 'package:credit_card_wallet/src/use_cases/payment_card/list_payment_card_use_case.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

abstract class Injector {
  HomeViewModel get homeViewModel;

  Stream<bool> get initializationStream;

  Future<void> initialize();

  void dispose();

  bool isInitialized();
}

class DefaultInjector implements Injector {
  final StreamController<bool> _initializationStreamController =
      StreamController<bool>.broadcast();

  late Config _config;
  late Database _database;
  bool _initialized = false;
  late PaymentCardStorage _paymentCardStorage;
  late ListPaymentCardUseCase _listPaymentCardUseCase;

  @override
  HomeViewModel get homeViewModel => HomeViewModel();

  @override
  Stream<bool> get initializationStream =>
      _initializationStreamController.stream;

  @override
  Future<void> initialize() async {
    if (!isInitialized()) {
      final configJson = await rootBundle.loadString(
        Config.path,
      );

      _config = Config.fromMap(
        json.decode(configJson),
      );

      if (_config.blockScreenshots) {
        await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
      }

      final path = join(
        (await getApplicationDocumentsDirectory()).path,
        _config.databaseFileName,
      );
      _database = await databaseFactoryIo.openDatabase(path);

      _paymentCardStorage = PaymentCardStorageImpl(database: _database);
      _listPaymentCardUseCase = ListPaymentCardUseCase(
        paymentCardStorage: _paymentCardStorage,
      );

      _initialized = true;
      _initializationStreamController.add(_initialized);
    }
  }

  @override
  void dispose() {
    _initialized = false;
    _initializationStreamController.add(_initialized);
    _initializationStreamController.close();
  }

  @override
  bool isInitialized() => _initialized;
}

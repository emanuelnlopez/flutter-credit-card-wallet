import 'package:credit_card_wallet/src/model/payment_card.dart';
import 'package:credit_card_wallet/src/services/storage/payment_card_storage.dart';
import 'package:sembast/sembast.dart';

class PaymentCardStorageImpl implements PaymentCardStorage {
  PaymentCardStorageImpl({
    required Database database,
  }) : _database = database;

  final Database _database;
  final _paymentCardStore = stringMapStoreFactory.store(
    PaymentCard.storeName,
  );
  @override
  Future<void> delete(PaymentCard paymentCard) async {
    await _database.transaction(
      (txn) async {
        await _paymentCardStore.delete(
          txn,
          finder: Finder(
            filter: Filter.equals(
              'number',
              paymentCard.number,
            ),
          ),
        );
      },
    );
  }

  @override
  Future<List<PaymentCard>> getAll() async {
    var snapshot = await _paymentCardStore.find(
      _database,
    );

    return PaymentCard.fromDynamicList(snapshot);
  }

  @override
  Future<void> store(PaymentCard paymentCard) async {
    await _database.transaction((txn) async {
      await _paymentCardStore.add(
        txn,
        paymentCard.toJson(),
      );
    });
  }

  @override
  Future<void> update(PaymentCard paymentCard) async {
    await _database.transaction(
      (transaction) async {
        await _paymentCardStore.update(
          transaction,
          paymentCard.toJson(),
          finder: Finder(
            filter: Filter.equals(
              'number',
              paymentCard.number,
            ),
          ),
        );
      },
    );
  }
}

import 'package:credit_card_wallet/src/core/core.dart';
import 'package:credit_card_wallet/src/model/model.dart';
import 'package:credit_card_wallet/src/use_cases/use_cases.dart';

enum CardFormViewState {
  completed,
  error,
  initial,
  loading,
}

class CardFormViewModel extends ViewModel<CardFormViewState> {
  CardFormViewModel({
    required StorePaymentCardUseCase storePaymentCardUseCase,
  })  : _storePaymentCardUseCase = storePaymentCardUseCase,
        super(CardFormViewState.initial);

  final StorePaymentCardUseCase _storePaymentCardUseCase;

  void createCard(PaymentCard card) async {
    final result = await _storePaymentCardUseCase.execute(arguments: {
      StorePaymentCardUseCaseAttributesKeys.card: card,
    });

    result.fold(
      (failure) => setState(
        CardFormViewState.error,
        description: failure.description,
      ),
      (success) => setState(CardFormViewState.completed),
    );
  }
}

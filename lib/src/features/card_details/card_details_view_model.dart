import 'package:credit_card_wallet/src/core/core.dart';

enum CardDetailsViewState {
  completed,
  error,
  initial,
  loading,
}

class CardDetailsViewModel extends ViewModel<CardDetailsViewState> {
  CardDetailsViewModel() : super(CardDetailsViewState.initial);
}

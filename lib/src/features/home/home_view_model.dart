import 'package:credit_card_wallet/src/core/core.dart';
import 'package:credit_card_wallet/src/model/model.dart';

enum HomeViewState {
  completed,
  error,
  initial,
  loading,
}

enum HomeListType {
  cards,
  list,
}

class HomeViewModel extends ViewModel<HomeViewState> {
  HomeViewModel() : super(HomeViewState.initial);

  List<PaymentCard>? _cards;

  HomeListType _listType = HomeListType.list;

  List<PaymentCard>? get cards => _cards;

  HomeListType get listType => _listType;

  void getCards() async {
    setState(HomeViewState.loading);
    await Future.delayed(Duration(seconds: 3));
    _cards = [
      PaymentCard(
        company: 'Lemon Cash',
        expirationDate: DateTime.now(),
        holderName: 'Emanuel N. López',
        number: 'XXXX XXXX XXXX 1234',
        type: CardType.prepaid,
        verificationValue: 'XXX',
      ),
      PaymentCard(
        company: 'Belo',
        expirationDate: DateTime.now(),
        holderName: 'Emanuel N. López',
        number: 'XXXX XXXX XXXX 4567',
        type: CardType.prepaid,
        verificationValue: 'XXX',
      ),
      PaymentCard(
        company: 'Brubank',
        expirationDate: DateTime.now(),
        holderName: 'Emanuel N. López',
        number: 'XXXX XXXX XXXX 7890',
        type: CardType.debit,
        verificationValue: 'XXX',
      ),
    ];
    setState(HomeViewState.completed);
  }

  void switchListType() {
    _listType =
        listType == HomeListType.cards ? HomeListType.list : HomeListType.cards;

    setState(HomeViewState.completed);
  }
}

import 'package:credit_card_wallet/generated/l10n.dart';
import 'package:credit_card_wallet/src/core/core.dart';
import 'package:credit_card_wallet/src/features/home/home_view_model.dart';
import 'package:credit_card_wallet/src/model/payment_card.dart';
import 'package:credit_card_wallet/src/theme/theme.dart';
import 'package:credit_card_wallet/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel _homeViewModel;

  @override
  void initState() {
    super.initState();
    _homeViewModel = context.read<Injector>().homeViewModel;

    SchedulerBinding.instance!.addPostFrameCallback(
      (_) => _homeViewModel.getCards(),
    );
  }

  Widget _buildItem(
    BuildContext context, {
    required PaymentCard card,
    required HomeListType listType,
  }) {
    return listType == HomeListType.cards
        ? PaymentCardWidget(
            card: card,
            onTap: () => Navigator.of(context).pushNamed(
              NamedRoute.cardDetails,
              arguments: {
                'card': card,
              },
            ),
          )
        : ListTile(
            title: Text(card.company),
            subtitle: Text(card.type.name),
            onTap: () => _showCardDetails(context, card: card),
          );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => _homeViewModel,
      child: Consumer<HomeViewModel>(
        builder: (context, value, _) {
          Widget body;

          if (value.state == HomeViewState.completed) {
            body = SingleChildScrollView(
              padding: const EdgeInsets.all(
                Spacing.medium,
              ),
              child: Column(
                children: value.cards!
                    .map(
                      (card) => _buildItem(
                        context,
                        card: card,
                        listType: value.listType,
                      ),
                    )
                    .toList(),
              ),
            );
          } else {
            body = LoadingScreen(
              message: value.description,
            );
          }

          return Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    value.listType == HomeListType.list
                        ? Icons.credit_card
                        : Icons.list,
                    color: Colors.white,
                  ),
                  onPressed: () => _homeViewModel.switchListType(),
                )
              ],
              title: Text(AppLocalizations.of(context).appName),
            ),
            body: body,
            floatingActionButton: FloatingActionButton(
              elevation: Spacing.small,
              onPressed: () =>
                  Navigator.of(context).pushNamed(NamedRoute.cardForm),
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }

  void _showCardDetails(
    BuildContext context, {
    required PaymentCard card,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: PaymentCardDetails(card: card),
      ),
    );
  }
}

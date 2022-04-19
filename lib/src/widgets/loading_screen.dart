import 'package:credit_card_wallet/generated/l10n.dart';
import 'package:credit_card_wallet/src/theme/theme.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key? key,
    this.message,
  }) : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(
            Spacing.medium,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                const SizedBox(
                  height: Spacing.xlarge,
                ),
                Text(message ?? appLocalizations.loading),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

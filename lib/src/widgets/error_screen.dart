import 'package:credit_card_wallet/generated/l10n.dart';
import 'package:credit_card_wallet/src/theme/theme.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    this.buttonText,
    Key? key,
    this.message,
    this.onPressed,
    this.title,
  }) : super(key: key);

  final String? buttonText;
  final String? message;
  final VoidCallback? onPressed;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
          Spacing.medium,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error,
                color: AppColors.errorColor,
                size: IconSize.medium * 2,
              ),
              const SizedBox(
                height: Spacing.xlarge,
              ),
              Text(
                title ?? appLocalizations.errorTitle,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: Spacing.xlarge,
              ),
              Text(
                message ?? appLocalizations.errorMessage,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              if (buttonText?.isNotEmpty == true && onPressed != null) ...[
                const SizedBox(
                  height: Spacing.xlarge,
                ),
                ElevatedButton(
                  onPressed: onPressed,
                  child: Text(buttonText!),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

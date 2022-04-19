import 'package:credit_card_wallet/generated/l10n.dart';
import 'package:credit_card_wallet/src/core/core.dart';
import 'package:credit_card_wallet/src/features/card_form/card_form_view_model.dart';
import 'package:credit_card_wallet/src/model/model.dart';
import 'package:credit_card_wallet/src/theme/theme.dart';
import 'package:dart_utils/dart_utils.dart';
import 'package:flutter/material.dart';

class CardFormScreen extends StatefulWidget {
  const CardFormScreen({
    this.cardNumber,
    Key? key,
  }) : super(key: key);

  final String? cardNumber;

  @override
  State<CardFormScreen> createState() => _CardFormScreenState();
}

class _CardFormScreenState extends State<CardFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cardCompanyController = TextEditingController();
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cardExpirationDateController =
      TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardVerificationValueController =
      TextEditingController();

  PaymentCard? card;
  late CardFormViewModel _cardFormViewModel;
  CardType? _cardType;

  @override
  void initState() {
    super.initState();
    if (widget.cardNumber?.isNotEmpty != true) {
      // card = PaymentCard.empty();
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(card?.company ?? appLocalizations.newCard),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(
          Spacing.medium,
        ),
        child: Column(
          children: [
            // PaymentCardWidget(card: card),
            const SizedBox(height: Spacing.medium),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: _cardCompanyController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: Spacing.small,
                              vertical: Spacing.medium,
                            ),
                            hintText: appLocalizations.cardCompanyHint,
                            labelText: appLocalizations.cardCompany,
                          ),
                          validator: (value) {
                            String? result;
                            if (value?.isNotEmpty != true) {
                              result = appLocalizations.requiredValue;
                            }
                            return result;
                          },
                        ),
                      ),
                      const SizedBox(width: Spacing.medium),
                      Expanded(
                        flex: 1,
                        child: DropdownButtonFormField<CardType>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: Spacing.small,
                              vertical: Spacing.medium,
                            ),
                            hintText: appLocalizations.typeHint,
                            labelText: appLocalizations.type,
                          ),
                          items: CardType.values
                              .map((item) => DropdownMenuItem<CardType>(
                                    value: item,
                                    child: Text(item.getDescription(context)),
                                  ))
                              .toList(growable: false),
                          onChanged: (newValue) => _cardType = newValue,
                          validator: (value) {
                            String? result;
                            if (value == null) {
                              result = appLocalizations.requiredValue;
                            }
                            return result;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Spacing.medium),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: _cardHolderNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: Spacing.small,
                              vertical: Spacing.medium,
                            ),
                            hintText: appLocalizations.cardHolderNameHint,
                            labelText: appLocalizations.cardHolderName,
                          ),
                          validator: (value) {
                            String? result;
                            if (value?.isNotEmpty != true) {
                              result = appLocalizations.requiredValue;
                            }
                            return result;
                          },
                        ),
                      ),
                      const SizedBox(width: Spacing.medium),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: _cardExpirationDateController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: Spacing.small,
                              vertical: Spacing.medium,
                            ),
                            hintText: appLocalizations.cardExpirationDateHint,
                            labelText: appLocalizations.cardExpirationDate,
                          ),
                          validator: (value) {
                            String? result;
                            if (value?.isNotEmpty != true) {
                              result = appLocalizations.requiredValue;
                            }
                            return result;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Spacing.medium),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: _cardNumberController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: Spacing.small,
                              vertical: Spacing.medium,
                            ),
                            hintText: appLocalizations.cardNumberHint,
                            labelText: appLocalizations.cardNumber,
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            String? result;
                            if (value?.isNotEmpty != true) {
                              result = appLocalizations.requiredValue;
                            }
                            return result;
                          },
                        ),
                      ),
                      const SizedBox(width: Spacing.medium),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: _cardVerificationValueController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: Spacing.small,
                              vertical: Spacing.medium,
                            ),
                            hintText:
                                appLocalizations.cardVerificationValueHint,
                            labelText: appLocalizations.cardVerificationValue,
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            String? result;
                            if (value?.isNotEmpty != true) {
                              result = appLocalizations.requiredValue;
                            }
                            return result;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Spacing.medium),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        debugPrint(_cardNumberController.text);
                        _cardFormViewModel.createCard(
                          PaymentCard(
                            company: _cardCompanyController.text,
                            expirationDate: DateTimeFormat.parse(
                              dateTime: _cardExpirationDateController.text,
                              format:
                                  AppConstants.creditCardExpirationDateFormat,
                            )!,
                            holderName: _cardHolderNameController.text,
                            number: _cardNumberController.text,
                            type: _cardType!,
                            verificationValue:
                                _cardVerificationValueController.text,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                        double.infinity,
                        Spacing.large * 2,
                      ),
                    ),
                    child: Text(appLocalizations.save),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

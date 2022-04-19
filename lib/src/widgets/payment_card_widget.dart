import 'dart:math';

import 'package:credit_card_wallet/src/core/core.dart';
import 'package:credit_card_wallet/src/model/model.dart';
import 'package:credit_card_wallet/src/theme/theme.dart';
import 'package:dart_utils/dart_utils.dart';
import 'package:flutter/material.dart';

class PaymentCardWidget extends StatefulWidget {
  const PaymentCardWidget({
    required this.card,
    Key? key,
    this.onTap,
  }) : super(key: key);

  final PaymentCard card;
  final VoidCallback? onTap;

  @override
  State<PaymentCardWidget> createState() => _PaymentCardWidgetState();
}

class _PaymentCardWidgetState extends State<PaymentCardWidget> {
  bool _isFront = true;

  Widget _transitionBuilder(Widget child, Animation<double> animation) {
    final rotate = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotate,
      child: child,
      builder: (context, child) {
        final angle = (ValueKey(_isFront) != widget.key)
            ? min(rotate.value, pi / 2)
            : rotate.value;
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(angle),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Spacing.xsmall,
      ),
      child: AspectRatio(
        aspectRatio: 16.0 / 9.0,
        child: GestureDetector(
          onTap: widget.onTap,
          onLongPress: () => setState(() => _isFront = !_isFront),
          child: Hero(
            tag: widget.card.number,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              switchInCurve: Curves.easeInBack,
              switchOutCurve: Curves.easeInBack.flipped,
              transitionBuilder: _transitionBuilder,
              child: _isFront
                  ? PaymentCardFront(card: widget.card)
                  : PaymentCardBack(card: widget.card),
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentCardFront extends StatelessWidget {
  const PaymentCardFront({
    required this.card,
    Key? key,
  }) : super(key: key);

  final PaymentCard card;

  @override
  Widget build(BuildContext context) => Card(
        clipBehavior: Clip.antiAlias,
        elevation: Spacing.small,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Spacing.xsmall * 3,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: AppColors.randomGradient,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.medium,
            vertical: Spacing.xlarge,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(card.company.toUpperCase()),
                  Text(
                    card.type.name,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: Spacing.large * 2,
              ),
              Text(card.number),
              const SizedBox(
                height: Spacing.medium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(card.holderName.toUpperCase()),
                  Text(
                    DateTimeFormat.format(
                      dateTime: card.expirationDate,
                      format: AppConstants.creditCardExpirationDateFormat,
                    )!,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

class PaymentCardBack extends StatelessWidget {
  const PaymentCardBack({
    required this.card,
    Key? key,
  }) : super(key: key);

  final PaymentCard card;

  @override
  Widget build(BuildContext context) => Card(
        clipBehavior: Clip.antiAlias,
        elevation: Spacing.small,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Spacing.xsmall * 3,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: AppColors.randomGradient,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: Spacing.xlarge,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                color: Colors.grey,
                height: Spacing.large,
              ),
              Text(card.verificationValue),
            ],
          ),
        ),
      );
}

import 'package:credit_card_wallet/src/core/core.dart';
import 'package:credit_card_wallet/src/features/card_details/card_details_screen.dart';
import 'package:credit_card_wallet/src/features/card_form/card_form_screen.dart';
import 'package:credit_card_wallet/src/features/home/home_screen.dart';
import 'package:credit_card_wallet/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static RouteFactory get generatedRoutes => (RouteSettings settings) {
        ModalRoute? route;

        var argumentsMap = settings.arguments as Map<String, dynamic>?;

        switch (settings.name) {
          case NamedRoute.home:
            route = MaterialPageRoute(
              builder: (_) => const HomeScreen(),
              settings: RouteSettings(
                name: settings.name,
              ),
            );
            break;
          case NamedRoute.cardDetails:
            route = MaterialPageRoute(
              builder: (_) => CardDetailsScreen(
                card: argumentsMap?['card'],
              ),
              settings: RouteSettings(
                name: settings.name,
              ),
            );
            break;
          case NamedRoute.cardForm:
            route = MaterialPageRoute(
              builder: (_) => CardFormScreen(
                cardNumber: argumentsMap?['cardNumber'],
              ),
              settings: RouteSettings(
                name: settings.name,
              ),
            );
            break;
          case NamedRoute.error:
          default:
            route = MaterialPageRoute(
              builder: (_) => const ErrorScreen(),
              settings: RouteSettings(name: settings.name),
            );
            break;
        }

        return route;
      };
}

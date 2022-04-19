// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("My Cards"),
        "cardCompany": MessageLookupByLibrary.simpleMessage("Company"),
        "cardCompanyHint": MessageLookupByLibrary.simpleMessage("Acme"),
        "cardExpirationDate": MessageLookupByLibrary.simpleMessage("Expiry"),
        "cardExpirationDateHint": MessageLookupByLibrary.simpleMessage("MM/YY"),
        "cardHolderName":
            MessageLookupByLibrary.simpleMessage("Cardholder Name"),
        "cardHolderNameHint": MessageLookupByLibrary.simpleMessage("John Doe"),
        "cardNumber": MessageLookupByLibrary.simpleMessage("Card Number"),
        "cardNumberHint":
            MessageLookupByLibrary.simpleMessage("XXXX XXXX XXXX XXXX"),
        "cardTypeCredit": MessageLookupByLibrary.simpleMessage("Credit"),
        "cardTypeDedit": MessageLookupByLibrary.simpleMessage("Debit"),
        "cardTypePrepaid": MessageLookupByLibrary.simpleMessage("Prepaid"),
        "cardVerificationValue": MessageLookupByLibrary.simpleMessage("CVV"),
        "cardVerificationValueHint":
            MessageLookupByLibrary.simpleMessage("XXX"),
        "errorMessage": MessageLookupByLibrary.simpleMessage(
            "Something wrong happened. Please try again later."),
        "errorTitle":
            MessageLookupByLibrary.simpleMessage("Oops! something went wrong"),
        "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
        "newCard": MessageLookupByLibrary.simpleMessage("New card"),
        "requiredValue": MessageLookupByLibrary.simpleMessage("Required value"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "type": MessageLookupByLibrary.simpleMessage("Type"),
        "typeHint":
            MessageLookupByLibrary.simpleMessage("Debit, Credit or Prepaid")
      };
}

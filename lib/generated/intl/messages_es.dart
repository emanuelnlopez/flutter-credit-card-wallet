// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("My Cards"),
        "cardCompany": MessageLookupByLibrary.simpleMessage("Compañía"),
        "cardCompanyHint": MessageLookupByLibrary.simpleMessage("Acme"),
        "cardExpirationDate":
            MessageLookupByLibrary.simpleMessage("Vencimiento"),
        "cardExpirationDateHint": MessageLookupByLibrary.simpleMessage("MM/AA"),
        "cardHolderName":
            MessageLookupByLibrary.simpleMessage("Nombre del Titular"),
        "cardHolderNameHint": MessageLookupByLibrary.simpleMessage("John Doe"),
        "cardNumber": MessageLookupByLibrary.simpleMessage("Número de Tarjeta"),
        "cardNumberHint":
            MessageLookupByLibrary.simpleMessage("XXXX XXXX XXXX XXXX"),
        "cardTypeCredit": MessageLookupByLibrary.simpleMessage("Crédito"),
        "cardTypeDedit": MessageLookupByLibrary.simpleMessage("Débito"),
        "cardTypePrepaid": MessageLookupByLibrary.simpleMessage("Prepaga"),
        "cardVerificationValue": MessageLookupByLibrary.simpleMessage("CVV"),
        "cardVerificationValueHint":
            MessageLookupByLibrary.simpleMessage("XXX"),
        "errorMessage": MessageLookupByLibrary.simpleMessage(
            "Algo se rompió. Por favor, inténtelo de nuevo más tarde."),
        "errorTitle":
            MessageLookupByLibrary.simpleMessage("¡Ups! algo salió mal"),
        "loading": MessageLookupByLibrary.simpleMessage("Cargando..."),
        "newCard": MessageLookupByLibrary.simpleMessage("Nueva tarjeta"),
        "requiredValue":
            MessageLookupByLibrary.simpleMessage("Valor requerido"),
        "save": MessageLookupByLibrary.simpleMessage("Guardar"),
        "type": MessageLookupByLibrary.simpleMessage("Tipo"),
        "typeHint":
            MessageLookupByLibrary.simpleMessage("Débito, Crédto o Prepaga")
      };
}

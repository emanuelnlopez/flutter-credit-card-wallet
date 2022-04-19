import 'package:credit_card_wallet/generated/l10n.dart';
import 'package:credit_card_wallet/src/core/core.dart';
import 'package:credit_card_wallet/src/theme/theme.dart';
import 'package:credit_card_wallet/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _localizationsDelegates = <LocalizationsDelegate>[
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  final _supportedLocales = [
    const Locale('en', ''),
    const Locale('es', ''),
  ];

  late Injector _injector;

  @override
  void initState() {
    super.initState();
    _injector = DefaultInjector();
    _injector.initialize();
  }

  @override
  void dispose() {
    _injector.dispose();
    super.dispose();
  }

  Widget _buildApp(
    BuildContext context, {
    required bool initialized,
  }) =>
      MaterialApp(
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: !initialized ? LoadingScreen() : null,
        localizationsDelegates: _localizationsDelegates,
        onGenerateRoute: initialized ? AppRouter.generatedRoutes : null,
        supportedLocales: _supportedLocales,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.system,
        title: 'My Cards',
      );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: _injector.isInitialized(),
      stream: _injector.initializationStream,
      builder: (context, snapshot) {
        Widget result;

        if (snapshot.data == true) {
          result = MultiProvider(
            providers: [
              Provider<Injector>.value(
                value: _injector,
              ),
            ],
            child: _buildApp(
              context,
              initialized: snapshot.data!,
            ),
          );
        } else {
          result = _buildApp(
            context,
            initialized: snapshot.data!,
          );
        }

        return result;
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterapp/generated/app_localizations.dart';
import 'package:flutterapp/router.dart';
import 'package:flutterapp/src/common/GraphQLConfiguration.dart';
import 'package:flutterapp/src/common/theme.dart';
import 'package:flutterapp/src/pages/startup/StartupPage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = AppConceptThemeProvider.get();
     
    return GraphQLProvider(
        child: MaterialApp(
          title: "DEMO",
          theme: themeData,
          onGenerateRoute: generateRoute,
          supportedLocales: [Locale('en', 'US')],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          home: StartupPage(),
        ),
        client: client);
  }
}

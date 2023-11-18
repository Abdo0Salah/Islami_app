import 'package:flutter/material.dart';
import 'package:islamic/providers/my_provider.dart';
import 'package:islamic/screens/ahadeth_details.dart';
import 'package:islamic/screens/sura_detailes.dart';
import 'package:islamic/screens/home_screen.dart';
import 'package:islamic/theme/my_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<MyProvider>(
    create: (context) => MyProvider(),
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var proider = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
    debugShowCheckedModeBanner: false,
    locale: Locale(proider.language),
    initialRoute: HomeScree.routeName ,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: proider.myTheme,
      routes: {
        HomeScree.routeName: (context) => HomeScree(),
        SuraDetails.routeName: (context) => SuraDetails(),
        AhadethDetails.routeName: (context) => AhadethDetails(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:islamic/screens/ahadeth_details.dart';
import 'package:islamic/screens/sura_detailes.dart';
import 'package:islamic/screens/home_screen.dart';
import 'package:islamic/theme/my_theme.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    initialRoute: HomeScree.routeName ,
      theme: MyTheme.lightTheme,
      routes: {
        HomeScree.routeName: (context) => HomeScree(),
        SuraDetails.routeName: (context) => SuraDetails(),
        AhadethDetails.routeName: (context) => AhadethDetails(),
      },
    );
  }
}

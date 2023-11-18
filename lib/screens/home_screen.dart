import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/my_provider.dart';
import '../tap/ahadeth_tap.dart';
import '../tap/quran_tap.dart';
import '../tap/radio_tap.dart';
import '../tap/sabha_tap.dart';
import '../tap/setting_tap/setting_tap.dart';
import '../theme/my_theme.dart';

class HomeScree extends StatefulWidget {
  static const String routeName = 'home';
  @override
  State<HomeScree> createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScree> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    var proider = Provider.of<MyProvider>(context);

    return Stack(
      children: [
        Image.asset(
            proider.getBackgroundImg( ),
            width: double.infinity,
            fit: BoxFit.fill),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.islame,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/quran.png")),
                  label: AppLocalizations.of(context)!.quran,
                  backgroundColor: proider.myTheme == ThemeMode.dark
                      ? MyTheme.primaryDark
                      : MyTheme.primary),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/hadith.png")),
                  label: AppLocalizations.of(context)!.hadith,
                  backgroundColor: proider.myTheme == ThemeMode.dark
                      ? MyTheme.primaryDark
                      : MyTheme.primary),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/sepha.png")),
                  label: AppLocalizations.of(context)!.sepha,
                  backgroundColor: proider.myTheme == ThemeMode.dark
                      ? MyTheme.primaryDark
                      : MyTheme.primary),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/radio.png")),
                  label: AppLocalizations.of(context)!.radio,
                  backgroundColor: proider.myTheme == ThemeMode.dark
                      ? MyTheme.primaryDark
                      : MyTheme.primary),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.setting,
                  backgroundColor: proider.myTheme == ThemeMode.dark
                      ? MyTheme.primaryDark
                      : MyTheme.primary),
            ],
          ),
          body: tap[index],
        ),
      ],
    );
  }

  List<Widget> tap = [
    QuranTap(),
    AhadethTap(),
    SabhaTap(),
    RadioTap(),
    SettingTap(),
  ];
}

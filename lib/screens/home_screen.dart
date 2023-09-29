import 'package:flutter/material.dart';

import '../tap/ahadeth_tap.dart';
import '../tap/quran_tap.dart';
import '../tap/radio_tap.dart';
import '../tap/sabha_tap.dart';
import '../tap/setting_tap.dart';
import '../theme/my_theme.dart';
class HomeScree extends StatefulWidget {
static const String routeName ='home';

  @override
  State<HomeScree> createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScree> {
int index =0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset("assets/images/img.png",
      width: double.infinity,
      fit: BoxFit.fill),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("eslame",style: Theme.of(context).textTheme.bodyLarge,),
        ),
        bottomNavigationBar:BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            index=value;
            setState(() {

            });
          } ,
          items: [
            BottomNavigationBarItem(icon:ImageIcon(AssetImage("assets/images/quran.png")),
                label:"quran"
                ,backgroundColor: MyTheme.primary),
            BottomNavigationBarItem(icon:ImageIcon(AssetImage("assets/images/hadith.png")),
                label:"hadith" ,
                backgroundColor: MyTheme.primary),
            BottomNavigationBarItem(icon:ImageIcon(AssetImage("assets/images/sepha.png"))
                ,label:"sepha",
             backgroundColor: MyTheme.primary),
            BottomNavigationBarItem(icon:ImageIcon(AssetImage("assets/images/radio.png")),
                label:"radio" ,
                backgroundColor: MyTheme.primary),
            BottomNavigationBarItem(icon:Icon(Icons.settings),label:"settings" ),
          ],
        ) ,
        body: tap[index],
      ),
    ],);
  }
  List<Widget> tap =[
  QuranTap(),
  AhadethTap(),
  SabhaTap(),
  RadioTap(),
  SettingTap(),
];
}

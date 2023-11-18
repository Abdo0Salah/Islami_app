import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/theme/my_theme.dart';
import 'package:provider/provider.dart';
import '../providers/my_provider.dart';
class SabhaTap extends StatefulWidget {
  const SabhaTap({super.key});

  @override
  State<SabhaTap> createState() => _SabhaTapState();
}

class _SabhaTapState extends State<SabhaTap> {

  int counter = 0;
  int x = 0;
  double turn = 0.0;
  List<String> azkar = [
  'سبحان الله',
  'الحمد الله',
  'لا اله الا الله',
  'الله أكبر'
  ];
  @override
  Widget build(BuildContext context) {
    var h =MediaQuery.of(context).size.height;
    var w =MediaQuery.of(context).size.width;
    var provider = Provider.of<MyProvider>(context);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(top: h*0.01,

                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 120
                    ),
                    child: Image.asset(width: w*0.25,

                      provider.myTheme == ThemeMode.light
                          ? 'assets/images/sebha_head.png'
                          : 'assets/images/sebha_head_dark.png',
                    ),
                  ),
                ),
                InkWell(onTap: () =>  tasbehaLogic(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(1, 100, 1, 1),
                    child: AnimatedRotation(
                      turns: turn,
                      duration: const Duration(seconds: 1),
                      child: Image.asset(provider.myTheme == ThemeMode.light
                          ? 'assets/images/sebha_body.png'
                          : 'assets/images/sebha_body_dark.png'),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(1, 10, 1, 1),
              child: Text(
                AppLocalizations.of(context)!.number_of_tasbeha,
                style:TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: provider.myTheme == ThemeMode.light
                        ? const Color(0xff242424)
                        : Colors.white),
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(1, 5, 1, 10),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                decoration: BoxDecoration(
                  color: provider.myTheme == ThemeMode.light
                      ? MyTheme.primary
                      : MyTheme.primaryDark,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  ' $counter ',
                  style: Theme.of(context).textTheme.displaySmall,
                )),
            ElevatedButton(
              onPressed: () {
                tasbehaLogic();
              },
              style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(0.0),
                backgroundColor: MaterialStatePropertyAll(
                    provider.myTheme == ThemeMode.light
                        ? MyTheme.primary
                        : MyTheme.primaryDark),
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.fromLTRB(20, 8, 20, 8)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
              ),
              child: Text(azkar[x],
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff242424))),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
  tasbehaLogic(){if (counter < 33) {
    counter++;
  } else {
    counter = 0;
    if (x < 3) {
      x++;
    } else {
      x = 0;
    }
  }
  setState(() {
    turn += 1 / 32;
  });}
}

import 'package:flutter/material.dart';
import 'package:islamic/models/sura_details_model.dart';
import '../screens/sura_detailes.dart';
import '../sura_names.dart';
import '../theme/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Image(image: AssetImage("assets/images/head_quran.png"))),
        Divider(
          color: MyTheme.primary,
          thickness: 3,
        ),
        Text(AppLocalizations.of(context)!.sura_name, style: Theme.of(context).textTheme.bodyMedium),
        Divider(
          color: MyTheme.primary,
          thickness: 3,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                color: MyTheme.primary,
                thickness: 2,
                endIndent: 20,
                indent: 20,
              );
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SuraDetails.routeName,
                      arguments: SuraModel(
                          index: index, name: SuraNames.suraNames[index]));
                },
                child: Center(child: Text(SuraNames.suraNames[index],
                  style: Theme.of(context).textTheme.bodySmall,)),
              );
            },
            itemCount: SuraNames.suraNames.length,
          ),
        )
      ],
    );
  }
}

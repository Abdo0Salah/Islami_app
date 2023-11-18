import 'package:flutter/material.dart';
import 'package:islamic/tap/setting_tap/theme_shete.dart';
import 'package:islamic/theme/my_theme.dart';
import 'package:provider/provider.dart';
import '../../providers/my_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'language_sheet.dart';
class SettingTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: MyTheme.primary),
                color:pro.myTheme==ThemeMode.light? MyTheme.whiteColor:MyTheme.primaryDark,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(pro.language=='en'?"english"
                      :"Arabic",
                      style: Theme.of(context).textTheme.bodySmall),
                  Spacer(),
                  InkWell(
                    onTap: () => languageSheet(context),
                    child: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      size: 40,
                      color: MyTheme.primary,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            AppLocalizations.of(context)!.mode,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: MyTheme.primary),
                color:pro.myTheme==ThemeMode.light? MyTheme.whiteColor:MyTheme.primaryDark,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(pro.myTheme==ThemeMode.light?"light":"dark",
                      style: Theme.of(context).textTheme.bodySmall),
                  Spacer(),
                  InkWell(
                    onTap: () => themeSheet(context),
                    child: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      size: 40,
                      color: MyTheme.primary,
                    ),
                  )
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
  languageSheet(context){

    showBottomSheet(context: context,
        builder: (context) => LanguageSheet());
  }
  themeSheet(context){

    showBottomSheet(context: context,
        builder: (context) => ThemeSheet());
  }
}

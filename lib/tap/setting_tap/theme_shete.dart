import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../providers/my_provider.dart';
import '../../theme/my_theme.dart';

class ThemeSheet extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () {
            pro.changeTheme(ThemeMode.light);
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.headlineSmall),
                Spacer(),

                Visibility(
                  visible: pro.myTheme==ThemeMode.light,
                  child: Icon(
                    Icons.done_outline_rounded,

                    color: MyTheme.primary,
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(color: MyTheme.primary,
            thickness: 1),
        InkWell(
          onTap: () {
            pro.changeTheme(ThemeMode.dark);
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.dark,
                    style: Theme.of(context).textTheme.headlineSmall),
                Spacer(),
                Visibility(
                  visible: pro.myTheme==ThemeMode.dark,
                  child: Icon(
                    Icons.done_outline_rounded,

                    color: MyTheme.primary,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

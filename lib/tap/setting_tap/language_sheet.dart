import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/my_provider.dart';
import '../../theme/my_theme.dart';

class LanguageSheet extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () {
            pro.changeLanguage('en');
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Text("English",
                    style: Theme.of(context).textTheme.headlineSmall),
                Spacer(),

                Visibility(
                  visible: pro.language=='en',
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
      pro.changeLanguage('ar');
      Navigator.pop(context);
    },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Text("اللغة العربية",
                    style: Theme.of(context).textTheme.headlineSmall),
                Spacer(),
                Visibility(
                  visible:  pro.language=='ar',
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

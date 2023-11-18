import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/hadeth_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../providers/my_provider.dart';
import '../theme/my_theme.dart';
class AhadethDetails extends StatefulWidget {
  static const String routeName = 'ahadeth';
  @override
  State<AhadethDetails> createState() => _DetailsState();
}

class _DetailsState extends State<AhadethDetails> {

  Widget build(BuildContext context) {
    var proider = Provider.of<MyProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  proider.getBackgroundImg( ),
                ),
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title:
            Text(args.head, style: Theme.of(context).textTheme.bodyLarge),
          ),
          body: Card(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    args.body[index],
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: MyTheme.blackColor),
                    textAlign: TextAlign.center,
                  ),
                );
              },
              itemCount:  args.body.length,
            ),
          ),
        ));
  }


}


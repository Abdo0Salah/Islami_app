import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:islamic/theme/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/sura_details_model.dart';
import '../providers/my_provider.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'Details';

  @override
  State<SuraDetails> createState() => _DetailsState();
}

class _DetailsState extends State<SuraDetails> {
  List<String> verses = [];
  Widget build(BuildContext context) {
    var proider = Provider.of<MyProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      getFileData(args.index);
    }
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
                Text(args.name, style: Theme.of(context).textTheme.bodyLarge),
          ),
          body: Card(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                  '${verses[index]}(${index+1})',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: MyTheme.blackColor),
                    textAlign: TextAlign.center,
                  ),
                );
              },
              itemCount: verses.length,
            ),
          ),
        ));
  }

  void getFileData(int index) async {
    String file = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = file.split("\n");
    verses = lines;
    print(verses);
    setState(() {});
  }
}

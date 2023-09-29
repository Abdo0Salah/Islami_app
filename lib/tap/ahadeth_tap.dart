import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/hadeth_model.dart';
import '../models/sura_details_model.dart';
import '../screens/ahadeth_details.dart';
import '../screens/sura_detailes.dart';
import '../sura_names.dart';
import '../theme/my_theme.dart';

class AhadethTap extends StatefulWidget {
  @override
  State<AhadethTap> createState() => _AhadethTapState();
}

class _AhadethTapState extends State<AhadethTap> {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {

    if(allAhadeth.isEmpty){ getFileData();}
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Image(image: AssetImage("assets/images/head_hadeth.png"))),
        Divider(
          color: MyTheme.primary,
          thickness: 3,
        ),
        Text("Hadeth Name", style: Theme.of(context).textTheme.bodyMedium),
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
              return InkWell( onTap: () {
                Navigator.pushNamed(context, AhadethDetails.routeName,
                    arguments: HadethModel(body: allAhadeth[index].body, head: allAhadeth[index].head));
              },
                child: Center(child: Text(allAhadeth[index].head,
                style: Theme.of(context).textTheme.bodySmall,)),
              );
            },
            itemCount: allAhadeth.length,
          ),
        )
      ],
    );
  }

  getFileData() {
    rootBundle
        .loadString("assets/files/ahadeth/ahadethfile.txt")
        .then((ahadethfile) {
      List<String> ahadeth = ahadethfile.split("#");
      print(ahadeth.length);
      for (int i = 0; i < ahadeth.length; i++) {
        String hadeth = ahadeth[i];
        List<String> Lines = hadeth.trim().split("\n");
        String head = Lines[0];
        Lines.removeAt(0);
        List<String> body = Lines;
        HadethModel hadethmodel = HadethModel(body: body, head: head);
        print(hadethmodel.head);
        allAhadeth.add(hadethmodel) ;
        setState(() {

        });
      }
    }).catchError((e) {
      print(e.toString());
    });
  }
}

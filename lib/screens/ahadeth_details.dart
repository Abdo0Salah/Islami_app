import 'package:flutter/material.dart';
import '../models/hadeth_model.dart';
import '../models/sura_details_model.dart';
class AhadethDetails extends StatefulWidget {
  static const String routeName = 'ahadeth';
  @override
  State<AhadethDetails> createState() => _DetailsState();
}

class _DetailsState extends State<AhadethDetails> {

  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/img.png",
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
                    style: Theme.of(context).textTheme.bodySmall,
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


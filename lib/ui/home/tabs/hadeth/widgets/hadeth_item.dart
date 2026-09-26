import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import 'package:islami_c20/core/resources/routes_manager.dart';
import 'package:islami_c20/model/hadeth_model.dart';

class HadethItem extends StatefulWidget {
  int index;
  HadethItem(this.index);

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  @override
  void initState() {
    super.initState();
    readFile();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(RoutesManager.hadethDetailRouteName,arguments: hadethModel);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorsManager.goldColor
        ),
        child: hadethModel==null
            ?Center(child: CircularProgressIndicator(),)
            :Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 12,
                top: 12
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsManager.hadethLeftCorner),
                      Image.asset(AssetsManager.hadethRightCorner),
                    ],
                  ),
                  Text(hadethModel?.title??"",style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.blackColor
                  ),),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Stack(
                  children: [
                    Column(
                      spacing: 10,
                      children: [
                        Expanded(
                            flex: 4,
                            child: Image.asset(AssetsManager.hadethCardBack,
                              width: double.infinity,
                              fit: BoxFit.fill,)),
                        Expanded(
                          child: Image.asset(AssetsManager.hadethMosque,
                            width: double.infinity,
                            fit: BoxFit.cover,),
                        )
                      ],
                    ),
                    Text(
                      hadethModel?.content??"",
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 13,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.blackColor
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  HadethModel? hadethModel;

  readFile()async{
    String hadethText = await rootBundle.loadString("assets/Hadeeth/h${widget.index+1}.txt");
    List<String> hadethLines = hadethText.split("\n");
    String title = hadethLines[0];
    hadethLines.removeAt(0);
    String content = hadethLines.join(" ");
    setState(() {
      hadethModel = HadethModel(
          title: title,
          content: content,
          number: widget.index+1);
    });
  }
}

import 'package:flutter/material.dart';
import 'package:islami_c20/model/hadeth_model.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/colors_manager.dart';

class HadethDetailsScreen extends StatelessWidget {
  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadethModel hadethModel = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
      backgroundColor: ColorsManager.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Hadith ${hadethModel.number}",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ColorsManager.goldColor
        ),),
        iconTheme: IconThemeData(
            color: ColorsManager.goldColor
        ),
      ),
      /* padding: EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 9
        ),*/
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 9
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(AssetsManager.leftCorner),
                          Image.asset(AssetsManager.rightCorner),
                        ],
                      ),
                      Text(hadethModel.title,style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.goldColor
                      ),),
                    ],
                  ),
                  SizedBox(height: 3,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(hadethModel.content,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 2.5,
                            fontWeight:  FontWeight.w700,
                            fontSize: 20,
                            color: ColorsManager.goldColor
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(AssetsManager.suraMosque)
        ],
      ),
    );
  }
}

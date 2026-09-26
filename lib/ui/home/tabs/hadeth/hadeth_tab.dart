import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import 'package:islami_c20/ui/home/tabs/hadeth/widgets/hadeth_item.dart';

class HadethTab extends StatelessWidget {

  PageController pageController = PageController(
    viewportFraction: 0.8,
  );
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage(AssetsManager.hadethBack),
        )
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            spacing: 30,
            children: [
              Image.asset(AssetsManager.header,width: screenWidth * 0.75,fit: BoxFit.fitWidth,),
              Expanded(
                child: PageView.builder(
                    controller: pageController,
                    itemCount: 50,
                    itemBuilder: (context, index) => HadethItem(index),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

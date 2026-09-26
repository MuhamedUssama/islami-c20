import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import 'package:islami_c20/core/resources/strings_manager.dart';
import 'package:islami_c20/ui/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_c20/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami_c20/ui/home/tabs/radio/radio_tab.dart';
import 'package:islami_c20/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_c20/ui/home/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [QuranTab(),HadethTab(),SebhaTab(),RadioTab(),TimeTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.blackColor,
      bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          indicatorColor: ColorsManager.blackColor.withValues(
            alpha: 0.6
          ),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          labelTextStyle: WidgetStateTextStyle.resolveWith((states){
            return TextStyle(color: ColorsManager.whiteColor,fontWeight: FontWeight.w700,fontSize: 12);
          } ,),
          backgroundColor: ColorsManager.goldColor,
          destinations: [
            NavigationDestination(
                icon: SvgPicture.asset(AssetsManager.quranTab,
                  colorFilter:ColorFilter.mode(ColorsManager.blackColor, BlendMode.srcIn) ,
                ),
                label: StringsManager.quran,
                selectedIcon: SvgPicture.asset(AssetsManager.quranTab,colorFilter:ColorFilter.mode(ColorsManager.whiteColor, BlendMode.srcIn)),
            ),
            NavigationDestination(
                icon: SvgPicture.asset(AssetsManager.hadethTab,
                  colorFilter:ColorFilter.mode(ColorsManager.blackColor, BlendMode.srcIn) ,
                ),
                label: StringsManager.hadith,
                selectedIcon: SvgPicture.asset(AssetsManager.hadethTab,colorFilter:ColorFilter.mode(ColorsManager.whiteColor, BlendMode.srcIn)),
            ),
            NavigationDestination(
                icon: SvgPicture.asset(AssetsManager.sebhaTab,
                  colorFilter:ColorFilter.mode(ColorsManager.blackColor, BlendMode.srcIn) ,
                ),
                label: StringsManager.sebha,
                selectedIcon: SvgPicture.asset(AssetsManager.sebhaTab,colorFilter:ColorFilter.mode(ColorsManager.whiteColor, BlendMode.srcIn)),
            ),
            NavigationDestination(
                icon: SvgPicture.asset(AssetsManager.radioTab,
                  colorFilter:ColorFilter.mode(ColorsManager.blackColor, BlendMode.srcIn) ,
                ),
                label: StringsManager.radio,
                selectedIcon: SvgPicture.asset(AssetsManager.radioTab,colorFilter:ColorFilter.mode(ColorsManager.whiteColor, BlendMode.srcIn)),
            ),
            NavigationDestination(
                icon: SvgPicture.asset(AssetsManager.timeTab,
                  colorFilter:ColorFilter.mode(ColorsManager.blackColor, BlendMode.srcIn) ,
                ),
                label: StringsManager.time,
                selectedIcon: SvgPicture.asset(AssetsManager.timeTab,colorFilter:ColorFilter.mode(ColorsManager.whiteColor, BlendMode.srcIn)),
            ),
          ]
      ),
      body: tabs[selectedIndex],
    );
  }
}

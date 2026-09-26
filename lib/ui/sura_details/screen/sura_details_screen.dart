import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import 'package:islami_c20/model/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  SuraModel? suraModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      suraModel= ModalRoute.of(context)?.settings.arguments as SuraModel;
      readFile(suraModel?.suraNumber??0);
    },);
  }
  @override
  Widget build(BuildContext context) {
      //non blocking
    return Scaffold(
      backgroundColor: ColorsManager.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(suraModel?.suraNameEn??"",style: TextStyle(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsManager.leftCorner),
                      Text(suraModel?.suraNameAr??"",style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.goldColor
                      ),),
                      Image.asset(AssetsManager.rightCorner),
                    ],
                  ),
                  SizedBox(height: 3,),
                  Expanded(
                    child: suraVerses.isEmpty
                        ?Center(child: CircularProgressIndicator(color: ColorsManager.goldColor,))
                        :SingleChildScrollView(
                      child: Text(suraVerses,
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

  int add(int n1 , int n2){
    return n1 + n2;
  }

  String suraVerses = "";

  readFile(int suraNumber)async{
   String suraContent = await rootBundle.loadString("assets/Suras/$suraNumber.txt"); // non blocking code
    List<String> suraLines = suraContent.split("\n");
    for(int i=0;i<suraLines.length;i++){
      suraVerses+=suraLines[i].trim();
      suraVerses+=" (${i+1}) ";
    }
    setState(() {

    });
  }
}

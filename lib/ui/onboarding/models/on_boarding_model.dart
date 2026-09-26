import 'package:islami_c20/core/resources/assets_manager.dart';

class OnBoardingModel {
  final String imagePath;
  final String title;
  final String? body;

  const OnBoardingModel({
    required this.title,
    required this.imagePath,
    this.body,
  });

  static const List<OnBoardingModel> items = [
    OnBoardingModel(
      title: "Welcome To Islmi App",
      imagePath: AssetsManager.onBoarding1,
    ),
    OnBoardingModel(
      title: "Welcome To Islami",
      imagePath: AssetsManager.onBoarding2,
      body: "We Are Very Excited To Have You In Our Community",
    ),
    OnBoardingModel(
      title: "Reading the Quran",
      imagePath: AssetsManager.onBoarding3,
      body: "Read, and your Lord is the Most Generous",
    ),
    OnBoardingModel(
      title: "Bearish",
      imagePath: AssetsManager.onBoarding4,
      body: "Praise the name of your Lord, the Most High",
    ),
    OnBoardingModel(
      title: "Holy Quran Radio",
      imagePath: AssetsManager.onBoarding5,
      body:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
}

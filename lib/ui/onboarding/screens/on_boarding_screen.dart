import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:islami_c20/core/remote/local/prefs_manager.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import 'package:islami_c20/core/resources/routes_manager.dart';
import 'package:islami_c20/ui/onboarding/models/on_boarding_model.dart';
import 'package:islami_c20/ui/onboarding/widgets/on_boarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextClicked() async {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    if (_currentPage == OnBoardingModel.items.length - 1) {
      await PrefsManager.setBool('onboarding', true);

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, RoutesManager.homeRouteName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.blackColor,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              AssetsManager.header,
              width: MediaQuery.sizeOf(context).width * .7,
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (page) => setState(() {
                  _currentPage = page;
                }),
                itemBuilder: (context, index) {
                  final item = OnBoardingModel.items[index];
                  return OnBoardingItem(item: item);
                },
                itemCount: OnBoardingModel.items.length,
              ),
            ),

            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                _currentPage == 0
                    ? const SizedBox(width: 64)
                    : TextButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Text(
                          'Back',
                          style: TextStyle(color: ColorsManager.goldColor),
                        ),
                      ),

                DotsIndicator(
                  dotsCount: OnBoardingModel.items.length,
                  position: _currentPage.toDouble(),
                  decorator: DotsDecorator(
                    activeColor: ColorsManager.goldColor,
                    color: ColorsManager.greyColor,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),

                TextButton(
                  onPressed: _onNextClicked,
                  child: Text(
                    _currentPage == OnBoardingModel.items.length - 1
                        ? 'Finish'
                        : 'Next',
                    style: const TextStyle(color: ColorsManager.goldColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

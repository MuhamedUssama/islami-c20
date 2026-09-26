import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/assets_manager.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  late final double width;
  int _counter = 0;
  final List<String> tasabeh = ['سبحان الله', 'الحمد لله', 'الله اكبر'];
  int _tasabehIndex = 0;

  double _turns = 0;

  void _onSebhaClicked() {
    _counter++;
    _turns += 1 / 30;

    if (_counter == 34) {
      _counter = 0;
      _tasabehIndex++;
      if (_tasabehIndex == tasabeh.length) _tasabehIndex = 0;
    }

    setState(() {});
  }

  @override
  void didChangeDependencies() {
    width = MediaQuery.sizeOf(context).width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.sebhaBack),
          fit: .cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(AssetsManager.header, width: width * .7),
            const SizedBox(height: 8),
            const Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
              style: TextStyle(
                fontSize: 36,
                fontWeight: .bold,
                color: ColorsManager.whiteColor,
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(AssetsManager.sebhaHead, width: width * .36),
            Transform.translate(
              offset: const Offset(0, -8),
              child: GestureDetector(
                onTap: _onSebhaClicked,
                child: Stack(
                  alignment: .center,
                  children: [
                    AnimatedRotation(
                      turns: _turns,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 300),
                      child: Image.asset(
                        AssetsManager.sebhaBody,
                        width: width * .86,
                      ),
                    ),
                    Column(
                      spacing: 8,
                      children: [
                        Text(
                          tasabeh[_tasabehIndex],
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: .bold,
                            color: ColorsManager.whiteColor,
                          ),
                        ),

                        Text(
                          _counter.toString(),
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: .bold,
                            color: ColorsManager.whiteColor,
                          ),
                        ),
                      ],
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
}

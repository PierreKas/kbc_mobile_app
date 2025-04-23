import 'package:flutter/material.dart';
import 'package:kbc/colors/colors.dart';
import 'package:kbc/components/text_content.dart';
import 'package:kbc/components/text_hearder.dart';

class AnimatedMissionContainer extends StatefulWidget {
  const AnimatedMissionContainer({super.key});

  @override
  State<AnimatedMissionContainer> createState() =>
      _AnimatedMissionContainerState();
}

class _AnimatedMissionContainerState extends State<AnimatedMissionContainer> {
  final List<String> missions = [
    'To Bring back the lost with the compassionate heart',
    'To Teach them kingdom mindset',
    'To Transform them to be disciples of JESUS CHRIST',
  ];

  int currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    // Auto-scroll animation
    Future.delayed(const Duration(seconds: 2), () {
      autoScroll();
    });
  }

  void autoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (currentIndex < missions.length - 1) {
        currentIndex++;
        _pageController.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        autoScroll();
      } else {
        currentIndex = 0;
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        autoScroll();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  /**
   Widget _buildContainer({
    required String title,
    required String content,
    Widget? footer,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 12, right: 10),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: MyColors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: MyColors.black.withOpacity(0.3),
              blurRadius:
                  10, //The more I add this value, the more the shadow increase the size outside the container
              offset: const Offset(0,
                  5), //Reduce the power of shadow on the top of the container
            ),
          ],
        ),
        child: Column(
          children: [
            MyTextHeader(
              content: title,
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 4,
              endIndent: 90,
              indent: 90,
              color: MyColors.amber,
            ),
            MyTextContent(content: content),
            Container(
              child: footer,
            )
          ],
        ),
      ),
    );
  } */

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 10),
      child: Container(
        height: 250,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(8),
        //   color: Colors.black,
        // ),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: MyColors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: MyColors.black.withOpacity(0.3),
              blurRadius:
                  10, //The more I add this value, the more the shadow increase the size outside the container
              offset: const Offset(0,
                  5), //Reduce the power of shadow on the top of the container
            ),
          ],
        ),
        child: Column(
          children: [
            const MyTextHeader(content: 'MISSION'),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 4,
              endIndent: 90,
              indent: 90,
              color: MyColors.amber,
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: missions.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: currentIndex == index ? 1.0 : 0.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      child: MyTextContent(content: missions[index]),
                    ),
                  );
                },
              ),
            ),
            // Dots indicator
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: List.generate(
            //     missions.length,
            //     (index) => Container(
            //       margin:
            //           const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            //       width: 8,
            //       height: 8,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: currentIndex == index ? Colors.white : Colors.grey,
            //       ),
            //     ),
            //   ),
            // ),
            //Numbers indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                missions.length,
                (index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index
                        ? MyColors.amber
                        : MyColors.black.withOpacity(0.5),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: currentIndex == index
                            ? MyColors.white
                            : MyColors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

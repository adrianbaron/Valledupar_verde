import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:valledupar_verde_app/main.dart';
import 'package:valledupar_verde_app/src/Base/features/views/home/home_map.dart';
import 'package:valledupar_verde_app/src/Base/features/views/onBoarding/Screens/onboarding_screem_1.dart';
import 'package:valledupar_verde_app/src/Base/features/views/onBoarding/Screens/onboarding_screem_2.dart';
import 'package:valledupar_verde_app/src/Base/features/views/onBoarding/Screens/onboarding_screem_dos.dart';

class OnboardingContainerScreen extends StatefulWidget {
  static const String routeName = '/onboarding_screem_container';
  const OnboardingContainerScreen({super.key});

  @override
  State<OnboardingContainerScreen> createState() =>
      _OnboardingContainerScreenState();
}

class _OnboardingContainerScreenState extends State<OnboardingContainerScreen> {
  final PageController _pageController = PageController();
  bool ultimatePage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              ultimatePage = value == 1;
            });
          },
          children: const [
            OnboardingScreem1(),
            OnboardingScreem2(),
          ],
        ),
        Container(
          alignment: const Alignment(0, 0.90),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 30.w,
                child: TextButton(
                    onPressed: () {
                      _pageController.jumpToPage(1);
                    },
                    child: Text(
                      'Saltar',
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: const Color.fromARGB(255, 63, 192, 67),
                      ),
                    )),
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: 2,
                effect: const ExpandingDotsEffect(
                  dotHeight: 8.0,
                  dotWidth: 8.0,
                  dotColor: Colors.grey, // Color para los puntos inactivos
                  activeDotColor: Color.fromARGB(
                      255, 63, 192, 67), // Color para el punto activo
                ),
              ),
              SizedBox(
                width: 30.w,
                child: ultimatePage == true ? 
                 TextButton(
                    onPressed: () {
                     Navigator.pushReplacementNamed(context, MapPage.routeName);
                     //Navigator.pushReplacementNamed(context, MapPages.routeName);
                    },
                    child: Text(
                      'Listo',
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: const Color.fromARGB(255, 63, 192, 67),
                      ),
                    )):TextButton(
                    onPressed: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: Text(
                      'Siguiente',
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: const Color.fromARGB(255, 63, 192, 67),
                      ),
                    )),
              )
            ],
          ),
        )
      ],
    )));
  }
}

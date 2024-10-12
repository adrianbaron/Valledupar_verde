import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:valledupar_verde_app/src/Base/features/views/home/home_map.dart';
import 'package:valledupar_verde_app/src/Base/features/views/onBoarding/Screens/onboarding_container_screen.dart';
import 'package:valledupar_verde_app/src/Base/features/views/onBoarding/Screens/onboarding_screem_1.dart';
import 'package:valledupar_verde_app/src/Base/features/views/onBoarding/Screens/onboarding_screem_2.dart';
import 'package:valledupar_verde_app/src/Base/features/views/onBoarding/Screens/onboarding_screem_dos.dart';
import 'package:valledupar_verde_app/src/Base/features/views/onBoarding/pre_onboarding_screem.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: PreOnboardingScreem.routeName,
          routes: {
            PreOnboardingScreem.routeName: (context) => const PreOnboardingScreem(),
            OnboardingContainerScreen.routeName: (context) => const OnboardingContainerScreen(),
            OnboardingScreem1.routeName: (context) => const OnboardingScreem1(),
            OnboardingScreem2.routeName: (context) => const OnboardingScreem2(),
            MapPages.routeName: (context) => const MapPages(),
            MapPage.routeName: (context) => const MapPage(),
          },
        );
      },
    );
  }
}

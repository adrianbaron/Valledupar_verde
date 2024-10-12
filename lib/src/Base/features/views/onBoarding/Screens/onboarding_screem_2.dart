import 'package:animate_do/animate_do.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:valledupar_verde_app/src/Base/features/views/home/home_map.dart';
import 'package:valledupar_verde_app/src/Base/features/views/onBoarding/custom/text_custon.dart';

class OnboardingScreem2 extends StatelessWidget {
  static const String routeName = '/onboarding_screem2';
  const OnboardingScreem2({super.key});

  @override
  Widget build(BuildContext context) {
    // Detectamos la orientación del dispositivo usando MediaQuery
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: SizedBox(
              // Ajustamos las dimensiones según la orientación
              width: isPortrait ? 50.w : 70.w, // Ancho ajustado al 50% en vertical y 70% en horizontal
              height: isPortrait ? 30.h : 40.h, // Altura ajustada al 30% en vertical y 40% en horizontal
              child: LottieBuilder.asset("assets/Animation - 1728250545173.json"),
            ),
          ),
          FadeIn(
            delay: const Duration(milliseconds: 2500),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: isPortrait ? 2.h : 1.h),
              child: textNegro(
                '¡Empecemos a explorar!',context
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: isPortrait ? 1.h : 0.5.h),
            child: textVerde(
              '¿Estás listo para conocer un poco más?', context
            ),
          ),
        ],
      ),
      nextScreen: const MapPage(),
      duration: 8000,
      splashIconSize: isPortrait ? 60.h : 40.h, // Ajustamos el tamaño del splash según la orientación
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}

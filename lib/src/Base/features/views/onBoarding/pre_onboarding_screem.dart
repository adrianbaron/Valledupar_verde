import 'package:animate_do/animate_do.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class PreOnboardingScreem extends StatelessWidget {
  static const String routeName = '/pre_onboarding_screem';
  const PreOnboardingScreem({super.key});

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/screen1.svg';
    final Widget svg = SvgPicture.asset(
      assetName,
      semanticsLabel: 'Acme Logo',
    );

    // Detectar la orientación del dispositivo
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: isPortrait ? 10.h : 5.h), // Ajuste en altura según la orientación
              FadeIn(
                duration: const Duration(seconds: 3),
                child: Text(
                  '¡Bienvenido!',
                  style: TextStyle(
                    fontSize: isPortrait ? 25.sp : 18.sp, // Tamaño del texto ajustado
                    color: Colors.green,
                  ),
                ),
              ),
              FadeIn(
                delay: const Duration(milliseconds: 1500),
                duration: const Duration(seconds: 5),
                child: SizedBox(
                  height: isPortrait ? 40.h : 30.h, // Ajuste del tamaño de la imagen
                  width: isPortrait ? 80.w : 60.w,
                  child: svg,
                ),
              ),
              FadeIn(
                delay: const Duration(milliseconds: 2500),
                duration: const Duration(seconds: 3),
                child: Text(
                  'Valledupar Verde',
                  style: TextStyle(
                    fontSize: isPortrait ? 20.sp : 15.sp, // Ajuste de tamaño según la orientación
                    color: const Color.fromARGB(255, 20, 196, 26),
                  ),
                ),
              ),
              SizedBox(height: isPortrait ? 18.h : 12.h), // Ajuste en altura
              FadeIn(
                delay: const Duration(seconds: 4),
                duration: const Duration(seconds: 3),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/onboarding_screem_container');
                  },
                  child: AvatarGlow(
                    glowColor: Colors.green,
                    glowRadiusFactor: 2,
                    startDelay: const Duration(seconds: 3),
                    animate: true,
                    glowCount: 2,
                    duration: const Duration(seconds: 3),
                    child: const SizedBox(
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: isPortrait ? 5.h : 3.h), // Ajuste en altura
              FadeIn(
                delay: const Duration(milliseconds: 4000),
                duration: const Duration(seconds: 3),
                child: Text(
                  'Presione para continuar',
                  style: TextStyle(
                    fontSize: isPortrait ? 17.sp : 13.sp, // Tamaño del texto ajustado
                    color: const Color.fromARGB(255, 94, 224, 98),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

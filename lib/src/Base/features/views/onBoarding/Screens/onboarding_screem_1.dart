import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:valledupar_verde_app/src/Base/features/views/onBoarding/custom/text_custon.dart';

class OnboardingScreem1 extends StatelessWidget {
  static const String routeName = '/onboarding_screem1';
  const OnboardingScreem1({super.key});

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/screen2.svg';
    final Widget svg = SvgPicture.asset(
      assetName,
      semanticsLabel: 'Acme Logo',
    );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 80.h, // Se adapta al 80% de la altura de la pantalla
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.h, // 50% de la altura del dispositivo
                  width: 70.w, // 70% del ancho del dispositivo
                  child: svg,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      textNegro(
                        'Ahora podemos explorar los barrios de la ciudad', context
                        // Tamaño del texto adaptado
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      textNegro(
                        'conocer cada uno de sus ',context
                        
                      ),
                      textVerde(
                        'árboles', context,
                       
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      textNegro(
                        'y cada una de sus '
                        
                      ,context),
                      textVerde(
                        'aves',context
                       
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

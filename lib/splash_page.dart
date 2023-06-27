import 'dart:async';

import 'package:animated_widgets/widgets/scale_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:morse_code_app/values_manager.dart';

import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:sizer/sizer.dart';

import 'assets_manager.dart';
import 'color_manager.dart';
import 'morse_entity.dart';




class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final bool _enabled = true;
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>  const MorseEntity()));
    // '/MyApp'; (context) => const MyApp();
  }
  @override
  void initState() {
    _startDelay();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.panDarkBlue,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child:Shimmer(
            colorOpacity: 0.3,
            child: Center(
              child: ScaleAnimatedWidget.tween(
                enabled: _enabled,
                duration: const Duration(milliseconds: 600),
                scaleDisabled: 0.3,
                scaleEnabled: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const SizedBox(height: AppSize.s40,),
                    Padding(
                      padding: const EdgeInsets.only(left:AppSize.s65,right:AppSize.s65),

                      child: Container(
                        height: 25.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            ImageAssets.splashLogo,
                            scale: 1.4,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSize.s40,),
                    const Text(
                      'Morse Code ',
                      style: TextStyle(
                          fontFamily: 'Trade_Gothic',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 32),
                    ),
                    const SizedBox(height: AppSize.s40,),
                    //Image.asset(ImageAssets.smartChargerLogo,scale: 1.6,),
                    //Image.asset(ImageAssets.mainPageLogo,scale: 1.8,),
                    // Padding(
                    //   padding: const EdgeInsets.only(left:AppSize.s24,right:AppSize.s24 ),
                    //   child: Image.asset(ImageAssets.smartChargerPic,scale: 1.2,),
                    // ),


                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

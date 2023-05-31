import 'package:flutter/material.dart';
import 'package:morse_code_app/morse_entity.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<RelativeRect> _positionAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    final curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _positionAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(0, 200, 0, 0),
      end: RelativeRect.fromLTRB(0, 0, 0, 0),
    ).animate(curvedAnimation);

    _sizeAnimation = Tween<double>(begin: 50.0, end: 100.0).animate(curvedAnimation);

    _animationController.forward();
    _handleSplash();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Stack(
            children: [
              PositionedTransition(
                rect: _positionAnimation,
                child: Center(
                  child: Container(
                    width: _sizeAnimation.value,
                    height: _sizeAnimation.value,
                    decoration: BoxDecoration(

                    ),
                    child: Center(
                      child: Text(
                        "Morse Converter",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _handleSplash() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const MorseEntity();
    }));
  }
}

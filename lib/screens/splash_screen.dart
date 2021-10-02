import 'package:audio_palyer/screens/home_screen.dart';
import 'package:audio_palyer/utils/appstyle.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _StateSplashScreen createState() => _StateSplashScreen();
}

class _StateSplashScreen extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _navigateScreen();
    super.initState();
  }

  _navigateScreen() async {
    await Future.delayed(const Duration(milliseconds: 1300), () {});

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: animation,
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage('assets/radio.png'),
                width: 90,
                height: 90,
                frameBuilder: (BuildContext context, Widget child, int? frame,
                    bool wasSynchronouslyLoaded) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: child,
                  );
                },
              ),
              const Text(
                'Quran Radio',
                style: AppStyle.bodyTitle,
              )
            ],
          ),
        ),
      ),
    );
  }
}

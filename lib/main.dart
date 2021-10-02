import 'package:audio_palyer/screens/splash_screen.dart';
import 'package:audio_palyer/utils/colors.dart';
import 'veiwmodel/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'veiwmodel/audio_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AudioProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => FavoritViewModel(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran Radio',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: const SplashScreen(),
    );
  }
}

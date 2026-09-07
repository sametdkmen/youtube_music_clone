import 'package:flutter/material.dart';
import 'package:youtube_music_clone/features/splash/view/splash_view.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const YoutubeMusicCloneApp());
}

class YoutubeMusicCloneApp extends StatelessWidget {
  const YoutubeMusicCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Music Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        sliderTheme: const SliderThemeData(
            trackHeight: 1,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.00)),
        progressIndicatorTheme:
            ProgressIndicatorThemeData(color: Colors.grey.shade300),
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(backgroundColor: Colors.black),
        bottomAppBarTheme: const BottomAppBarThemeData(color: Colors.black),
      ),
      home: const SplashView(),
    );
  }
}

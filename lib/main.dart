import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_riverpod/screen/main_screen.dart';
import 'package:movie_riverpod/screen/splash_screen.dart';

void main() {
  runApp(
    SplashScreen(
      key: UniqueKey(),
      function: () => runApp(ProviderScope(child: MyApp())),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie APP',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext _ctx) => MianScreen(),
      },
    );
  }
}

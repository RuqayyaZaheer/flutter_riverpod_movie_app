import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_riverpod/services/movie_service.dart';
import '../models/app_config.dart';
import '../services/http_service.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback function;
  const SplashScreen({Key? key, required this.function}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1))
        .then((_) => _setup(context).then((value) => widget.function()));
  }

  Future<void> _setup(BuildContext _context) async {
    final getIt = GetIt.instance;

    final configFile = await rootBundle.loadString("assets/config/main.json");

    final configData = jsonDecode(configFile);

    getIt.registerSingleton<AppConfig>(AppConfig(
        API_KEY: configData["API_KEY"],
        BASE_API_URL: configData["BASE_API_URL"],
        BASE_IMAGE_API_URL: configData["BASE_IMAGE_API_URL"]));
    getIt.registerSingleton<HTTPService>(
      HTTPService(),
    );
    getIt.registerSingleton<MovieService>(
      MovieService(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/logo.png"), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

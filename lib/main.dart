import 'package:bhagvadgita/providers/theme_provider.dart';
import 'package:bhagvadgita/views/screens/homepage.dart';
import 'package:bhagvadgita/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark(),
          themeMode:
              Provider.of<ThemeProvider>(context, listen: true).isdark == false
                  ? ThemeMode.light
                  : ThemeMode.dark,
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            'home': (context) => Homepage()
          },
        );
      },
    );
  }
}

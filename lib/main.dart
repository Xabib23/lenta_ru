import 'package:flutter/material.dart';
import 'package:news_app/domain/providers/app_provider.dart';
import 'package:news_app/domain/providers/theme_provider.dart';
import 'package:news_app/ui/app.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(
    Builder(
      builder: (context) {
        return MultiProvider(
          providers: <ChangeNotifierProvider>[
            ChangeNotifierProvider<ThemeProvider>(
              create: (context) => ThemeProvider(),
            ),
            ChangeNotifierProvider<AppProvider>(
              create: (context) => AppProvider(),
            )
          ],
          child: const MyApp(),
        );
      },
    ),
  );
}

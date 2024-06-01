import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/domain/providers/theme_provider.dart';
import 'package:news_app/domain/router/navigator.dart';

import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ThemeProvider>(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        noAppBar: true,
        systemNavBarStyle: FlexSystemNavBarStyle.transparent,
      ),
      child: MaterialApp(
        routes: AppNavigator.routes,
        initialRoute: AppNavigator.initialPage,
        theme: model.currentTheme,
      ),
    );
  }
}

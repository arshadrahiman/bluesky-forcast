import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtree_forcast/config/router/router.dart';
import 'package:webtree_forcast/config/router/router_constants.dart';
import 'package:webtree_forcast/config/themes.dart';
import 'package:webtree_forcast/view-model/theme_provider.dart';
import 'package:webtree_forcast/view-model/weather_provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ListenableProvider<WeatherProvider>(
            create: (_) => WeatherProvider(),
          ),
          ListenableProvider<ThemeProvider>(
            create: (_) => ThemeProvider(),
          ),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          title: 'Webtree Forecast',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeNotifier.themMode,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppNamedRoute.homeRoute,
        );
      },
    );
  }
}

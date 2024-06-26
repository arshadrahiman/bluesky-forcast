import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:webtree_forcast/config/router/router_constants.dart';
import 'package:webtree_forcast/view-model/weather_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isVisible = false;

  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 800))
        .then((value) => setState(() {
              isVisible = true;
            }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, value, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (value.getLoading == false) {
            ScaffoldMessenger.of(context).clearSnackBars();
            Future.delayed(const Duration(milliseconds: 1500)).then((_) {
              Navigator.of(context)
                  .pushReplacementNamed(AppNamedRoute.homeRoute);
            });
          } else {
            Future.delayed(const Duration(seconds: 10)).then((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Connection Lost",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  backgroundColor: Colors.red[400],
                  dismissDirection: DismissDirection.horizontal,
                  duration: const Duration(seconds: 3),
                  action: SnackBarAction(
                    label: "Retry",
                    textColor: Colors.white,
                    disabledTextColor: Colors.amber,
                    onPressed: () => setState(() => value.setWeather()),
                  ),
                ),
              );
              setState(() {
                value.setWeather();
              });
            });
          }
        });
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: isVisible ? 1.0 : 0.0,
                  duration: const Duration(seconds: 2),
                  child: Image.network(
                    "https://www.webtreeonline.com/wp-content/themes/webtree/images/logo-light.png",
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                const SizedBox(height: 150),
                AnimatedOpacity(
                  opacity: isVisible ? 1.0 : 0.0,
                  duration: const Duration(seconds: 3),
                  child: LoadingAnimationWidget.beat(
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

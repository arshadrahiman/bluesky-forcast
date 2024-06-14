import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
  }
}

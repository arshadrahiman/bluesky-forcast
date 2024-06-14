import 'package:flutter/material.dart';

class WeatherStatusIconWidget extends StatelessWidget {
  const WeatherStatusIconWidget(
      {super.key,
      required this.iconData,
      required this.iconSize,
      required this.paddingLeft,
      this.sizedBoxWidth,
      this.shadowOn = false});
  final IconData iconData;
  final double iconSize;
  final double? sizedBoxWidth;
  final bool shadowOn;
  final double paddingLeft;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizedBoxWidth,
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: <Color>[
                Color(0xffD75EF9),
                Color(0xff2AAFFF),
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ).createShader(bounds),
            child: Padding(
              padding: EdgeInsets.only(left: paddingLeft),
              child: Icon(
                iconData,
                size: iconSize,
                color: Colors.white,
                shadows: shadowOn
                    ? [
                        const Shadow(
                          color: Color(0xffFFB67F),
                          blurRadius: 10,
                          offset: Offset(-2, 0),
                        ),
                      ]
                    : [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

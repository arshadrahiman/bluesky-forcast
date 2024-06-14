import 'package:flutter/material.dart';
import 'package:webtree_forcast/config/colors.dart';
import 'package:webtree_forcast/utils/align_constants.dart';

class HomeAppbarRowWidget extends StatelessWidget {
  const HomeAppbarRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: elementAlignment,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                "",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: mainColors.lightContainerBG,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}

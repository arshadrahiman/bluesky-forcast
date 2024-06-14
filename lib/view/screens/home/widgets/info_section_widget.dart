import 'package:flutter/material.dart';
import 'package:webtree_forcast/config/colors.dart';

class MoreInfoSectionWidget extends StatelessWidget {
  const MoreInfoSectionWidget(
      {super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: utilsColors.subColor,
          size: 20,
        ),
        const SizedBox(width: 5),
        Text(
          title,
          overflow: TextOverflow.clip,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}

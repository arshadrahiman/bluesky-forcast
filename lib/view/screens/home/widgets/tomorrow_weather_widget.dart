import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:webtree_forcast/config/themes.dart';
import 'package:webtree_forcast/utils/align_constants.dart';


class TomarrowWeatherRowWidget extends StatelessWidget {
  const TomarrowWeatherRowWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.maxTemp,
      required this.minTemp});
  final DateTime title;
  final IconData icon;
  final double maxTemp;
  final double minTemp;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: elementAlignment.left, right: 25, bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat('EEEE').format(title),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 50),
              Text(
                "$maxTemp°",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(width: 10),
              Text(
                "$minTemp°",
                style: AppTheme.infoTextstyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

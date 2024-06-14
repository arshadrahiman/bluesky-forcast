import 'package:flutter/material.dart';
import 'package:webtree_forcast/utils/align_constants.dart';

class TodayListviewBuilderWidget extends StatelessWidget {
  const TodayListviewBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(
              left: elementAlignment.left,
              right: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                 "12:0",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  "6°",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtree_forcast/config/router/router_constants.dart';
import 'package:webtree_forcast/models/weather_model.dart';
import 'package:webtree_forcast/models/weathercode_model.dart';
import 'package:webtree_forcast/utils/align_constants.dart';
import 'package:webtree_forcast/view-model/theme_provider.dart';
import 'package:webtree_forcast/view-model/weather_provider.dart';
import 'package:webtree_forcast/view/screens/home/widgets/home_appbar.dart';
import 'package:webtree_forcast/view/screens/home/widgets/info_section_widget.dart';
import 'package:webtree_forcast/view/screens/home/widgets/today_listview.dart';
import 'package:webtree_forcast/view/screens/home/widgets/tomorrow_weather_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherNotifier, child) {
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    searchRoute,
                    ModalRoute.withName(homeRoute),
                    arguments: {},
                  );
                },
                child: const Icon(Icons.arrow_back_ios_rounded)),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeAppbarRowWidget(),
                  const SizedBox(height: 10),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: elementAlignment.left,
                        right: elementAlignment.left,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MoreInfoSectionWidget(
                              icon: CupertinoIcons.globe,
                              title:
                                  "title"),
                          MoreInfoSectionWidget(
                              icon: CupertinoIcons.wind,
                              title: "100 km/h"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: elementAlignment,
                    child: Text(
                      "Today",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TodayListviewBuilderWidget(),
                  Padding(
                    padding: elementAlignment,
                    child: Text(
                      "Future weather",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
               
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtree_forcast/config/router/router_constants.dart';
import 'package:webtree_forcast/models/weather_model.dart';
import 'package:webtree_forcast/models/weathercode_model.dart';
import 'package:webtree_forcast/utils/align_constants.dart';
import 'package:webtree_forcast/view-model/theme_provider.dart';
import 'package:webtree_forcast/view-model/weather_provider.dart';
import 'package:webtree_forcast/view/home/widgets/home_appbar.dart';
import 'package:webtree_forcast/view/home/widgets/info_section_widget.dart';
import 'package:webtree_forcast/view/home/widgets/today_listview.dart';
import 'package:webtree_forcast/view/home/widgets/tomorrow_weather_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherNotifier, child) {
        List todayWeather = weatherNotifier.todayWeather;
        WeatherModel current = weatherNotifier.getLoadedWeather;
        List futureWeather = weatherNotifier.futureDayWeather;
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppNamedRoute.searchRoute,
                              ModalRoute.withName(AppNamedRoute.homeRoute),
                              arguments: {},
                            );
                          },
                          child: const Icon(Icons.search)),
                      Consumer<ThemeProvider>(
                        builder: (context, themeNotifier, child) => IconButton(
                          icon: themeNotifier.isDark
                              ? const Icon(CupertinoIcons.sun_min_fill)
                              : const Icon(CupertinoIcons.moon_stars_fill),
                          onPressed: () => themeNotifier.switchTheme(),
                        ),
                      ),
                    ],
                  ),
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
                                  "${current.latitude.toStringAsFixed(0)}/${current.longitude.toStringAsFixed(0)}"),
                          MoreInfoSectionWidget(
                              icon: CupertinoIcons.wind,
                              title: "${todayWeather[3].toString()} km/h"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: elementAlignment,
                    child: Text(
                      "Today",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TodayListviewBuilderWidget(),
                  const SizedBox(height: 20),
                  Padding(
                    padding: elementAlignment,
                    child: Text(
                      "Future weather",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: futureWeather.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        WeatherCodeModel? weatherCodeModel = weatherNotifier
                            .getWeatherCode(futureWeather[index][1]);
                        return TomarrowWeatherRowWidget(
                          title: futureWeather[index][0],
                          icon: weatherCodeModel.iconData,
                          maxTemp: futureWeather[index][2],
                          minTemp: futureWeather[index][3],
                        );
                      },
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

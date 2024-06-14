import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtree_forcast/config/colors.dart';
import 'package:webtree_forcast/models/weather_model.dart';
import 'package:webtree_forcast/models/weathercode_model.dart';
import 'package:webtree_forcast/utils/align_constants.dart';
import 'package:webtree_forcast/view-model/weather_provider.dart';
import 'package:webtree_forcast/view/screens/widget/weather_status.dart';

class HomeAppbarRowWidget extends StatelessWidget {
  const HomeAppbarRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProvider = Provider.of<WeatherProvider>(context);
    WeatherModel weatherModel = weatherProvider.getLoadedWeather;
    List todayWeather = weatherProvider.todayWeather;

    WeatherCodeModel? weatherCodeModel =
        weatherProvider.getWeatherCode(todayWeather[0].toDouble());

    return Padding(
      padding: elementAlignment,
      child: SizedBox(
        height: 200,
        child: Row(
          children: [
            Padding(
              padding: elementAlignment,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    weatherModel.timezone,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "${todayWeather[1].toString()}°",
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
                      weatherCodeModel.name,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            WeatherStatusIconWidget(
              iconData: weatherCodeModel.iconData,
              iconSize: 150,
              sizedBoxWidth: 170,
              shadowOn: true,
              paddingLeft: 20,
            )
          ],
        ),
      ),
    );
  }
}

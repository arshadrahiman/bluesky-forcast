import 'package:dio/dio.dart';
import 'package:webtree_forcast/models/weather_model.dart';
import 'package:webtree_forcast/service/api_constans.dart';

class WeatherService {
  static Future<WeatherModel> getWeather(double lat, double long) async {
    try {
      var dio = Dio();
      String weatherEndpoint =
          "/forecast?latitude=$lat&longitude=$long&hourly=temperature_2m,weathercode&daily=weathercode,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,rain_sum,windspeed_10m_max&timezone=auto&past_days=7";

      var response = await dio.get(ApiConstants.baseUrl + weatherEndpoint);

      if (response.statusCode == 200) {
        final WeatherModel weatherModel = WeatherModel.fromJson(response.data);

        return weatherModel;
      } else {
        throw Exception("Error occurred in connection");
      }
    } catch (e) {
      rethrow;
    }
  }
}

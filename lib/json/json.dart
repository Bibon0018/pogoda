import 'dart:convert';

import 'package:http/http.dart';

Future<Map> getData(String city) async {
  Response response = await get(Uri.parse(
      'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=70fb43cd9b3b2770780e333d03b75656&units=metric'));
  Map data = jsonDecode(response.body);
  Map temp_data = data['main'];
  double temp = temp_data['temp'];
  List weatherData = data['weather'];
  Map myWeather = weatherData[0];
  String getMain = myWeather['main'];

  Map weather = {
    'temp': data['main']['temp'],
    'status': data['weather'][0]['icon'],
  };

  return weather;
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:AlmatyTour/const/weathermodel.dart';

class WeatherData {
  Future<Weather> getData(var latitude, var longitude) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=b8ca3929bed841d099b201119230404&q=$latitude,$longitude&aqi=no');
    var responce = await http.get(uriCall);
    var body = jsonDecode(responce.body);
    return Weather.fromJson(body);
  }
}

// To parse this JSON data, do
//
//     final fetchCityModel = fetchCityModelFromJson(jsonString);

import 'dart:convert';

List<FetchCityModel> fetchCityModelFromJson(String str) => List<FetchCityModel>.from(json.decode(str).map((x) => FetchCityModel.fromJson(x)));

String fetchCityModelToJson(List<FetchCityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FetchCityModel {
  String cityId;
  String cityName;
  String cityAddress;
  String latitude;
  String longitude;

  FetchCityModel({
    required this.cityId,
    required this.cityName,
    required this.cityAddress,
    required this.latitude,
    required this.longitude,
  });

  factory FetchCityModel.fromJson(Map<String, dynamic> json) => FetchCityModel(
    cityId: json["city_id"],
    cityName: json["city_name"],
    cityAddress: json["city_address"],
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "city_id": cityId,
    "city_name": cityName,
    "city_address": cityAddress,
    "latitude": latitude,
    "longitude": longitude,
  };
}

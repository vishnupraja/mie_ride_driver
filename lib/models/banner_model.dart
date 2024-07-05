// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

List<BannerModel> bannerModelFromJson(String str) => List<BannerModel>.from(json.decode(str).map((x) => BannerModel.fromJson(x)));

String bannerModelToJson(List<BannerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerModel {
  String id;
  String bannerImg;

  BannerModel({
    required this.id,
    required this.bannerImg,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json["id"],
    bannerImg: json["banner_img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "banner_img": bannerImg,
  };
}

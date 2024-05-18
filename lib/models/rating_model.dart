// To parse this JSON data, do
//
//     final ratingModel = ratingModelFromJson(jsonString);

import 'dart:convert';

RatingModel ratingModelFromJson(String str) => RatingModel.fromJson(json.decode(str));

String ratingModelToJson(RatingModel data) => json.encode(data.toJson());

class RatingModel {
  String overallRating;
  String star1RatedPer;
  String star2RatedPer;
  String star3RatedPer;
  String star4RatedPer;
  String star5RatedPer;
  List<Detail> details;

  RatingModel({
    required this.overallRating,
    required this.star1RatedPer,
    required this.star2RatedPer,
    required this.star3RatedPer,
    required this.star4RatedPer,
    required this.star5RatedPer,
    required this.details,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
    overallRating: json["overall_rating"],
    star1RatedPer: json["star1_rated_per"],
    star2RatedPer: json["star2_rated_per"],
    star3RatedPer: json["star3_rated_per"],
    star4RatedPer: json["star4_rated_per"],
    star5RatedPer: json["star5_rated_per"],
    details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "overall_rating": overallRating,
    "star1_rated_per": star1RatedPer,
    "star2_rated_per": star2RatedPer,
    "star3_rated_per": star3RatedPer,
    "star4_rated_per": star4RatedPer,
    "star5_rated_per": star5RatedPer,
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class Detail {
  String rateId;
  String userId;
  String bookingId;
  String userFeedbackToDriver;
  String driverFeedbackToUser;
  String driverRatedToUser;
  String userRatedToDriver;
  String date;
  String time;
  String image;
  String fullname;

  Detail({
    required this.rateId,
    required this.userId,
    required this.bookingId,
    required this.userFeedbackToDriver,
    required this.driverFeedbackToUser,
    required this.driverRatedToUser,
    required this.userRatedToDriver,
    required this.date,
    required this.image,
    required this.fullname,
    required this.time,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    rateId: json["rate_id"],
    userId: json["user_id"],
    bookingId: json["booking_id"],
    userFeedbackToDriver: json["user_feedback_to_driver"],
    driverFeedbackToUser: json["driver_feedback_to_user"],
    driverRatedToUser: json["driver_rated_to_user"],
    userRatedToDriver: json["user_rated_to_driver"],
    date: json["date"],
    time: json["time"],
    image: json["image"],
    fullname: json["fullname"],
  );

  Map<String, dynamic> toJson() => {
    "rate_id": rateId,
    "user_id": userId,
    "booking_id": bookingId,
    "user_feedback_to_driver":userFeedbackToDriver,
    "driver_feedback_to_user": driverFeedbackToUser,
    "driver_rated_to_user": driverRatedToUser,
    "user_rated_to_driver": userRatedToDriver,
    "date": date,
    "time": time,
    "image": image,
    "fullname": fullname,
  };
}



// To parse this JSON data, do
//
//     final onGoingModelModel = onGoingModelModelFromJson(jsonString);

import 'dart:convert';

List<OnGoingModelModel> onGoingModelModelFromJson(String str) => List<OnGoingModelModel>.from(json.decode(str).map((x) => OnGoingModelModel.fromJson(x)));

String onGoingModelModelToJson(List<OnGoingModelModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OnGoingModelModel {
  DateTime rideStartDate;
  String rideStartTime;
  String allotedId;
  String bookingIds;
  String totalAmount;
  List<TripDetail> tripDetail;

  OnGoingModelModel({
    required this.rideStartDate,
    required this.rideStartTime,
    required this.allotedId,
    required this.bookingIds,
    required this.totalAmount,
    required this.tripDetail,
  });

  factory OnGoingModelModel.fromJson(Map<String, dynamic> json) => OnGoingModelModel(
    rideStartDate: DateTime.parse(json["ride_start_date"]),
    rideStartTime: json["ride_start_time"],
    allotedId: json["alloted_id"],
    bookingIds: json["booking_ids"],
    totalAmount: json["total_amount"],
    tripDetail: List<TripDetail>.from(json["trip_detail"].map((x) => TripDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ride_start_date": "${rideStartDate.year.toString().padLeft(4, '0')}-${rideStartDate.month.toString().padLeft(2, '0')}-${rideStartDate.day.toString().padLeft(2, '0')}",
    "ride_start_time": rideStartTime,
    "alloted_id": allotedId,
    "booking_ids": bookingIds,
    "total_amount": totalAmount,
    "trip_detail": List<dynamic>.from(tripDetail.map((x) => x.toJson())),
  };
}

class TripDetail {
  String bookingId;
  String userId;
  String fullname;
  String rating;
  String sourceAdd;
  String sourceLat;
  String sourceLng;
  String destinationAdd;
  String destinationLat;
  String destinationLng;
  String date;
  String bookingStatus;
  String totalAmount;
  String image;
  String sourceCity;
  String destinationCity;
  String bookingDate;
  String bookingTime;
  String typeName;
  String bookingType;
  String driverRideStartTime;
  String vehicleNo;
  String contact;

  TripDetail({
    required this.bookingId,
    required this.userId,
    required this.fullname,
    required this.rating,
    required this.sourceAdd,
    required this.sourceLat,
    required this.sourceLng,
    required this.destinationAdd,
    required this.destinationLat,
    required this.destinationLng,
    required this.date,
    required this.bookingStatus,
    required this.totalAmount,
    required this.image,
    required this.sourceCity,
    required this.destinationCity,
    required this.bookingDate,
    required this.bookingTime,
    required this.typeName,
    required this.bookingType,
    required this.driverRideStartTime,
    required this.vehicleNo,
    required this.contact,
  });

  factory TripDetail.fromJson(Map<String, dynamic> json) => TripDetail(
    bookingId: json["booking_id"],
    userId: json["user_id"],
    fullname: json["fullname"],
    rating: json["rating"],
    sourceAdd: json["source_add"],
    sourceLat: json["source_lat"],
    sourceLng: json["source_lng"],
    destinationAdd: json["destination_add"],
    destinationLat: json["destination_lat"],
    destinationLng: json["destination_lng"],
    date: json["date"].toString(),
    bookingStatus: json["booking_status"],
    totalAmount: json["total_amount"],
    image: json["image"],
    sourceCity: json["source_city"],
    destinationCity: json["destination_city"],
    bookingDate: json["booking_date"].toString(),
    bookingTime: json["booking_time"],
    typeName: json["type_name"],
    bookingType: json["booking_type"],
    driverRideStartTime: json["driver_ride_start_time"],
    vehicleNo: json["vehicle_no"],
    contact: json["contact"],
  );

  Map<String, dynamic> toJson() => {
    "booking_id": bookingId,
    "user_id": userId,
    "fullname": fullname,
    "rating": rating,
    "source_add": sourceAdd,
    "source_lat": sourceLat,
    "source_lng": sourceLng,
    "destination_add": destinationAdd,
    "destination_lat": destinationLat,
    "destination_lng": destinationLng,
    "date": date.toString(),
    "booking_status": bookingStatus,
    "total_amount": totalAmount,
    "image": image,
    "source_city": sourceCity,
    "destination_city": destinationCity,
    "booking_date": bookingDate.toString(),
    "booking_time": bookingTime,
    "type_name": typeName,
    "booking_type": bookingType,
    "driver_ride_start_time": driverRideStartTime,
    "vehicle_no": vehicleNo,
    "contact": contact,
  };
}

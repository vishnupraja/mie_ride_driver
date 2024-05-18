// To parse this JSON data, do
//
//     final driverBookingHistoryModel = driverBookingHistoryModelFromJson(jsonString);

import 'dart:convert';

List<DriverBookingHistoryModel> driverBookingHistoryModelFromJson(String str) => List<DriverBookingHistoryModel>.from(json.decode(str).map((x) => DriverBookingHistoryModel.fromJson(x)));

String driverBookingHistoryModelToJson(List<DriverBookingHistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DriverBookingHistoryModel {
  String bookingId;
  String sourceAdd;
  String destinationAdd;
  String rideType;
  String rideDate;
  String rideTime;
  String rideStartTime;
  String rideEndTime;
  String status;
  String totalPrice;

  DriverBookingHistoryModel({
    required this.bookingId,
    required this.sourceAdd,
    required this.destinationAdd,
    required this.rideType,
    required this.rideDate,
    required this.rideTime,
    required this.rideStartTime,
    required this.rideEndTime,
    required this.status,
    required this.totalPrice,
  });

  factory DriverBookingHistoryModel.fromJson(Map<String, dynamic> json) => DriverBookingHistoryModel(
    bookingId: json["booking_id"],
    sourceAdd: json["source_add"],
    destinationAdd: json["destination_add"],
    rideType: json["ride_type"],
    rideDate: json["ride_date"],
    rideTime: json["ride_time"],
    rideStartTime: json["ride_start_time"],
    rideEndTime: json["ride_end_time"],
    status:json["status"],
    totalPrice: json["total_price"],
  );

  Map<String, dynamic> toJson() => {
    "booking_id": bookingId,
    "source_add": sourceAdd,
    "destination_add": destinationAdd,
    "ride_type": rideType,
    "ride_date": rideDate,
    "ride_time": rideTime,
    "ride_start_time": rideStartTime,
    "ride_end_time": rideEndTime,
    "status": status,
    "total_price": totalPrice,
  };
}



// To parse this JSON data, do
//
//     final acceptBookingModel = acceptBookingModelFromJson(jsonString);

import 'dart:convert';

List<AcceptBookingModel> acceptBookingModelFromJson(String str) => List<AcceptBookingModel>.from(json.decode(str).map((x) => AcceptBookingModel.fromJson(x)));

String acceptBookingModelToJson(List<AcceptBookingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AcceptBookingModel {
  String allotedId;
  String bookingIds;
  String totalAmount;
  String bonusAmount;
  List<TripDetail> tripDetail;

  AcceptBookingModel({
    required this.allotedId,
    required this.bookingIds,
    required this.totalAmount,
    required this.bonusAmount,
    required this.tripDetail,
  });

  factory AcceptBookingModel.fromJson(Map<String, dynamic> json) => AcceptBookingModel(
    allotedId: json["alloted_id"],
    bookingIds: json["booking_ids"],
    totalAmount: json["total_amount"],
    bonusAmount: json["bonus_amount"],
    tripDetail: List<TripDetail>.from(json["trip_detail"].map((x) => TripDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "alloted_id": allotedId,
    "booking_ids": bookingIds,
    "total_amount": totalAmount,
    "bonus_amount": bonusAmount,
    "trip_detail": List<dynamic>.from(tripDetail.map((x) => x.toJson())),
  };
}

class TripDetail {
  String bookingId;
  String userId;
  String fullname;
  String sourceCity;
  String sourceAdd;
  String sourceLat;
  String sourceLng;
  String destinationCity;
  String destinationAdd;
  String destinationLat;
  String destinationLng;
  String bookingDate;
  String bookingTime;
  String typeName;
  String bookingType;
  String totalAmount;
  String driverRideStartTime;
  String vehicleNo;

  TripDetail({
    required this.bookingId,
    required this.userId,
    required this.fullname,
    required this.sourceCity,
    required this.sourceAdd,
    required this.sourceLat,
    required this.sourceLng,
    required this.destinationCity,
    required this.destinationAdd,
    required this.destinationLat,
    required this.destinationLng,
    required this.bookingDate,
    required this.bookingTime,
    required this.typeName,
    required this.bookingType,
    required this.totalAmount,
    required this.driverRideStartTime,
    required this.vehicleNo,
  });

  factory TripDetail.fromJson(Map<String, dynamic> json) => TripDetail(
    bookingId: json["booking_id"],
    userId: json["user_id"],
    fullname: json["fullname"],
    sourceCity: json["source_city"],
    sourceAdd: json["source_add"],
    sourceLat: json["source_lat"],
    sourceLng: json["source_lng"],
    destinationCity: json["destination_city"],
    destinationAdd: json["destination_add"],
    destinationLat: json["destination_lat"],
    destinationLng: json["destination_lng"],
    bookingDate: json["booking_date"].toString(),
    bookingTime: json["booking_time"],
    typeName: json["type_name"],
    bookingType: json["booking_type"],
    totalAmount: json["total_amount"],
    driverRideStartTime: json["driver_ride_start_time"],
    vehicleNo: json["vehicle_no"],
  );

  Map<String, dynamic> toJson() => {
    "booking_id": bookingId,
    "user_id": userId,
    "fullname": fullname,
    "source_city": sourceCity,
    "source_add": sourceAdd,
    "source_lat": sourceLat,
    "source_lng": sourceLng,
    "destination_city": destinationCity,
    "destination_add": destinationAdd,
    "destination_lat": destinationLat,
    "destination_lng": destinationLng,
    "booking_date": bookingDate.toString(),
    "booking_time": bookingTime,
    "type_name": typeName,
    "booking_type": bookingType,
    "total_amount": totalAmount,
    "driver_ride_start_time": driverRideStartTime,
    "vehicle_no": vehicleNo,
  };
}

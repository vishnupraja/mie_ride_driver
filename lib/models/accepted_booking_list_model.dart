// To parse this JSON data, do
//
//     final acceptedBookingListModel = acceptedBookingListModelFromJson(jsonString);

import 'dart:convert';

List<AcceptedBookingListModel> acceptedBookingListModelFromJson(String str) => List<AcceptedBookingListModel>.from(json.decode(str).map((x) => AcceptedBookingListModel.fromJson(x)));

String acceptedBookingListModelToJson(List<AcceptedBookingListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AcceptedBookingListModel {
  String allotedId;
  String bookingIds;
  String total_amount;
  String ride_start_time;
  String ride_start_date;
  List<TripDetail> tripDetail;

  AcceptedBookingListModel({
    required this.allotedId,
    required this.bookingIds,
    required this.tripDetail,
    required this.total_amount,
    required this.ride_start_time,
    required this.ride_start_date,
  });

  factory AcceptedBookingListModel.fromJson(Map<String, dynamic> json) => AcceptedBookingListModel(
    allotedId: json["alloted_id"],
    bookingIds: json["booking_ids"],
    total_amount: json["total_amount"],
    ride_start_time: json["ride_start_time"],
    ride_start_date: json["ride_start_date"],
    tripDetail: List<TripDetail>.from(json["trip_detail"].map((x) => TripDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "alloted_id": allotedId,
    "booking_ids": bookingIds,
    "total_amount": total_amount,
    "ride_start_time": ride_start_time,
    "ride_start_date": ride_start_date,
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
  };
}

// To parse this JSON data, do
//
//     final bookingIdModel = bookingIdModelFromJson(jsonString);

import 'dart:convert';

List<BookingIdModel> bookingIdModelFromJson(String str) => List<BookingIdModel>.from(json.decode(str).map((x) => BookingIdModel.fromJson(x)));

String bookingIdModelToJson(List<BookingIdModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookingIdModel {
  String bookingId;

  BookingIdModel({
    required this.bookingId,
  });

  factory BookingIdModel.fromJson(Map<String, dynamic> json) => BookingIdModel(
    bookingId: json["booking_id"],
  );

  Map<String, dynamic> toJson() => {
    "booking_id": bookingId,
  };
}

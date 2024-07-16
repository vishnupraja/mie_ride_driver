// To parse this JSON data, do
//
//     final fetchQueryModel = fetchQueryModelFromJson(jsonString);

import 'dart:convert';

List<FetchQueryModel> fetchQueryModelFromJson(String str) => List<FetchQueryModel>.from(json.decode(str).map((x) => FetchQueryModel.fromJson(x)));

String fetchQueryModelToJson(List<FetchQueryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FetchQueryModel {
  String subject;
  String message;
  String complainNumber;
  String status;
  String time;

  FetchQueryModel({
    required this.subject,
    required this.message,
    required this.complainNumber,
    required this.status,
    required this.time,
  });

  factory FetchQueryModel.fromJson(Map<String, dynamic> json) => FetchQueryModel(
    subject: json["subject"],
    message: json["message"],
    complainNumber: json["complain_number"],
    status: json["status"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "subject": subject,
    "message": message,
    "complain_number": complainNumber,
    "status": status,
    "time": time,
  };
}

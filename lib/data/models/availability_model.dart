import 'package:flutter/material.dart';

enum BusyStatus {
  none(0), booked(1), external(2), personal(3), tentative(4), block(5);
  Color get color {
    switch (this) {
  }

  String get defaultTitle {
    switch (this) {
    }
  }
}

DateTime parseServerUtc(String? dateStr) {
  }
  return DateTime.parse(normalized).toUtc();
}

class GetAvailabilityRequest {
  final int? serviceId;
  final DateTime startDate;
  final DateTime endDate;

  GetAvailabilityRequest({
    this.serviceId,
    required this.startDate,
    required this.endDate,
  });

class AvailabilityModel {
  final int id;
  final BusyStatus status;

    this.cityCode,
    this.clientName,
    this.userPhotoUrl,
  });


  factory AvailabilityModel.fromJson(Map<String, dynamic> json) {
    return AvailabilityModel(
      id: json['id'] ?? 0,
      userPhotoUrl: json['u_p'],
    );
  }
}

class SaveSingleEventRequest {
  final int? id;
  final DateTime startTimeUtc;
  final DateTime endTimeUtc;

  SaveSingleEventRequest({
    this.id, required this.startTimeUtc, required this.endTimeUtc, required this.status,
    this.note, this.cityCode, thi
class BulkBlockRequest {
  final DateTime startDate;
  final DateTime endDate;
  final int status;

  BulkBlockRequest({
    required this.startDate, required this.endDate, required this.status, this.note,
    this.cityCode = 0, this.latitude, this.longitude, this.daysOfWeek, this.startHour, this.endHour,
  });

  Map<String, dynamic> toJson() => {
    'st': status, 'nt': note, 'ct': cityCode, 'lat': latitude, 'lon': longitude, 'days': daysOfWeek, 's_hr': startHour, 'e_hr': endHour,
  };
}
import 'package:flutter/material.dart';

DateTime parseServerUtc(String? dateStr) {
  if (dateStr == null || dateStr.isEmpty) return DateTime.now();

  String normalized = dateStr.trim();
  if (!normalized.endsWith('Z') && !normalized.contains(RegExp(r'[+-]\d\d'))) {
    normalized += 'Z';
  }
  return DateTime.parse(normalized).toUtc();
}

class ConfirmOrderRequestDto {
  final int orderId;
  ConfirmOrderRequestDto({required this.orderId});
  Map<String, dynamic> toJson() => {'id': orderId};
}

class CancelOrderRequestDto {
  final int orderId;
  final String reason;
  CancelOrderRequestDto({required this.orderId, required this.reason});
  Map<String, dynamic> toJson() => {'id': orderId, 'rsn': reason};
}

class EstimateOrderRequestDto {

  EstimateOrderRequestDto({
    required this.serviceId,
    required this.startTimeUtc,
    this.longitude,
  });

  Map<String, dynamic> toJson() => {
    'sid': serviceId,
}

class OrderCostResponseDto {

  OrderCostResponseDto({
    required this.performancePrice,
    required this.travelPrice,
    required this.totalPrice,
    required this.currencyCode,
  });

  factory OrderCostResponseDto.fromJson(Map<String, dynamic> json) {
    return OrderCostResponseDto(
      performancePrice: (json['pp'] as num?)?
  }
}

class GetOrdersRequestDto {
  final bool isHistory;
  final int offset;
  final int limit;

  GetOrdersRequestDto({
    this.isHistory = false,
    this.offset = 0,
    this.limit = 20,
}

class CreateOrderRequestDto {
  final int serviceId;
  final DateTime startTimeUtc;
  final DateTime endTimeUtc;
  final double? latitude;
  final double? longitude;
  final int cityId;

  OrderResponseDto({
    required this.orderId, required this.clientId, required this.clientName, this.clientAvatar,
    required this.performerId, required this.performerNickname, this.performerAvatar, required this.serviceId,
    required this.startTimeUtc, required this.endTimeUtc, required this.createdAt, required this.cityId,
    this.fullAddress, this.latitude, this.longitude, required this.performancePrice, required this.travelPrice,
    required this.totalPrice, required this.currencyCode, required this.status, this.clientComment,
    this.cancellationReason, this.cancelledBy,
  });
  }

  factory OrderResponseDto.fromJson(Map<String, dynamic> json) {
    return OrderResponseDto(
      orderId: json['id'] ?? 0,
  CreateOrderResponseDto({required this.orderId, required this.totalPrice});

  factory CreateOrderResponseDto.fromJson(Map<String, dynamic> json) {
    return CreateOrderResponseDto(
      orderId: json['id'] ?? 0,
      totalPrice: (json['tot'] as num?)?.toDouble() ?? 0.0,
    );
  }
}


class OrderShortResponseDto {
  final int orderId;
  final String displayName;
  final String? displayAvatar;
    required this.currencyCode,
    required this.status,
    required this.createdAt,
  });

  String get statusLabel {
      case "Paid": return Colors.green;
      case "InProgress": return Colors.purple;
      case "Completed": return Colors.grey;
      case "Cancelled": return Colors.red;
      default: return Colors.white24;
    }
  }

  factory OrderShortResponseDto.fromJson(Map<String, dynamic> json) {
    return OrderShortResponseDto(
      orderId: json['id'] ?? 0,
  }
}
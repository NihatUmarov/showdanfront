import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:showdan/data/models/chats_models.dart';
import 'package:showdan/data/services/chat_service.dart';
import 'package:showdan/data/signal_r_service/chat_signal_r.dart';
import 'package:showdan/core/storage/secure_storage.dart';
import '../../ThemeData/ui_kit.dart';
import '../../ThemeData/ui_overlays.dart';
import '../../core/di/service_locator.dart';
import 'chat_composer.dart';

class ChatConversationScreen extends StatefulWidget {
  final int interlocutorId;
  final String interlocutorName;
  final String avatarUrl;
  final int orderId;

  const ChatConversationScreen({
    super.key,
    required this.interlocutorId,import 'package:flutter/widgets.dart';
import 'AppLanguage.dart';
import 'artists/lead_data.dart';
import 'filters_data.dart';
import 'filters_city.dart';
import 's.dart';

extension AppLocalizationsContextX on BuildContext {
  AppLanguage get currentLanguage => LangController.current;
}

extension AppLocalizationsX on BuildContext {
  String labelOf(dynamic item) {abel;
    if (item is WorkStyle) return item.labelimport 'package:flutter/widgets.dart';
import 'AppLanguage.dart';
import 'artists/lead_data.dart';
import 'filters_data.dart';
import 'filters_city.dart';
import 's.dart';

extension AppLocalizationsContextX on BuildContext {
  AppLanguage get currentLanguage => LangController.current;
}

extension AppLocalizationsX on BuildContext {
  String labelOf(dynamic item) {abel;
    if (item is WorkStyle) return item.label;

    if (item is FilterOption) {
      if (['uzs', 'usd', 'rub'].contains(item.id.toLowerCase())) {
        return S.currencyLabel(item.id);
      }
      return item.label;
    }

  @override
  void dispose() {
    _messageSubscription?.cancel();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();

    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
              top: 12.w,
              bottom: 12.h,
            ),
            child: Column(
              children: [
                _ConversationHeader(
                  title: widget.interlocutorName,
                  avatarUrl: widget.avatarUrl,
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: _isLoading
                      ? const Center(child: CircularProgressIndicator(color: AppColors.accentPink))
                      : ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(bottom: 16.h),
                    physics: const BouncingScrollPhysics(),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      final bool showDate = index == _messages.length - 1 ||
                          !_isSameCalendarDate(message.createdAt, _messages[index + 1].createdAt);

                      return Padding(
                        padding: EdgeInsets.only(bottom: 14.h),
                        child: Column(
                          children: [
                            if (showDimport 'package:flutter/widgets.dart';
import 'AppLanguage.dart';
import 'artists/lead_data.dart';
import 'filters_data.dart';
import 'filters_city.dart';
import 's.dart';

extension AppLocalizationsContextX on BuildContext {
  AppLanguage get currentLanguage => LangController.current;
}

extension AppLocalizationsX on BuildContext {
  String labelOf(dynamic item) {abel;
    if (item is WorkStyle) return item.label;

    if (item is FilterOption) {
      if (['uzs', 'usd', 'rub'].contains(item.id.toLowerCase())) {
        return S.currencyLabel(item.id);
      }
      return item.label;
    }
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20.w),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppImg(import 'package:flutter/widgets.dart';
import 'AppLanguage.dart';
import 'artists/lead_data.dart';
import 'filters_data.dart';
import 'filters_city.dart';
import 's.dart';

extension AppLocalizationsContextX on BuildContext {
  AppLanguage get currentLanguage => LangController.current;
}

extension AppLocalizationsX on BuildContext {
  String labelOf(dynamic item) {abel;
    if (item is WorkStyle) return item.label;

    if (item is FilterOption) {
      if (['uzs', 'usd', 'rub'].contains(item.id.toLowerCase())) {
        return S.currencyLabel(item.id);
      }
      return item.label;
    }
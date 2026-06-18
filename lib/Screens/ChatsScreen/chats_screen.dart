import 'package:flutter/widgets.dart';
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
          SizedBox(child: Center(child: S.chatsTab.h1())),
          SizedBox(height: 16.h),
          Expanded(
            child: provider.isInitialLoading
                ? const SizedBox.shrink()
                : chats.isEmpty
                ? const _ChatsEmptyState()
                : RefreshIndicator(
              onRefresh: () => provider.fetchChats(),
              color: AppColors.accentPink,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
                itemCount: chats.length,
                separatorBuilder: (_, __) => SizedBox(height: 2.h),
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return ChatPreviewTile(
                    chat: chat,
                    onTap: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ChatConversationScreen(
                            interlocutorId: chat.interlocutorId,
                            interlocutorName: chat.name ?? "User",
                            avatarUrl: chat.photoUrl ?? "",
                            orderId: chat.orderId ?? 0,
                          ),import 'package:flutter/widgets.dart';
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
class _ChatsEmptyState extends StatelessWidimport 'package:flutter/widgets.dart';
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
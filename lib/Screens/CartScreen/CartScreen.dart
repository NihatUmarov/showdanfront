import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:showdan/core/provider/orders_provider.dart';
import '../../ThemeData/ui_kit.dart';
import '../../core/provider/session_provider.dart';
import '../../l10n/AppLanguage.dart';
import '../../core/di/service_locator.dart';
import '../../data/services/order_service.dart';
import '../../data/models/order_models.dart';
import '../../widgets/BottomSheetApp.dart';
import '../../l10n/s.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}import 'package:flutter/widgets.dart';
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
    }? '';
    final String name = order.displayName;
    final String description = isClient ? S.rolePerformerDescription : S.roleClientDescription;

    return AppCard(
      radius: 20,
      padding: EdgeInsets.all(16.r),
      color: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppImg(avatar, width: 44, height: 44, radius: 22),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    name.h2(overflow: TextOverflow.ellipsis),
                    description.caption(color: AppColors.textSecondary),
                  ],
                ),
              ),
              _buildBadge(),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.access_time,import 'package:flutter/widgets.dart';
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
            S.orderDetailsButton,
            onPressed: () {
              OrderDetailsBottomSheet.show(
                context,
                orderId: order.orderId,
                isClient: isClient,
                onCancel: (reason) async {
                  await getIt<OrderService>().cancelOrder(
                    CancelOrderRequestDto(orderId: order.orderId, reason: reason),
                  );
                  onUpdate();
                },
                onConfirm: () async {
                  await getIt<OrderService>().confirmOrder(
                    ConfirmOrderRequestDto(orderId: order.orderId),
                  );
                  onUpdate();
                },
              );
            },
          )
        ],
      ),
    );
  }import 'package:flutter/widgets.dart';
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
}
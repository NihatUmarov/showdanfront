import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../ThemeData/ui_kit.dart';
import '../../../data/models/order_models.dart';
import '../OrderScreen.dart';

class OrderWarningBox extends StatelessWidget {
  const OrderWarningBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      radius: 10,
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 18.h),
      border: Border.all(width: 2, color: AppColors.surfaceBorder), // ИСПРАВЛЕНО: Заменен хардкод бордюра
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline, color: AppColors.accentPink, size: 24),
          SizedBox(width: 20.w),
          Expanded(
            child: 'Потребитель организовывает и оплачивает за проживание исполнителя в гостинице при выезде в пригород, другой город или в другую страну от местоположения исполнителя в момент заказа. Включая само место проведения события, вплоть до места проживания исполнителя в момент завершения.\n\nТолько в том случае если общее время дороги (туда-обратно) + заказное указаное время услуги превысит 12 часов!'.body(
              size: 12,
              weight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class OrderTariffSection extends StatelessWidget {
  final DateTime? selectedDate;
  final bool hasAddress;
  final bool isConflicting;
  final bool isEstimating;
  final OrderCostResponseDto? calculatedCost;

  const OrderTariffSection({
    super.key, required this.selectedDate, required this.hasAddress,
    required this.isConflicting, required this.isEstimating, required this.calculatedCost,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedDate == null || !hasAddress) {
      return 'Выберите дату и адрес для расчета стоимости'.body(size: 14, color: Colors.grey).padded();
    }
    if (isConflicting) {
      return 'Выбранное время пересекается с занятыми слотами'.body(size: 14, color: Colors.orangeAccent).padded();
    }
    if (isEstimating) {
      return const Center(child: CircularProgressIndicator()).padded();
    }

    // ИСПРАВЛЕНО: Безопасное присвоение переменной вместо бесконечного спама calculatedCost!
    final cost = calculatedCost;
    if (cost == null) {
      return 'Не удалось рассчитать стоимость'.body(size: 14, color: AppColors.danger).padded();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTariffCard(title: 'Выступление', price: '${cost.performancePrice} ${cost.currencyCode}'),
        SizedBox(height: 16.h),
        _buildTariffCard(title: 'Транспортные расходы', price: '${cost.travelPrice} ${cost.currencyCode}'),
        SizedBox(height: 16.h),
        _buildTariffCard(title: 'Итого к оплате', price: '${cost.totalPrice} ${cost.currencyCode}', isTotal: true),
      ],
    ).padded();
  }

  Widget _buildTariffCard({required String title, required String price, bool isTotal = false}) {
    return Container(
      width: double.infinity,
      height: 120.h,
      padding: EdgeInsets.all(2.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: isTotal ? [AppColors.danger, AppColors.accentPink] : AppColors.mainBtnGradient,
            begin: Alignment.centerLeft, end: Alignment.centerRight
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Container(
        decoration: BoxDecoration(color: AppColors.backgroundStart, borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            title.body(size: isTotal ? 22 : 18, color: AppColors.accentStart, weight: FontWeight.w700),
            Container(width: 215.w, margin: EdgeInsets.symmetric(vertical: 6.h), height: 1, color: AppColors.accentEnd), // ИСПРАВЛЕНО: Очищен внутренний разделитель
            price.body(size: isTotal ? 20 : 16, weight: FontWeight.w600, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
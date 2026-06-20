import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
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
  void initState() {
    super.initState();
    final now = DateTime.now();
    _todayMidnight = DateTime(now.year, now.month, now.day);
    _displayedMonth = DateTime(now.year, now.month, 1);
    _commentConimport 'package:flutter/widgets.dart';
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
    }on,
        'bdg': budget,
        'cmt': _commentController.text.trim(),
      };

      await getIt<PublicOrderService>().createPublicOrder(payload);

      if (mounted) {import 'package:flutter/widgets.dart';
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
    final bool isAddressValid = _selectedAddress != null;
    final bool isBudgetValid = _budgetController.text.trim().isNotEmpty;
    final bool isCommentValid = _commentController.text.trim().isNotEmpty;
    final bool isDateValid = _selectedDate != null;
    final bool isFormValid = isAddressValid && isBudgetValid && isCommentValid && isDateValid && !_isSubmitting;

    String buttonText = 'Опубликовать заказ';
    if (!isAddressValid) buttonText = 'Укажите адрес проведения';
    else if (!isBudgetValid) buttonText = 'Укажите сумму бюджета';
    else if (!isCommentValid) buttonText = 'Заполните описание';
    else if (!isDateValid) buttonText = 'Выберите дату';

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent, resizeToAvoidBottomInset: true, extendBody: true,
        bottomNavigationBar: AppFloatingBottomBar(text: buttonText, isLoading: _isSubmitting, onPressed: isFormValid ? _publishOrder : null),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              _buildHeader(context).padded(),
              SizedBox(height: 20.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  'Где планируется мероприятие?'.h2(),
                  SizedBox(height: 12.h),
                  LocationSelectorButton(selectedAddress: _selectedAddress, onAddressSelected: (address) => setState(() => _selectedAddress = address)),
                ],
              ).padded(),
              SizedBox(height: 24.h),
              AppInput(controller: _budgetController, label: 'Предлагаемый бюджет (USD):', hint: 'Укажите сумму...', keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly]).padded(),
              AppInput(controller: _commentController, label: 'Описание / Пожелания к артистам:', hint: 'Например: Ищем ведущего на свадьбу...').padded(),
              SizedBox(height: 12.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  'Выберите дату проведения'.h2(),
                  SizedBox(height: 16.h),
                  GestureDetecimport 'package:flutter/widgets.dart';
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
    if (item is WorkStyle) return item.label;f

    if (item is FilterOption) {
      if (['uzs', 'usd', 'rub'].contains(item.id.toLowerCase())) {
        return S.currencyLabel(item.id);
      }
      return item.label;
    }
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
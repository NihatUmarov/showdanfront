import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../ThemeData/ui_kit.dart';
import '../l10n/s.dart';

class ScalableAIBanner extends StatelessWidget {
  final VoidCallback? onTap;

  const ScalableAIBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Row(
                children: [
                  Image.asset(
                    'assets/shouiIcon.png',
                          maxLines: 1,
                        ),
                        SizedBox(height: 2.h),
                        S.aiBannerSubtitle.body(
                          size: 10.sp,
                          weight: FontWeight.w400,
                          color: Colors.white.withValues(alpha: 0.7),
                          maxLines: 2,
          ],
        ),
      ),
    );
  }
}
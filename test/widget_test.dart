import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:showdan/Screens/WelcomeScreen/WelcomeScreen.dart';

void main() {
  Widget buildTestApp(Widget child) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return MaterialApp(

          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ru'),
            Locale('uz'),
          ],
          home: child,
        );
      },
    );
  }

  Future<void> pumpWelcomeFlow(WidgetTester tester) async {
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(buildTestApp(const WelcomeScreen()));
    await tester.pumpAndSettle();
  }

  testWidgets('welcome flow opens email step and validates email', (
      WidgetTester tester,
      ) async {
    await pumpWelcomeFlow(tester);

    expect(find.text('Continue with email'), findsOneWidget);

    await tester.tap(find.text('Continue with email'));
    await tester.pumpAndSettle();

    expect(find.text('Sign in / Sign up'), findsOneWidget);

    await tester.enterText(find.byType(TextField).first, 'invalid-email');
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(find.text('Enter a valid email'), findsOneWidget);
  });

  testWidgets('welcome flow reaches home screen after otp confirmation', (
      WidgetTester tester,
      ) async {
    await pumpWelcomeFlow(tester);

    await tester.tap(find.text('Continue with email'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).first, 'user@example.com');
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(find.text('Verification code'), findsOneWidget);

    final otpFields = find.byType(TextField);
    for (var index = 0; index < 6; index++) {
      await tester.enterText(otpFields.at(index), '${index + 1}');
    }

    await tester.tap(find.text('Confirm'));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
  });
}
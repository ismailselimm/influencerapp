// Flutter Widget Tests for Kuwa Authentication App
// Tests UI components and user interactions

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kuwa_app/main.dart';

void main() {
  group('Kuwa App Widget Tests', () {
    testWidgets('App should start with login screen', (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester.pumpWidget(
        const ProviderScope(
          child: KuwaApp(),
        ),
      );
      
      // Wait for navigation to complete
      await tester.pumpAndSettle();

      // Verify login screen elements are present
      expect(find.text('Tekrar Hoş Geldiniz'), findsOneWidget);
      expect(find.text('Hesabınıza giriş yapın'), findsOneWidget);
      expect(find.text('E-posta'), findsOneWidget);
      expect(find.text('Şifre'), findsOneWidget);
      expect(find.text('Giriş Yap'), findsOneWidget);
    });

    testWidgets('Login form should have required fields', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: KuwaApp(),
        ),
      );
      
      await tester.pumpAndSettle();

      // Find email and password fields
      expect(find.byType(TextFormField), findsAtLeastNWidgets(2));
      
      // Find login button
      expect(find.widgetWithText(ElevatedButton, 'Giriş Yap'), findsOneWidget);
    });

    testWidgets('Should navigate to register screen', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: KuwaApp(),
        ),
      );
      
      await tester.pumpAndSettle();

      // Find and tap "Kayıt Ol" link
      expect(find.text('Kayıt Ol'), findsOneWidget);
      await tester.tap(find.text('Kayıt Ol'));
      await tester.pumpAndSettle();

      // Verify register screen elements
      expect(find.text('Hesap Oluşturun'), findsOneWidget);
      expect(find.text('Ad Soyad'), findsOneWidget);
      expect(find.text('Şifre Onayı'), findsOneWidget);
    });
  });
}
